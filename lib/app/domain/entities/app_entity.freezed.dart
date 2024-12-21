// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppEntity _$AppEntityFromJson(Map<String, dynamic> json) {
  return _AppEntity.fromJson(json);
}

/// @nodoc
mixin _$AppEntity {
  @PackageInfoEntityConverter()
  PackageInfoEntity get packageInfo => throw _privateConstructorUsedError;
  @RepositoryEntityConverter()
  RepositoryEntity get repository => throw _privateConstructorUsedError;
  @AppReleaseEntityConverter()
  AppReleaseEntity get lastRelease => throw _privateConstructorUsedError;
  @AppReleaseEntityConverter()
  AppReleaseEntity get currentRelease => throw _privateConstructorUsedError;
  @FileConverter()
  File? get file => throw _privateConstructorUsedError;
  bool get favorite => throw _privateConstructorUsedError;

  /// Serializes this AppEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppEntityCopyWith<AppEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEntityCopyWith<$Res> {
  factory $AppEntityCopyWith(AppEntity value, $Res Function(AppEntity) then) =
      _$AppEntityCopyWithImpl<$Res, AppEntity>;
  @useResult
  $Res call(
      {@PackageInfoEntityConverter() PackageInfoEntity packageInfo,
      @RepositoryEntityConverter() RepositoryEntity repository,
      @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
      @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
      @FileConverter() File? file,
      bool favorite});

  $PackageInfoEntityCopyWith<$Res> get packageInfo;
  $RepositoryEntityCopyWith<$Res> get repository;
  $AppReleaseEntityCopyWith<$Res> get lastRelease;
  $AppReleaseEntityCopyWith<$Res> get currentRelease;
}

