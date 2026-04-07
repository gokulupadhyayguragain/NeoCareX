import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:openEMR/openEMR.dart';
import 'package:openEMR/src/infrastructure/data_sources/remote/openEMR_api.dart';
import 'package:openEMR/src/infrastructure/data_sources/remote/request_response_handler.dart';
import 'package:openEMR/src/infrastructure/util/openEMR_code.dart';
import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';

/// {@template cerner_api_impl}
/// Implementation of [OpenEMRApi].
/// {@endtemplate}
class OpenEMRApiImpl extends OpenEMRApi {
  /// {@macro cerner_api_impl}
  OpenEMRApiImpl(this._handler, this.config);

  final RequestResponseHandler _handler;
  final OpenEMRAuthConfig config;
  final _secureStorage = const FlutterSecureStorage();


  @override
  Future<OpenEMRCredential> exchangeCodeWithCredential(
    String uri,
    OpenEMRCode code,
    String codeVerifier,
  ) async {
    final username = config.clientId;
    final password = config.clientSecret;
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final response = await _handler.post<Map<String, dynamic>>(
      uri,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {'Authorization': basicAuth, 'noAuth': true},
      ),
      data: code.toJson(),
    );

      final credential = OpenEMRCredential.fromJson(response);

  await _secureStorage.write(key: 'emr_accessToken', value: credential.accessToken);

  return credential;
  }

  @override
  Future<OpenEMRCapabilityStatement> getCapabilityStatement() async {
    final response = await _handler.get<Map<String, dynamic>>(
      '/.well-known/smart-configuration',
      options: Options(
        headers: {
          'noAuth': true,
        },
      ),
    );
    return OpenEMRCapabilityStatement.fromJson(response);
  }

  @override
  Future<Bundle> searchPatient(OpenEMRPatientSearch query) async {
    // print(query.birthDate.toString().split(' ')[0]);
    final response = await _handler.get<Map<String, dynamic>>(
      '/Patient',
      queryParameters: {
        'given': query.given,
        'family': query.family,
        'birthdate': query.birthDate.toString().split(' ')[0],
        'gender': query.gender,
        'phone': query.phone
      },
      options: Options(
        contentType: 'application/json',
        headers: {'Accept': 'application/json'},
      ),
    );
    return compute(_parsePatientSearch, response);
  }

  @override
  Future<Encounter> getEncounterById(String id) async {
    final response = await _handler.get<Map<String, dynamic>>(
      '/Encounter/$id',
      options: Options(
        headers: {'Accept': 'application/json'},
      ),
    );
    return Encounter.fromJson(response);
  }

  @override
  Future<Patient> getPatientById(String id, String clientID) async {
    final response = await _handler.get<Map<String, dynamic>>(
      '/Patient/$id',
      options: Options(
        headers: {'Accept': 'application/json'},
      ),
    );
    print("The response is " + response.toString());
    print(Patient.fromJson(response));
    return Patient.fromJson(response);
  }

  @override
  Future<dynamic> getObservationByPatientId(String id, String clientID) async {
    final response = await _handler.get<Map<String, dynamic>>(
      '/Observation?patient=$id&category=vital-signs',
      options: Options(
        headers: {'Accept': 'application/json'},
      ),
    );
    return response;
  }

  @override
  Future<OpenEMRCredential> refreshToken(String refreshToken) async {
    final response = await _handler.post<Map<String, dynamic>>(
      '/protocols/oauth2/profiles/smart-v1/token',
      data: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
      },
      options: Options(
        headers: {'Accept': 'application/json', 'noAuth': true},
        contentType: 'application/x-www-form-urlencoded',
      ),
    );
   final credential = OpenEMRCredential.fromJson(response);

  await _secureStorage.write(key: 'emr_accessToken', value: credential.accessToken);

  return credential;
  }
}

Bundle _parsePatientSearch(Map<String, dynamic> json) => Bundle.fromJson(json);
