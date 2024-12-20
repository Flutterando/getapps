import '../../app.dart';

abstract interface class PackageService {
  AsyncResult<AppEntity> addInfo(AppEntity app);
  AsyncResult<List<AppEntity>> addInfos(List<AppEntity> apps);
  AsyncResult<AppEntity> installApp(AppEntity app);
  AsyncResult<Unit> checkInstallPermission();
  AsyncResult<AppEntity> uninstallApp(AppEntity app);
  AsyncResult<Unit> openApp(AppEntity app);
}
