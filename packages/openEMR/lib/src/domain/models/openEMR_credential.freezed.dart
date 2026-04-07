// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openEMR_credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OpenEMRCredential _$OpenEMRCredentialFromJson(Map<String, dynamic> json) {
  return _OpenEMRCredential.fromJson(json);
}

/// @nodoc
mixin _$OpenEMRCredential {
  String? get scope => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String? get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_token')
  String? get idToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String? get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in')
  int? get expiresIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_ttl')
  int? get refreshTokenTTL => throw _privateConstructorUsedError;
  String? get encounter => throw _privateConstructorUsedError;
  String? get patient => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this OpenEMRCredential to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenEMRCredential
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenEMRCredentialCopyWith<OpenEMRCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenEMRCredentialCopyWith<$Res> {
  factory $OpenEMRCredentialCopyWith(
          OpenEMRCredential value, $Res Function(OpenEMRCredential) then) =
      _$OpenEMRCredentialCopyWithImpl<$Res, OpenEMRCredential>;
  @useResult
  $Res call(
      {String? scope,
      @JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken,
      @JsonKey(name: 'id_token') String? idToken,
      @JsonKey(name: 'token_type') String? tokenType,
      @JsonKey(name: 'expires_in') int? expiresIn,
      @JsonKey(name: 'active_ttl') int? refreshTokenTTL,
      String? encounter,
      String? patient,
      String? user,
      DateTime? createdAt});
}

/// @nodoc
class _$OpenEMRCredentialCopyWithImpl<$Res, $Val extends OpenEMRCredential>
    implements $OpenEMRCredentialCopyWith<$Res> {
  _$OpenEMRCredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenEMRCredential
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scope = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? idToken = freezed,
    Object? tokenType = freezed,
    Object? expiresIn = freezed,
    Object? refreshTokenTTL = freezed,
    Object? encounter = freezed,
    Object? patient = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      refreshTokenTTL: freezed == refreshTokenTTL
          ? _value.refreshTokenTTL
          : refreshTokenTTL // ignore: cast_nullable_to_non_nullable
              as int?,
      encounter: freezed == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as String?,
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenEMRCredentialImplCopyWith<$Res>
    implements $OpenEMRCredentialCopyWith<$Res> {
  factory _$$OpenEMRCredentialImplCopyWith(_$OpenEMRCredentialImpl value,
          $Res Function(_$OpenEMRCredentialImpl) then) =
      __$$OpenEMRCredentialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? scope,
      @JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken,
      @JsonKey(name: 'id_token') String? idToken,
      @JsonKey(name: 'token_type') String? tokenType,
      @JsonKey(name: 'expires_in') int? expiresIn,
      @JsonKey(name: 'active_ttl') int? refreshTokenTTL,
      String? encounter,
      String? patient,
      String? user,
      DateTime? createdAt});
}

/// @nodoc
class __$$OpenEMRCredentialImplCopyWithImpl<$Res>
    extends _$OpenEMRCredentialCopyWithImpl<$Res, _$OpenEMRCredentialImpl>
    implements _$$OpenEMRCredentialImplCopyWith<$Res> {
  __$$OpenEMRCredentialImplCopyWithImpl(_$OpenEMRCredentialImpl _value,
      $Res Function(_$OpenEMRCredentialImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenEMRCredential
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scope = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? idToken = freezed,
    Object? tokenType = freezed,
    Object? expiresIn = freezed,
    Object? refreshTokenTTL = freezed,
    Object? encounter = freezed,
    Object? patient = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$OpenEMRCredentialImpl(
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      refreshTokenTTL: freezed == refreshTokenTTL
          ? _value.refreshTokenTTL
          : refreshTokenTTL // ignore: cast_nullable_to_non_nullable
              as int?,
      encounter: freezed == encounter
          ? _value.encounter
          : encounter // ignore: cast_nullable_to_non_nullable
              as String?,
      patient: freezed == patient
          ? _value.patient
          : patient // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenEMRCredentialImpl implements _OpenEMRCredential {
  const _$OpenEMRCredentialImpl(
      {this.scope,
      @JsonKey(name: 'access_token') this.accessToken,
      @JsonKey(name: 'refresh_token') this.refreshToken,
      @JsonKey(name: 'id_token') this.idToken,
      @JsonKey(name: 'token_type') this.tokenType,
      @JsonKey(name: 'expires_in') this.expiresIn,
      @JsonKey(name: 'active_ttl') this.refreshTokenTTL,
      this.encounter,
      this.patient,
      this.user,
      this.createdAt});

  factory _$OpenEMRCredentialImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenEMRCredentialImplFromJson(json);

  @override
  final String? scope;
  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @override
  @JsonKey(name: 'id_token')
  final String? idToken;
  @override
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @override
  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @override
  @JsonKey(name: 'active_ttl')
  final int? refreshTokenTTL;
  @override
  final String? encounter;
  @override
  final String? patient;
  @override
  final String? user;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'OpenEMRCredential(scope: $scope, accessToken: $accessToken, refreshToken: $refreshToken, idToken: $idToken, tokenType: $tokenType, expiresIn: $expiresIn, refreshTokenTTL: $refreshTokenTTL, encounter: $encounter, patient: $patient, user: $user, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenEMRCredentialImpl &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.refreshTokenTTL, refreshTokenTTL) ||
                other.refreshTokenTTL == refreshTokenTTL) &&
            (identical(other.encounter, encounter) ||
                other.encounter == encounter) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      scope,
      accessToken,
      refreshToken,
      idToken,
      tokenType,
      expiresIn,
      refreshTokenTTL,
      encounter,
      patient,
      user,
      createdAt);

  /// Create a copy of OpenEMRCredential
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenEMRCredentialImplCopyWith<_$OpenEMRCredentialImpl> get copyWith =>
      __$$OpenEMRCredentialImplCopyWithImpl<_$OpenEMRCredentialImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenEMRCredentialImplToJson(
      this,
    );
  }
}

abstract class _OpenEMRCredential implements OpenEMRCredential {
  const factory _OpenEMRCredential(
      {final String? scope,
      @JsonKey(name: 'access_token') final String? accessToken,
      @JsonKey(name: 'refresh_token') final String? refreshToken,
      @JsonKey(name: 'id_token') final String? idToken,
      @JsonKey(name: 'token_type') final String? tokenType,
      @JsonKey(name: 'expires_in') final int? expiresIn,
      @JsonKey(name: 'active_ttl') final int? refreshTokenTTL,
      final String? encounter,
      final String? patient,
      final String? user,
      final DateTime? createdAt}) = _$OpenEMRCredentialImpl;

  factory _OpenEMRCredential.fromJson(Map<String, dynamic> json) =
      _$OpenEMRCredentialImpl.fromJson;

  @override
  String? get scope;
  @override
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;
  @override
  @JsonKey(name: 'id_token')
  String? get idToken;
  @override
  @JsonKey(name: 'token_type')
  String? get tokenType;
  @override
  @JsonKey(name: 'expires_in')
  int? get expiresIn;
  @override
  @JsonKey(name: 'active_ttl')
  int? get refreshTokenTTL;
  @override
  String? get encounter;
  @override
  String? get patient;
  @override
  String? get user;
  @override
  DateTime? get createdAt;

  /// Create a copy of OpenEMRCredential
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenEMRCredentialImplCopyWith<_$OpenEMRCredentialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
