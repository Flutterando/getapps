import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_release_entity.freezed.dart';
part 'app_release_entity.g.dart';

@freezed
sealed class AppReleaseEntity with _$AppReleaseEntity {
  const factory AppReleaseEntity({
    required String tagName,
    required List<String> assets,
  }) = _AppReleaseEntity;

  const factory AppReleaseEntity.empty({
    @Default('') String tagName,
    @Default([]) List<String> assets,
  }) = EmptyAppReleaseEntity;

  factory AppReleaseEntity.fromJson(Map<String, Object?> json) => _$AppReleaseEntityFromJson(json);
}

class AppReleaseEntityConverter implements JsonConverter<AppReleaseEntity, Map<String, dynamic>> {
  const AppReleaseEntityConverter();

  @override
  AppReleaseEntity fromJson(Map<String, dynamic> json) {
    return AppReleaseEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(AppReleaseEntity object) {
    return object.toJson();
  }
}
