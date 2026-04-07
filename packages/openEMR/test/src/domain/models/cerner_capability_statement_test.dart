// import 'dart:convert';

// import 'package:openEMR/openEMR.dart';
// import 'package:test/test.dart';

// import '../../../fixture/fixture_reader.dart';

// void main() {
//   group('CernerCredential', () {
//     test('fromJson', () {
//       final jsonString = 'openEMR_capability_statement'.readFile;
//       final capability = OpenEMRCapabilityStatement.fromJson(
//         jsonDecode(jsonString) as Map<String, dynamic>,
//       );

//       expect(
//         capability,
//         isA<OpenEMRCapabilityStatement>()
//             .having((p0) => p0.authorizationEndpoint, 'Authorization', 'AE')
//             .having((p0) => p0.tokenEndpoint, 'Token', 'TE')
//             .having((p0) => p0.revocationEndpoint, 'Revocation', 'RE')
//             .having((p0) => p0.managementEndpoint, 'Management', 'ME')
//             .having((p0) => p0.introspectionEndpoint, 'Introspection', 'IE'),
//       );
//     });
//     test('toJson', () {
//       final jsonString = 'openEMR_capability_statement'.readFile;
//       final capability = OpenEMRCapabilityStatement.fromJson(
//         jsonDecode(jsonString) as Map<String, dynamic>,
//       );

//       expect(capability.toJson(), jsonDecode(jsonString));
//     });
//   });
// }
