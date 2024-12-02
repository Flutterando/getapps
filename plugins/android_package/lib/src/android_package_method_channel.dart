import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_package_platform_interface.dart';
import 'package_info.dart';

class MethodChannelAndroidPackage extends AndroidPackagePlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('android_package');

  @override
  Future<bool> openApp(String packageId) async {
    final result = await methodChannel.invokeMethod<bool>('openApp', packageId);
    return result ?? false;
  }

  @override
  Future<bool> uninstallApp(String packageId) async {
    final result = await methodChannel.invokeMethod<bool>('uninstallApp', packageId);
    return result ?? false;
  }

  @override
  Future<bool> installApp(String apkFilePath) async {
    final result = await methodChannel.invokeMethod<bool>('installApp', apkFilePath);
    return result ?? false;
  }

  @override
  Future<PackageInfo?> getInfoById(String id) async {
    final result = await methodChannel.invokeMethod<Map>('getInfoById', id);
    if (result == null) {
      return null;
    }

    return PackageInfo.fromMap(result);
  }

  @override
  Future<PackageInfo?> getAPKInfo(String apkPath) async {
    final result = await methodChannel.invokeMethod<Map>('getAPKInfo', apkPath);
    if (result == null) {
      return null;
    }

    return PackageInfo.fromMap(result);
  }

  @override
  Future<bool> checkAndRequestInstallPermission() async {
    final result = await methodChannel.invokeMethod<bool>('checkAndRequestInstallPermission');
    return result ?? false;
  }
}
