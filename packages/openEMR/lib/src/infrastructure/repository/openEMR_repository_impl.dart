import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:openEMR/openEMR.dart';
import 'package:openEMR/src/domain/models/openEMR_observation_bundle.dart';
import 'package:openEMR/src/infrastructure/data_sources/local/openEMR_dao.dart';
import 'package:openEMR/src/infrastructure/data_sources/remote/openEMR_api.dart';
import 'package:openEMR/src/infrastructure/util/openEMR_code.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared/shared.dart';

/// Implements [OpenEMRRepository].
class OpenEMRRepositoryImpl extends OpenEMRRepository {
  /// CernerRepositoryImpl
  OpenEMRRepositoryImpl(
    this._api,
    this._credentialDao,
    this._authConfig,
  ) {
    _checkAuthenticationStatus();
  }

  final OpenEMRDao<OpenEMRCredential> _credentialDao;

  final OpenEMRApi _api;
  final OpenEMRAuthConfig _authConfig;

  @override
  Future<Either<Failure, Uri>> getAuthorizationUrl() async {
    try {
      final uri = Uri.parse(
        '${_authConfig.baseURL}/oauth2/default/authorize',
      ).replace(
        queryParameters: {
          'response_type': 'code',
          'client_id': _authConfig.clientId,
          'state': 'this_is_state',
          'scope': _authConfig.scopes.join("  "),
          'redirect_uri': _authConfig.redirectUri,
          'aud': _authConfig.audience,
        },
      );

      return right(uri);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } on StorageException catch (e) {
      return left(StorageFailure(message: e.message));
    } on PlatformException catch (_) {
      return left(
        StorageFailure(message: 'There is some problem with platform'),
      );
    }
  }

  @override
  Future<Either<Failure, Uri>> getAuthorizationUrlWithLaunchCode(
    String launchCode,
    String codeChallenge,
  ) async {
    try {
      print("redirecting to " +
          '${_authConfig.baseURL}/oauth2/default/authorize');
      print({
        'response_type': 'code',
        'client_id': _authConfig.clientId,
        'state': 'this_is_state',
        'scope': _authConfig.scopes.join('  '),
        'redirect_uri': _authConfig.redirectUri,
        'launch': launchCode,
        'aud': _authConfig.audience,
      });
      final uri = Uri.parse(
        '${_authConfig.baseURL}/oauth2/default/authorize',
      ).replace(
        queryParameters: {
          'response_type': 'code',
          'client_id': _authConfig.clientId,
          'state': 'this_is_state',
          'scope': _authConfig.scopes.join(' '),
          'redirect_uri': _authConfig.redirectUri,
          'launch': launchCode,
          'aud': _authConfig.audience,
        },
      );

      return right(uri);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } on StorageException catch (e) {
      return left(StorageFailure(message: e.message));
    } on PlatformException catch (_) {
      return left(
        StorageFailure(message: 'There is some problem with platform'),
      );
    }
  }

