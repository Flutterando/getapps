import 'package:flutter_test/flutter_test.dart';
import 'package:getapps/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../testing/fakes/fakes.dart';
import '../../../testing/mocks/mocks.dart';

void main() {
  late AppRepository appRepository;
  late CodeHostingRepository codeHostingRepository;
  late InstallAppUsecase usecase;

  setUp(() {
    appRepository = AppRepositoryMock();
    codeHostingRepository = CodeHostingRepositoryFake();
    usecase = InstallAppUsecase(appRepository, codeHostingRepository);
  });

  test('Should install apps', () async {
    // Arrange
    const app = NotInstalledAppEntity(
      repository: RepositoryEntity(
        provider: GitRepositoryProvider.github,
        organizationName: 'test',
        projectName: 'test',
      ),
    );

    when(() => appRepository.checkInstallPermission()).thenAnswer(
      (_) async => const Success(unit),
    );

    when(() => appRepository.installApp(app.toLoading())).thenAnswer(
      (_) async => const Success(app),
    );

    final appStates = <AppEntity>[];

    void onChangeApp(AppEntity updatedApp) {
      appStates.add(updatedApp);
    }

    // Act
    final result = await usecase(
      app: app,
      asset: '',
      onChangeApp: onChangeApp,
    );

    // Assert
    expect(result.isSuccess(), isTrue);
    expect(
        appStates,
        equals([
          app.toLoading(),
          app.toLoading(0.2),
          app.toLoading(0.4),
          app.toLoading(0.6),
          app.toLoading(0.8),
          app.toLoading(1.0),
          app.toLoading(),
          app.toInstalled(),
        ]));
  });

  test('Should cancel app installation', () async {
    // Arrange
    const app = NotInstalledAppEntity(
      repository: RepositoryEntity(
        provider: GitRepositoryProvider.github,
        organizationName: 'test',
        projectName: 'test',
      ),
    );

    when(() => appRepository.checkInstallPermission()).thenAnswer(
      (_) async => const Success(unit),
    );

    when(() => appRepository.installApp(app.toLoading())).thenAnswer(
      (_) async => const Success(app),
    );

    when(() => appRepository.checkInstallPermission()).thenAnswer(
      (_) async => const Success(unit),
    );

    when(() => appRepository.installApp(app.toLoading())).thenAnswer(
      (_) async => const Success(app),
    );

    final appStates = <AppEntity>[];

    void onChangeApp(AppEntity updatedApp) {
      if (updatedApp == app.toLoading(0.8)) {
        usecase.cancelInstall(true);
      }
      appStates.add(updatedApp);
    }

    // Act

    final result = await usecase(
      app: app,
      asset: '',
      onChangeApp: onChangeApp,
    );

    // Assert
    expect(result.isSuccess(), isTrue);
    expect(
      appStates,
      equals([
        app.toLoading(),
        app.toLoading(0.2),
        app.toLoading(0.4),
        app.toLoading(0.6),
        app.toLoading(0.8),
        app,
      ]),
    );
  });
}
