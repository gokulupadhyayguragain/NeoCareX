import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fhir/r4.dart';

class UserApi {
  Dio dio = Dio();

  static const String auth0Domain = 'dev-hzeb55fj.us.auth0.com';
  static const String auth0Audience =
      'https://dev-hzeb55fj.us.auth0.com/api/v2/';
  static const String auth0ClientId = 'aABSTJMmfHz10yuDgP9TwqF2LXhAvgYT';
  static const String auth0ClientSecret =
      'yGgqrWGbrAIawRsGVzy5rOAZ7TZlsn7V5vo9zsrx-OpcNnMhElRopNiiHWS9jcmO';

  String? _accessToken;
  DateTime? _tokenExpiry;

  void setAccessToken(String token) {
    _accessToken = token;
  }

  Future<String?> _getAuth0AccessToken() async {
    try {
      final response = await dio.post(
        'https://$auth0Domain/oauth/token',
        data: {
          'grant_type': 'client_credentials',
          'client_id': auth0ClientId,
          'client_secret': auth0ClientSecret,
          'audience': auth0Audience,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Accept': 'application/json',
            'Origin': 'http://localhost:5000',
          },
        ),
      );

      if (response.statusCode == 200) {
        final token = response.data['access_token'];
        final expiresIn = response.data['expires_in'];

        _accessToken = token;
        _tokenExpiry = DateTime.now().add(Duration(seconds: expiresIn));

        return token;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<String?> _getValidAccessToken() async {
    if (_accessToken != null &&
        _tokenExpiry != null &&
        DateTime.now().isBefore(_tokenExpiry!)) {
      return _accessToken;
    }
    return await _getAuth0AccessToken();
  }

  Future<Map<String, dynamic>?> createUserInAuth0({
    required String email,
    required String password,
    required String givenName,
    required String familyName,
    required String patientId,
    required String role,
  }) async {
    try {
      final token = await _getValidAccessToken();

      final response = await dio.post(
        'https://$auth0Domain/api/v2/users',
        data: {
          "email": email,
          "password": password,
          "connection": "Username-Password-Authentication",
          "given_name": givenName,
          "family_name": familyName,
          "name": "$givenName $familyName",
          "nickname": givenName.toLowerCase(),
          "email_verified": false,
          "app_metadata": {"patientId": patientId, "role": role},
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      if (e is DioError && e.response != null) {
        return e.response?.data;
      }
      return null;
    }
  }

  Future<String?> createPatientInAdibox(Patient patient) async {
    const username = 'rpm-demo-client';
    const password = 'MoJpReAK7yvh4';

    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    try {
      final response = await dio.post(
        'https://aidboxdev.gheit.co/fhir/Patient',
        data: patient,
        options: Options(
          headers: {
            'Authorization': basicAuth,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["id"].toString();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  // Future<String?> addFirebaseIdInPatientResource(String patientid,String firebaseid) async {
  //   // Basic Auth credentials
  //   const username = 'rpm-demo-client';
  //   const password = 'MoJpReAK7yvh4';

  //   // Encode username:password to Base64
  //   final basicAuth =
  //       'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  //   try {
  //     final response = await dio.put(
  //       'https://aidboxdev.gheit.co/fhir/Patient',
  //       data: patient,
  //       options: Options(
  //         headers: {
  //           'Authorization': basicAuth,
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data["id"].toString();
  //     }
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  //   return null;
  // }

  Future<String?> addPatientIdReferenceInDevice(
    String patientid,
    Map<String, dynamic> deviceWithPatientReference,
    String deviceId,
  ) async {
    // Basic Auth credentials
    const username = 'rpm-demo-client';
    const password = 'MoJpReAK7yvh4';

    // Encode username:password to Base64
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    try {
      final response = await dio.post(
        'https://aidboxdev.gheit.co/Device',
        data: deviceWithPatientReference,
        options: Options(
          headers: {
            'Authorization': basicAuth,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["id"].toString();
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<Device?> getDevice(String deviceId) async {
    // Basic Auth credentials
    const username = 'rpm-demo-client';
    const password = 'MoJpReAK7yvh4';

    // Encode username:password to Base64
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    try {
      final response = await dio.get(
        'https://aidboxdev.gheit.co/Device/$deviceId',
        options: Options(
          headers: {
            'Authorization': basicAuth,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Device device = Device.fromJson(response.data);
        return device;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
