import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:patient_app/core/auth/dio.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';
import 'package:patient_app/features/home/data/models/observations_model.dart';

part 'insights_event.dart';
part 'insights_state.dart';
part 'insights_bloc.freezed.dart';

class InsightsBloc extends Bloc<InsightsEvent, InsightsState> {
  InsightsBloc() : super(const InsightsState.initial()) {
    on<FetchObservations>(_onFetchObservations);
    on<ChangePeriod>(_onChangePeriod);
    on<SelectCustomDateRange>(_onSelectCustomDateRange);
    on<ChangeTab>(_onChangeTab);
  }

  Future<void> _onFetchObservations(
    FetchObservations event,
    Emitter<InsightsState> emit,
  ) async {
    emit(const InsightsState.loading());

    try {
      print("Fetching observation for dashboard");
      final dio = Dio();
      const username = 'rpm-demo-client';
      const password = 'MoJpReAK7yvh4';

      final basicAuth =
          'Basic ${base64Encode(utf8.encode('$username:$password'))}';
      // final token = Hive.box('authBox').get('accessToken');

      // if (token == null) {
      //   throw Exception('No access token found');
      // }

      final deviceIDs = ["381A100610E", "100251303404", "200242101321"];
      //final user = FirebaseAuth.instance.currentUser;
      Map<String, dynamic> payload = {};
      // final authBox = Hive.box('authBox');
      // String? idToken = '';
      // if (user != null) {
      //   idToken = await user.getIdToken();
      //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
      //       .collection('users')
      //       .doc(user.uid)
      //       .get();

      //   if (snapshot.exists) {
      //     payload = (snapshot.data() as Map<String, dynamic>);
      //   }
      // } else {
      //   idToken = authBox.get('accessToken');
      // }

      //final patientId = payload["patient_id"] ?? 'patient id';
      final storage = SecureStorageService();
      String patientId =
          await storage.readString("patientId") ??
          "093266f6-6417-4e07-9219-e55bcd8a4e73";
      print("Getting Patient's Device Data");
      print(patientId);
      if (patientId == '') {
        emit(InsightsState.error("Device Not Found"));
        return;
      }
      if (patientId != "093266f6-6417-4e07-9219-e55bcd8a4e73") {
        final deviceResponse = await dio.get(
          'https://aidboxdev.gheit.co/Device?_patient=${payload["patient_id"]}',
          options: Options(
            headers: {
              'Authorization': basicAuth,
              'Content-Type': 'application/json',
            },
          ),
        );
        print("The device id is");
        deviceIDs.clear();
        if (deviceResponse.data["entry"] != null) {
          Device device = Device.fromJson(
            deviceResponse.data["entry"][0]["resource"],
          );
          print(deviceResponse.data["entry"][0]["resource"]);
          print(device);
          List<Device> devices = [];

          for (int k = 0; k < deviceResponse.data["entry"].length; k++) {
            Device device = Device.fromJson(
              deviceResponse.data["entry"][k]["resource"],
            );
            devices.add(device);
            deviceIDs.add(device.id ?? '');
          }
        }
        print(deviceIDs);
      }
      final List<Observation> fetchedObservations = [];

      // final storage = SecureStorageService();
      // final idToken = await storage.readString("access_token");
      DioClient dioclient = DioClient();

      for (String deviceID in deviceIDs) {
        int page = 1;
        bool hasMoreData = true;

        while (hasMoreData && page <= 5) {
          final response = await dioclient.dio.get(
            '/get_obs_for_graph/$deviceID?page=$page&count=50',
          );

          if (response.data['entry'] != null &&
              response.data['entry'].isNotEmpty) {
            for (var entry in response.data['entry']) {
              fetchedObservations.add(Observation.fromJson(entry['resource']));
            }

            final links = response.data['link'] as List?;
            hasMoreData =
                links?.any((link) => link['relation'] == 'next') ?? false;
            page++;
          } else {
            hasMoreData = false;
          }
        }
      }

      final result = _convertObservationsToHealthRecords(fetchedObservations);

      emit(
        InsightsState.loaded(
          observations: fetchedObservations,
          healthRecords: result['records'] as List<HealthRecord>,
          averagedDates: result['averagedDates'] as Set<String>,
        ),
      );
    } catch (e) {
      emit(InsightsState.error(e.toString()));
    }
  }

