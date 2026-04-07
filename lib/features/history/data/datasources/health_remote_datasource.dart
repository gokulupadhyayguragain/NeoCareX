import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:patient_app/core/auth/dio.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'dart:convert';
import '../models/observation_model.dart';

abstract class HealthRemoteDataSource {
  Future<List<Observation>> fetchObservationsForDevice(String deviceId);
}

class HealthRemoteDataSourceImpl implements HealthRemoteDataSource {
  final Dio dio;

  HealthRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Observation>> fetchObservationsForDevice(String deviceId) async {
    // const username = 'rpm-demo-client';
    // const password = 'MoJpReAK7yvh4';
    // final basicAuth =
    //     'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    // final token = Hive.box('authBox').get('accessToken');
    // if (token == null) {
    //   throw Exception('No access token found');
    // }

    // final url =
    //     'https://aidboxdev.gheit.co/Observation?device=$deviceId&_sort=-lastUpdated&_count=100';
    String url = '/device/get_all_observations/$deviceId';

    DioClient dioclient = DioClient();

    final response = await dioclient.dio.get(url);

    if (response.statusCode == 200) {
      final observationResponse = ObservationResponse.fromJson(response.data);
      return observationResponse.entry.map((e) => e.resource).toList();
    } else {
      throw Exception('Failed to fetch observations for device $deviceId');
    }
  }
}
