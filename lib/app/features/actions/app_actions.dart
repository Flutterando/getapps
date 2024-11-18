import 'package:asp/asp.dart';
import 'package:getapps/app/core/extensions/result_extension.dart';
import 'package:getapps/app/core/states/state.dart';
import 'package:getapps/app/features/entities/app_entity.dart';
import 'package:getapps/app/features/entities/repository_entity.dart';
import 'package:getapps/app/features/services/package_service.dart';
import 'package:getapps/app/features/states/app_state.dart';
import 'package:getapps/app/injector.dart';
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

Future<void> installAppAction(appModel, asset) async {
  final codeHosting = injector.get<CodeHostingService>();
  final storage = injector.get<AppLocalStorageService>();
  final package = injector.get<PackageService>();

  final currentState = appModel.state;

  appModel.loading();

  await codeHosting
      .getLastRelease(appModel.app) //
      .flatMap(
        (app) => codeHosting.downloadAPK(app, asset, (percent) {
          appModel.downloading(percent);
        }),
      )
      .onSuccess((_) => appModel.loading())
      .flatMap(package.installApp)
      .flatMap(storage.putApp)
      .onFailure((_) => appModel.update(currentState))
      .onSuccess((_) => appModel.installed());
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
