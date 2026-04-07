import 'package:auth0_flutter/auth0_flutter_web.dart'; // import the web version

class Auth0Service {
  static final Auth0Web _auth0 = Auth0Web(
    'dev-hzeb55fj.us.auth0.com',
    'SEAxyCOSHw67mj29fH2HdtfwTFeDrLSe',
  );

  static Future<void> login() async {
    await _auth0.loginWithRedirect(
      redirectUrl: "http://localhost:5000", 
      scopes: {'openid', 'profile', 'email'},
    );
  }

  static Future<void> logout() async {
    await _auth0.logout(returnToUrl:"http://localhost:5000", );
  }

  static Future<void> loginWithGoogle() async {
    await _auth0.loginWithRedirect(
      // redirectUrl is a String (use app origin for web)
      redirectUrl:"http://localhost:5000", 
      // scopes is a Set<String>
      scopes: {'openid', 'profile', 'email'},
      // any extra authorize params (pass connection here)
      parameters: {'connection': 'google-oauth2'},
    );
  }
}
