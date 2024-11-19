import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:getapps/app/core/exceptions/exception.dart';
import 'package:getapps/app/injector.dart';
import 'package:getapps/app/interactor/actions/app_actions.dart';
import 'package:getapps/app/interactor/entities/app_entity.dart';
import 'package:getapps/app/interactor/entities/repository_entity.dart';
import 'package:getapps/app/interactor/services/app_local_storage_service.dart';
import 'package:getapps/app/interactor/services/code_hosting_service.dart';
import 'package:getapps/app/interactor/services/package_service.dart';
import 'package:getapps/app/interactor/states/app_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

class CodeHostingServiceMock extends Fake implements CodeHostingService {
  var _percent = 0.0;

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

class AppLocalStorageServiceMock extends Mock implements AppLocalStorageService {
  @override
  AsyncResult<AppEntity, AppException> putApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Success(app);
  }
}

class PackageServiceMock extends Mock implements PackageService {
  @override
  AsyncResult<AppEntity, AppException> installApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Success(app);
  }
}

void main() {
  setUp(() {
    injector.replaceInstance<CodeHostingService>(CodeHostingServiceMock());
    injector.replaceInstance<AppLocalStorageService>(AppLocalStorageServiceMock());
    injector.replaceInstance<PackageService>(PackageServiceMock());
  });
  test('installAppAction', () async {
    final app = NotInstallAppEntity(
      repository: RepositoryEntity(
        provider: GitRepositoryProvider.github,
        organizationName: 'flutter',
        projectName: 'flutter',
      ),
    );

    final appModel = AppModel(app);

    expect(
      appModel.toStream(),
      emitsInOrder([
        isA<LoadingAppState>(),
        DownloadingAppState(app, 0.2),
        DownloadingAppState(app, 0.4),
        DownloadingAppState(app, 0.6),
        DownloadingAppState(app, 0.8),
        DownloadingAppState(app, 1.0),
        isA<LoadingAppState>(),
        isA<InstalledAppState>(),
      ]),
    );

    await installAppAction(appModel, '');
  });

  test('cancel installAppAction', () async {
    final app = NotInstallAppEntity(
      repository: RepositoryEntity(
        provider: GitRepositoryProvider.github,
        organizationName: 'flutter',
        projectName: 'flutter',
      ),
    );

    final appModel = AppModel(app);

    expect(
      appModel.toStream(),
      emitsInOrder([
        isA<LoadingAppState>(),
        DownloadingAppState(app, 0.2),
        DownloadingAppState(app, 0.4),
        DownloadingAppState(app, 0.6),
        DownloadingAppState(app, 0.8),
        isA<NotInstallAppState>(),
      ]),
    );

    installAppAction(appModel, '');
    await Future.delayed(const Duration(milliseconds: 1000));
    await cancelInstallAppAction();
  });
}

extension AppModelToStream on AppModel {
  Stream<AppState> toStream() {
    final controller = StreamController<AppState>();

    addListener(() {
      controller.add(state);
    });

    return controller.stream;
  }
}
