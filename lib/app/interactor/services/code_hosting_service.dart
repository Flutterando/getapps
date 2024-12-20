import '../../app.dart';

abstract interface class CodeHostingService {
  AsyncResult<AppEntity> getLastRelease(AppEntity app);
  AsyncResult<AppEntity> downloadAPK(
    AppEntity app,
    String asset,
    void Function(double percent) onProgress,
  );
  Future<void> openRepository(AppEntity app);
}
