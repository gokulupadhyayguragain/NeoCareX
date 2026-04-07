import 'dart:convert';

import 'package:openEMR/openEMR.dart';
import 'package:test/test.dart';

import '../../../fixture/fixture_reader.dart';

void main() {
  group('CernerCredential', () {
    test('fromJson', () {
      final jsonString = 'cerner_credential'.readFile;
      final credential = OpenEMRCredential.fromJson(
        jsonDecode(jsonString) as Map<String, dynamic>,
      );

      expect(
        credential,
        isA<OpenEMRCredential>()
            .having((p0) => p0.accessToken, 'Access Token', 'Access Token')
            .having((p0) => p0.scope, 'Scope', 'openid')
            .having((p0) => p0.idToken, 'Id Token', 'Id Token')
            .having((p0) => p0.tokenType, 'Token Type', 'Bearer')
            .having((p0) => p0.expiresIn, 'Expires In', 570)
            .having((p0) => p0.refreshToken, 'Refresh Token', 'Refresh Token')
            .having((p0) => p0.refreshTokenTTL, 'time to live', 46797)
            .having((p0) => p0.encounter, 'Encounter', 'Encounter')
            .having((p0) => p0.patient, 'Patient', 'Patient')
            .having((p0) => p0.user, 'User', 'User'),
      );
    });
    test('toJson', () {
      final jsonString = 'cerner_credential'.readFile;
      final credential = OpenEMRCredential.fromJson(
        jsonDecode(jsonString) as Map<String, dynamic>,
      );

      expect(credential.toJson(), jsonDecode(jsonString));
    });
  });
}
