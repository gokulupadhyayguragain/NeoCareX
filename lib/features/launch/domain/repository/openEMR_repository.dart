// /// Provides methods for authentication and resource access.
// ///
// /// __Authorization__: Use [getAuthorizationUrl] and [handleAuthorizationCode].
// ///
// abstract class OpenEMRRepository {
//   /// Wired up all necessary information inside the url.
//   Future<Either<Failure, Uri>> getAuthorizationUrl();

//   /// Wired up all necessary information inside the url with [launchCode].
//   Future<Either<Failure, Uri>> getAuthorizationUrlWithLaunchCode(
//       String launchCode, String codeChallenge);

//   /// handles the authentication code return after user gives consent to this
//   /// application.
//   Future<Either<Failure, Unit>> handleAuthorizationCode(
//       String code, String codeVerifier);

//   /// Search patient with the given [searchParameter].
//   Future<Either<Failure, List<Patient>>> searchPatient(
//     OpenEMRPatientSearch searchParameter,
//   );

//   /// Is current user is authorized to access the resource.
//   Future<Either<Failure, bool>> isAuthorized();

//   /// Is current user is authorized to access the resource.
//   Stream<bool> get authorized;

//   /// Get EHR launched user information
//   Future<Either<Failure, (Bundle, List<ObservationBundle>)>>
//       getUserInformationBundle();

//   Future<Either<Failure, dynamic>> getObservationBundleByPatientId(
//       String id, String clientID);
// }
