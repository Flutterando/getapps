import 'package:flutter/material.dart';
import 'package:getapps/app/app.dart';
import 'package:getapps/app/data/repositories/app_repository.dart';
import 'package:getapps/app/data/repositories/code_hosting_repository.dart';
import 'package:getapps/app/domain/usecases/install_app_usecase.dart';
import 'package:getapps/app/domain/usecases/uninstall_app_usecase.dart';

part 'app_viewmodel.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel(this._appRepository, this._codeHostingRepository);

  final AppRepository _appRepository;
  final CodeHostingRepository _codeHostingRepository;
  late final fetchAppsCommand = Command0(_fetchApps);
  late final deleteAppCommand = Command1(_deleteApp);
  late final registerAppCommand = Command1(_registerApp);
  late final checkUpdateCommand = Command0(_checkUpdates);

  String _appVersion = '';
  String get appVersion => _appVersion;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  List<AppViewmodel> _apps = [];
  List<AppViewmodel> get apps {
    if (_searchQuery.isEmpty) {
      return _apps;
    }

    return _apps.where((model) {
      final entity = model.app;
      final byName = entity.appName.toLowerCase().contains(_searchQuery.toLowerCase());
      final byPackageId = entity.packageInfo.id.toLowerCase().contains(_searchQuery.toLowerCase());
      return byName || byPackageId;
    }).toList();
  }

  List<AppViewmodel> get favoriteApps {
    return _apps.where((state) {
      return state.app.favorite && !state.app.appNotInstall;
    }).toList();
  }

  void _setApps(List<AppViewmodel> apps) {
    _apps = apps;
    if (_apps.isNotEmpty) {
      _appVersion = _apps.first.app.packageInfo.version;
    }
    notifyListeners();
  }

  void searchApps(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  AsyncResult<Unit> _checkUpdates() async {
    final installedApps = _apps.where((model) {
      return model.app is InstalledAppEntity;
    }).toList();

    for (var i = 0; i < installedApps.length; i++) {
      final result = await _codeHostingRepository
          .getLastRelease(installedApps[i].app) //
          .flatMap(_appRepository.putApp)
          .onSuccess((app) => installedApps[i]._updateApp);
      if (result.isError()) {
        return result.map((_) => unit);
      }
    }

    return const Success(unit);
  }

  AsyncResult<List<AppViewmodel>> _fetchApps([_]) {
    return _appRepository //
        .fetchApps()
        .map(_mapAppsToModels)
        .onSuccess(_setApps);
  }

  List<AppViewmodel> _mapAppsToModels(List<AppEntity> apps) {
    return apps
        .map((app) => AppViewmodel(
              app,
              InstallAppUsecase(_appRepository),
              UninstallAppUsecase(_appRepository),
              _codeHostingRepository,
              _appRepository,
            ))
        .toList();
  }

  AsyncResult<List<AppViewmodel>> _registerApp(
    String repositoryUrl,
  ) {
    final uri = Uri.parse(repositoryUrl);
    final appRepository = RepositoryEntity(
      provider: GitRepositoryProvider.github,
      organizationName: uri.pathSegments[0],
      projectName: uri.pathSegments[1],
    );

    final app = AppEntity.notInstallApp(appRepository);

    return _codeHostingRepository
        .getLastRelease(app) //
        .flatMap(_appRepository.putApp)
        .flatMap(_fetchApps);
  }

  AsyncResult<List<AppViewmodel>> _deleteApp(AppEntity app) {
    return _appRepository
        .deleteApp(app) //
        .flatMap(_fetchApps);
  }
}