  @override
  Future<Either<Failure, OpenEMRCredential>> handleAuthorizationCode(
      String code, String codeVerifier) async {
    try {
      final credential = await _api.exchangeCodeWithCredential(
        '${_authConfig.baseURL}/oauth2/default/token',
        OpenEMRCode(
          code: code,
          redirectUri: _authConfig.redirectUri,
          clientId: _authConfig.clientId,
        ),
        codeVerifier,
      );
      credential;
      await _credentialDao.create(
        credential.copyWith(
          createdAt: DateTime.now(),
        ),
      );
      // Map<String, String> userinfo = {};
      // userinfo = {
      //   "access_token":credential.accessToken ?? '',
      //   "patient_id":credential.patient ?? ''
      // };
      _controller.add(true);
      return right(credential);
      //return right(unit);
    } on ServerException catch (e) {
      _controller.add(false);
      return left(ServerFailure(message: e.message));
    } on StorageException catch (e) {
      _controller.add(false);
      return left(StorageFailure(message: e.message));
    } on PlatformException catch (_) {
      _controller.add(false);
      return left(
        StorageFailure(message: 'There is some problem with platform'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Patient>>> searchPatient(
    OpenEMRPatientSearch searchParameter,
  ) async {
    try {
      final bundle = await _api.searchPatient(searchParameter);
      if (bundle.entry == null || bundle.entry!.isEmpty) return right([]);
      final resources = bundle.entry!
          .map((e) => e.resource)
          .where((r) => r != null)
          .whereType<Patient>()
          .toList();
      return right(resources);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getObservationBundleByPatientId(
    String id,
    String clientID,
  ) async {
    try {
      final bundle = await _api.getObservationByPatientId(id, clientID);
      return right(bundle);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isAuthorized() async {
    try {
      final storedCredential = await _credentialDao.read();
      if (storedCredential == null ||
          storedCredential.accessToken == null ||
          storedCredential.refreshTokenTTL == null ||
          storedCredential.createdAt == null) {
        _controller.add(false);
        return left(StorageFailure(message: 'Credentials is not available'));
      }

      // check if token is expired or not
      final expired = DateTime.now().isAfter(
        storedCredential.createdAt!.add(
          Duration(seconds: storedCredential.refreshTokenTTL!),
        ),
      );
      await _credentialDao.delete();
      _controller.add(!expired);
      return right(!expired);
    } on PlatformException {
      _controller.add(false);
      return left(StorageFailure(message: 'Unable to read stored credentials'));
    }
  }

  final _controller = BehaviorSubject<bool>();

  @override
  Stream<bool> get authorized => _controller.asBroadcastStream();

  Future<void> _checkAuthenticationStatus() async {
    await isAuthorized();
  }

  @override
  Future<Either<Failure, (Bundle, List<ObservationBundle>)>>
      getUserInformationBundle() async {
    try {
      final storedCredential = await _credentialDao.read();

      if (storedCredential == null ||
          // storedCredential.encounter == null ||
          storedCredential.patient == null) {
        return left(StorageFailure(message: 'Unable to read credential'));
      }
      try {
        // print("Getting patient");
        final patient = await _api.getPatientById(
            storedCredential.patient!, _authConfig.clientId);

        List<ObservationBundle> observationBundle = [];
        final observationOrFailure = await getObservationBundleByPatientId(
            storedCredential.patient!, _authConfig.clientId);

        observationOrFailure.fold(
          (l) {
            // Handle the Failure (e.g., show error or log)
            print("Failure: ${l.toString()}");
          },
          (r) {
            try {
              if (r is! Map<String, dynamic>) {
                print("Unexpected response format");
                return;
              }

              final entries = r["entry"];
              if (entries is! List) {
                print("Missing or invalid 'entry' list in response");
                return;
              }

              for (var entry in entries) {
                if (entry is Map<String, dynamic>) {
                  observationBundle.add(ObservationBundle.fromJson(entry));
                } else {
                  print("Invalid entry format: $entry");
                }
              }
            } catch (e, stack) {
              print("Error parsing observation data: $e");
              print(stack);
            }
          },
        );

        final bundle = Bundle(
          entry: [
            // BundleEntry(resource: encounter),
            BundleEntry(resource: patient),
            // BundleEntry(resource: observation),
          ],
        );
        return right((bundle, observationBundle));
      } catch (e) {
        // print("Error 1");
        final bundle = Bundle();
        return right((bundle, []));
      }
    } on ServerException catch (e) {
      //print("Error 2");
      return left(ServerFailure(message: e.message));
    } on StorageException catch (e) {
      //print("Error 3");
      return left(StorageFailure(message: e.message));
    } on PlatformException catch (_) {
      // print("Error 4");
      return left(
        StorageFailure(message: 'There is some problem with platform'),
      );
    }
  }
}
