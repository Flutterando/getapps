import 'dart:async';
import 'dart:isolate';

import 'package:getapps/domain/repositories/app_repository.dart';
import 'package:getapps/domain/repositories/code_hosting_repository.dart';
import 'package:getapps/utils/extensions/extensions.dart';
import 'package:result_dart/result_dart.dart';

import '../../config/dependencies.dart';
import '../domain.dart';

class InstallAppUsecase {
  final AppRepository _appRepository;

  InstallAppUsecase(this._appRepository);

  Isolate? _installIsolate;
  ReceivePort? _installReceivePort;
  Completer? finishIsateCompleter;
  var _isolateExitForced = true;

  Result<Unit> cancelInstallApp([bool force = true]) {
    _isolateExitForced = force;
    finishIsateCompleter?.complete();
    finishIsateCompleter = null;

    _installReceivePort?.close();
    _installReceivePort = null;

    _installIsolate?.kill(priority: Isolate.immediate);
    _installIsolate = null;
    return const Success(unit);
  }

  AsyncResult<Unit> call(
    AppEntity app,
    String asset,
    void Function(AppEntity) onChangeApp,
  ) async {
    final canInstall = await _appRepository.checkInstallPermission();
    if (canInstall.isError()) {
      return Failure(Exception('Permission denied'));
    }

    cancelInstallApp(true);
    final firstState = app;

    finishIsateCompleter = Completer();
    _installReceivePort = ReceivePort();
    _installReceivePort!.listen((message) {
      if (message is AppEntity) {
        onChangeApp(message);
        return;
      } else if (message == 'finish') {
        cancelInstallApp(false);
      }
    });

    _installIsolate = await Isolate.spawn(
      _installAppIsolateAction,
      (app, asset, _installReceivePort!.sendPort),
    );

    await finishIsateCompleter!.future;
    if (_isolateExitForced) {
      onChangeApp(firstState);
    }

    return const Success(unit);
  }
}

@pragma('vm:entry-point')
Future<void> _installAppIsolateAction((AppEntity, String, SendPort) record) async {
  final (app, asset, installReceivePort) = record;

  setupInjection();

  final codeHosting = injector.get<CodeHostingRepository>();
  final appRepository = injector.get<AppRepository>();
  final currentState = app;

  final newState = await codeHosting
      .downloadAPK(app, asset, (percent) {
        installReceivePort.send(app.toLoading(percent));
      })
      .map((app) => app.toLoading())
      .onSuccess(installReceivePort.send)
      .flatMap(appRepository.installApp)
      .map<AppEntity>((app) => app.toInstalled())
      .pureError<AppEntity>(currentState)
      .merge();

  installReceivePort.send(newState);
  await Future.delayed(const Duration(milliseconds: 300));
  installReceivePort.send('finish');
}
