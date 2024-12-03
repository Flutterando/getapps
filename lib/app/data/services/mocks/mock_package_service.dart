import 'package:getapps/app/app.dart';

import 'image_bytes.dart';

class MockPackageService implements PackageService {
  @override
  AsyncResult<AppEntity, AppException> installApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Success(app.copyWith(
      packageInfo: PackageInfoEntity(
        id: 'my.com.app.test',
        name: 'My App',
        version: '2.0.0',
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
    ));
  }

  @override
  AsyncResult<AppEntity, AppException> addInfo(AppEntity app) async {
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
  AsyncResult<Unit, AppException> openApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Success.unit();
  }

  @override
  AsyncResult<AppEntity, AppException> uninstallApp(AppEntity app) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Success(app);
  }

  @override
  AsyncResult<List<AppEntity>, AppException> addInfos(List<AppEntity> apps) async {
    return Success(apps);
  }

  @override
  AsyncResult<Unit, AppException> checkInstallPermission() async {
    return Success.unit();
  }
}
