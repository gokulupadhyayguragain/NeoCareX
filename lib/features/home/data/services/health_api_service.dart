import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:patient_app/core/auth/dio.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import '../models/observations_model.dart';
import 'health_data_processor.dart';

class HealthApiService {
  static const String _baseUrl = 'https://aidboxdev.gheit.co';
  static const String _username = 'rpm-demo-client';
  static const String _password = 'MoJpReAK7yvh4';

  late final Dio _dio;
  late final String _basicAuth;

  HealthApiService() {
    _dio = Dio();
    _basicAuth = 'Basic ${base64Encode(utf8.encode('$_username:$_password'))}';
  }

  Future<List<Observation>> fetchObservationsForDevice(String deviceId) async {
    final token = Hive.box('authBox').get('accessToken');
    if (token == null) {
      throw Exception('No access token available');
    }

    try {
      //String url = '$_baseUrl/Observation?device=$deviceId&_sort=-lastUpdated&_count=100';
      DioClient dioclient = DioClient();
      String url = '/device/get_all_observations/$deviceId';
      final response = await dioclient.dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> entries = data['entry'] ?? [];

        final observations = entries
            .map((entry) => Observation.fromJson(entry['resource']))
            .toList();

        observations.sort((a, b) {
          final aEffective = a.effective?.dateTime;
          final bEffective = b.effective?.dateTime;

          if (aEffective == null && bEffective == null) return 0;
          if (aEffective == null) return 1;
          if (bEffective == null) return -1;

          try {
            final aDate = DateTime.parse(aEffective);
            final bDate = DateTime.parse(bEffective);
            return bDate.compareTo(aDate);
          } catch (e) {
            return 0;
          }
        });

        return observations;
      } else {
        throw Exception('Failed to fetch observations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching observations for device $deviceId: $e');
    }
  }

  Future<Map<String, List<Observation>>> fetchObservationsForDevices(
    Map<String, String> deviceTypeMapping,
  ) async {
    final Map<String, List<Observation>> results = {};

    for (String deviceId in deviceTypeMapping.keys) {
      try {
        final observations = await fetchObservationsForDevice(deviceId);
        final observationType = deviceTypeMapping[deviceId]!;

        final validObservations = observations
            .where(
              (obs) =>
                  HealthDataProcessor.isValidObservation(obs, observationType),
            )
            .toList();

        results[observationType] = validObservations;
      } catch (e) {
        results[deviceTypeMapping[deviceId]!] = [];
      }
    }

    return results;
  }

  Future<void> postObservation(dynamic observation) async {
    try {
      Map<String, dynamic> observationData;
      if (observation is Map<String, dynamic>) {
        observationData = observation;
      } else if (observation is Map) {
        observationData = {};
        observation.forEach((key, value) {
          observationData[key.toString()] = value;
        });
      } else {
        final jsonData = observation.toJson();
        observationData = {};
        jsonData.forEach((key, value) {
          observationData[key.toString()] = value;
        });
      }

      if (!observationData.containsKey('resourceType')) {
        observationData['resourceType'] = 'Observation';
      }
      DioClient dioclient = DioClient();
      final response = await dioclient.dio.post(
        '/observation',
        data: observationData,
      );

      if (response.statusCode != 201 && response.statusCode != 200) {
        throw Exception(
          'Failed to post observation: ${response.statusCode} - ${response.data}',
        );
      }
    } catch (e) {
      throw Exception('Error posting observation: $e');
    }
  }

  Future<List<Observation>> fetchNutritionObservations(String patientId) async {
    try {
      DioClient dioclient = DioClient();
      final response = await dioclient.dio.get(
        '/get_nutri_analysis/$patientId?code=9052-2&count=100',
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> entries = data['entry'] ?? [];

        final observations = entries
            .map((entry) => Observation.fromJson(entry['resource']))
            .toList();

        return observations;
      } else {
        throw Exception(
          'Failed to fetch nutrition observations: ${response.statusCode}',
        );
      }
    } catch (e) {
      debugPrint('Error in fetchNutritionObservations: $e');
      throw Exception('Error fetching nutrition observations: $e');
    }
  }
}
