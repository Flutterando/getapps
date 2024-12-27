import 'package:flutter/material.dart';
import 'package:getapps/domain/usecases/register_app_usecase.dart';
import 'package:getapps/utils/functions/functions.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';

part 'app_viewmodel.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel(
    this._appRepository,
    this._codeHostingRepository,
    this._installAppUsecase,
    this._uninstallAppUsecase,
    this._registerAppUsecase,
  );

  final AppRepository _appRepository;
  final CodeHostingRepository _codeHostingRepository;
  final InstallAppUsecase _installAppUsecase;
  final UninstallAppUsecase _uninstallAppUsecase;
  final RegisterAppUsecase _registerAppUsecase;

  final debounceSearch = Debounce(delay: const Duration(milliseconds: 800));
  late final fetchAppsCommand = Command0(_fetchApps);
  late final deleteAppCommand = Command1(_deleteApp);
  late final registerAppCommand = Command1(_registerApp);
  late final checkUpdateCommand = Command0(_checkUpdates);
  late final installAppCommand = Command1(
    _installApp,
    onCancel: _installAppUsecase.cancelInstallApp,
  );
  late final _uninstallAppCommand = Command1(_uninstallApp);

  String _appVersion = '';
  String get appVersion => _appVersion;

  String _searchQuery = '';

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

  bool get canVisibleFavoriteView => favoriteApps.isNotEmpty && _searchQuery.isEmpty;

  void _setApps(List<AppViewmodel> apps) {
    _apps = apps;
    if (_apps.isNotEmpty) {
      _appVersion = _apps.first.app.packageInfo.version;
    }
    notifyListeners();
  }

  void resetSearch() {
    debounceSearch.cancel();
    _searchQuery = '';
    notifyListeners();
  }

  void searchApps(String query) {
    debounceSearch(() {
      _searchQuery = query;
      notifyListeners();
    });
  }

  void _addApp(AppViewmodel appModel) {
    _apps.add(appModel);
    notifyListeners();
  }

  void _removeApp(AppViewmodel appModel) {
    _apps.remove(appModel);
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
    return apps.map(_createAppViewmodel).toList();
  }

  AppViewmodel _createAppViewmodel(AppEntity app) {
    return AppViewmodel(
      app: app,
      codeHostingRepository: _codeHostingRepository,
      appRepository: _appRepository,
      installAppCommand: installAppCommand,
      uninstallAppCommand: _uninstallAppCommand,
      softParentUpdate: notifyListeners,
    );
  }

  AsyncResult<Unit> _registerApp(
    String repositoryUrl,
  ) {
    return _registerAppUsecase //
        .call(repositoryUrl)
        .map(_createAppViewmodel)
        .onSuccess(_addApp)
        .pure(unit);
  }

  AsyncResult<Unit> _deleteApp(AppViewmodel appModel) {
    return _appRepository
        .deleteApp(appModel.app) //
        .pure(appModel)
        .onSuccess(_removeApp)
        .pure(unit);
  }

  AsyncResult<Unit> _installApp(AppViewmodel appModel, [String selectedAsset = '']) async {
    final app = appModel.app.toLoading();
    appModel._updateApp(app);

    return _installAppUsecase.call(
      app,
      selectedAsset,
      appModel._updateApp,
    );
  }

  AsyncResult<Unit> _uninstallApp(AppViewmodel appModel) async {
    return _uninstallAppUsecase //
        .call(appModel.app)
        .pure(unit);
  }
}
