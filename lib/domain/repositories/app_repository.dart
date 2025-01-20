import 'package:getapps/domain/domain.dart';
import 'package:result_dart/result_dart.dart';

abstract class AppRepository {
  AsyncResult<Unit> openApp(AppEntity app);
  AsyncResult<List<AppEntity>> fetchApps([_]);
  AsyncResult<AppEntity> putApp(AppEntity app);
  AsyncResult<AppEntity> deleteApp(AppEntity app);
  AsyncResult<AppEntity> uninstallApp(AppEntity app);
  AsyncResult<Unit> checkInstallPermission();
  AsyncResult<AppEntity> addInfo(AppEntity app);
  AsyncResult<AppEntity> installApp(AppEntity app);
}
