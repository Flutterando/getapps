// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppEntityImpl _$$AppEntityImplFromJson(Map<String, dynamic> json) =>
    _$AppEntityImpl(
      packageInfo: const PackageInfoEntityConverter()
          .fromJson(json['packageInfo'] as Map<String, dynamic>),
      repository: const RepositoryEntityConverter()
          .fromJson(json['repository'] as Map<String, dynamic>),
      lastRelease: const AppReleaseEntityConverter()
          .fromJson(json['lastRelease'] as Map<String, dynamic>),
      currentRelease: const AppReleaseEntityConverter()
          .fromJson(json['currentRelease'] as Map<String, dynamic>),
      file: const FileConverter().fromJson(json['file'] as String?),
      favorite: json['favorite'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppEntityImplToJson(_$AppEntityImpl instance) =>
    <String, dynamic>{
      'packageInfo':
          const PackageInfoEntityConverter().toJson(instance.packageInfo),
      'repository':
          const RepositoryEntityConverter().toJson(instance.repository),
      'lastRelease':
          const AppReleaseEntityConverter().toJson(instance.lastRelease),
      'currentRelease':
          const AppReleaseEntityConverter().toJson(instance.currentRelease),
      'file': const FileConverter().toJson(instance.file),
      'favorite': instance.favorite,
      'runtimeType': instance.$type,
    };

_$LoadingAppEntityImpl _$$LoadingAppEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$LoadingAppEntityImpl(
      packageInfo: const PackageInfoEntityConverter()
          .fromJson(json['packageInfo'] as Map<String, dynamic>),
      repository: const RepositoryEntityConverter()
          .fromJson(json['repository'] as Map<String, dynamic>),
      lastRelease: const AppReleaseEntityConverter()
          .fromJson(json['lastRelease'] as Map<String, dynamic>),
      currentRelease: const AppReleaseEntityConverter()
          .fromJson(json['currentRelease'] as Map<String, dynamic>),
      progress: (json['progress'] as num?)?.toDouble(),
      file: const FileConverter().fromJson(json['file'] as String?),
      favorite: json['favorite'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingAppEntityImplToJson(
        _$LoadingAppEntityImpl instance) =>
    <String, dynamic>{
      'packageInfo':
          const PackageInfoEntityConverter().toJson(instance.packageInfo),
      'repository':
          const RepositoryEntityConverter().toJson(instance.repository),
      'lastRelease':
          const AppReleaseEntityConverter().toJson(instance.lastRelease),
      'currentRelease':
          const AppReleaseEntityConverter().toJson(instance.currentRelease),
      'progress': instance.progress,
      'file': const FileConverter().toJson(instance.file),
      'favorite': instance.favorite,
      'runtimeType': instance.$type,
    };

_$InstalledAppEntityImpl _$$InstalledAppEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$InstalledAppEntityImpl(
      packageInfo: const PackageInfoEntityConverter()
          .fromJson(json['packageInfo'] as Map<String, dynamic>),
      repository: const RepositoryEntityConverter()
          .fromJson(json['repository'] as Map<String, dynamic>),
      lastRelease: const AppReleaseEntityConverter()
          .fromJson(json['lastRelease'] as Map<String, dynamic>),
      currentRelease: const AppReleaseEntityConverter()
          .fromJson(json['currentRelease'] as Map<String, dynamic>),
      file: const FileConverter().fromJson(json['file'] as String?),
      favorite: json['favorite'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InstalledAppEntityImplToJson(
        _$InstalledAppEntityImpl instance) =>
    <String, dynamic>{
      'packageInfo':
          const PackageInfoEntityConverter().toJson(instance.packageInfo),
      'repository':
          const RepositoryEntityConverter().toJson(instance.repository),
      'lastRelease':
          const AppReleaseEntityConverter().toJson(instance.lastRelease),
      'currentRelease':
          const AppReleaseEntityConverter().toJson(instance.currentRelease),
      'file': const FileConverter().toJson(instance.file),
      'favorite': instance.favorite,
      'runtimeType': instance.$type,
    };

_$NotInstalledAppEntityImpl _$$NotInstalledAppEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$NotInstalledAppEntityImpl(
      repository: const RepositoryEntityConverter()
          .fromJson(json['repository'] as Map<String, dynamic>),
      packageInfo: json['packageInfo'] == null
          ? const PackageInfoEntity.empty()
          : const PackageInfoEntityConverter()
              .fromJson(json['packageInfo'] as Map<String, dynamic>),
      lastRelease: json['lastRelease'] == null
          ? const AppReleaseEntity.empty()
          : const AppReleaseEntityConverter()
              .fromJson(json['lastRelease'] as Map<String, dynamic>),
      currentRelease: json['currentRelease'] == null
          ? const AppReleaseEntity.empty()
          : const AppReleaseEntityConverter()
              .fromJson(json['currentRelease'] as Map<String, dynamic>),
      file: const FileConverter().fromJson(json['file'] as String?),
      favorite: json['favorite'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotInstalledAppEntityImplToJson(
        _$NotInstalledAppEntityImpl instance) =>
    <String, dynamic>{
      'repository':
          const RepositoryEntityConverter().toJson(instance.repository),
      'packageInfo':
          const PackageInfoEntityConverter().toJson(instance.packageInfo),
      'lastRelease':
          const AppReleaseEntityConverter().toJson(instance.lastRelease),
      'currentRelease':
          const AppReleaseEntityConverter().toJson(instance.currentRelease),
      'file': const FileConverter().toJson(instance.file),
      'favorite': instance.favorite,
      'runtimeType': instance.$type,
    };
