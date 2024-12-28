import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_entity.freezed.dart';
part 'repository_entity.g.dart';

enum GitRepositoryProvider {
  @JsonValue('unknow')
  unknow(''),

  @JsonValue('github')
  github('github.com');

  final String host;
  const GitRepositoryProvider(this.host);
}

@freezed
class RepositoryEntity with _$RepositoryEntity {
  const factory RepositoryEntity({
    required GitRepositoryProvider provider,
    required String organizationName,
    required String projectName,
  }) = _RepositoryEntity;

  factory RepositoryEntity.fromJson(Map<String, Object?> json) => _$RepositoryEntityFromJson(json);
}

class RepositoryEntityConverter implements JsonConverter<RepositoryEntity, Map<String, dynamic>> {
  const RepositoryEntityConverter();

  @override
  RepositoryEntity fromJson(Map<String, dynamic> json) {
    return RepositoryEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(RepositoryEntity object) {
    return object.toJson();
  }
}
