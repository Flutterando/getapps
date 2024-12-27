import 'package:result_dart/result_dart.dart';

import '../domain.dart';
import '../repositories/app_repository.dart';
import '../repositories/code_hosting_repository.dart';

class RegisterAppUsecase {
  RegisterAppUsecase(
    this._appRepository,
    this._codeHostingRepository,
  );

  final AppRepository _appRepository;
  final CodeHostingRepository _codeHostingRepository;

  AsyncResult<AppEntity> call(String repositoryUrl) {
    final uri = Uri.parse(repositoryUrl);
    final appRepository = RepositoryEntity(
      provider: GitRepositoryProvider.github,
      organizationName: uri.pathSegments[0],
      projectName: uri.pathSegments[1],
    );

    final app = AppEntity.notInstallApp(appRepository);

    return _codeHostingRepository
        .getLastRelease(app) //
        .flatMap(_appRepository.putApp);
  }
}
