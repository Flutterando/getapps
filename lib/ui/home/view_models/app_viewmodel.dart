part of 'home_viewmodel.dart';

class AppViewmodel extends ChangeNotifier {
  AppViewmodel({
    required AppEntity app,
    required CodeHostingRepository codeHostingRepository,
    required AppRepository appRepository,
    required Command2<Unit, AppViewmodel, String> installAppCommand,
    required Command1<Unit, AppViewmodel> uninstallAppCommand,
    required Command1<Unit, AppViewmodel> deleteAppCommand,
    required VoidCallback softParentUpdate,
  })  : _app = app,
        _codeHostingRepository = codeHostingRepository,
        _appRepository = appRepository,
        _installAppCommand = installAppCommand,
        _uninstallAppCommand = uninstallAppCommand,
        _deleteAppCommand = deleteAppCommand,
        _softParentUpdate = softParentUpdate;

  final VoidCallback _softParentUpdate;
  final CodeHostingRepository _codeHostingRepository;
  final AppRepository _appRepository;
  final Command2<Unit, AppViewmodel, String> _installAppCommand;
  final Command1<Unit, AppViewmodel> _deleteAppCommand;

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

  Future<void> install(String selectedAsset) async {
    if (selectedAsset.isEmpty) {
      return;
    }

    await _installAppCommand.execute(this, selectedAsset);
  }

  Future<void> delete() async {
    await _deleteAppCommand.execute(this);
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
