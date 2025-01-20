import 'package:flutter/material.dart';
import 'package:getapps/utils/functions/functions.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';

part 'app_viewmodel.dart';

mixin _StateHome on ChangeNotifier {
  String get _appVersion {
    return apps //
            .map((e) => e.app)
            .where((app) => app.packageInfo.id == AppEntity.thisAppEntity().packageInfo.id)
            .map((app) => app.packageInfo.version)
            .firstOrNull ??
        '0.0.0';
  }

  String get appVersion => _appVersion;

  final _debounceSearch = Debounce(delay: const Duration(milliseconds: 800));
  String _searchQuery = '';
  void resetSearch() {
    _debounceSearch.cancel();
    _searchQuery = '';
    notifyListeners();
  }

  void searchApps(String query) {
    _debounceSearch(() {
      _searchQuery = query;
      notifyListeners();
    });
  }

  List<AppViewmodel> _apps = [];
  List<AppViewmodel> get apps {
    if (_searchQuery.isEmpty) {
      return _apps.toList(growable: false);
    }

    return _apps.where((model) {
      final entity = model.app;
      final byName = entity.appName.toLowerCase().contains(_searchQuery.toLowerCase());
      final byPackageId = entity.packageInfo.id.toLowerCase().contains(_searchQuery.toLowerCase());
      return byName || byPackageId;
    }).toList(growable: false);
  }

  List<AppViewmodel> get favoriteApps {
    return _apps.where((state) {
      return state.app.favorite && !state.app.appNotInstall;
    }).toList(growable: false);
  }

  bool get canVisibleFavoriteView => favoriteApps.isNotEmpty && _searchQuery.isEmpty;

  @visibleForTesting
  void setApps(List<AppViewmodel> apps) {
    _setApps(apps);
  }

  void _setApps(List<AppViewmodel> apps) {
    _apps = apps;
    notifyListeners();
  }

  void _addApp(AppViewmodel appModel) {
    _apps.add(appModel);
    notifyListeners();
  }

  void _removeApp(AppViewmodel appModel) {
    _apps.remove(appModel);
    notifyListeners();
  }
}

class HomeViewmodel extends ChangeNotifier with _StateHome {
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

  late final fetchAppsCommand = Command0(_fetchApps);
  late final registerAppCommand = Command1(_registerApp);
  late final checkUpdateCommand = Command0(_checkUpdates);
  late final deleteAppCommand = Command1(_deleteApp);
  late final installAppCommand = Command2(
    _installApp,
    onCancel: _installAppUsecase.cancelInstall,
  );
  late final _uninstallAppCommand = Command1(_uninstallApp);

  AsyncResult<Unit> _checkUpdates() async {
    final installedApps = _apps.where((model) {
      return !model.app.appNotInstall;
    }).toList();

    for (var i = 0; i < installedApps.length; i++) {
      final result = await _codeHostingRepository
          .getLastRelease(installedApps[i].app) //
          .flatMap(_appRepository.putApp)
          .onSuccess(installedApps[i]._updateApp);
      if (result.isError()) {
        return result.pure(unit);
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

  @visibleForTesting
  AppViewmodel createAppViewmodel(AppEntity app) {
    return _createAppViewmodel(app);
  }

  AppViewmodel _createAppViewmodel(AppEntity app) {
    return AppViewmodel(
      app: app,
      codeHostingRepository: _codeHostingRepository,
      appRepository: _appRepository,
      installAppCommand: installAppCommand,
      uninstallAppCommand: _uninstallAppCommand,
      softParentUpdate: notifyListeners,
      deleteAppCommand: deleteAppCommand,
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

  AsyncResult<Unit> _installApp(AppViewmodel appModel, String selectedAsset) async {
    return _installAppUsecase.call(
      app: appModel.app,
      asset: selectedAsset,
      onChangeApp: appModel._updateApp,
    );
  }

  AsyncResult<Unit> _uninstallApp(AppViewmodel appModel) async {
    return _uninstallAppUsecase //
        .call(appModel.app)
        .pure(unit);
  }
}
