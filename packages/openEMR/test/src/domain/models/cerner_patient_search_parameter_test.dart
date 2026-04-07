import 'package:openEMR/openEMR.dart';
import 'package:test/test.dart';

void main() {
  group('OpenEMRPatientSearchParameter', () {
    test('toJson', () {
      final dob = DateTime.now();
      final json = {
        'given': 'given',
        'family': 'family',
        'birthDate': dob.toIso8601String().split('T').first,
        'phone': '8033333333',
        'gender': 'female',
      };

      final patientSearch = OpenEMRPatientSearch(
        birthDate: dob,
        family: 'family',
        gender: 'female',
        given: 'given',
        phone: '8033333333',
      );
      expect(patientSearch.toJson(), json);
    });
  });
}
