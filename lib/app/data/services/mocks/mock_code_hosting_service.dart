import 'package:getapps/app/core/exceptions/exception.dart';
import 'package:getapps/app/interactor/entities/app_entity.dart';
import 'package:getapps/app/interactor/services/code_hosting_service.dart';
import 'package:result_dart/result_dart.dart';

class MockCodeHostingService implements CodeHostingService {
  var _percent = 0.0;

  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }

  @override
  AsyncResult<AppEntity, AppException> downloadAPK(
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
}
