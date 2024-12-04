import '../../app.dart';

abstract interface class CodeHostingService {
  AsyncResult<AppEntity, AppException> getLastRelease(AppEntity app);
  AsyncResult<AppEntity, AppException> downloadAPK(
    AppEntity app,
    String asset,
    void Function(double percent) onProgress,
  );
  Future<void> openRepository(AppEntity app);
}
