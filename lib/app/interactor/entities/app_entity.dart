// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import '../../app.dart';

class AppEntity {
  final PackageInfoEntity packageInfo;
  final RepositoryEntity repository;
  final AppReleaseEntity lastRelease;
  final AppReleaseEntity currentRelease;
  final File? file;
  final bool favorite;

  AppEntity({
    required this.packageInfo,
    required this.repository,
    required this.lastRelease,
    required this.currentRelease,
    this.file,
    this.favorite = false,
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

  static AppEntity getAppsEntity() {
    return AppEntity(
      repository: RepositoryEntity(
        provider: GitRepositoryProvider.github,
        organizationName: 'Flutterando',
        projectName: 'getapps',
      ),
      packageInfo: PackageInfoEntity(
        id: 'br.com.flutterando.getapps',
        version: '1.0.0',
        imageBytes: [],
      ),
      lastRelease: AppReleaseEntity.empty(),
      currentRelease: AppReleaseEntity.empty(),
    );
  }

  AppEntity copyWith({
    PackageInfoEntity? packageInfo,
    RepositoryEntity? repository,
    AppReleaseEntity? lastRelease,
    AppReleaseEntity? currentRelease,
    bool? favorite,
    File? file,
  }) {
    return AppEntity(
      packageInfo: packageInfo ?? this.packageInfo,
      repository: repository ?? this.repository,
      lastRelease: lastRelease ?? this.lastRelease,
      currentRelease: currentRelease ?? this.currentRelease,
      file: file ?? this.file,
      favorite: favorite ?? this.favorite,
    );
  }
}
