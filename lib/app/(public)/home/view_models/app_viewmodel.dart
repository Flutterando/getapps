part of 'home_viewmodel.dart';

class AppViewmodel extends ChangeNotifier {
  AppViewmodel(
    AppEntity app,
    UninstallAppUsecase uninstallAppUsecase,
    CodeHostingRepository codeHostingRepository,
    AppRepository appRepository,
    this.installAppCommand,
  )   : _app = app,
        _uninstallAppUsecase = uninstallAppUsecase,
        _codeHostingRepository = codeHostingRepository,
        _appRepository = appRepository;

  final CodeHostingRepository _codeHostingRepository;
  final AppRepository _appRepository;
  final UninstallAppUsecase _uninstallAppUsecase;
  final Command1<Unit, AppViewmodel> installAppCommand;

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

  void install() {
    installAppCommand.execute(this);
  }

  void cancelInstallation() => installAppCommand.cancel();

  void openRepository() {
    _codeHostingRepository.openRepository(_app);
  }

  void openApp() {
    _appRepository.openApp(app);
  }

  AsyncResult<AppEntity> favoriteApp() async {
    final appCache = _app;
    final newApp = _app.copyWith(favorite: !_app.favorite);
    _updateApp(newApp);

    return _appRepository
        .putApp(newApp) //
        .onFailure((e) => _updateApp(appCache));
  }

  void _updateApp(AppEntity newApp) {
    if (newApp == _app) return;
    _app = newApp;
    notifyListeners();
  }

  AsyncResult<AppEntity> _uninstallApp() async {
    return _uninstallAppUsecase.call(_app).onSuccess(_updateApp);
  }
}
