import 'package:flutter_test/flutter_test.dart';
import 'package:getapps/domain/domain.dart';
import 'package:getapps/ui/home/view_models/home_viewmodel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../testing/mocks/mocks.dart';

void main() {
  late AppRepository appRepository;
  late CodeHostingRepository codeHostingRepository;
  late HomeViewmodel viewModel;

  setUp(() {
    appRepository = AppRepositoryMock();
    codeHostingRepository = CodeHostingRepositoryMock();
    viewModel = HomeViewmodel(
      appRepository,
      codeHostingRepository,
      InstallAppUsecase(appRepository, codeHostingRepository),
      UninstallAppUsecase(appRepository),
      RegisterAppUsecase(appRepository, codeHostingRepository),
    );
  });

  test('fetch Apps Command', () async {
    when(() => appRepository.fetchApps()).thenAnswer((_) async => const Success([]));

    await viewModel.fetchAppsCommand.execute();

    expect(viewModel.fetchAppsCommand.isSuccess, isTrue);
  });
}
