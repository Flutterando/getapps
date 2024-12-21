// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_release_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppReleaseEntity _$AppReleaseEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _AppReleaseEntity.fromJson(json);
    case 'empty':
      return EmptyAppReleaseEntity.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppReleaseEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AppReleaseEntity {
  String get tagName => throw _privateConstructorUsedError;
  List<String> get assets => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String tagName, List<String> assets) $default, {
    required TResult Function(String tagName, List<String> assets) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String tagName, List<String> assets)? $default, {
    TResult? Function(String tagName, List<String> assets)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String tagName, List<String> assets)? $default, {
    TResult Function(String tagName, List<String> assets)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppReleaseEntity value) $default, {
    required TResult Function(EmptyAppReleaseEntity value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppReleaseEntity value)? $default, {
    TResult? Function(EmptyAppReleaseEntity value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppReleaseEntity value)? $default, {
    TResult Function(EmptyAppReleaseEntity value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this AppReleaseEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppReleaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppReleaseEntityCopyWith<AppReleaseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppReleaseEntityCopyWith<$Res> {
  factory $AppReleaseEntityCopyWith(
          AppReleaseEntity value, $Res Function(AppReleaseEntity) then) =
      _$AppReleaseEntityCopyWithImpl<$Res, AppReleaseEntity>;
  @useResult
  $Res call({String tagName, List<String> assets});
}

/// @nodoc
class _$AppReleaseEntityCopyWithImpl<$Res, $Val extends AppReleaseEntity>
    implements $AppReleaseEntityCopyWith<$Res> {
  _$AppReleaseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppReleaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagName = null,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppReleaseEntityImplCopyWith<$Res>
    implements $AppReleaseEntityCopyWith<$Res> {
  factory _$$AppReleaseEntityImplCopyWith(_$AppReleaseEntityImpl value,
          $Res Function(_$AppReleaseEntityImpl) then) =
      __$$AppReleaseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tagName, List<String> assets});
}

/// @nodoc
class __$$AppReleaseEntityImplCopyWithImpl<$Res>
    extends _$AppReleaseEntityCopyWithImpl<$Res, _$AppReleaseEntityImpl>
    implements _$$AppReleaseEntityImplCopyWith<$Res> {
  __$$AppReleaseEntityImplCopyWithImpl(_$AppReleaseEntityImpl _value,
      $Res Function(_$AppReleaseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppReleaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagName = null,
    Object? assets = null,
  }) {
    return _then(_$AppReleaseEntityImpl(
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppReleaseEntityImpl implements _AppReleaseEntity {
  const _$AppReleaseEntityImpl(
      {required this.tagName,
      required final List<String> assets,
      final String? $type})
      : _assets = assets,
        $type = $type ?? 'default';

  factory _$AppReleaseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppReleaseEntityImplFromJson(json);

  @override
  final String tagName;
  final List<String> _assets;
  @override
  List<String> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppReleaseEntity(tagName: $tagName, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppReleaseEntityImpl &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, tagName, const DeepCollectionEquality().hash(_assets));

  /// Create a copy of AppReleaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppReleaseEntityImplCopyWith<_$AppReleaseEntityImpl> get copyWith =>
      __$$AppReleaseEntityImplCopyWithImpl<_$AppReleaseEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String tagName, List<String> assets) $default, {
    required TResult Function(String tagName, List<String> assets) empty,
  }) {
    return $default(tagName, assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String tagName, List<String> assets)? $default, {
    TResult? Function(String tagName, List<String> assets)? empty,
  }) {
    return $default?.call(tagName, assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String tagName, List<String> assets)? $default, {
    TResult Function(String tagName, List<String> assets)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(tagName, assets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppReleaseEntity value) $default, {
    required TResult Function(EmptyAppReleaseEntity value) empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppReleaseEntity value)? $default, {
    TResult? Function(EmptyAppReleaseEntity value)? empty,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppReleaseEntity value)? $default, {
    TResult Function(EmptyAppReleaseEntity value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AppReleaseEntityImplToJson(
      this,
    );
  }
}

abstract class _AppReleaseEntity implements AppReleaseEntity {
  const factory _AppReleaseEntity(
      {required final String tagName,
      required final List<String> assets}) = _$AppReleaseEntityImpl;

  factory _AppReleaseEntity.fromJson(Map<String, dynamic> json) =
      _$AppReleaseEntityImpl.fromJson;

  @override
  String get tagName;
  @override
  List<String> get assets;

  /// Create a copy of AppReleaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppReleaseEntityImplCopyWith<_$AppReleaseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyAppReleaseEntityImplCopyWith<$Res>
    implements $AppReleaseEntityCopyWith<$Res> {
  factory _$$EmptyAppReleaseEntityImplCopyWith(
          _$EmptyAppReleaseEntityImpl value,
          $Res Function(_$EmptyAppReleaseEntityImpl) then) =
      __$$EmptyAppReleaseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tagName, List<String> assets});
}

/// @nodoc
class __$$EmptyAppReleaseEntityImplCopyWithImpl<$Res>
    extends _$AppReleaseEntityCopyWithImpl<$Res, _$EmptyAppReleaseEntityImpl>
    implements _$$EmptyAppReleaseEntityImplCopyWith<$Res> {
  __$$EmptyAppReleaseEntityImplCopyWithImpl(_$EmptyAppReleaseEntityImpl _value,
      $Res Function(_$EmptyAppReleaseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppReleaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagName = null,
    Object? assets = null,
  }) {
    return _then(_$EmptyAppReleaseEntityImpl(
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmptyAppReleaseEntityImpl implements EmptyAppReleaseEntity {
  const _$EmptyAppReleaseEntityImpl(
      {this.tagName = '',
      final List<String> assets = const [],
      final String? $type})
      : _assets = assets,
        $type = $type ?? 'empty';

  factory _$EmptyAppReleaseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmptyAppReleaseEntityImplFromJson(json);

  @override
  @JsonKey()
  final String tagName;
  final List<String> _assets;
  @override
  @JsonKey()
  List<String> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppReleaseEntity.empty(tagName: $tagName, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyAppReleaseEntityImpl &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, tagName, const DeepCollectionEquality().hash(_assets));

  /// Create a copy of AppReleaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyAppReleaseEntityImplCopyWith<_$EmptyAppReleaseEntityImpl>
      get copyWith => __$$EmptyAppReleaseEntityImplCopyWithImpl<
          _$EmptyAppReleaseEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String tagName, List<String> assets) $default, {
    required TResult Function(String tagName, List<String> assets) empty,
  }) {
    return empty(tagName, assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String tagName, List<String> assets)? $default, {
    TResult? Function(String tagName, List<String> assets)? empty,
  }) {
    return empty?.call(tagName, assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String tagName, List<String> assets)? $default, {
    TResult Function(String tagName, List<String> assets)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(tagName, assets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AppReleaseEntity value) $default, {
    required TResult Function(EmptyAppReleaseEntity value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppReleaseEntity value)? $default, {
    TResult? Function(EmptyAppReleaseEntity value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppReleaseEntity value)? $default, {
    TResult Function(EmptyAppReleaseEntity value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyAppReleaseEntityImplToJson(
      this,
    );
  }
}

abstract class EmptyAppReleaseEntity implements AppReleaseEntity {
  const factory EmptyAppReleaseEntity(
      {final String tagName,
      final List<String> assets}) = _$EmptyAppReleaseEntityImpl;

  factory EmptyAppReleaseEntity.fromJson(Map<String, dynamic> json) =
      _$EmptyAppReleaseEntityImpl.fromJson;

  @override
  String get tagName;
  @override
  List<String> get assets;

  /// Create a copy of AppReleaseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmptyAppReleaseEntityImplCopyWith<_$EmptyAppReleaseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
