// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_release_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppReleaseEntityImpl _$$AppReleaseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AppReleaseEntityImpl(
      tagName: json['tagName'] as String,
      assets:
          (json['assets'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AppReleaseEntityImplToJson(
        _$AppReleaseEntityImpl instance) =>
    <String, dynamic>{
      'tagName': instance.tagName,
      'assets': instance.assets,
      'runtimeType': instance.$type,
    };

_$EmptyAppReleaseEntityImpl _$$EmptyAppReleaseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$EmptyAppReleaseEntityImpl(
      tagName: json['tagName'] as String? ?? '',
      assets: (json['assets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyAppReleaseEntityImplToJson(
        _$EmptyAppReleaseEntityImpl instance) =>
    <String, dynamic>{
      'tagName': instance.tagName,
      'assets': instance.assets,
      'runtimeType': instance.$type,
    };
