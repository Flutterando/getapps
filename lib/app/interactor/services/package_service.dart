import '../../app.dart';

abstract interface class PackageService {
  AsyncResult<AppEntity, AppException> addInfo(AppEntity app);
  AsyncResult<AppEntity, AppException> installApp(AppEntity app);
  AsyncResult<AppEntity, AppException> uninstallApp(AppEntity app);
  AsyncResult<Unit, AppException> openApp(AppEntity app);
}