  void _onChangePeriod(ChangePeriod event, Emitter<InsightsState> emit) {
    state.maybeWhen(
      loaded:
          (
            observations,
            healthRecords,
            averagedDates,
            selectedTab,
            selectedPeriodBloodPressure,
            selectedPeriodPulse,
            selectedPeriodOxygen,
            selectedPeriodBloodSugar,
            selectedPeriodBodyWeight,
            customDateRangeBloodPressure,
            customDateRangePulse,
            customDateRangeOxygen,
            customDateRangeBloodSugar,
            customDateRangeBodyWeight,
          ) {
            switch (event.chartType) {
              case 'bloodPressure':
                emit(
                  InsightsState.loaded(
                    observations: observations,
                    healthRecords: healthRecords,
                    averagedDates: averagedDates,
                    selectedTab: selectedTab,
                    selectedPeriodBloodPressure: event.period,
                    selectedPeriodPulse: selectedPeriodPulse,
                    selectedPeriodOxygen: selectedPeriodOxygen,
                    selectedPeriodBloodSugar: selectedPeriodBloodSugar,
                    selectedPeriodBodyWeight: selectedPeriodBodyWeight,
                    customDateRangeBloodPressure: customDateRangeBloodPressure,
                    customDateRangePulse: customDateRangePulse,
                    customDateRangeOxygen: customDateRangeOxygen,
                    customDateRangeBloodSugar: customDateRangeBloodSugar,
                    customDateRangeBodyWeight: customDateRangeBodyWeight,
                  ),
                );
                break;
              case 'pulse':
                emit(
                  InsightsState.loaded(
                    observations: observations,
                    healthRecords: healthRecords,
                    averagedDates: averagedDates,
                    selectedTab: selectedTab,
                    selectedPeriodBloodPressure: selectedPeriodBloodPressure,
                    selectedPeriodPulse: event.period,
                    selectedPeriodOxygen: selectedPeriodOxygen,
                    selectedPeriodBloodSugar: selectedPeriodBloodSugar,
                    selectedPeriodBodyWeight: selectedPeriodBodyWeight,
                    customDateRangeBloodPressure: customDateRangeBloodPressure,
                    customDateRangePulse: customDateRangePulse,
                    customDateRangeOxygen: customDateRangeOxygen,
                    customDateRangeBloodSugar: customDateRangeBloodSugar,
                    customDateRangeBodyWeight: customDateRangeBodyWeight,
                  ),
                );
                break;
              case 'oxygen':
                emit(
                  InsightsState.loaded(
                    observations: observations,
                    healthRecords: healthRecords,
                    averagedDates: averagedDates,
                    selectedTab: selectedTab,
                    selectedPeriodBloodPressure: selectedPeriodBloodPressure,
                    selectedPeriodPulse: selectedPeriodPulse,
                    selectedPeriodOxygen: event.period,
                    selectedPeriodBloodSugar: selectedPeriodBloodSugar,
                    selectedPeriodBodyWeight: selectedPeriodBodyWeight,
                    customDateRangeBloodPressure: customDateRangeBloodPressure,
                    customDateRangePulse: customDateRangePulse,
                    customDateRangeOxygen: customDateRangeOxygen,
                    customDateRangeBloodSugar: customDateRangeBloodSugar,
                    customDateRangeBodyWeight: customDateRangeBodyWeight,
                  ),
                );
                break;
              case 'bloodSugar':
                emit(
                  InsightsState.loaded(
                    observations: observations,
                    healthRecords: healthRecords,
                    averagedDates: averagedDates,
                    selectedTab: selectedTab,
                    selectedPeriodBloodPressure: selectedPeriodBloodPressure,
                    selectedPeriodPulse: selectedPeriodPulse,
                    selectedPeriodOxygen: selectedPeriodOxygen,
                    selectedPeriodBloodSugar: event.period,
                    selectedPeriodBodyWeight: selectedPeriodBodyWeight,
                    customDateRangeBloodPressure: customDateRangeBloodPressure,
                    customDateRangePulse: customDateRangePulse,
                    customDateRangeOxygen: customDateRangeOxygen,
                    customDateRangeBloodSugar: customDateRangeBloodSugar,
                    customDateRangeBodyWeight: customDateRangeBodyWeight,
                  ),
                );
                break;
              case 'bodyWeight':
                emit(
                  InsightsState.loaded(
                    observations: observations,
                    healthRecords: healthRecords,
                    averagedDates: averagedDates,
                    selectedTab: selectedTab,
                    selectedPeriodBloodPressure: selectedPeriodBloodPressure,
                    selectedPeriodPulse: selectedPeriodPulse,
                    selectedPeriodOxygen: selectedPeriodOxygen,
                    selectedPeriodBloodSugar: selectedPeriodBloodSugar,
                    selectedPeriodBodyWeight: event.period,
                    customDateRangeBloodPressure: customDateRangeBloodPressure,
                    customDateRangePulse: customDateRangePulse,
                    customDateRangeOxygen: customDateRangeOxygen,
                    customDateRangeBloodSugar: customDateRangeBloodSugar,
                    customDateRangeBodyWeight: customDateRangeBodyWeight,
                  ),
                );
                break;
            }
          },
      orElse: () {},
    );
  }

