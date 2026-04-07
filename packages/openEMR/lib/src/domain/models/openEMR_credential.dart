// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'openEMR_credential.freezed.dart';
part 'openEMR_credential.g.dart';

/// {@template cerner_credential}
///
/// Wrapper for wrapping the access token related information provided by
/// cerner. Includes following information:
///
/// - __accessToken__: Access token to be added in header for resource access.
///
/// -  __refreshToken__: To refresh the access token.
///
/// - __idToken__: Id token to get the information about the current user.
///
/// - __tokenType__: Type of token. eg. `Bearer`.
///
/// - __expiresIn__: time to expire access token in seconds.
///
/// {@endtemplate}
@freezed
class OpenEMRCredential with _$OpenEMRCredential {
  /// {@macro cerner_credential}
  const factory OpenEMRCredential({
    String? scope,
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
    @JsonKey(name: 'id_token') String? idToken,
    @JsonKey(name: 'token_type') String? tokenType,
    @JsonKey(name: 'expires_in') int? expiresIn,
    @JsonKey(name: 'active_ttl') int? refreshTokenTTL,
    String? encounter,
    String? patient,
    String? user,
    DateTime? createdAt,
  }) = _OpenEMRCredential;

  /// Converts [json] into [OpenEMRCredential].
  factory OpenEMRCredential.fromJson(Map<String, dynamic> json) =>
      _$OpenEMRCredentialFromJson(json);
}
