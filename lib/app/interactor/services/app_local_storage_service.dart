import '../../app.dart';

abstract interface class AppLocalStorageService {
  AsyncResult<List<AppEntity>, AppException> fetchApps([_]);
  AsyncResult<AppEntity, AppException> putApp(AppEntity app);
  AsyncResult<AppEntity, AppException> deleteApp(AppEntity app);
}
