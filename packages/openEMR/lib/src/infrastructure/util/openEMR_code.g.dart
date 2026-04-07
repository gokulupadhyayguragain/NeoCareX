// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openEMR_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenEMRCodeImpl _$$OpenEMRCodeImplFromJson(Map<String, dynamic> json) =>
    _$OpenEMRCodeImpl(
      code: json['code'] as String,
      redirectUri: json['redirect_uri'] as String,
      clientId: json['client_id'] as String,
      grantType: json['grant_type'] as String? ?? 'authorization_code',
    );

Map<String, dynamic> _$$OpenEMRCodeImplToJson(_$OpenEMRCodeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'redirect_uri': instance.redirectUri,
      'client_id': instance.clientId,
      'grant_type': instance.grantType,
    };
