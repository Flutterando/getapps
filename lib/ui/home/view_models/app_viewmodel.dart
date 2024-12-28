part of 'home_viewmodel.dart';

class AppViewmodel extends ChangeNotifier {
  AppViewmodel({
    required AppEntity app,
    required CodeHostingRepository codeHostingRepository,
    required AppRepository appRepository,
    required Command1<Unit, AppViewmodel> installAppCommand,
    required Command1<Unit, AppViewmodel> uninstallAppCommand,
    required VoidCallback softParentUpdate,
  })  : _app = app,
        _codeHostingRepository = codeHostingRepository,
        _appRepository = appRepository,
        _installAppCommand = installAppCommand,
        _uninstallAppCommand = uninstallAppCommand,
        _softParentUpdate = softParentUpdate;

  final VoidCallback _softParentUpdate;
  final CodeHostingRepository _codeHostingRepository;
  final AppRepository _appRepository;
  final Command1<Unit, AppViewmodel> _installAppCommand;

  final Command1<Unit, AppViewmodel> _uninstallAppCommand;
  late final favoriteAppCommand = Command0(_favoriteApp);

  AppEntity _app;
  AppEntity get app => _app;

  bool get isLoading => app is LoadingAppEntity;
  double? get downloadPercent {
    if (app is LoadingAppEntity) {
      return (app as LoadingAppEntity).progress;
    }
    return null;
  }

  void _updateApp(AppEntity newApp) {
    if (newApp == _app) return;
    _app = newApp;
    notifyListeners();
  }

  Future<void> install() async {
    await _installAppCommand.execute(this);
  }

  Future<void> uninstall() async {
    await _uninstallAppCommand.execute(this);
    if (_uninstallAppCommand.isSuccess) {
      _updateApp(_app.toNotInstalled());
    }
  }

  void cancelInstallation() => _installAppCommand.cancel();

  void openRepository() {
    _codeHostingRepository.openRepository(_app);
  }

  void openApp() {
    _appRepository.openApp(app);
  }

  AsyncResult<Unit> _favoriteApp() async {
    final appCache = _app;
    final newApp = _app.copyWith(favorite: !_app.favorite);
    _updateApp(newApp);

    return _appRepository
        .putApp(newApp) //
        .pure(unit)
        .onSuccess((_) => _softParentUpdate())
        .onFailure((e) => _updateApp(appCache));
  }
}
