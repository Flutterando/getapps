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

  factory AppEntity.fromJson(Map<String, Object?> json) => _$AppEntityFromJson(json);

  static AppEntity notInstallApp(RepositoryEntity repository) {
    return AppEntity(
      repository: repository,
      packageInfo: const PackageInfoEntity.empty(),
      lastRelease: const AppReleaseEntity.empty(),
      currentRelease: const AppReleaseEntity.empty(),
    );
  }

  bool get appNotInstall => packageInfo is EmptyPackageInfoEntity;
  bool get updateIsAvailable => lastRelease != currentRelease;
  String get appName => packageInfo.name ?? repository.projectName;

  static AppEntity thisAppEntity() {
    return const AppEntity(
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
