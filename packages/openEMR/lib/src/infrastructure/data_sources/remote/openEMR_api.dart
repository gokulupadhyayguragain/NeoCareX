import 'package:openEMR/openEMR.dart';

import 'package:openEMR/src/infrastructure/util/openEMR_code.dart';
import 'package:shared/shared.dart';

/// Cerner api implementation
///
/// base url should be
/// https://fhir-ehr.cerner.com/r4/ec2458f2-1e24-41c8-b71b-0e701af7583d
abstract class OpenEMRApi {
  /// Get cerner server capability statement.
  Future<OpenEMRCapabilityStatement> getCapabilityStatement();

  /// Exchange [code] with access token.
  ///
  /// [uri] must be the token url fetch using [getCapabilityStatement].
  Future<OpenEMRCredential> exchangeCodeWithCredential(
    String uri,
    OpenEMRCode code,
    String codeVerifier,
  );

  /// Search patient with [query].
  Future<Bundle> searchPatient(OpenEMRPatientSearch query);

  /// Get encounter by [id].
  Future<Encounter> getEncounterById(String id);

  /// Get patient by [id].
  Future<Patient> getPatientById(String id, String clientID);

  Future<dynamic> getObservationByPatientId(String id, String clientID);

  /// Refresh token [refreshToken].
  Future<OpenEMRCredential> refreshToken(String refreshToken);
}
