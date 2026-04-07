import 'package:dio/dio.dart';
import 'package:shared/src/error/p_verify_error_model.dart';

extension CustomDioErrorMessage on DioError {
  String get errorMessage {
    const map = {
      301: 'Moved Permanently: Requested resource has been changed',
      304: 'Not Modified: Response has not been modified',
      401: 'Unauthorized: You should login to perform this action',
      403: 'Forbidden: You don\'t have access right to this content',
      404: 'Not Found: Requested resource is not available',
      407: 'Proxy Authentication Required:',
      408: 'Take longer time to respond',
      500: 'Internal server Error:',
      503: 'This service is not available',
      511: 'You need to authenticated to gain network access',
      409: 'Entity already exists with a same name or email',
      429: 'Too many requests.',
    };

    if (map[response?.statusCode] == null) {
      if (type == DioErrorType.receiveTimeout ||
          type == DioErrorType.connectTimeout) {
        return 'Server is not reachable!';
      }

      if (type == DioErrorType.other && message.contains('SocketException')) {
        return 'No Internet Connection !!!';
      }

      if (type == DioErrorType.connectTimeout ||
          type == DioErrorType.receiveTimeout) {
        return 'Timeout Error: Please check your connection';
      }
    }
    if (map[response?.data["statusCode"]] != null) {
      return response?.data["message"];
    }
    if (map[response?.data["message"]] != null) {
      return response?.data["message"];
    }
    if (map[response?.data["errors"]] != null) {
      final error = PVerifyError.fromJson(response?.data["errors"]);
      return error.errors.first;
    }
    //print(response);
    return map[response?.statusCode] ?? 'Server Not Responding';
  }
}
