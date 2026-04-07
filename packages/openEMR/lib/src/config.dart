import 'package:openEMR/openEMR.dart';
import 'package:openEMR/src/infrastructure/data_sources/local/openEMR_credential_dao.dart';
import 'package:openEMR/src/infrastructure/data_sources/local/openEMR_dao.dart';
import 'package:openEMR/src/infrastructure/data_sources/remote/openEMR_api_impl.dart';
import 'package:openEMR/src/infrastructure/data_sources/remote/openEMR_dio_interceptor.dart';
import 'package:openEMR/src/infrastructure/data_sources/remote/request_response_handler.dart';
import 'package:openEMR/src/infrastructure/repository/openEMR_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared/shared.dart';

/// {@template OpenEMR_config}
/// Configures the OpenEMR Package before using it.
///
/// You need to call the [init] method before access the [repository].
///
///
/// It is lazy singleton.
/// {@endtemplate}
class OpenEMRConfig {
  /// {@macro OpenEMR_config}
  factory OpenEMRConfig() {
    if (_instance != null) return _instance!;
    _instance = OpenEMRConfig._();
    return _instance!;
  }

  OpenEMRConfig._();

  static OpenEMRConfig? _instance;

  late OpenEMRRepository _repository;
  late OpenEMRDao<OpenEMRCredential> _storage;

  /// Provides the configured repository. Make sure you have called the
  /// [init] method before access the [repository].
  OpenEMRRepository get repository => _repository;

  /// Provides the configured toaken storage for Cerner.
  ///  Make sure you have called the  [init] method before access the [storage].
  OpenEMRDao<OpenEMRCredential> get storage => _storage;

  ///  Method to configure the Cerner package.
  ///
  /// It will configured the package based on [config] provided.
  Future<void> init(OpenEMRAuthConfig config) async {
    final time = const Duration(seconds: 15).inMilliseconds;
    final dio = Dio(
      BaseOptions(
        baseUrl: config.audience,
        connectTimeout: time,
        receiveTimeout: time,
        sendTimeout: time,
      ),
    );

    const secureStorage = FlutterSecureStorage();
    final credentialDao = OpenEMRCredentialDao(secureStorage);
    _storage = credentialDao;

    final interceptor = OpenEMRDioInterceptor(credentialDao, config);

    dio.interceptors.add(interceptor);

    final handler = RequestResponseHandler(dio);
    final api = OpenEMRApiImpl(handler, config);

    _repository = OpenEMRRepositoryImpl(
      api,
      credentialDao,
      config,
    );
  }
}
