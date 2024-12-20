import '../../app.dart';

abstract interface class AppLocalStorageService {
  AsyncResult<List<AppEntity>> fetchApps([_]);
  AsyncResult<AppEntity> putApp(AppEntity app);
  AsyncResult<AppEntity> deleteApp(AppEntity app);
}
