import 'package:result_dart/result_dart.dart';

import '../domain.dart';

abstract interface class CodeHostingRepository {
  AsyncResult<AppEntity> getLastRelease(AppEntity app);
  AsyncResult<AppEntity> downloadAPK(
    AppEntity app,
    String asset,
    void Function(double percent) onProgress,
  );
  Future<void> openRepository(AppEntity app);
  AsyncResult<AppEntity> checkUpdate(AppEntity app);
}
