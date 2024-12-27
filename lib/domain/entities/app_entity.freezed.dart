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
  switch (json['runtimeType']) {
    case 'default':
      return _AppEntity.fromJson(json);
    case 'loading':
      return LoadingAppEntity.fromJson(json);
    case 'installed':
      return InstalledAppEntity.fromJson(json);
    case 'notInstalled':
      return NotInstalledAppEntity.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        $default, {
    required TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)
        loading,
    required TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        installed,
    required TResult Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        notInstalled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        $default, {
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)?
        loading,
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        installed,
    TResult? Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        notInstalled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        $default, {
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)?
        loading,
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        installed,
    TResult Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        notInstalled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppEntity value) $default, {
    required TResult Function(LoadingAppEntity value) loading,
    required TResult Function(InstalledAppEntity value) installed,
    required TResult Function(NotInstalledAppEntity value) notInstalled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppEntity value)? $default, {
    TResult? Function(LoadingAppEntity value)? loading,
    TResult? Function(InstalledAppEntity value)? installed,
    TResult? Function(NotInstalledAppEntity value)? notInstalled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppEntity value)? $default, {
    TResult Function(LoadingAppEntity value)? loading,
    TResult Function(InstalledAppEntity value)? installed,
    TResult Function(NotInstalledAppEntity value)? notInstalled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

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
      this.favorite = false,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

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

  @JsonKey(name: 'runtimeType')
  final String $type;

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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        $default, {
    required TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)
        loading,
    required TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        installed,
    required TResult Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        notInstalled,
  }) {
    return $default(
        packageInfo, repository, lastRelease, currentRelease, file, favorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        $default, {
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)?
        loading,
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        installed,
    TResult? Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        notInstalled,
  }) {
    return $default?.call(
        packageInfo, repository, lastRelease, currentRelease, file, favorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        $default, {
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)?
        loading,
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        installed,
    TResult Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        notInstalled,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          packageInfo, repository, lastRelease, currentRelease, file, favorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppEntity value) $default, {
    required TResult Function(LoadingAppEntity value) loading,
    required TResult Function(InstalledAppEntity value) installed,
    required TResult Function(NotInstalledAppEntity value) notInstalled,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppEntity value)? $default, {
    TResult? Function(LoadingAppEntity value)? loading,
    TResult? Function(InstalledAppEntity value)? installed,
    TResult? Function(NotInstalledAppEntity value)? notInstalled,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppEntity value)? $default, {
    TResult Function(LoadingAppEntity value)? loading,
    TResult Function(InstalledAppEntity value)? installed,
    TResult Function(NotInstalledAppEntity value)? notInstalled,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

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

/// @nodoc
abstract class _$$LoadingAppEntityImplCopyWith<$Res>
    implements $AppEntityCopyWith<$Res> {
  factory _$$LoadingAppEntityImplCopyWith(_$LoadingAppEntityImpl value,
          $Res Function(_$LoadingAppEntityImpl) then) =
      __$$LoadingAppEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@PackageInfoEntityConverter() PackageInfoEntity packageInfo,
      @RepositoryEntityConverter() RepositoryEntity repository,
      @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
      @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
      double? progress,
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
class __$$LoadingAppEntityImplCopyWithImpl<$Res>
    extends _$AppEntityCopyWithImpl<$Res, _$LoadingAppEntityImpl>
    implements _$$LoadingAppEntityImplCopyWith<$Res> {
  __$$LoadingAppEntityImplCopyWithImpl(_$LoadingAppEntityImpl _value,
      $Res Function(_$LoadingAppEntityImpl) _then)
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
    Object? progress = freezed,
    Object? file = freezed,
    Object? favorite = null,
  }) {
    return _then(_$LoadingAppEntityImpl(
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
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$LoadingAppEntityImpl extends LoadingAppEntity {
  const _$LoadingAppEntityImpl(
      {@PackageInfoEntityConverter() required this.packageInfo,
      @RepositoryEntityConverter() required this.repository,
      @AppReleaseEntityConverter() required this.lastRelease,
      @AppReleaseEntityConverter() required this.currentRelease,
      this.progress,
      @FileConverter() this.file,
      this.favorite = false,
      final String? $type})
      : $type = $type ?? 'loading',
        super._();

  factory _$LoadingAppEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoadingAppEntityImplFromJson(json);

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
  final double? progress;
  @override
  @FileConverter()
  final File? file;
  @override
  @JsonKey()
  final bool favorite;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppEntity.loading(packageInfo: $packageInfo, repository: $repository, lastRelease: $lastRelease, currentRelease: $currentRelease, progress: $progress, file: $file, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingAppEntityImpl &&
            (identical(other.packageInfo, packageInfo) ||
                other.packageInfo == packageInfo) &&
            (identical(other.repository, repository) ||
                other.repository == repository) &&
            (identical(other.lastRelease, lastRelease) ||
                other.lastRelease == lastRelease) &&
            (identical(other.currentRelease, currentRelease) ||
                other.currentRelease == currentRelease) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, packageInfo, repository,
      lastRelease, currentRelease, progress, file, favorite);

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingAppEntityImplCopyWith<_$LoadingAppEntityImpl> get copyWith =>
      __$$LoadingAppEntityImplCopyWithImpl<_$LoadingAppEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        $default, {
    required TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)
        loading,
    required TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        installed,
    required TResult Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        notInstalled,
  }) {
    return loading(packageInfo, repository, lastRelease, currentRelease,
        progress, file, favorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        $default, {
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)?
        loading,
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        installed,
    TResult? Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        notInstalled,
  }) {
    return loading?.call(packageInfo, repository, lastRelease, currentRelease,
        progress, file, favorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        $default, {
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)?
        loading,
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        installed,
    TResult Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        notInstalled,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(packageInfo, repository, lastRelease, currentRelease,
          progress, file, favorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppEntity value) $default, {
    required TResult Function(LoadingAppEntity value) loading,
    required TResult Function(InstalledAppEntity value) installed,
    required TResult Function(NotInstalledAppEntity value) notInstalled,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppEntity value)? $default, {
    TResult? Function(LoadingAppEntity value)? loading,
    TResult? Function(InstalledAppEntity value)? installed,
    TResult? Function(NotInstalledAppEntity value)? notInstalled,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppEntity value)? $default, {
    TResult Function(LoadingAppEntity value)? loading,
    TResult Function(InstalledAppEntity value)? installed,
    TResult Function(NotInstalledAppEntity value)? notInstalled,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingAppEntityImplToJson(
      this,
    );
  }
}

abstract class LoadingAppEntity extends AppEntity {
  const factory LoadingAppEntity(
      {@PackageInfoEntityConverter()
      required final PackageInfoEntity packageInfo,
      @RepositoryEntityConverter() required final RepositoryEntity repository,
      @AppReleaseEntityConverter() required final AppReleaseEntity lastRelease,
      @AppReleaseEntityConverter()
      required final AppReleaseEntity currentRelease,
      final double? progress,
      @FileConverter() final File? file,
      final bool favorite}) = _$LoadingAppEntityImpl;
  const LoadingAppEntity._() : super._();

  factory LoadingAppEntity.fromJson(Map<String, dynamic> json) =
      _$LoadingAppEntityImpl.fromJson;

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
  double? get progress;
  @override
  @FileConverter()
  File? get file;
  @override
  bool get favorite;

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingAppEntityImplCopyWith<_$LoadingAppEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InstalledAppEntityImplCopyWith<$Res>
    implements $AppEntityCopyWith<$Res> {
  factory _$$InstalledAppEntityImplCopyWith(_$InstalledAppEntityImpl value,
          $Res Function(_$InstalledAppEntityImpl) then) =
      __$$InstalledAppEntityImplCopyWithImpl<$Res>;
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
class __$$InstalledAppEntityImplCopyWithImpl<$Res>
    extends _$AppEntityCopyWithImpl<$Res, _$InstalledAppEntityImpl>
    implements _$$InstalledAppEntityImplCopyWith<$Res> {
  __$$InstalledAppEntityImplCopyWithImpl(_$InstalledAppEntityImpl _value,
      $Res Function(_$InstalledAppEntityImpl) _then)
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
    return _then(_$InstalledAppEntityImpl(
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
class _$InstalledAppEntityImpl extends InstalledAppEntity {
  const _$InstalledAppEntityImpl(
      {@PackageInfoEntityConverter() required this.packageInfo,
      @RepositoryEntityConverter() required this.repository,
      @AppReleaseEntityConverter() required this.lastRelease,
      @AppReleaseEntityConverter() required this.currentRelease,
      @FileConverter() this.file,
      this.favorite = false,
      final String? $type})
      : $type = $type ?? 'installed',
        super._();

  factory _$InstalledAppEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstalledAppEntityImplFromJson(json);

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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppEntity.installed(packageInfo: $packageInfo, repository: $repository, lastRelease: $lastRelease, currentRelease: $currentRelease, file: $file, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstalledAppEntityImpl &&
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
  _$$InstalledAppEntityImplCopyWith<_$InstalledAppEntityImpl> get copyWith =>
      __$$InstalledAppEntityImplCopyWithImpl<_$InstalledAppEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        $default, {
    required TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)
        loading,
    required TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        installed,
    required TResult Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        notInstalled,
  }) {
    return installed(
        packageInfo, repository, lastRelease, currentRelease, file, favorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        $default, {
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)?
        loading,
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        installed,
    TResult? Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        notInstalled,
  }) {
    return installed?.call(
        packageInfo, repository, lastRelease, currentRelease, file, favorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        $default, {
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)?
        loading,
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        installed,
    TResult Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        notInstalled,
    required TResult orElse(),
  }) {
    if (installed != null) {
      return installed(
          packageInfo, repository, lastRelease, currentRelease, file, favorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppEntity value) $default, {
    required TResult Function(LoadingAppEntity value) loading,
    required TResult Function(InstalledAppEntity value) installed,
    required TResult Function(NotInstalledAppEntity value) notInstalled,
  }) {
    return installed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppEntity value)? $default, {
    TResult? Function(LoadingAppEntity value)? loading,
    TResult? Function(InstalledAppEntity value)? installed,
    TResult? Function(NotInstalledAppEntity value)? notInstalled,
  }) {
    return installed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppEntity value)? $default, {
    TResult Function(LoadingAppEntity value)? loading,
    TResult Function(InstalledAppEntity value)? installed,
    TResult Function(NotInstalledAppEntity value)? notInstalled,
    required TResult orElse(),
  }) {
    if (installed != null) {
      return installed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InstalledAppEntityImplToJson(
      this,
    );
  }
}

abstract class InstalledAppEntity extends AppEntity {
  const factory InstalledAppEntity(
      {@PackageInfoEntityConverter()
      required final PackageInfoEntity packageInfo,
      @RepositoryEntityConverter() required final RepositoryEntity repository,
      @AppReleaseEntityConverter() required final AppReleaseEntity lastRelease,
      @AppReleaseEntityConverter()
      required final AppReleaseEntity currentRelease,
      @FileConverter() final File? file,
      final bool favorite}) = _$InstalledAppEntityImpl;
  const InstalledAppEntity._() : super._();

  factory InstalledAppEntity.fromJson(Map<String, dynamic> json) =
      _$InstalledAppEntityImpl.fromJson;

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
  _$$InstalledAppEntityImplCopyWith<_$InstalledAppEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotInstalledAppEntityImplCopyWith<$Res>
    implements $AppEntityCopyWith<$Res> {
  factory _$$NotInstalledAppEntityImplCopyWith(
          _$NotInstalledAppEntityImpl value,
          $Res Function(_$NotInstalledAppEntityImpl) then) =
      __$$NotInstalledAppEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@RepositoryEntityConverter() RepositoryEntity repository,
      @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
      @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
      @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
      @FileConverter() File? file,
      bool favorite});

  @override
  $RepositoryEntityCopyWith<$Res> get repository;
  @override
  $PackageInfoEntityCopyWith<$Res> get packageInfo;
  @override
  $AppReleaseEntityCopyWith<$Res> get lastRelease;
  @override
  $AppReleaseEntityCopyWith<$Res> get currentRelease;
}

/// @nodoc
class __$$NotInstalledAppEntityImplCopyWithImpl<$Res>
    extends _$AppEntityCopyWithImpl<$Res, _$NotInstalledAppEntityImpl>
    implements _$$NotInstalledAppEntityImplCopyWith<$Res> {
  __$$NotInstalledAppEntityImplCopyWithImpl(_$NotInstalledAppEntityImpl _value,
      $Res Function(_$NotInstalledAppEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repository = null,
    Object? packageInfo = null,
    Object? lastRelease = null,
    Object? currentRelease = null,
    Object? file = freezed,
    Object? favorite = null,
  }) {
    return _then(_$NotInstalledAppEntityImpl(
      repository: null == repository
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as RepositoryEntity,
      packageInfo: null == packageInfo
          ? _value.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfoEntity,
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
class _$NotInstalledAppEntityImpl extends NotInstalledAppEntity {
  const _$NotInstalledAppEntityImpl(
      {@RepositoryEntityConverter() required this.repository,
      @PackageInfoEntityConverter()
      this.packageInfo = const PackageInfoEntity.empty(),
      @AppReleaseEntityConverter()
      this.lastRelease = const AppReleaseEntity.empty(),
      @AppReleaseEntityConverter()
      this.currentRelease = const AppReleaseEntity.empty(),
      @FileConverter() this.file,
      this.favorite = false,
      final String? $type})
      : $type = $type ?? 'notInstalled',
        super._();

  factory _$NotInstalledAppEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotInstalledAppEntityImplFromJson(json);

  @override
  @RepositoryEntityConverter()
  final RepositoryEntity repository;
  @override
  @JsonKey()
  @PackageInfoEntityConverter()
  final PackageInfoEntity packageInfo;
  @override
  @JsonKey()
  @AppReleaseEntityConverter()
  final AppReleaseEntity lastRelease;
  @override
  @JsonKey()
  @AppReleaseEntityConverter()
  final AppReleaseEntity currentRelease;
  @override
  @FileConverter()
  final File? file;
  @override
  @JsonKey()
  final bool favorite;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppEntity.notInstalled(repository: $repository, packageInfo: $packageInfo, lastRelease: $lastRelease, currentRelease: $currentRelease, file: $file, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotInstalledAppEntityImpl &&
            (identical(other.repository, repository) ||
                other.repository == repository) &&
            (identical(other.packageInfo, packageInfo) ||
                other.packageInfo == packageInfo) &&
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
  int get hashCode => Object.hash(runtimeType, repository, packageInfo,
      lastRelease, currentRelease, file, favorite);

  /// Create a copy of AppEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotInstalledAppEntityImplCopyWith<_$NotInstalledAppEntityImpl>
      get copyWith => __$$NotInstalledAppEntityImplCopyWithImpl<
          _$NotInstalledAppEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        $default, {
    required TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)
        loading,
    required TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        installed,
    required TResult Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)
        notInstalled,
  }) {
    return notInstalled(
        repository, packageInfo, lastRelease, currentRelease, file, favorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        $default, {
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)?
        loading,
    TResult? Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        installed,
    TResult? Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        notInstalled,
  }) {
    return notInstalled?.call(
        repository, packageInfo, lastRelease, currentRelease, file, favorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        $default, {
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            double? progress,
            @FileConverter() File? file,
            bool favorite)?
        loading,
    TResult Function(
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @RepositoryEntityConverter() RepositoryEntity repository,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        installed,
    TResult Function(
            @RepositoryEntityConverter() RepositoryEntity repository,
            @PackageInfoEntityConverter() PackageInfoEntity packageInfo,
            @AppReleaseEntityConverter() AppReleaseEntity lastRelease,
            @AppReleaseEntityConverter() AppReleaseEntity currentRelease,
            @FileConverter() File? file,
            bool favorite)?
        notInstalled,
    required TResult orElse(),
  }) {
    if (notInstalled != null) {
      return notInstalled(
          repository, packageInfo, lastRelease, currentRelease, file, favorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppEntity value) $default, {
    required TResult Function(LoadingAppEntity value) loading,
    required TResult Function(InstalledAppEntity value) installed,
    required TResult Function(NotInstalledAppEntity value) notInstalled,
  }) {
    return notInstalled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppEntity value)? $default, {
    TResult? Function(LoadingAppEntity value)? loading,
    TResult? Function(InstalledAppEntity value)? installed,
    TResult? Function(NotInstalledAppEntity value)? notInstalled,
  }) {
    return notInstalled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppEntity value)? $default, {
    TResult Function(LoadingAppEntity value)? loading,
    TResult Function(InstalledAppEntity value)? installed,
    TResult Function(NotInstalledAppEntity value)? notInstalled,
    required TResult orElse(),
  }) {
    if (notInstalled != null) {
      return notInstalled(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotInstalledAppEntityImplToJson(
      this,
    );
  }
}

abstract class NotInstalledAppEntity extends AppEntity {
  const factory NotInstalledAppEntity(
      {@RepositoryEntityConverter() required final RepositoryEntity repository,
      @PackageInfoEntityConverter() final PackageInfoEntity packageInfo,
      @AppReleaseEntityConverter() final AppReleaseEntity lastRelease,
      @AppReleaseEntityConverter() final AppReleaseEntity currentRelease,
      @FileConverter() final File? file,
      final bool favorite}) = _$NotInstalledAppEntityImpl;
  const NotInstalledAppEntity._() : super._();

  factory NotInstalledAppEntity.fromJson(Map<String, dynamic> json) =
      _$NotInstalledAppEntityImpl.fromJson;

  @override
  @RepositoryEntityConverter()
  RepositoryEntity get repository;
  @override
  @PackageInfoEntityConverter()
  PackageInfoEntity get packageInfo;
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
  _$$NotInstalledAppEntityImplCopyWith<_$NotInstalledAppEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
