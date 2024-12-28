import 'package:flutter_test/flutter_test.dart';
import 'package:getapps/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../testing/mocks/mocks.dart';

void main() {
  late AppRepository appRepository;
  late UninstallAppUsecase usecase;

  setUp(() {
    appRepository = AppRepositoryMock();
    usecase = UninstallAppUsecase(appRepository);
  });
  test('uninstall app', () async {
    final app = AppEntity.notInstallApp(
      const RepositoryEntity(
        provider: GitRepositoryProvider.github,
        organizationName: 'Flutterando',
        projectName: 'yuno',
      ),
    );

    when(() => appRepository.uninstallApp(app)).thenAnswer((_) async => Success(app.toNotInstalled()));
    when(() => appRepository.putApp(app.toNotInstalled())).thenAnswer((_) async => Success(app.toNotInstalled()));

    final result = await usecase(app);

    expect(result.isSuccess(), isTrue);
    expect(result.getOrNull(), app.toNotInstalled());
  });
}
