import 'package:flutter_test/flutter_test.dart';
import 'package:getapps/domain/domain.dart';
import 'package:getapps/ui/home/view_models/home_viewmodel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../testing/mocks/mocks.dart';

void main() {
  late AppRepository appRepository;
  late CodeHostingRepository codeHostingRepository;
  late AppViewmodel viewModel;
  late AppEntity app;

  setUp(() {
    app = const AppEntity.notInstalled(
      repository: RepositoryEntity(
        provider: GitRepositoryProvider.github,
        organizationName: '',
        projectName: '',
      ),
    );
    appRepository = AppRepositoryMock();
    codeHostingRepository = CodeHostingRepositoryMock();
    viewModel = AppViewmodel(
      app: app,
      codeHostingRepository: codeHostingRepository,
      appRepository: appRepository,
      installAppCommand: Command1((v) async => const Success(unit)),
      uninstallAppCommand: Command1((v) async => const Success(unit)),
      softParentUpdate: () {},
    );
  });

  test('favorite app', () async {
    when(() => appRepository.putApp(app.copyWith(favorite: true))).thenAnswer(
      (_) async => Success(app),
    );

    await viewModel.favoriteAppCommand.execute();

    expect(viewModel.favoriteAppCommand.isSuccess, isTrue);
  });
}
