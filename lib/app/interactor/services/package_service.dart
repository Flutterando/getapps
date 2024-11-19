import 'package:getapps/app/interactor/entities/app_entity.dart';
import 'package:result_dart/result_dart.dart';

import '../../core/exceptions/exception.dart';

abstract interface class PackageService {
  AsyncResult<AppEntity, AppException> addInfo(AppEntity app);
  AsyncResult<AppEntity, AppException> installApp(AppEntity app);
  AsyncResult<AppEntity, AppException> uninstallApp(AppEntity app);
  AsyncResult<Unit, AppException> openApp(AppEntity app);
}
