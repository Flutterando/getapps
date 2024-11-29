import 'package:auto_injector/auto_injector.dart';
import 'package:getapps/app/core/exceptions/exception.dart';
import 'package:getapps/app/interactor/entities/app_entity.dart';
import 'package:getapps/app/interactor/services/package_service.dart';
import 'package:result_dart/result_dart.dart';

import 'interactor/services/app_local_storage_service.dart';
import 'interactor/services/code_hosting_service.dart';

final injector = AutoInjector();

void setupInjection() {}

void setupMockInjection() {
  injector.addSingleton<CodeHostingService>(CodeHostingServiceMock.new);
  injector.addSingleton<AppLocalStorageService>(AppLocalStorageServiceMock.new);
  injector.addSingleton<PackageService>(PackageServiceMock.new);
  injector.commit();
}

class CodeHostingServiceMock implements CodeHostingService {
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

class AppLocalStorageServiceMock implements AppLocalStorageService {
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

class PackageServiceMock implements PackageService {
  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }

  @override
  AsyncResult<AppEntity, AppException> installApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Success(app);
  }
}