  void _onSelectCustomDateRange(
    SelectCustomDateRange event,
    Emitter<InsightsState> emit,
  ) {
    state.maybeWhen(
      loaded:
          (
            observations,
            healthRecords,
            averagedDates,
            selectedTab,
            selectedPeriodBloodPressure,
            selectedPeriodPulse,
            selectedPeriodOxygen,
            selectedPeriodBloodSugar,
            selectedPeriodBodyWeight,
            customDateRangeBloodPressure,
            customDateRangePulse,
            customDateRangeOxygen,
            customDateRangeBloodSugar,
            customDateRangeBodyWeight,
          ) {
            switch (event.chartType) {
              case 'bloodPressure':
                emit(
                  InsightsState.loaded(
                    observations: observations,
                    healthRecords: healthRecords,
                    averagedDates: averagedDates,
                    selectedTab: selectedTab,
                    selectedPeriodBloodPressure: 'Custom',
                    selectedPeriodPulse: selectedPeriodPulse,
                    selectedPeriodOxygen: selectedPeriodOxygen,
                    selectedPeriodBloodSugar: selectedPeriodBloodSugar,
                    selectedPeriodBodyWeight: selectedPeriodBodyWeight,
                    customDateRangeBloodPressure: event.dateRange,
                    customDateRangePulse: customDateRangePulse,
                    customDateRangeOxygen: customDateRangeOxygen,
                    customDateRangeBloodSugar: customDateRangeBloodSugar,
                    customDateRangeBodyWeight: customDateRangeBodyWeight,
                  ),
                );
                break;
              case 'pulse':
                emit(
                  InsightsState.loaded(
                    observations: observations,
                    healthRecords: healthRecords,
                    averagedDates: averagedDates,
                    selectedTab: selectedTab,
                    selectedPeriodBloodPressure: selectedPeriodBloodPressure,
                    selectedPeriodPulse: 'Custom',
                    selectedPeriodOxygen: selectedPeriodOxygen,
                    selectedPeriodBloodSugar: selectedPeriodBloodSugar,
                    selectedPeriodBodyWeight: selectedPeriodBodyWeight,
                    customDateRangeBloodPressure: customDateRangeBloodPressure,
                    customDateRangePulse: event.dateRange,
                    customDateRangeOxygen: customDateRangeOxygen,
                    customDateRangeBloodSugar: customDateRangeBloodSugar,
                    customDateRangeBodyWeight: customDateRangeBodyWeight,
                  ),
                );
                break;
              case 'oxygen':
                emit(
                  InsightsState.loaded(
                    observations: observations,
                    healthRecords: healthRecords,
                    averagedDates: averagedDates,
                    selectedTab: selectedTab,
                    selectedPeriodBloodPressure: selectedPeriodBloodPressure,
                    selectedPeriodPulse: selectedPeriodPulse,
                    selectedPeriodOxygen: 'Custom',
                    selectedPeriodBloodSugar: selectedPeriodBloodSugar,
                    selectedPeriodBodyWeight: selectedPeriodBodyWeight,
                    customDateRangeBloodPressure: customDateRangeBloodPressure,
                    customDateRangePulse: customDateRangePulse,
                    customDateRangeOxygen: event.dateRange,
                    customDateRangeBloodSugar: customDateRangeBloodSugar,
                    customDateRangeBodyWeight: customDateRangeBodyWeight,
                  ),
                );
                break;
              case 'bloodSugar':
                emit(
                  InsightsState.loaded(
                    observations: observations,
                    healthRecords: healthRecords,
                    averagedDates: averagedDates,
                    selectedTab: selectedTab,
                    selectedPeriodBloodPressure: selectedPeriodBloodPressure,
                    selectedPeriodPulse: selectedPeriodPulse,
                    selectedPeriodOxygen: selectedPeriodOxygen,
                    selectedPeriodBloodSugar: 'Custom',
                    selectedPeriodBodyWeight: selectedPeriodBodyWeight,
                    customDateRangeBloodPressure: customDateRangeBloodPressure,
                    customDateRangePulse: customDateRangePulse,
                    customDateRangeOxygen: customDateRangeOxygen,
                    customDateRangeBloodSugar: event.dateRange,
                    customDateRangeBodyWeight: customDateRangeBodyWeight,
                  ),
                );
                break;
              case 'bodyWeight':
                emit(
                  InsightsState.loaded(
                    observations: observations,
                    healthRecords: healthRecords,
                    averagedDates: averagedDates,
                    selectedTab: selectedTab,
                    selectedPeriodBloodPressure: selectedPeriodBloodPressure,
                    selectedPeriodPulse: selectedPeriodPulse,
                    selectedPeriodOxygen: selectedPeriodOxygen,
                    selectedPeriodBloodSugar: selectedPeriodBloodSugar,
                    selectedPeriodBodyWeight: 'Custom',
                    customDateRangeBloodPressure: customDateRangeBloodPressure,
                    customDateRangePulse: customDateRangePulse,
                    customDateRangeOxygen: customDateRangeOxygen,
                    customDateRangeBloodSugar: customDateRangeBloodSugar,
                    customDateRangeBodyWeight: event.dateRange,
                  ),
                );
                break;
            }
          },
      orElse: () {},
    );
  }

