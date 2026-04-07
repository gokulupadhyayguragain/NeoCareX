// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openEMR_capability_statement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenEMRCapabilityStatementImpl _$$OpenEMRCapabilityStatementImplFromJson(
        Map<String, dynamic> json) =>
    _$OpenEMRCapabilityStatementImpl(
      authorizationEndpoint: json['authorization_endpoint'] as String?,
      tokenEndpoint: json['token_endpoint'] as String?,
      revocationEndpoint: json['revocation_endpoint'] as String?,
      managementEndpoint: json['management_endpoint'] as String?,
      introspectionEndpoint: json['introspection_endpoint'] as String?,
    );

Map<String, dynamic> _$$OpenEMRCapabilityStatementImplToJson(
    _$OpenEMRCapabilityStatementImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authorization_endpoint', instance.authorizationEndpoint);
  writeNotNull('token_endpoint', instance.tokenEndpoint);
  writeNotNull('revocation_endpoint', instance.revocationEndpoint);
  writeNotNull('management_endpoint', instance.managementEndpoint);
  writeNotNull('introspection_endpoint', instance.introspectionEndpoint);
  return val;
}
