import 'package:flutter_test/flutter_test.dart';
import 'package:getapps/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../testing/mocks/mocks.dart';

void main() {
  late AppRepository appRepository;
  late CodeHostingRepository codeHostingRepository;
  late RegisterAppUsecase usecase;

  setUp(() {
    appRepository = AppRepositoryMock();
    codeHostingRepository = CodeHostingRepositoryMock();
    usecase = RegisterAppUsecase(appRepository, codeHostingRepository);
  });

  test('Register Github Repository', () async {
    const repositoryUrl = 'https://github.com/Flutterando/yuno';
    final app = AppEntity.notInstallApp(
      const RepositoryEntity(
        provider: GitRepositoryProvider.github,
        organizationName: 'Flutterando',
        projectName: 'yuno',
      ),
    );

    when(() => codeHostingRepository.getLastRelease(app)).thenAnswer((_) async => Success(app));
    when(() => appRepository.putApp(app)).thenAnswer((_) async => Success(app));

    final result = await usecase(repositoryUrl);

    expect(result.isSuccess(), isTrue);
    expect(result.getOrNull(), app);
  });

  test(' Throws exception if not valid url', () async {
    expect(usecase('').exceptionOrNull(), completion(isA<InvalidRepositoryUrlException>()));
    expect(usecase('sfsdfsdf').exceptionOrNull(), completion(isA<InvalidRepositoryUrlException>()));
    expect(usecase('https://google.com').exceptionOrNull(), completion(isA<InvalidRepositoryUrlException>()));
  });
}