  void _onChangeTab(ChangeTab event, Emitter<InsightsState> emit) {
    state.maybeWhen(
      loaded:
          (
            observations,
            healthRecords,
            averagedDates,
            selectedTab,
            selectedPeriodBloodPressure,
            selectedPeriodPulse,
            selectedPeriodOxygen,
            selectedPeriodBloodSugar,
            selectedPeriodBodyWeight,
            customDateRangeBloodPressure,
            customDateRangePulse,
            customDateRangeOxygen,
            customDateRangeBloodSugar,
            customDateRangeBodyWeight,
          ) {
            emit(
              InsightsState.loaded(
                observations: observations,
                healthRecords: healthRecords,
                averagedDates: averagedDates,
                selectedTab: event.tabIndex,
                selectedPeriodBloodPressure: selectedPeriodBloodPressure,
                selectedPeriodPulse: selectedPeriodPulse,
                selectedPeriodOxygen: selectedPeriodOxygen,
                selectedPeriodBloodSugar: selectedPeriodBloodSugar,
                selectedPeriodBodyWeight: selectedPeriodBodyWeight,
                customDateRangeBloodPressure: customDateRangeBloodPressure,
                customDateRangePulse: customDateRangePulse,
                customDateRangeOxygen: customDateRangeOxygen,
                customDateRangeBloodSugar: customDateRangeBloodSugar,
                customDateRangeBodyWeight: customDateRangeBodyWeight,
              ),
            );
          },
      orElse: () {},
    );
  }

