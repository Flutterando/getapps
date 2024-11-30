import 'package:getapps/app/app.dart';

import 'image_bytes.dart';

final _apps = <AppEntity>[
  AppEntity(
    repository: RepositoryEntity(
      organizationName: 'Flutterando',
      projectName: 'yuno',
      provider: GitRepositoryProvider.github,
    ),
    packageInfo: PackageInfoEntity(
      id: 'br.com.flutterando.yuno',
      name: 'YuNO',
      version: '1.0.0',
      imageBytes: facebookImageBytes,
    ),
    currentRelease: AppReleaseEntity(
      tagName: 'c8duej',
      assets: [],
    ),
    lastRelease: AppReleaseEntity(
      tagName: 'c8duej',
      assets: [],
    ),
  ),
  AppEntity(
    repository: RepositoryEntity(
      organizationName: 'Flutterando',
      projectName: 'playflix',
      provider: GitRepositoryProvider.github,
    ),
    packageInfo: PackageInfoEntity(
      id: 'br.com.flutterando.playflix',
      name: 'Playflix',
      version: '1.0.0',
      imageBytes: facebookImageBytes,
    ),
    currentRelease: AppReleaseEntity(
      tagName: 'c8duej',
      assets: [],
    ),
    lastRelease: AppReleaseEntity(
      tagName: 'gfgwddsg',
      assets: [
        'https://flutterando.com/playflix_64.apk'
            'https://flutterando.com/playflix_86.apk'
            'https://flutterando.com/playflix.apk'
      ],
    ),
  ),
  AppEntity.notInstallApp(
    RepositoryEntity(
      organizationName: 'Flutterando',
      projectName: 'My App',
      provider: GitRepositoryProvider.github,
    ),
  ),
];

class MockAppLocalStorageService implements AppLocalStorageService {
  @override
  AsyncResult<AppEntity, AppException> putApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (!_apps.contains(app)) {
      _apps.add(app);
    }

    _apps.add(app);
    return Success(app);
  }

  @override
  AsyncResult<AppEntity, AppException> deleteApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _apps.remove(app);
    return Success(app);
  }

  @override
  AsyncResult<List<AppEntity>, AppException> fetchApps([_]) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return Success(_apps);
  }
}
