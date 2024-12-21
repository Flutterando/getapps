import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_info_entity.freezed.dart';
part 'package_info_entity.g.dart';

@freezed
sealed class PackageInfoEntity with _$PackageInfoEntity {
  const PackageInfoEntity._();

  const factory PackageInfoEntity({
    required String id,
    String? name,
    required List<int> imageBytes,
    required String version,
  }) = _PackageInfoEntity;

  const factory PackageInfoEntity.empty({
    @Default('') String id,
    @Default(null) String? name,
    @Default([]) List<int> imageBytes,
    @Default('') String version,
  }) = EmptyPackageInfoEntity;

  factory PackageInfoEntity.fromJson(Map<String, Object?> json) => _$PackageInfoEntityFromJson(json);

  PackageInfoEntity toPackageInfoEntity() {
    return PackageInfoEntity(
      id: id,
      name: name,
      imageBytes: imageBytes,
      version: version,
    );
  }

  PackageInfoEntity toEmpty() {
    return const PackageInfoEntity.empty();
  }
}

class PackageInfoEntityConverter implements JsonConverter<PackageInfoEntity, Map<String, dynamic>> {
  const PackageInfoEntityConverter();

  @override
  PackageInfoEntity fromJson(Map<String, dynamic> json) {
    return PackageInfoEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PackageInfoEntity object) {
    return object.toJson();
  }
}
