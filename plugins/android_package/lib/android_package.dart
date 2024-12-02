import 'src/android_package_platform_interface.dart';
import 'src/package_info.dart';

export 'src/package_info.dart';

class AndroidPackage {
  Future<PackageInfo?> getInfoById(String id) {
    return AndroidPackagePlatform.instance.getInfoById(id);
  }

  Future<PackageInfo?> getAPKInfo(String apkPath) {
    return AndroidPackagePlatform.instance.getAPKInfo(apkPath);
  }

  Future<bool> openApp(String packageId) {
    return AndroidPackagePlatform.instance.openApp(packageId);
  }

  Future<bool> uninstallApp(String packageId) {
    return AndroidPackagePlatform.instance.uninstallApp(packageId);
  }

  Future<bool> installApp(String apkFilePath) {
    return AndroidPackagePlatform.instance.installApp(apkFilePath);
  }

  Future<bool> checkAndRequestInstallPermission() {
    return AndroidPackagePlatform.instance.checkAndRequestInstallPermission();
  }
}
