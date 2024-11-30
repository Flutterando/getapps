// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import '../../app.dart';

class AppEntity {
  final PackageInfoEntity packageInfo;
  final RepositoryEntity repository;
  final AppReleaseEntity lastRelease;
  final AppReleaseEntity currentRelease;
  final File? file;

  AppEntity({
    required this.packageInfo,
    required this.repository,
    required this.lastRelease,
    required this.currentRelease,
    this.file,
  });

  bool get appNotInstall => packageInfo is EmptyPackageInfoEntity;
  bool get updateIsAvailable => lastRelease != currentRelease;
  String get appName => packageInfo.name ?? repository.projectName;

  static AppEntity notInstallApp(RepositoryEntity repository) {
    return AppEntity(
      repository: repository,
      packageInfo: PackageInfoEntity.empty(),
      lastRelease: AppReleaseEntity.empty(),
      currentRelease: AppReleaseEntity.empty(),
    );
  }

  AppEntity copyWith({
    PackageInfoEntity? packageInfo,
    RepositoryEntity? repository,
    AppReleaseEntity? lastRelease,
    AppReleaseEntity? currentRelease,
    File? file,
  }) {
    return AppEntity(
      packageInfo: packageInfo ?? this.packageInfo,
      repository: repository ?? this.repository,
      lastRelease: lastRelease ?? this.lastRelease,
      currentRelease: currentRelease ?? this.currentRelease,
      file: file ?? this.file,
    );
  }
}
