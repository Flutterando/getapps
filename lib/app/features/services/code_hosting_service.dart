import 'package:getapps/app/core/exceptions/exception.dart';
import 'package:getapps/app/features/entities/app_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class CodeHostingService {
  AsyncResult<AppEntity, AppException> getLastRelease(AppEntity app);
  AsyncResult<AppEntity, AppException> downloadAPK(
    AppEntity app,
    String asset,
    void Function(double percent) onProgress,
  );
}
