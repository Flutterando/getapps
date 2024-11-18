import 'package:result_dart/result_dart.dart';

import '../../core/exceptions/exception.dart';
import '../entities/app_entity.dart';

abstract interface class AppLocalStorageService {
  AsyncResult<List<AppEntity>, AppException> fetchApps([_]);
  AsyncResult<AppEntity, AppException> putApp(AppEntity app);
  AsyncResult<AppEntity, AppException> deleteApp(AppEntity app);
}
