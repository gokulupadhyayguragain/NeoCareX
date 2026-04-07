// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openEMR_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenEMRCredentialImpl _$$OpenEMRCredentialImplFromJson(
        Map<String, dynamic> json) =>
    _$OpenEMRCredentialImpl(
      scope: json['scope'] as String?,
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      idToken: json['id_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      refreshTokenTTL: (json['active_ttl'] as num?)?.toInt(),
      encounter: json['encounter'] as String?,
      patient: json['patient'] as String?,
      user: json['user'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$OpenEMRCredentialImplToJson(
    _$OpenEMRCredentialImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scope', instance.scope);
  writeNotNull('access_token', instance.accessToken);
  writeNotNull('refresh_token', instance.refreshToken);
  writeNotNull('id_token', instance.idToken);
  writeNotNull('token_type', instance.tokenType);
  writeNotNull('expires_in', instance.expiresIn);
  writeNotNull('active_ttl', instance.refreshTokenTTL);
  writeNotNull('encounter', instance.encounter);
  writeNotNull('patient', instance.patient);
  writeNotNull('user', instance.user);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  return val;
}
