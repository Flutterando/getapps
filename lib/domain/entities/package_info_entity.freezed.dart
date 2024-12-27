// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PackageInfoEntity _$PackageInfoEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _PackageInfoEntity.fromJson(json);
    case 'empty':
      return EmptyPackageInfoEntity.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PackageInfoEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PackageInfoEntity {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<int> get imageBytes => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id, String? name, List<int> imageBytes, String version)
        $default, {
    required TResult Function(
            String id, String? name, List<int> imageBytes, String version)
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id, String? name, List<int> imageBytes, String version)?
        $default, {
    TResult? Function(
            String id, String? name, List<int> imageBytes, String version)?
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id, String? name, List<int> imageBytes, String version)?
        $default, {
    TResult Function(
            String id, String? name, List<int> imageBytes, String version)?
        empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PackageInfoEntity value) $default, {
    required TResult Function(EmptyPackageInfoEntity value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PackageInfoEntity value)? $default, {
    TResult? Function(EmptyPackageInfoEntity value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PackageInfoEntity value)? $default, {
    TResult Function(EmptyPackageInfoEntity value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this PackageInfoEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackageInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageInfoEntityCopyWith<PackageInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageInfoEntityCopyWith<$Res> {
  factory $PackageInfoEntityCopyWith(
          PackageInfoEntity value, $Res Function(PackageInfoEntity) then) =
      _$PackageInfoEntityCopyWithImpl<$Res, PackageInfoEntity>;
  @useResult
  $Res call({String id, String? name, List<int> imageBytes, String version});
}

/// @nodoc
class _$PackageInfoEntityCopyWithImpl<$Res, $Val extends PackageInfoEntity>
    implements $PackageInfoEntityCopyWith<$Res> {
  _$PackageInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? imageBytes = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBytes: null == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageInfoEntityImplCopyWith<$Res>
    implements $PackageInfoEntityCopyWith<$Res> {
  factory _$$PackageInfoEntityImplCopyWith(_$PackageInfoEntityImpl value,
          $Res Function(_$PackageInfoEntityImpl) then) =
      __$$PackageInfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name, List<int> imageBytes, String version});
}

/// @nodoc
class __$$PackageInfoEntityImplCopyWithImpl<$Res>
    extends _$PackageInfoEntityCopyWithImpl<$Res, _$PackageInfoEntityImpl>
    implements _$$PackageInfoEntityImplCopyWith<$Res> {
  __$$PackageInfoEntityImplCopyWithImpl(_$PackageInfoEntityImpl _value,
      $Res Function(_$PackageInfoEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? imageBytes = null,
    Object? version = null,
  }) {
    return _then(_$PackageInfoEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBytes: null == imageBytes
          ? _value._imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageInfoEntityImpl extends _PackageInfoEntity {
  const _$PackageInfoEntityImpl(
      {required this.id,
      this.name,
      required final List<int> imageBytes,
      required this.version,
      final String? $type})
      : _imageBytes = imageBytes,
        $type = $type ?? 'default',
        super._();

  factory _$PackageInfoEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageInfoEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  final List<int> _imageBytes;
  @override
  List<int> get imageBytes {
    if (_imageBytes is EqualUnmodifiableListView) return _imageBytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageBytes);
  }

  @override
  final String version;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PackageInfoEntity(id: $id, name: $name, imageBytes: $imageBytes, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageInfoEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._imageBytes, _imageBytes) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_imageBytes), version);

  /// Create a copy of PackageInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageInfoEntityImplCopyWith<_$PackageInfoEntityImpl> get copyWith =>
      __$$PackageInfoEntityImplCopyWithImpl<_$PackageInfoEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id, String? name, List<int> imageBytes, String version)
        $default, {
    required TResult Function(
            String id, String? name, List<int> imageBytes, String version)
        empty,
  }) {
    return $default(id, name, imageBytes, version);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id, String? name, List<int> imageBytes, String version)?
        $default, {
    TResult? Function(
            String id, String? name, List<int> imageBytes, String version)?
        empty,
  }) {
    return $default?.call(id, name, imageBytes, version);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id, String? name, List<int> imageBytes, String version)?
        $default, {
    TResult Function(
            String id, String? name, List<int> imageBytes, String version)?
        empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, imageBytes, version);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PackageInfoEntity value) $default, {
    required TResult Function(EmptyPackageInfoEntity value) empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PackageInfoEntity value)? $default, {
    TResult? Function(EmptyPackageInfoEntity value)? empty,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PackageInfoEntity value)? $default, {
    TResult Function(EmptyPackageInfoEntity value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageInfoEntityImplToJson(
      this,
    );
  }
}

