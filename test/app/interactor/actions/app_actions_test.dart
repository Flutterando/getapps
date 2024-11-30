import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getapps/app/interactor/actions/app_actions.dart';
import 'package:getapps/app/interactor/entities/app_entity.dart';
import 'package:getapps/app/interactor/entities/repository_entity.dart';
import 'package:getapps/app/interactor/states/app_state.dart';

void main() {
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
    appModel.addListener(() {
      if (appModel.state == DownloadingAppState(app, 0.8)) {
        cancelInstallAppAction();
      }
    });

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

    await installAppAction(appModel, '');
  });

  test('fake cancel', () async {
    final cancelable = CancelableOperation.fromFuture(() async {
      await Future.delayed(const Duration(seconds: 5));
      print('Future finalizcou');
    }());

    await Future.delayed(const Duration(seconds: 2));
    await cancelable.cancel();
    print('CPF CANCELADO');

    await Future.delayed(const Duration(seconds: 20));
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
