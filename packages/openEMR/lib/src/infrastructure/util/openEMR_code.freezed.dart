// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openEMR_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OpenEMRCode _$OpenEMRCodeFromJson(Map<String, dynamic> json) {
  return _OpenEMRCode.fromJson(json);
}

/// @nodoc
mixin _$OpenEMRCode {
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'redirect_uri')
  String get redirectUri => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_id')
  String get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'grant_type')
  String get grantType => throw _privateConstructorUsedError;

  /// Serializes this OpenEMRCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenEMRCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenEMRCodeCopyWith<OpenEMRCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenEMRCodeCopyWith<$Res> {
  factory $OpenEMRCodeCopyWith(
          OpenEMRCode value, $Res Function(OpenEMRCode) then) =
      _$OpenEMRCodeCopyWithImpl<$Res, OpenEMRCode>;
  @useResult
  $Res call(
      {String code,
      @JsonKey(name: 'redirect_uri') String redirectUri,
      @JsonKey(name: 'client_id') String clientId,
      @JsonKey(name: 'grant_type') String grantType});
}

/// @nodoc
class _$OpenEMRCodeCopyWithImpl<$Res, $Val extends OpenEMRCode>
    implements $OpenEMRCodeCopyWith<$Res> {
  _$OpenEMRCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenEMRCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? redirectUri = null,
    Object? clientId = null,
    Object? grantType = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUri: null == redirectUri
          ? _value.redirectUri
          : redirectUri // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      grantType: null == grantType
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenEMRCodeImplCopyWith<$Res>
    implements $OpenEMRCodeCopyWith<$Res> {
  factory _$$OpenEMRCodeImplCopyWith(
          _$OpenEMRCodeImpl value, $Res Function(_$OpenEMRCodeImpl) then) =
      __$$OpenEMRCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      @JsonKey(name: 'redirect_uri') String redirectUri,
      @JsonKey(name: 'client_id') String clientId,
      @JsonKey(name: 'grant_type') String grantType});
}

/// @nodoc
class __$$OpenEMRCodeImplCopyWithImpl<$Res>
    extends _$OpenEMRCodeCopyWithImpl<$Res, _$OpenEMRCodeImpl>
    implements _$$OpenEMRCodeImplCopyWith<$Res> {
  __$$OpenEMRCodeImplCopyWithImpl(
      _$OpenEMRCodeImpl _value, $Res Function(_$OpenEMRCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenEMRCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? redirectUri = null,
    Object? clientId = null,
    Object? grantType = null,
  }) {
    return _then(_$OpenEMRCodeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUri: null == redirectUri
          ? _value.redirectUri
          : redirectUri // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      grantType: null == grantType
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenEMRCodeImpl implements _OpenEMRCode {
  const _$OpenEMRCodeImpl(
      {required this.code,
      @JsonKey(name: 'redirect_uri') required this.redirectUri,
      @JsonKey(name: 'client_id') required this.clientId,
      @JsonKey(name: 'grant_type') this.grantType = 'authorization_code'});

  factory _$OpenEMRCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenEMRCodeImplFromJson(json);

  @override
  final String code;
  @override
  @JsonKey(name: 'redirect_uri')
  final String redirectUri;
  @override
  @JsonKey(name: 'client_id')
  final String clientId;
  @override
  @JsonKey(name: 'grant_type')
  final String grantType;

  @override
  String toString() {
    return 'OpenEMRCode(code: $code, redirectUri: $redirectUri, clientId: $clientId, grantType: $grantType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenEMRCodeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.redirectUri, redirectUri) ||
                other.redirectUri == redirectUri) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.grantType, grantType) ||
                other.grantType == grantType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, redirectUri, clientId, grantType);

  /// Create a copy of OpenEMRCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenEMRCodeImplCopyWith<_$OpenEMRCodeImpl> get copyWith =>
      __$$OpenEMRCodeImplCopyWithImpl<_$OpenEMRCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenEMRCodeImplToJson(
      this,
    );
  }
}

abstract class _OpenEMRCode implements OpenEMRCode {
  const factory _OpenEMRCode(
      {required final String code,
      @JsonKey(name: 'redirect_uri') required final String redirectUri,
      @JsonKey(name: 'client_id') required final String clientId,
      @JsonKey(name: 'grant_type') final String grantType}) = _$OpenEMRCodeImpl;

  factory _OpenEMRCode.fromJson(Map<String, dynamic> json) =
      _$OpenEMRCodeImpl.fromJson;

  @override
  String get code;
  @override
  @JsonKey(name: 'redirect_uri')
  String get redirectUri;
  @override
  @JsonKey(name: 'client_id')
  String get clientId;
  @override
  @JsonKey(name: 'grant_type')
  String get grantType;

  /// Create a copy of OpenEMRCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenEMRCodeImplCopyWith<_$OpenEMRCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