  Map<String, dynamic> _convertObservationsToHealthRecords(
    List<Observation> observations,
  ) {
    final List<HealthRecord> records = [];
    final Set<String> averagedDates = {};

    final sortedObservations = List<Observation>.from(observations);
    sortedObservations.sort((a, b) {
      final aDate = a.meta?.lastUpdated ?? '';
      final bDate = b.meta?.lastUpdated ?? '';
      return bDate.compareTo(aDate);
    });

    final Map<String, Map<String, dynamic>> recordMap = {};

    for (var obs in sortedObservations) {
      try {
        final timestamp =
            obs.meta?.lastUpdated ?? DateTime.now().toIso8601String();
        final parsedTimestamp = DateTime.parse(timestamp);
        final dateKey =
            '${parsedTimestamp.year}-${parsedTimestamp.month.toString().padLeft(2, '0')}-${parsedTimestamp.day.toString().padLeft(2, '0')}';

        if (!recordMap.containsKey(dateKey)) {
          recordMap[dateKey] = {
            'timestamp': parsedTimestamp,
            'systolicReadings': <int>[],
            'diastolicReadings': <int>[],
            'pulseReadings': <int>[],
            'bloodSugarReadings': <double>[],
            'spo2Readings': <double>[],
            'weightReadings': <double>[],
          };
        }

        if (parsedTimestamp.isAfter(
          recordMap[dateKey]!['timestamp'] as DateTime,
        )) {
          recordMap[dateKey]!['timestamp'] = parsedTimestamp;
        }

        final deviceId = obs.device?.id?.split('/').last ?? '';

        if (deviceId == "100251303404") {
          if (obs.component != null && obs.component!.length >= 2) {
            final systolic =
                obs.component![0].value?.quantity?.value?.toInt() ?? 0;
            final diastolic =
                obs.component![1].value?.quantity?.value?.toInt() ?? 0;

            if (systolic >= 60 &&
                systolic <= 250 &&
                diastolic >= 40 &&
                diastolic <= 150) {
              (recordMap[dateKey]!['systolicReadings'] as List<int>).add(
                systolic,
              );
              (recordMap[dateKey]!['diastolicReadings'] as List<int>).add(
                diastolic,
              );
            }
          }
        } else if (deviceId == "381A100610E") {
          if (obs.value?.quantity?.value != null) {
            final value = obs.value!.quantity!.value!;
            if (value >= 30 && value <= 600) {
              (recordMap[dateKey]!['bloodSugarReadings'] as List<double>).add(
                value.toDouble(),
              );
            }
          }
        } else if (deviceId == "200242101321") {
          if (obs.value?.quantity?.value != null) {
            final value = obs.value!.quantity!.value!;
            if (value >= 20 && value <= 500) {
              (recordMap[dateKey]!['weightReadings'] as List<double>).add(
                value.toDouble(),
              );
            }
          }
        }
      } catch (e) {
        continue;
      }
    }

    for (var entry in recordMap.entries) {
      final data = entry.value;

      final systolicReadings = data['systolicReadings'] as List<int>;
      final diastolicReadings = data['diastolicReadings'] as List<int>;
      final bloodSugarReadings = data['bloodSugarReadings'] as List<double>;
      final weightReadings = data['weightReadings'] as List<double>;

      if (systolicReadings.length > 1 ||
          diastolicReadings.length > 1 ||
          bloodSugarReadings.length > 1 ||
          weightReadings.length > 1) {
        averagedDates.add(entry.key);
      }

      final avgSystolic = systolicReadings.isEmpty
          ? 0
          : (systolicReadings.reduce((a, b) => a + b) / systolicReadings.length)
                .round();
      final avgDiastolic = diastolicReadings.isEmpty
          ? 0
          : (diastolicReadings.reduce((a, b) => a + b) /
                    diastolicReadings.length)
                .round();
      final avgBloodSugar = bloodSugarReadings.isEmpty
          ? 0.0
          : bloodSugarReadings.reduce((a, b) => a + b) /
                bloodSugarReadings.length;
      final avgWeight = weightReadings.isEmpty
          ? 0.0
          : weightReadings.reduce((a, b) => a + b) / weightReadings.length;

      if (avgBloodSugar > 0 || avgWeight > 0 || avgSystolic > 0) {
        String hypertensionStage = 'Normal';
        if (avgSystolic >= 180 || avgDiastolic >= 120) {
          hypertensionStage = 'Crisis';
        } else if (avgSystolic >= 140 || avgDiastolic >= 90) {
          hypertensionStage = 'Stage 2';
        } else if (avgSystolic >= 130 || avgDiastolic >= 80) {
          hypertensionStage = 'Stage 1';
        } else if (avgSystolic >= 120) {
          hypertensionStage = 'Elevated';
        }

        records.add(
          HealthRecord(
            id: entry.key,
            timestamp: data['timestamp'] as DateTime,
            systolic: avgSystolic,
            diastolic: avgDiastolic,
            pulse: 0,
            weight: avgWeight,
            hypertensionStage: hypertensionStage,
            bloodSugar: avgBloodSugar,
            spo2: 0.0,
          ),
        );
      }
    }

    records.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return {'records': records, 'averagedDates': averagedDates};
  }
}
