// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageInfoEntityImpl _$$PackageInfoEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PackageInfoEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      imageBytes: (json['imageBytes'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      version: json['version'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PackageInfoEntityImplToJson(
        _$PackageInfoEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageBytes': instance.imageBytes,
      'version': instance.version,
      'runtimeType': instance.$type,
    };

_$EmptyPackageInfoEntityImpl _$$EmptyPackageInfoEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$EmptyPackageInfoEntityImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? null,
      imageBytes: (json['imageBytes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      version: json['version'] as String? ?? '',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyPackageInfoEntityImplToJson(
        _$EmptyPackageInfoEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageBytes': instance.imageBytes,
      'version': instance.version,
      'runtimeType': instance.$type,
    };
