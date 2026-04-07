// ignore_for_file: unused_element

import 'package:openEMR/openEMR.dart';
import 'package:openEMR/src/infrastructure/data_sources/local/openEMR_dao.dart';
import 'package:shared/shared.dart';

/// {@template cerner_dio_interceptor}
/// Intercept each request and adds Authorization token in header. If
/// header does not contain `noAuth`.
///
/// Also also calls the required url if `baseUrl` header is present.
/// {@endtemplate}
class OpenEMRDioInterceptor extends Interceptor {
  /// {@macro cerner_dio_interceptor}
  OpenEMRDioInterceptor(this._dao, this._authConfig);
  final OpenEMRDao<OpenEMRCredential> _dao;
  final OpenEMRAuthConfig _authConfig;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //print('requesting');
    final noAuth = options.headers.containsKey('noAuth');

    if (!noAuth) {
      final credential = await _dao.read();
      options.headers.addAll(
        {'Authorization': 'Bearer ${credential?.accessToken}'},
      );
      return handler.next(options);
    }

    options.headers.remove('noAuth');

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    //Uncomment this code for getting access token from refresh token
    // if (err.response?.statusCode == 401) {
    //   await _refreshToken();

    //   return onRequest(
    //     err.requestOptions,
    //     RequestInterceptorHandler(),
    //   );
    // }

    return handler.next(err);
  }

  Future<void> _refreshToken() async {
    final storedToken = await _dao.read();
    final response = await Dio().post<Map<String, dynamic>>(
      '${_authConfig.baseURL}/oauth2/default/token',
      data: {
        'grant_type': 'refresh_token',
        'refresh_token': storedToken?.refreshToken ?? '',
        'client_id': _authConfig.clientId
      },
      options: Options(
        contentType: 'application/x-www-form-urlencoded',
      ),
    );
    if (response.statusCode == 200) {
      final credential = OpenEMRCredential.fromJson(response.data!);
      await _dao.update(credential);
    } else {
      await _dao.delete();
    }
  }
}
