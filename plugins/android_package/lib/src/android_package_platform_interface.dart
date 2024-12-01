import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_package_method_channel.dart';
import 'package_info.dart';

abstract class AndroidPackagePlatform extends PlatformInterface {
  /// Constructs a AndroidPackagePlatform.
  AndroidPackagePlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidPackagePlatform _instance = MethodChannelAndroidPackage();

  /// The default instance of [AndroidPackagePlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidPackage].
  static AndroidPackagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidPackagePlatform] when
  /// they register themselves.
  static set instance(AndroidPackagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<PackageInfo?> getInfoById(String id) {
    throw UnimplementedError('getInfoById() has not been implemented.');
  }

  Future<PackageInfo?> getAPKInfo(String apkPath) {
    throw UnimplementedError('getAPKInfo() has not been implemented.');
  }

  Future<bool> openApp(String packageId) {
    throw UnimplementedError('openApp() has not been implemented.');
  }

  Future<bool> uninstallApp(String packageId) {
    throw UnimplementedError('uninstallApp() has not been implemented.');
  }

  Future<bool> installApp(String apkFilePath) {
    throw UnimplementedError('installApp() has not been implemented.');
  }

  Future<bool> checkAndRequestInstallPermission() {
    throw UnimplementedError('checkAndRequestInstallPermission() has not been implemented.');
  }
}
