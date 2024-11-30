import 'package:getapps/app/core/exceptions/exception.dart';
import 'package:getapps/app/interactor/services/app_local_storage_service.dart';
import 'package:result_dart/result_dart.dart';

import '../../../interactor/entities/app_entity.dart';

class MockAppLocalStorageService implements AppLocalStorageService {
  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }

  @override
  AsyncResult<AppEntity, AppException> putApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Success(app);
  }
}
