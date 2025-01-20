import 'dart:async';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:getapps/utils/extensions/extensions.dart';
import 'package:result_dart/result_dart.dart';

import '../domain.dart';

class InstallAppUsecase {
  final AppRepository _appRepository;
  final CodeHostingRepository _codeHostingRepository;

  InstallAppUsecase(this._appRepository, this._codeHostingRepository);

  Isolate? _installIsolate;
  ReceivePort? _installReceivePort;
  Completer? finishIsateCompleter;
  var _isolateExitForced = true;

  Result<Unit> cancelInstall([bool force = true]) {
    _isolateExitForced = force;
    finishIsateCompleter?.complete();
    finishIsateCompleter = null;

    _installReceivePort?.close();
    _installReceivePort = null;

    _installIsolate?.kill(priority: Isolate.immediate);
    _installIsolate = null;
    return const Success(unit);
  }

  AsyncResult<Unit> call({
    required AppEntity app,
    required String asset,
    required void Function(AppEntity) onChangeApp,
  }) async {
    final canInstall = await _appRepository.checkInstallPermission();
    if (canInstall.isError()) {
      return Failure(Exception('Permission denied'));
    }

    cancelInstall(true);
    final firstState = app;

    finishIsateCompleter = Completer();
    _installReceivePort = ReceivePort();
    _installReceivePort!.listen((message) {
      if (message is AppEntity) {
        onChangeApp(message);
        return;
      } else if (message == 'finish') {
        cancelInstall(false);
      }
    });

    _installIsolate = await Isolate.spawn(
      _installAppIsolateAction,
      (
        app,
        asset,
        _installReceivePort!.sendPort,
        _appRepository,
        _codeHostingRepository,
        RootIsolateToken.instance!,
      ),
    );

    await finishIsateCompleter!.future;
    if (_isolateExitForced) {
      onChangeApp(firstState);
    }

    return const Success(unit);
  }
}

@pragma('vm:entry-point')
Future<void> _installAppIsolateAction(
    (
      AppEntity,
      String,
      SendPort,
      AppRepository,
      CodeHostingRepository,
      RootIsolateToken,
    ) record) async {
  final (app, asset, installReceivePort, appRepository, codeHosting, rootIsolateToken) = record;
  BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

  final currentState = app;

  installReceivePort.send(app.toLoading());

  final newState = await codeHosting
      .downloadAPK(app, asset, (percent) {
        installReceivePort.send(app.toLoading(percent));
      })
      .map((app) => app.toLoading())
      .onSuccess(installReceivePort.send)
      .flatMap(appRepository.installApp)
      .flatMap(appRepository.putApp)
      .pureError<AppEntity>(currentState)
      .merge();

  installReceivePort.send(newState);
  await Future.delayed(const Duration(milliseconds: 300));
  installReceivePort.send('finish');
}
