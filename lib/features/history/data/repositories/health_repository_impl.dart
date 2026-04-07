import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/core/functions/get_patient_devices.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:patient_app/features/home/data/services/health_api_service.dart';
import '../datasources/health_remote_datasource.dart';
import '../models/health_data_model.dart';
import '../models/observation_model.dart' as local_models;

abstract class HealthRepository {
  Future<Map<HealthDataType, List<HealthDataModel>>> fetchAllHealthData();
}

class HealthRepositoryImpl implements HealthRepository {
  final HealthRemoteDataSource remoteDataSource;
  final HealthApiService healthApiService;

  HealthRepositoryImpl({
    required this.remoteDataSource,
    required this.healthApiService,
  });

  static const String bloodSugarDeviceId = "381A100610E";
  static const String bloodPressureDeviceId = "100251303404";
  static const String bodyWeightDeviceId = "200242101321";
  static const String pulseDeviceId = "pulse_device_id";
  static const String oxygenLevelDeviceId = "oxygen_device_id";

  @override
  Future<Map<HealthDataType, List<HealthDataModel>>>
  fetchAllHealthData() async {
    final Map<HealthDataType, List<HealthDataModel>> healthData = {
      HealthDataType.bloodSugar: [],
      HealthDataType.bloodPressure: [],
      HealthDataType.bodyWeight: [],
      HealthDataType.pulse: [],
      HealthDataType.oxygenLevel: [],
      HealthDataType.nutrition: [],
    };

    List deviceIds = [
      bloodSugarDeviceId,
      bloodPressureDeviceId,
      bodyWeightDeviceId,
      pulseDeviceId,
      oxygenLevelDeviceId,
    ];
    final storage = SecureStorageService();
    String patientId =
        await storage.readString("patientId") ??
        "093266f6-6417-4e07-9219-e55bcd8a4e73";
    if (patientId == '') {
      return healthData;
    }
    if (patientId != "093266f6-6417-4e07-9219-e55bcd8a4e73") {
      deviceIds.clear();
      deviceIds = await getPatientDeviceIDList(patientId);
    }

    final futures = deviceIds.map((deviceId) async {
      try {
        final observations = await remoteDataSource.fetchObservationsForDevice(
          deviceId,
        );
        return {
          'deviceId': deviceId,
          'observations': observations,
          'error': null,
        };
      } catch (e) {
        debugPrint('Error fetching data for device $deviceId: $e');
        return {'deviceId': deviceId, 'observations': null, 'error': e};
      }
    });

    final results = await Future.wait(futures);

    for (var result in results) {
      if (result['observations'] != null) {
        _processObservations(
          result['observations'],
          result['deviceId'],
          healthData,
        );
      }
    }

    try {
      final nutritionObservations = await healthApiService
          .fetchNutritionObservations(patientId);

      final nutritionDataModels = nutritionObservations
          .map((obs) => HealthDataModel.fromNutritionObservation(obs))
          .toList();

      healthData[HealthDataType.nutrition] = nutritionDataModels;
    } catch (e) {
      debugPrint('Error fetching nutrition data: $e');
      healthData[HealthDataType.nutrition] = [];
    }

    for (var type in HealthDataType.values) {
      healthData[type]!.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    }

    return healthData;
  }

  void _processObservations(
    List<local_models.Observation> observations,
    String deviceId,
    Map<HealthDataType, List<HealthDataModel>> healthData,
  ) {
    Set<String> seenTimestamps = {};

    for (var obs in observations) {
      final dateTime = _parseDateTime(obs.meta?.lastUpdated);
      if (dateTime == null) continue;

      final timestampKey = '${deviceId}_${obs.meta?.lastUpdated}';
      if (seenTimestamps.contains(timestampKey)) {
        continue;
      }
      seenTimestamps.add(timestampKey);

      final date = DateFormat('MMM dd, yyyy').format(dateTime);
      final time = DateFormat('h:mm a').format(dateTime);

      if (deviceId == bloodSugarDeviceId) {
        final value = obs.value?.quantity?.value;
        if (value != null && _isValidBloodSugar(value)) {
          healthData[HealthDataType.bloodSugar]!.add(
            HealthDataModel(
              value: value.toStringAsFixed(0),
              unit: 'mg/dl',
              date: date,
              time: time,
              timestamp: dateTime,
            ),
          );
        }
      } else if (deviceId == bloodPressureDeviceId) {
        if (obs.component != null && obs.component!.length >= 2) {
          final systolic = obs.component![0].value?.quantity?.value;
          final diastolic = obs.component![1].value?.quantity?.value;

          if (systolic != null &&
              diastolic != null &&
              _isValidBloodPressure(systolic, diastolic)) {
            healthData[HealthDataType.bloodPressure]!.add(
              HealthDataModel(
                value: '',
                systolic: systolic.toStringAsFixed(0),
                diastolic: diastolic.toStringAsFixed(0),
                unit: 'mm Hg',
                date: date,
                time: time,
                timestamp: dateTime,
              ),
            );
          }
        }
      } else if (deviceId == bodyWeightDeviceId) {
        final value = obs.value?.quantity?.value;
        if (value != null && _isValidWeight(value)) {
          healthData[HealthDataType.bodyWeight]!.add(
            HealthDataModel(
              value: value.toStringAsFixed(1),
              unit: 'lbs',
              date: date,
              time: time,
              timestamp: dateTime,
            ),
          );
        }
      } else if (deviceId == pulseDeviceId) {
        final value = obs.value?.quantity?.value;
        if (value != null && _isValidPulse(value)) {
          healthData[HealthDataType.pulse]!.add(
            HealthDataModel(
              value: value.toStringAsFixed(0),
              unit: 'bpm',
              date: date,
              time: time,
              timestamp: dateTime,
            ),
          );
        }
      } else if (deviceId == oxygenLevelDeviceId) {
        final value = obs.value?.quantity?.value;
        if (value != null && _isValidOxygenLevel(value)) {
          healthData[HealthDataType.oxygenLevel]!.add(
            HealthDataModel(
              value: value.toStringAsFixed(1),
              unit: '%',
              date: date,
              time: time,
              timestamp: dateTime,
            ),
          );
        }
      }
    }
  }

  DateTime? _parseDateTime(String? dateTimeStr) {
    if (dateTimeStr == null) return null;
    try {
      return DateTime.parse(dateTimeStr);
    } catch (e) {
      return null;
    }
  }

  bool _isValidBloodSugar(num value) {
    return value >= 50 && value <= 500;
  }

  bool _isValidBloodPressure(num systolic, num diastolic) {
    return systolic >= 70 &&
        systolic <= 250 &&
        diastolic >= 40 &&
        diastolic <= 150 &&
        systolic > diastolic;
  }

  bool _isValidWeight(num value) {
    return value >= 1 && value <= 1000;
  }

  bool _isValidPulse(num value) {
    return value >= 40 && value <= 200;
  }

  bool _isValidOxygenLevel(num value) {
    return value >= 70 && value <= 100;
  }
}
