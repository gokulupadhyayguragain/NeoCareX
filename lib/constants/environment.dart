/// provides the different environment variables for different development
///  environments
class Environment {
  /// nutrition ai key
  static const String nutritionAiKey = String.fromEnvironment('NUTRITION_AI_KEY');

  /// google api key
  static const String googleApiKey = String.fromEnvironment('GOOGLE_API_KEY');

  /// aid box url
  static const String aidBoxUrl = String.fromEnvironment('AID_BOX_URL');

  /// flask url
  static const String flaskUrl = String.fromEnvironment('FLASK_URL');

  ////shoprideon_url
  static const String shoprideonUrl = String.fromEnvironment('SHOPRIDEON_URL');

  //auth0 app id
  static const String auth0App = String.fromEnvironment('AUTH0APP');

  /// signnow url
  static const String signnowUrl = String.fromEnvironment('SIGNNOW_URL');

  /// flask websocket url
  static const String flaskWebSocketUrl = String.fromEnvironment(
    'FLASK_WEBSOCKET_URL',
    defaultValue: flaskUrl,
  );

  /// p verify server url
  /// "P_VERIFY_URL": "https://api.pverify.com/test",
  static const String pVerifyUrl = String.fromEnvironment('P_VERIFY_URL');

  /// NPI registry url
  static const String npiRegistryUrl = String.fromEnvironment(
    'NPI_REGISTRY_URL',
  );

  /// docusign url
  static const String docusignUrl = String.fromEnvironment('DOCUSIGN_URL');

  /// proxy server url
  static const String proxyServerUrl = String.fromEnvironment(
    'PROXY_SERVER_URL',
  );

  /// auth0 url
  static const String auth0Url = String.fromEnvironment('AUTH0_URL');

  /// auth0 client id
  //static const String auth0ClientId = String.fromEnvironment('AUTH0_CLIENT_ID');

  /// EPIC Client ID
  /// bdd07e6b-ac6d-43e1-9b5d-d206446079f8
  static const String epicClientId = String.fromEnvironment('EPIC_CLIENT_ID');

  /// EPIC base url
  /// https://fhir.epic.com/interconnect-fhir-oauth/
  static const String epicBaseUrl = String.fromEnvironment('EPIC_BASE_URL');

  /// AUTH0 base url
  static const String auth0BaseUrl = String.fromEnvironment('AUTH0_BASE_URL');

  /// AUTH0 refresh token url (for client credentials only).
  static const String auth0RefreshUrl = String.fromEnvironment(
    'AUTH0_REFRESH_URL',
  );

  ///Claim Api URL
  static const String claimApiUrl = String.fromEnvironment("CLAIM_REV_URL");

  /// Cerner clientId.
  static const String cernerClientId = String.fromEnvironment(
    "CERNER_CLIENT_ID",
  );

  /// oauth2 redirect uri
  static const String oauth2RedirectUri = String.fromEnvironment(
    "OAUTH2_REDIRECT_URI",
  );
  //openEMR client id
  static const String openEMRClientId = String.fromEnvironment(
    "OPENEMR_CLIENT_ID",
  );
  //openEMR client id
  static const String openEMRClientSecret = String.fromEnvironment(
    "OPENEMR_CLIENT_SECRET",
  );
  //openEMR fhir url
  static const String openEMRFhirURL = String.fromEnvironment(
    "OPENEMR_FHIR_URL",
  );
  //openEMR base url
  static const String openEMRBaseURL = String.fromEnvironment(
    "OPENEMR_BASE_URL",
  );

  //aws gateway
  static const String awsGateway = String.fromEnvironment("AWSGATEWAY");

  //instance
  static const String instance = String.fromEnvironment("INSTANCE");

  static const String auth0RedirectUrl = String.fromEnvironment(
    "AUTH0_REDIRECT_URL",
  );

  static const String auth0LogouttUrl = String.fromEnvironment(
    "AUTH0_LOGOUT_URL",
  );

  static const String auth0Domain = String.fromEnvironment("AUTH0_DOMAIN");

  static const String auth0ClientId = String.fromEnvironment("AUTH0_CLIENT_ID");

  static const String rookClientUuid = String.fromEnvironment("ROOK_CLIENT_UUID");
  
  static const String rookSecretKey = String.fromEnvironment("ROOK_SECRET_KEY");

  static const String rookEnvironment = String.fromEnvironment("ROOK_ENVIRONMENT");
}
