import 'package:getapps/domain/domain.dart';
import 'package:result_dart/result_dart.dart';

class MockCodeHostingRepository implements CodeHostingRepository {
  var _percent = 0.0;

  @override
  AsyncResult<AppEntity> downloadAPK(
    AppEntity app,
    String asset,
    void Function(double percent) onProgress,
  ) async {
    while (_percent < 1.0) {
      await Future.delayed(const Duration(milliseconds: 300));
      _percent += 0.2;
      _percent = double.parse(_percent.toStringAsFixed(1));
      onProgress(_percent);
    }

    return Success(app);
  }

  @override
  AsyncResult<AppEntity> getLastRelease(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    return Success(app);
  }

  @override
  Future<void> openRepository(AppEntity app) async {}

  @override
  AsyncResult<AppEntity> checkUpdate(AppEntity app) async {
    return Success(app);
  }
}
