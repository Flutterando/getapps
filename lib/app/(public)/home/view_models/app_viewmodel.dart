part of 'home_viewmodel.dart';

class AppViewmodel extends ChangeNotifier {
  AppViewmodel(
    AppEntity app,
    InstallAppUsecase installAppUsecase,
    UninstallAppUsecase uninstallAppUsecase,
    CodeHostingRepository codeHostingRepository,
    AppRepository appRepository,
  )   : _app = app,
        _uninstallAppUsecase = uninstallAppUsecase,
        _codeHostingRepository = codeHostingRepository,
        _appRepository = appRepository,
        _installAppUsecase = installAppUsecase;

  final InstallAppUsecase _installAppUsecase;
  final CodeHostingRepository _codeHostingRepository;
  final AppRepository _appRepository;
  final UninstallAppUsecase _uninstallAppUsecase;

  late final installAppCommand = Command0(
    _installApp,
    onCancel: _installAppUsecase.cancelInstallApp,
  );

  late final uninstallAppCommand = Command0(_uninstallApp);

  AppEntity _app;
  AppEntity get app => _app;

  bool get isLoading => app is LoadingAppEntity;
  double? get downloadPercent {
    if (app is LoadingAppEntity) {
      return (app as LoadingAppEntity).progress;
    }
    return null;
  }

  void openRepository() {
    _codeHostingRepository.openRepository(_app);
  }

  void openApp() {
    _appRepository.openApp(app);
  }

  AsyncResult<AppEntity> favoriteApp() async {
    final newApp = _app.copyWith(favorite: !_app.favorite);

    return _appRepository
        .putApp(newApp) //
        .onSuccess(_updateApp);
  }

  void _updateApp(AppEntity newApp) {
    if (newApp == _app) return;
    _app = newApp;
    notifyListeners();
  }

  AsyncResult<Unit> _installApp([String selectedAsset = '']) async {
    return _installAppUsecase.call(
      _app,
      selectedAsset,
      _updateApp,
    );
  }

  AsyncResult<AppEntity> _uninstallApp() async {
    return _uninstallAppUsecase.call(_app).onSuccess(_updateApp);
  }
}
