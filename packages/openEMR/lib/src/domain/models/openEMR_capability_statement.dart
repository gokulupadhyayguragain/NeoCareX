// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'openEMR_capability_statement.freezed.dart';
part 'openEMR_capability_statement.g.dart';

/// {@template openEMR_capability_statement}
///  Provides the information about the cerner different endpoints.
///
/// __authorizationEndpoint__ : To get the code for exchange with access token.
///
/// __tokenEndpoint__ : To get the access token, refresh token etc by providing
///  the code.
///
/// __revocationEndpoint__ : token revocation endpoint.
///
/// __manageEndpoint__ : Management api endpoint.
///
/// __introspectionEndpoint__ : Token introspection endpoint.
/// {@endtemplate}

@freezed
class OpenEMRCapabilityStatement with _$OpenEMRCapabilityStatement {
  /// {@macro openEMR_capability_statement}
  const factory OpenEMRCapabilityStatement({
    @JsonKey(name: 'authorization_endpoint') String? authorizationEndpoint,
    @JsonKey(name: 'token_endpoint') String? tokenEndpoint,
    @JsonKey(name: 'revocation_endpoint') String? revocationEndpoint,
    @JsonKey(name: 'management_endpoint') String? managementEndpoint,
    @JsonKey(name: 'introspection_endpoint') String? introspectionEndpoint,
  }) = _OpenEMRCapabilityStatement;

  /// Converts [json] into [OpenEMRCapabilityStatement].
  factory OpenEMRCapabilityStatement.fromJson(Map<String, dynamic> json) =>
      _$OpenEMRCapabilityStatementFromJson(json);
}
