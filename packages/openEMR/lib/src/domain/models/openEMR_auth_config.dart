/// {@template cerner_auth_config}
/// This is wrapper class which holds all the information required for
/// authentication in Cerner EHR.
///
/// {@endtemplate}
class OpenEMRAuthConfig {
  /// {@macro cerner_auth_config}
  OpenEMRAuthConfig(
      {required this.redirectUri,
      required this.scopes,
      required this.clientId,
      required this.clientSecret,
      required this.audience,
      required this.baseURL});

  /// Audience from where you want to access the resource.
  ///
  /// There is two audience in cerner r4 and dst2.
  ///
  /// For this project r4 is used as the audience.
  ///
  /// Default is https://fhir-ehr.cerner.com/r4/ec2458f2-1e24-41c8-b71b-0e701af7583d.
  final String audience;

  /// Scopes required.
  final List<String> scopes;

  /// Application redirect uri registered in cerner.
  final String redirectUri;

  /// Client id.
  final String clientId;

  ///Client Secret
  final String clientSecret;

  ////Base URL
  final String baseURL;
}

// this.audience = 'https://neocarex.shoprideon.com/apis/default/fhir',
