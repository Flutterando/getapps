// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepositoryEntity _$RepositoryEntityFromJson(Map<String, dynamic> json) {
  return _RepositoryEntity.fromJson(json);
}

/// @nodoc
mixin _$RepositoryEntity {
  GitRepositoryProvider get provider => throw _privateConstructorUsedError;
  String get organizationName => throw _privateConstructorUsedError;
  String get projectName => throw _privateConstructorUsedError;

  /// Serializes this RepositoryEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepositoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepositoryEntityCopyWith<RepositoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryEntityCopyWith<$Res> {
  factory $RepositoryEntityCopyWith(
          RepositoryEntity value, $Res Function(RepositoryEntity) then) =
      _$RepositoryEntityCopyWithImpl<$Res, RepositoryEntity>;
  @useResult
  $Res call(
      {GitRepositoryProvider provider,
      String organizationName,
      String projectName});
}

/// @nodoc
class _$RepositoryEntityCopyWithImpl<$Res, $Val extends RepositoryEntity>
    implements $RepositoryEntityCopyWith<$Res> {
  _$RepositoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepositoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? organizationName = null,
    Object? projectName = null,
  }) {
    return _then(_value.copyWith(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as GitRepositoryProvider,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepositoryEntityImplCopyWith<$Res>
    implements $RepositoryEntityCopyWith<$Res> {
  factory _$$RepositoryEntityImplCopyWith(_$RepositoryEntityImpl value,
          $Res Function(_$RepositoryEntityImpl) then) =
      __$$RepositoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GitRepositoryProvider provider,
      String organizationName,
      String projectName});
}

/// @nodoc
class __$$RepositoryEntityImplCopyWithImpl<$Res>
    extends _$RepositoryEntityCopyWithImpl<$Res, _$RepositoryEntityImpl>
    implements _$$RepositoryEntityImplCopyWith<$Res> {
  __$$RepositoryEntityImplCopyWithImpl(_$RepositoryEntityImpl _value,
      $Res Function(_$RepositoryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepositoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? organizationName = null,
    Object? projectName = null,
  }) {
    return _then(_$RepositoryEntityImpl(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as GitRepositoryProvider,
      organizationName: null == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepositoryEntityImpl implements _RepositoryEntity {
  const _$RepositoryEntityImpl(
      {required this.provider,
      required this.organizationName,
      required this.projectName});

  factory _$RepositoryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepositoryEntityImplFromJson(json);

  @override
  final GitRepositoryProvider provider;
  @override
  final String organizationName;
  @override
  final String projectName;

  @override
  String toString() {
    return 'RepositoryEntity(provider: $provider, organizationName: $organizationName, projectName: $projectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryEntityImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, provider, organizationName, projectName);

  /// Create a copy of RepositoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoryEntityImplCopyWith<_$RepositoryEntityImpl> get copyWith =>
      __$$RepositoryEntityImplCopyWithImpl<_$RepositoryEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepositoryEntityImplToJson(
      this,
    );
  }
}

abstract class _RepositoryEntity implements RepositoryEntity {
  const factory _RepositoryEntity(
      {required final GitRepositoryProvider provider,
      required final String organizationName,
      required final String projectName}) = _$RepositoryEntityImpl;

  factory _RepositoryEntity.fromJson(Map<String, dynamic> json) =
      _$RepositoryEntityImpl.fromJson;

  @override
  GitRepositoryProvider get provider;
  @override
  String get organizationName;
  @override
  String get projectName;

  /// Create a copy of RepositoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepositoryEntityImplCopyWith<_$RepositoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
