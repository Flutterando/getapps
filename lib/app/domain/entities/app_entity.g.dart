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
    };
