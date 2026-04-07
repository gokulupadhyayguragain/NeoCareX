import 'package:openEMR/src/infrastructure/util/openEMR_code.dart';
import 'package:test/test.dart';

void main() {
  group('CernerCode', () {
    const json = {
      'grant_type': 'authorization_code',
      'code': 'code',
      'redirect_uri': 'redirectUri',
      'client_id': 'clientId',
    };

    test('fromJson', () {
      final code = OpenEMRCode.fromJson(json);
      expect(
        code,
        isA<OpenEMRCode>()
            .having((p0) => p0.clientId, 'client id', 'clientId')
            .having((p0) => p0.grantType, 'grantType', 'authorization_code'),
      );
    });

    test('toJson', () {
      final code = OpenEMRCode.fromJson(json);
      expect(code.toJson(), json);
    });
  });
}
