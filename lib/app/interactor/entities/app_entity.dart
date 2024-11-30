import 'dart:io';

import '../../app.dart';

class AppEntity {
  final PackageInfoEntity packageInfo;
  final RepositoryEntity repository;
  final AppReleaseEntity lastRelease;
  final AppReleaseEntity currentRelease;
  final File? file;

  bool get installCandidate {
    return (this is NotInstallAppEntity && currentRelease.assets.isNotEmpty //
        ||
        lastRelease.tagName != currentRelease.tagName);
  }

  AppEntity({
    required this.packageInfo,
    required this.repository,
    required this.lastRelease,
    required this.currentRelease,
    this.file,
  });
}

class NotInstallAppEntity extends AppEntity {
  NotInstallAppEntity({
    required super.repository,
  }) : super(
          lastRelease: AppReleaseEntity.empty(),
          currentRelease: AppReleaseEntity.empty(),
          packageInfo: PackageInfoEntity.empty(),
        );
}
