// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepositoryEntityImpl _$$RepositoryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RepositoryEntityImpl(
      provider: $enumDecode(_$GitRepositoryProviderEnumMap, json['provider']),
      organizationName: json['organizationName'] as String,
      projectName: json['projectName'] as String,
    );

Map<String, dynamic> _$$RepositoryEntityImplToJson(
        _$RepositoryEntityImpl instance) =>
    <String, dynamic>{
      'provider': _$GitRepositoryProviderEnumMap[instance.provider]!,
      'organizationName': instance.organizationName,
      'projectName': instance.projectName,
    };

const _$GitRepositoryProviderEnumMap = {
  GitRepositoryProvider.unknow: 'unknow',
  GitRepositoryProvider.github: 'github',
};
