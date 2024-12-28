import 'package:result_dart/result_dart.dart';

import '../domain.dart';

class RegisterAppUsecase {
  RegisterAppUsecase(
    this._appRepository,
    this._codeHostingRepository,
  );

  final AppRepository _appRepository;
  final CodeHostingRepository _codeHostingRepository;

  AsyncResult<AppEntity> call(String repositoryUrl) async {
    final uri = Uri.tryParse(repositoryUrl);
    if (uri == null) {
      return InvalidRepositoryUrlException().toFailure();
    }

    final provider = _getProvider(uri);

    if (provider == GitRepositoryProvider.unknow) {
      return InvalidRepositoryUrlException().toFailure();
    }

    final appRepository = RepositoryEntity(
      provider: provider,
      organizationName: uri.pathSegments[0],
      projectName: uri.pathSegments[1],
    );

    final app = AppEntity.notInstallApp(appRepository);

    return _codeHostingRepository
        .getLastRelease(app) //
        .flatMap(_appRepository.putApp);
  }

  GitRepositoryProvider _getProvider(Uri uri) {
    return GitRepositoryProvider.values.firstWhere(
      (provider) => provider.host == uri.host,
      orElse: () => GitRepositoryProvider.unknow,
    );
  }
}
