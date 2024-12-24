import 'package:getapps/app/app.dart';
import 'package:getapps/app/data/repositories/app_repository.dart';

import 'image_bytes.dart';

final _apps = <AppEntity>[
  InstalledAppEntity(
    favorite: true,
    repository: const RepositoryEntity(
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
    currentRelease: const AppReleaseEntity(
      tagName: 'c8duej',
      assets: [],
    ),
    lastRelease: const AppReleaseEntity(
      tagName: 'c8duej',
      assets: [],
    ),
  ),
  InstalledAppEntity(
    favorite: true,
    repository: const RepositoryEntity(
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
    currentRelease: const AppReleaseEntity(
      tagName: 'c8duej',
      assets: [],
    ),
    lastRelease: const AppReleaseEntity(
      tagName: 'gfgwddsg',
      assets: [
        'https://flutterando.com/playflix_64.apk'
            'https://flutterando.com/playflix_86.apk'
            'https://flutterando.com/playflix.apk'
      ],
    ),
  ),
  const NotInstalledAppEntity(
    repository: RepositoryEntity(
      organizationName: 'Flutterando',
      projectName: 'My App',
      provider: GitRepositoryProvider.github,
    ),
  ),
];

class MockAppRepository implements AppRepository {
  @override
  AsyncResult<AppEntity> installApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return Success(app.copyWith(
      packageInfo: PackageInfoEntity(
        id: 'my.com.app.test',
        name: 'My App',
        version: '2.0.0',
        imageBytes: facebookImageBytes,
      ),
      currentRelease: const AppReleaseEntity(
        tagName: 'c8duej',
        assets: [],
      ),
      lastRelease: const AppReleaseEntity(
        tagName: 'c8duej',
        assets: [],
      ),
    ));
  }

  @override
  AsyncResult<AppEntity> addInfo(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Success(app.copyWith(
      packageInfo: PackageInfoEntity(
        id: 'my.com.app.test',
        name: 'My App',
        version: '2.0.0',
        imageBytes: facebookImageBytes,
      ),
    ));
  }

  @override
  AsyncResult<Unit> openApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Success.unit();
  }

  @override
  AsyncResult<AppEntity> uninstallApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Success(app);
  }

  @override
  AsyncResult<List<AppEntity>> addInfos(List<AppEntity> apps) async {
    return Success(apps);
  }

  @override
  AsyncResult<Unit> checkInstallPermission() async {
    return Success.unit();
  }

  @override
  AsyncResult<AppEntity> deleteApp(AppEntity app) {
    // TODO: implement deleteApp
    throw UnimplementedError();
  }

  @override
  AsyncResult<List<AppEntity>> fetchApps([_]) async {
    return Success(_apps);
  }

  @override
  AsyncResult<AppEntity> putApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (!_apps.contains(app)) {
      _apps.add(app);
    }

    _apps.add(app);
    return Success(app);
  }

  @override
  AsyncResult<AppEntity> registerApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _apps.remove(app);
    return Success(app);
  }
}