abstract class _PackageInfoEntity extends PackageInfoEntity {
  const factory _PackageInfoEntity(
      {required final String id,
      final String? name,
      required final List<int> imageBytes,
      required final String version}) = _$PackageInfoEntityImpl;
  const _PackageInfoEntity._() : super._();

  factory _PackageInfoEntity.fromJson(Map<String, dynamic> json) =
      _$PackageInfoEntityImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  List<int> get imageBytes;
  @override
  String get version;

  /// Create a copy of PackageInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageInfoEntityImplCopyWith<_$PackageInfoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyPackageInfoEntityImplCopyWith<$Res>
    implements $PackageInfoEntityCopyWith<$Res> {
  factory _$$EmptyPackageInfoEntityImplCopyWith(
          _$EmptyPackageInfoEntityImpl value,
          $Res Function(_$EmptyPackageInfoEntityImpl) then) =
      __$$EmptyPackageInfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name, List<int> imageBytes, String version});
}

/// @nodoc
class __$$EmptyPackageInfoEntityImplCopyWithImpl<$Res>
    extends _$PackageInfoEntityCopyWithImpl<$Res, _$EmptyPackageInfoEntityImpl>
    implements _$$EmptyPackageInfoEntityImplCopyWith<$Res> {
  __$$EmptyPackageInfoEntityImplCopyWithImpl(
      _$EmptyPackageInfoEntityImpl _value,
      $Res Function(_$EmptyPackageInfoEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? imageBytes = null,
    Object? version = null,
  }) {
    return _then(_$EmptyPackageInfoEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBytes: null == imageBytes
          ? _value._imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmptyPackageInfoEntityImpl extends EmptyPackageInfoEntity {
  const _$EmptyPackageInfoEntityImpl(
      {this.id = '',
      this.name = null,
      final List<int> imageBytes = const [],
      this.version = '',
      final String? $type})
      : _imageBytes = imageBytes,
        $type = $type ?? 'empty',
        super._();

  factory _$EmptyPackageInfoEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmptyPackageInfoEntityImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String? name;
  final List<int> _imageBytes;
  @override
  @JsonKey()
  List<int> get imageBytes {
    if (_imageBytes is EqualUnmodifiableListView) return _imageBytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageBytes);
  }

  @override
  @JsonKey()
  final String version;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PackageInfoEntity.empty(id: $id, name: $name, imageBytes: $imageBytes, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyPackageInfoEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._imageBytes, _imageBytes) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_imageBytes), version);

  /// Create a copy of PackageInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyPackageInfoEntityImplCopyWith<_$EmptyPackageInfoEntityImpl>
      get copyWith => __$$EmptyPackageInfoEntityImplCopyWithImpl<
          _$EmptyPackageInfoEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id, String? name, List<int> imageBytes, String version)
        $default, {
    required TResult Function(
            String id, String? name, List<int> imageBytes, String version)
        empty,
  }) {
    return empty(id, name, imageBytes, version);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id, String? name, List<int> imageBytes, String version)?
        $default, {
    TResult? Function(
            String id, String? name, List<int> imageBytes, String version)?
        empty,
  }) {
    return empty?.call(id, name, imageBytes, version);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id, String? name, List<int> imageBytes, String version)?
        $default, {
    TResult Function(
            String id, String? name, List<int> imageBytes, String version)?
        empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(id, name, imageBytes, version);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PackageInfoEntity value) $default, {
    required TResult Function(EmptyPackageInfoEntity value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PackageInfoEntity value)? $default, {
    TResult? Function(EmptyPackageInfoEntity value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PackageInfoEntity value)? $default, {
    TResult Function(EmptyPackageInfoEntity value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyPackageInfoEntityImplToJson(
      this,
    );
  }
}

abstract class EmptyPackageInfoEntity extends PackageInfoEntity {
  const factory EmptyPackageInfoEntity(
      {final String id,
      final String? name,
      final List<int> imageBytes,
      final String version}) = _$EmptyPackageInfoEntityImpl;
  const EmptyPackageInfoEntity._() : super._();

  factory EmptyPackageInfoEntity.fromJson(Map<String, dynamic> json) =
      _$EmptyPackageInfoEntityImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  List<int> get imageBytes;
  @override
  String get version;

  /// Create a copy of PackageInfoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmptyPackageInfoEntityImplCopyWith<_$EmptyPackageInfoEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
