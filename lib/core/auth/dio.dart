import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:patient_app/core/storage/secure_storage.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late Dio dio;
  final SecureStorageService _storage = SecureStorageService();

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://dev.vitalcarex.backend.gheit.co",
        // connectTimeout: 30,
        // receiveTimeout: 30,
        headers: {
          "Content-Type": "application/json",
          "Origin": "http://localhost:5000/",
        },
      ),
    );

    _initializeInterceptors();
  }
  void _initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.readString("access_token");
          log("[DIO REQUEST] ${options.method} ${options.uri}");

          // log("[DIO DATA] ${options.data}");

          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          //log("[DIO HEADERS] ${options.headers}");
          handler.next(options);
        },

        onResponse: (response, handler) {
          log(
            "[DIO RESPONSE] ${response.statusCode} ${response.requestOptions.uri}",
          );
          // log("[DIO RESPONSE DATA] ${response.data}");
          handler.next(response);
        },

        onError: (DioError e, handler) async {
          log("[DIO ERROR] URL: ${e.requestOptions.uri}");
          log("[DIO ERROR TYPE] ${e.type}");

          if (e.response != null) {
            // Server responded with a status code outside 2xx
            log("[DIO ERROR RESPONSE] Status: ${e.response?.statusCode}");
            log("[DIO ERROR RESPONSE DATA] ${e.response?.data}");
          } else {
            // No response received
            log("[DIO ERROR MESSAGE] ${e.message}");
          }

          // Optional: handle token refresh
          if (e.response?.statusCode == 401) {
            log("[DIO ERROR] Unauthorized. Attempting refresh...");
            final refreshToken = await _storage.readString("refresh_token");
            if (refreshToken != null) {
              try {
                final refreshResponse = await Dio().post(
                  'https://dev.vitalcarex.backend.gheit.co/auth/refresh',
                  data: {"refresh_token": refreshToken},
                );
                await _storage.saveString(
                  "access_token",
                  "${refreshResponse.data["access_token"]}",
                );

                log("[DIO REFRESH] Token refreshed successfully");
              } catch (refreshError) {
                log("[DIO REFRESH ERROR] $refreshError");
              }
            }
          }

          handler.next(e); // continue error handling
        },
      ),
    );
  }
}
