import 'dart:async';
import 'dart:isolate';

import 'package:asp/asp.dart';
import 'package:getapps/app/core/extensions/result_extension.dart';
import 'package:getapps/app/core/states/state.dart';
import 'package:getapps/app/injector.dart';
import 'package:getapps/app/interactor/entities/app_entity.dart';
import 'package:getapps/app/interactor/entities/repository_entity.dart';
import 'package:getapps/app/interactor/services/package_service.dart';
import 'package:getapps/app/interactor/states/app_state.dart';
import 'package:result_dart/functions.dart';
import 'package:result_dart/result_dart.dart';

import '../services/app_local_storage_service.dart';
import '../services/code_hosting_service.dart';

final fetchAppsActions = atomAction((set) async {
  set(baseLoadingState, true);
  set(baseExceptionState, null);

  final storage = injector.get<AppLocalStorageService>();
  await storage
      .fetchApps() //
      .map((apps) => apps.map(AppModel.new).toList())
      .updateState(appsState, set);
});

final checkUpdatesActions = atomAction1<List<AppEntity>>((set, apps) async {
  set(baseExceptionState, null);
  final copy = apps.toList();
  final codeHosting = injector.get<CodeHostingService>();

  for (var i = 0; i < copy.length; i++) {
    await codeHosting
        .getLastRelease(copy[i]) //
        .onSuccess((app) => copy[i] = app);
  }

  set(appsState, copy);
});

final registerAppRepositoryAction = atomAction1<String>((set, repositoryUrl) async {
  set(baseLoadingState, true);
  set(baseExceptionState, null);

  final codeHosting = injector.get<CodeHostingService>();
  final storage = injector.get<AppLocalStorageService>();

  final uri = Uri.parse(repositoryUrl);
  final appRepository = RepositoryEntity(
    provider: GitRepositoryProvider.github,
    organizationName: uri.pathSegments[0],
    projectName: uri.pathSegments[1],
  );

  final app = NotInstallAppEntity(repository: appRepository);

  await codeHosting
      .getLastRelease(app) //
      .flatMap(storage.putApp)
      .flatMap(storage.fetchApps)
      .map((apps) => apps.map(AppModel.new).toList())
      .updateState(appsState, set);
});

Isolate? _installIsolate;
ReceivePort? _installReceivePort;
Completer? finishIsateCompleter;
var _isolateExitForced = true;

void cancelInstallAppAction([bool force = true]) {
  _isolateExitForced = force;
  finishIsateCompleter?.complete();
  finishIsateCompleter = null;

  _installReceivePort?.close();
  _installReceivePort = null;

  _installIsolate?.kill(priority: Isolate.immediate);
  _installIsolate = null;
}

Future<void> installAppAction(AppModel appModel, String asset) async {
  cancelInstallAppAction(true);
  final firstState = appModel.state;

  finishIsateCompleter = Completer();
  _installReceivePort = ReceivePort();
  _installReceivePort!.listen((message) {
    if (message is AppState) {
      appModel.update(message);
      return;
    } else if (message == 'finish') {
      cancelInstallAppAction(false);
    }
  });

  appModel.loading();

  _installIsolate = await Isolate.spawn(
    _installAppIsolateAction,
    (appModel.state, asset, _installReceivePort!.sendPort),
  );

  await finishIsateCompleter!.future;
  if (_isolateExitForced) {
    appModel.update(firstState);
  }
}

@pragma('vm:entry-point')
Future<void> _installAppIsolateAction((AppState, String, SendPort) record) async {
  final (appState, asset, installReceivePort) = record;

  setupMockInjection();

  final codeHosting = injector.get<CodeHostingService>();
  final storage = injector.get<AppLocalStorageService>();
  final package = injector.get<PackageService>();

  final currentState = appState;

  final newState = await codeHosting
      .downloadAPK(appState.app, asset, (percent) {
        installReceivePort.send(appState.downloading(percent));
      })
      .onSuccess((app) {
        installReceivePort.send(appState.loading(app));
      })
      .flatMap(package.installApp)
      .flatMap(storage.putApp)
      .pureError(currentState)
      .map(appState.installed)
      .fold(id, id);

  installReceivePort.send(newState);
  await Future.delayed(const Duration(milliseconds: 300));
  installReceivePort.send('finish');
}

final uninstallAppAction = atomAction1<AppEntity>((set, app) async {
  set(baseExceptionState, null);

  final package = injector.get<PackageService>();
  final storage = injector.get<AppLocalStorageService>();

  await package
      .uninstallApp(app) //
      .flatMap(storage.putApp)
      .flatMap(storage.fetchApps)
      .map((apps) => apps.map(AppModel.new).toList())
      .updateState(appsState, set);
});

final deleteAppAction = atomAction1<AppEntity>((set, app) async {
  set(baseExceptionState, null);

  final storage = injector.get<AppLocalStorageService>();

  await storage
      .deleteApp(app) //
      .flatMap(storage.fetchApps)
      .map((apps) => apps.map(AppModel.new).toList())
      .updateState(appsState, set);
});

void openApp(AppEntity app) {
  final package = injector.get<PackageService>();
  package.openApp(app);
}
