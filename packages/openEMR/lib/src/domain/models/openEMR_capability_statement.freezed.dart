// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openEMR_capability_statement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OpenEMRCapabilityStatement _$OpenEMRCapabilityStatementFromJson(
    Map<String, dynamic> json) {
  return _OpenEMRCapabilityStatement.fromJson(json);
}

/// @nodoc
mixin _$OpenEMRCapabilityStatement {
  @JsonKey(name: 'authorization_endpoint')
  String? get authorizationEndpoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_endpoint')
  String? get tokenEndpoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'revocation_endpoint')
  String? get revocationEndpoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'management_endpoint')
  String? get managementEndpoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'introspection_endpoint')
  String? get introspectionEndpoint => throw _privateConstructorUsedError;

  /// Serializes this OpenEMRCapabilityStatement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenEMRCapabilityStatement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenEMRCapabilityStatementCopyWith<OpenEMRCapabilityStatement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenEMRCapabilityStatementCopyWith<$Res> {
  factory $OpenEMRCapabilityStatementCopyWith(OpenEMRCapabilityStatement value,
          $Res Function(OpenEMRCapabilityStatement) then) =
      _$OpenEMRCapabilityStatementCopyWithImpl<$Res,
          OpenEMRCapabilityStatement>;
  @useResult
  $Res call(
      {@JsonKey(name: 'authorization_endpoint') String? authorizationEndpoint,
      @JsonKey(name: 'token_endpoint') String? tokenEndpoint,
      @JsonKey(name: 'revocation_endpoint') String? revocationEndpoint,
      @JsonKey(name: 'management_endpoint') String? managementEndpoint,
      @JsonKey(name: 'introspection_endpoint') String? introspectionEndpoint});
}

/// @nodoc
class _$OpenEMRCapabilityStatementCopyWithImpl<$Res,
        $Val extends OpenEMRCapabilityStatement>
    implements $OpenEMRCapabilityStatementCopyWith<$Res> {
  _$OpenEMRCapabilityStatementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenEMRCapabilityStatement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationEndpoint = freezed,
    Object? tokenEndpoint = freezed,
    Object? revocationEndpoint = freezed,
    Object? managementEndpoint = freezed,
    Object? introspectionEndpoint = freezed,
  }) {
    return _then(_value.copyWith(
      authorizationEndpoint: freezed == authorizationEndpoint
          ? _value.authorizationEndpoint
          : authorizationEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenEndpoint: freezed == tokenEndpoint
          ? _value.tokenEndpoint
          : tokenEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      revocationEndpoint: freezed == revocationEndpoint
          ? _value.revocationEndpoint
          : revocationEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      managementEndpoint: freezed == managementEndpoint
          ? _value.managementEndpoint
          : managementEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      introspectionEndpoint: freezed == introspectionEndpoint
          ? _value.introspectionEndpoint
          : introspectionEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenEMRCapabilityStatementImplCopyWith<$Res>
    implements $OpenEMRCapabilityStatementCopyWith<$Res> {
  factory _$$OpenEMRCapabilityStatementImplCopyWith(
          _$OpenEMRCapabilityStatementImpl value,
          $Res Function(_$OpenEMRCapabilityStatementImpl) then) =
      __$$OpenEMRCapabilityStatementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'authorization_endpoint') String? authorizationEndpoint,
      @JsonKey(name: 'token_endpoint') String? tokenEndpoint,
      @JsonKey(name: 'revocation_endpoint') String? revocationEndpoint,
      @JsonKey(name: 'management_endpoint') String? managementEndpoint,
      @JsonKey(name: 'introspection_endpoint') String? introspectionEndpoint});
}