/// @nodoc
class _$AppEntityCopyWithImpl<$Res, $Val extends AppEntity>
    implements $AppEntityCopyWith<$Res> {
  _$AppEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageInfo = null,
    Object? repository = null,
    Object? lastRelease = null,
    Object? currentRelease = null,
    Object? file = freezed,
    Object? favorite = null,
  }) {
    return _then(_value.copyWith(
      packageInfo: null == packageInfo
          ? _value.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfoEntity,
      repository: null == repository
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as RepositoryEntity,
      lastRelease: null == lastRelease
          ? _value.lastRelease
          : lastRelease // ignore: cast_nullable_to_non_nullable
              as AppReleaseEntity,
      currentRelease: null == currentRelease
          ? _value.currentRelease
          : currentRelease // ignore: cast_nullable_to_non_nullable
              as AppReleaseEntity,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PackageInfoEntityCopyWith<$Res> get packageInfo {
    return $PackageInfoEntityCopyWith<$Res>(_value.packageInfo, (value) {
      return _then(_value.copyWith(packageInfo: value) as $Val);
    });
  }

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepositoryEntityCopyWith<$Res> get repository {
    return $RepositoryEntityCopyWith<$Res>(_value.repository, (value) {
      return _then(_value.copyWith(repository: value) as $Val);
    });
  }

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppReleaseEntityCopyWith<$Res> get lastRelease {
    return $AppReleaseEntityCopyWith<$Res>(_value.lastRelease, (value) {
      return _then(_value.copyWith(lastRelease: value) as $Val);
    });
  }

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppReleaseEntityCopyWith<$Res> get currentRelease {
    return $AppReleaseEntityCopyWith<$Res>(_value.currentRelease, (value) {
      return _then(_value.copyWith(currentRelease: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppEntityImplCopyWith<$Res>
    implements $AppEntityCopyWith<$Res> {
  factory _$$AppEntityImplCopyWith(
          _$AppEntityImpl value, $Res Function(_$AppEntityImpl) then) =
      __$$AppEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@PackageInfoEntityConverter() PackageInfoEntity packageInfo,
      @RepositoryEntityConverter() RepositoryEntity repository,
      @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
      @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
      @FileConverter() File? file,
      bool favorite});

  @override
  $PackageInfoEntityCopyWith<$Res> get packageInfo;
  @override
  $RepositoryEntityCopyWith<$Res> get repository;
  @override
  $AppReleaseEntityCopyWith<$Res> get lastRelease;
  @override
  $AppReleaseEntityCopyWith<$Res> get currentRelease;
}

/// @nodoc
class __$$AppEntityImplCopyWithImpl<$Res>
    extends _$AppEntityCopyWithImpl<$Res, _$AppEntityImpl>
    implements _$$AppEntityImplCopyWith<$Res> {
  __$$AppEntityImplCopyWithImpl(
      _$AppEntityImpl _value, $Res Function(_$AppEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageInfo = null,
    Object? repository = null,
    Object? lastRelease = null,
    Object? currentRelease = null,
    Object? file = freezed,
    Object? favorite = null,
  }) {
    return _then(_$AppEntityImpl(
      packageInfo: null == packageInfo
          ? _value.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfoEntity,
      repository: null == repository
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as RepositoryEntity,
      lastRelease: null == lastRelease
          ? _value.lastRelease
          : lastRelease // ignore: cast_nullable_to_non_nullable
              as AppReleaseEntity,
      currentRelease: null == currentRelease
          ? _value.currentRelease
          : currentRelease // ignore: cast_nullable_to_non_nullable
              as AppReleaseEntity,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppEntityImpl extends _AppEntity {
  const _$AppEntityImpl(
      {@PackageInfoEntityConverter() required this.packageInfo,
      @RepositoryEntityConverter() required this.repository,
      @AppReleaseEntityConverter() required this.lastRelease,
      @AppReleaseEntityConverter() required this.currentRelease,
      @FileConverter() this.file,
      this.favorite = false})
      : super._();

  factory _$AppEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppEntityImplFromJson(json);

  @override
  @PackageInfoEntityConverter()
  final PackageInfoEntity packageInfo;
  @override
  @RepositoryEntityConverter()
  final RepositoryEntity repository;
  @override
  @AppReleaseEntityConverter()
  final AppReleaseEntity lastRelease;
  @override
  @AppReleaseEntityConverter()
  final AppReleaseEntity currentRelease;
  @override
  @FileConverter()
  final File? file;
  @override
  @JsonKey()
  final bool favorite;

  @override
  String toString() {
    return 'AppEntity(packageInfo: $packageInfo, repository: $repository, lastRelease: $lastRelease, currentRelease: $currentRelease, file: $file, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEntityImpl &&
            (identical(other.packageInfo, packageInfo) ||
                other.packageInfo == packageInfo) &&
            (identical(other.repository, repository) ||
                other.repository == repository) &&
            (identical(other.lastRelease, lastRelease) ||
                other.lastRelease == lastRelease) &&
            (identical(other.currentRelease, currentRelease) ||
                other.currentRelease == currentRelease) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, packageInfo, repository,
      lastRelease, currentRelease, file, favorite);

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEntityImplCopyWith<_$AppEntityImpl> get copyWith =>
      __$$AppEntityImplCopyWithImpl<_$AppEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppEntityImplToJson(
      this,
    );
  }
}

abstract class _AppEntity extends AppEntity {
  const factory _AppEntity(
      {@PackageInfoEntityConverter()
      required final PackageInfoEntity packageInfo,
      @RepositoryEntityConverter() required final RepositoryEntity repository,
      @AppReleaseEntityConverter() required final AppReleaseEntity lastRelease,
      @AppReleaseEntityConverter()
      required final AppReleaseEntity currentRelease,
      @FileConverter() final File? file,
      final bool favorite}) = _$AppEntityImpl;
  const _AppEntity._() : super._();

  factory _AppEntity.fromJson(Map<String, dynamic> json) =
      _$AppEntityImpl.fromJson;

  @override
  @PackageInfoEntityConverter()
  PackageInfoEntity get packageInfo;
  @override
  @RepositoryEntityConverter()
  RepositoryEntity get repository;
  @override
  @AppReleaseEntityConverter()
  AppReleaseEntity get lastRelease;
  @override
  @AppReleaseEntityConverter()
  AppReleaseEntity get currentRelease;
  @override
  @FileConverter()
  File? get file;
  @override
  bool get favorite;

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppEntityImplCopyWith<_$AppEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
