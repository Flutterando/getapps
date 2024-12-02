import 'dart:async';
import 'dart:isolate';

import '../../app.dart';

final fetchAppsActions = atomAction((set) async {
  set(baseLoadingState, true);
  set(baseExceptionState, null);

  final storage = injector.get<AppLocalStorageService>();
  final package = injector.get<PackageService>();
  await storage
      .fetchApps() //
      .flatMap(package.addInfos)
      .map(_mapAppsToModels)
      .updateState(appsState, set);
});

Future<bool> checkInstallPersmission() async {
  final package = injector.get<PackageService>();
  return package.checkInstallPermission().isSuccess();
}

final checkUpdatesActions = atomAction1<List<AppModel>>((set, apps) async {
  set(baseExceptionState, null);
  final codeHosting = injector.get<CodeHostingService>();
  final installedApps = apps.where((app) => app.state is InstalledAppState).toList();

  for (var i = 0; i < installedApps.length; i++) {
    await codeHosting
        .getLastRelease(installedApps[i].app) //
        .onSuccess((app) => installedApps[i].update(AppState.init(app)));
  }
});

final registerAppRepositoryAction = atomAction1<String>((set, repositoryUrl) async {
  set(baseLoadingState, true);
  set(baseExceptionState, null);

  final codeHosting = injector.get<CodeHostingService>();
  final storage = injector.get<AppLocalStorageService>();
  final package = injector.get<PackageService>();

  final uri = Uri.parse(repositoryUrl);
  final appRepository = RepositoryEntity(
    provider: GitRepositoryProvider.github,
    organizationName: uri.pathSegments[0],
    projectName: uri.pathSegments[1],
  );

  final app = AppEntity.notInstallApp(appRepository);

  await codeHosting
      .getLastRelease(app) //
      .flatMap(storage.putApp)
      .flatMap(storage.fetchApps)
      .flatMap(package.addInfos)
      .map(_mapAppsToModels)
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
  final canInstall = await checkInstallPersmission();
  if (!canInstall) {
    return;
  }

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

  setupInjection();

  final codeHosting = injector.get<CodeHostingService>();
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
      .pureError(currentState)
      .map(appState.installed)
      .fold(id, id);

  installReceivePort.send(newState);
  await Future.delayed(const Duration(milliseconds: 300));
  installReceivePort.send('finish');
}

final uninstallAppAction = atomAction1<AppModel>((set, model) async {
  set(baseExceptionState, null);

  final package = injector.get<PackageService>();
  final storage = injector.get<AppLocalStorageService>();

  await package
      .uninstallApp(model.app) //
      .flatMap(storage.putApp)
      .map(model.state.noInstalled)
      .onSuccess(model.update);
});

final deleteAppAction = atomAction1<AppEntity>((set, app) async {
  set(baseExceptionState, null);

  final storage = injector.get<AppLocalStorageService>();
  final package = injector.get<PackageService>();

  await storage
      .deleteApp(app) //
      .flatMap(storage.fetchApps)
      .flatMap(package.addInfos)
      .map((apps) => apps.map(AppModel.new).toList())
      .updateState(appsState, set);
});

void openApp(AppEntity app) {
  final package = injector.get<PackageService>();
  package.openApp(app);
}

List<AppModel> _mapAppsToModels(List<AppEntity> apps) {
  return apps.map(AppModel.new).toList();
}