/// @nodoc
class __$$OpenEMRCapabilityStatementImplCopyWithImpl<$Res>
    extends _$OpenEMRCapabilityStatementCopyWithImpl<$Res,
        _$OpenEMRCapabilityStatementImpl>
    implements _$$OpenEMRCapabilityStatementImplCopyWith<$Res> {
  __$$OpenEMRCapabilityStatementImplCopyWithImpl(
      _$OpenEMRCapabilityStatementImpl _value,
      $Res Function(_$OpenEMRCapabilityStatementImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenEMRCapabilityStatement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationEndpoint = freezed,
    Object? tokenEndpoint = freezed,
    Object? revocationEndpoint = freezed,
    Object? managementEndpoint = freezed,
    Object? introspectionEndpoint = freezed,
  }) {
    return _then(_$OpenEMRCapabilityStatementImpl(
      authorizationEndpoint: freezed == authorizationEndpoint
          ? _value.authorizationEndpoint
          : authorizationEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenEndpoint: freezed == tokenEndpoint
          ? _value.tokenEndpoint
          : tokenEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      revocationEndpoint: freezed == revocationEndpoint
          ? _value.revocationEndpoint
          : revocationEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      managementEndpoint: freezed == managementEndpoint
          ? _value.managementEndpoint
          : managementEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      introspectionEndpoint: freezed == introspectionEndpoint
          ? _value.introspectionEndpoint
          : introspectionEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenEMRCapabilityStatementImpl implements _OpenEMRCapabilityStatement {
  const _$OpenEMRCapabilityStatementImpl(
      {@JsonKey(name: 'authorization_endpoint') this.authorizationEndpoint,
      @JsonKey(name: 'token_endpoint') this.tokenEndpoint,
      @JsonKey(name: 'revocation_endpoint') this.revocationEndpoint,
      @JsonKey(name: 'management_endpoint') this.managementEndpoint,
      @JsonKey(name: 'introspection_endpoint') this.introspectionEndpoint});

  factory _$OpenEMRCapabilityStatementImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OpenEMRCapabilityStatementImplFromJson(json);

  @override
  @JsonKey(name: 'authorization_endpoint')
  final String? authorizationEndpoint;
  @override
  @JsonKey(name: 'token_endpoint')
  final String? tokenEndpoint;
  @override
  @JsonKey(name: 'revocation_endpoint')
  final String? revocationEndpoint;
  @override
  @JsonKey(name: 'management_endpoint')
  final String? managementEndpoint;
  @override
  @JsonKey(name: 'introspection_endpoint')
  final String? introspectionEndpoint;

  @override
  String toString() {
    return 'OpenEMRCapabilityStatement(authorizationEndpoint: $authorizationEndpoint, tokenEndpoint: $tokenEndpoint, revocationEndpoint: $revocationEndpoint, managementEndpoint: $managementEndpoint, introspectionEndpoint: $introspectionEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenEMRCapabilityStatementImpl &&
            (identical(other.authorizationEndpoint, authorizationEndpoint) ||
                other.authorizationEndpoint == authorizationEndpoint) &&
            (identical(other.tokenEndpoint, tokenEndpoint) ||
                other.tokenEndpoint == tokenEndpoint) &&
            (identical(other.revocationEndpoint, revocationEndpoint) ||
                other.revocationEndpoint == revocationEndpoint) &&
            (identical(other.managementEndpoint, managementEndpoint) ||
                other.managementEndpoint == managementEndpoint) &&
            (identical(other.introspectionEndpoint, introspectionEndpoint) ||
                other.introspectionEndpoint == introspectionEndpoint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      authorizationEndpoint,
      tokenEndpoint,
      revocationEndpoint,
      managementEndpoint,
      introspectionEndpoint);

  /// Create a copy of OpenEMRCapabilityStatement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenEMRCapabilityStatementImplCopyWith<_$OpenEMRCapabilityStatementImpl>
      get copyWith => __$$OpenEMRCapabilityStatementImplCopyWithImpl<
          _$OpenEMRCapabilityStatementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenEMRCapabilityStatementImplToJson(
      this,
    );
  }
}

abstract class _OpenEMRCapabilityStatement
    implements OpenEMRCapabilityStatement {
  const factory _OpenEMRCapabilityStatement(
      {@JsonKey(name: 'authorization_endpoint')
      final String? authorizationEndpoint,
      @JsonKey(name: 'token_endpoint') final String? tokenEndpoint,
      @JsonKey(name: 'revocation_endpoint') final String? revocationEndpoint,
      @JsonKey(name: 'management_endpoint') final String? managementEndpoint,
      @JsonKey(name: 'introspection_endpoint')
      final String? introspectionEndpoint}) = _$OpenEMRCapabilityStatementImpl;

  factory _OpenEMRCapabilityStatement.fromJson(Map<String, dynamic> json) =
      _$OpenEMRCapabilityStatementImpl.fromJson;

  @override
  @JsonKey(name: 'authorization_endpoint')
  String? get authorizationEndpoint;
  @override
  @JsonKey(name: 'token_endpoint')
  String? get tokenEndpoint;
  @override
  @JsonKey(name: 'revocation_endpoint')
  String? get revocationEndpoint;
  @override
  @JsonKey(name: 'management_endpoint')
  String? get managementEndpoint;
  @override
  @JsonKey(name: 'introspection_endpoint')
  String? get introspectionEndpoint;

  /// Create a copy of OpenEMRCapabilityStatement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenEMRCapabilityStatementImplCopyWith<_$OpenEMRCapabilityStatementImpl>
      get copyWith => throw _privateConstructorUsedError;
}
