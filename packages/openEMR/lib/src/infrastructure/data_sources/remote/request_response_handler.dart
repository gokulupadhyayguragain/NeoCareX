import 'package:shared/shared.dart';

/// {@template request_response_handler}
/// Handles request and response.
///
/// Also handles the DioException
///
/// {@endtemplate}
class RequestResponseHandler {
  /// {@macro request_response_handler}
  RequestResponseHandler(this._dio);
  final Dio _dio;

  /// Handles get request.
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) =>
      _handler(
        _dio.get<T>(
          path,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          options: options,
          queryParameters: queryParameters,
        ),
      );

  /// Handles post method.
  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) =>
      _handler(
        _dio.post<T>(
          path,
          cancelToken: cancelToken,
          data: data,
          queryParameters: queryParameters,
          options: options,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
        ),
      );

  /// Handle DELETE request
  Future<T> delete<T>(String path, {dynamic data}) =>
      _handler(_dio.delete<T>(path, data: data));

  /// Handle PATCH requests
  Future<T> patch<T>(String path, {dynamic data}) =>
      _handler(_dio.patch<T>(path, data: data));

  /// Handle PUT requests
  Future<T> put<T>(String path, {dynamic data}) =>
      _handler(_dio.put(path, data: data));

  Future<T> _handler<T>(_ResponseHandler<T> method) async {
    try {
      final response = await method;
      return response.data as T;
    } on DioError {
      return {} as T;
      // fetch token if status code is 401 or 403.
      //throw ServerException(message: e.errorMessage);
    }
  }
}

/// Response Handler
typedef _ResponseHandler<T> = Future<Response<T>>;
