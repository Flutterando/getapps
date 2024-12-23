// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_release_entity.dart';
import 'package_info_entity.dart';
import 'repository_entity.dart';

part 'app_entity.freezed.dart';
part 'app_entity.g.dart';

@freezed
class AppEntity with _$AppEntity {
  const AppEntity._();

  const factory AppEntity({
    @PackageInfoEntityConverter() required PackageInfoEntity packageInfo,
    @RepositoryEntityConverter() required RepositoryEntity repository,
    @AppReleaseEntityConverter() required AppReleaseEntity lastRelease,
    @AppReleaseEntityConverter() required AppReleaseEntity currentRelease,
    @FileConverter() File? file,
    @Default(false) bool favorite,
  }) = _AppEntity;

  const factory AppEntity.loading({
    @PackageInfoEntityConverter() required PackageInfoEntity packageInfo,
    @RepositoryEntityConverter() required RepositoryEntity repository,
    @AppReleaseEntityConverter() required AppReleaseEntity lastRelease,
    @AppReleaseEntityConverter() required AppReleaseEntity currentRelease,
    double? progress,
    @FileConverter() File? file,
    @Default(false) bool favorite,
  }) = LoadingAppEntity;

  const factory AppEntity.installed({
    @PackageInfoEntityConverter() required PackageInfoEntity packageInfo,
    @RepositoryEntityConverter() required RepositoryEntity repository,
    @AppReleaseEntityConverter() required AppReleaseEntity lastRelease,
    @AppReleaseEntityConverter() required AppReleaseEntity currentRelease,
    @FileConverter() File? file,
    @Default(false) bool favorite,
  }) = InstalledAppEntity;

  const factory AppEntity.notInstalled({
    @RepositoryEntityConverter() required RepositoryEntity repository,
    @PackageInfoEntityConverter() @Default(PackageInfoEntity.empty()) PackageInfoEntity packageInfo,
    @AppReleaseEntityConverter() @Default(AppReleaseEntity.empty()) AppReleaseEntity lastRelease,
    @AppReleaseEntityConverter() @Default(AppReleaseEntity.empty()) AppReleaseEntity currentRelease,
    @FileConverter() File? file,
    @Default(false) bool favorite,
  }) = NotInstalledAppEntity;

  factory AppEntity.fromJson(Map<String, Object?> json) => _$AppEntityFromJson(json);

  static NotInstalledAppEntity notInstallApp(RepositoryEntity repository) {
    return NotInstalledAppEntity(
      repository: repository,
    );
  }

  bool get appNotInstall => this is NotInstalledAppEntity;
  bool get updateIsAvailable => lastRelease != currentRelease;
  String get appName => packageInfo.name ?? repository.projectName;

  LoadingAppEntity toLoading([double? progress]) {
    return LoadingAppEntity(
      packageInfo: packageInfo,
      repository: repository,
      lastRelease: lastRelease,
      currentRelease: currentRelease,
      file: file,
      favorite: favorite,
      progress: progress,
    );
  }

  InstalledAppEntity toInstalled() {
    return InstalledAppEntity(
      packageInfo: packageInfo,
      repository: repository,
      lastRelease: lastRelease,
      currentRelease: currentRelease,
      file: file,
      favorite: favorite,
    );
  }

  NotInstalledAppEntity toNotInstalled() {
    return NotInstalledAppEntity(
      packageInfo: packageInfo,
      repository: repository,
      lastRelease: lastRelease,
      currentRelease: currentRelease,
      file: file,
      favorite: favorite,
    );
  }

  static AppEntity thisAppEntity() {
    return const InstalledAppEntity(
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
}

class FileConverter implements JsonConverter<File?, String?> {
  const FileConverter();

  @override
  File? fromJson(String? path) {
    if (path == null) {
      return null;
    }
    return File(path);
  }

  @override
  String? toJson(File? object) {
    return object?.path;
  }
}
