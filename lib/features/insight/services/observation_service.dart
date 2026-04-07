import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:patient_app/features/home/data/models/observations_model.dart';

class ObservationService {
  static final ObservationService _instance = ObservationService._internal();
  factory ObservationService() => _instance;
  ObservationService._internal();

  final Dio _dio = Dio();
  static const String _username = 'rpm-demo-client';
  static const String _password = 'MoJpReAK7yvh4';
  static const String _baseUrl = 'https://aidboxdev.gheit.co';

  String get _basicAuth =>
      'Basic ${base64Encode(utf8.encode('$_username:$_password'))}';

  Future<List<Observation>> fetchObservations(List<String> deviceIDs) async {
    final token = Hive.box('authBox').get('accessToken');
    if (token == null) {
      throw Exception('No access token found');
    }

    final List<Observation> observations = [];

    try {
      for (String deviceId in deviceIDs) {
        final response = await _dio.get(
          '$_baseUrl/Observation?device=$deviceId&_sort=-lastUpdated&_count=1',
          options: Options(
            headers: {
              'Authorization': _basicAuth,
              'Content-Type': 'application/json',
            },
          ),
        );

        if (response.data != null &&
            response.data['entry'] != null &&
            response.data['entry'].isNotEmpty) {
          final observationData = response.data['entry'][0]['resource'];
          observations.add(Observation.fromJson(observationData));
        }
      }

      return observations;
    } catch (e) {
      throw Exception('Failed to fetch observations: $e');
    }
  }

  Future<Observation?> fetchSingleObservation(String deviceId) async {
    try {
      final observations = await fetchObservations([deviceId]);
      return observations.isNotEmpty ? observations.first : null;
    } catch (e) {
      throw Exception('Failed to fetch observation for device $deviceId: $e');
    }
  }

  Future<List<Observation>> fetchObservationsWithCount(
    List<String> deviceIDs, {
    int count = 10,
  }) async {
    final token = Hive.box('authBox').get('accessToken');
    if (token == null) {
      throw Exception('No access token found');
    }

    final List<Observation> observations = [];

    try {
      for (String deviceId in deviceIDs) {
        final response = await _dio.get(
          '$_baseUrl/Observation?device=$deviceId&_sort=-lastUpdated&_count=$count',
          options: Options(
            headers: {
              'Authorization': _basicAuth,
              'Content-Type': 'application/json',
            },
          ),
        );

        if (response.data != null &&
            response.data['entry'] != null &&
            response.data['entry'].isNotEmpty) {
          for (var entry in response.data['entry']) {
            observations.add(Observation.fromJson(entry['resource']));
          }
        }
      }

      return observations;
    } catch (e) {
      throw Exception('Failed to fetch observations: $e');
    }
  }
}
