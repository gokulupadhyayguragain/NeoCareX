import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:patient_app/features/home/data/repository/health_repository.dart';
import 'package:patient_app/features/home/presentation/bloc/health_event.dart';
import 'package:patient_app/features/home/presentation/bloc/health_state.dart';
import 'package:patient_app/test_user.dart';

@injectable
class HealthBloc extends Bloc<HealthEvent, HealthState> {
  final HealthRepository _repository;

  HealthBloc(this._repository) : super(HealthInitial()) {
    on<LoadHealthRecords>(_onLoadHealthRecords);
    on<AddHealthRecord>(_onAddHealthRecord);
    on<LoadWearableData>(_onLoadWearableData);
  }

  Future<void> _onLoadHealthRecords(
    LoadHealthRecords event,
    Emitter<HealthState> emit,
  ) async {
    emit(HealthLoading());
    try {
      final records = await _repository.getHealthRecords();
      final latest = await _repository.getLatestRecord();
      emit(HealthLoaded(records: records, latestRecord: latest));
    } catch (e) {
      emit(HealthError(e.toString()));
    }
  }

  Future<void> _onAddHealthRecord(
    AddHealthRecord event,
    Emitter<HealthState> emit,
  ) async {
    try {
      await _repository.addHealthRecord(event.record);
      add(LoadHealthRecords());
    } catch (e) {
      emit(HealthError(e.toString()));
    }
  }

  Future<void> _onLoadWearableData(
    LoadWearableData event,
    Emitter<HealthState> emit,
  ) async {
    emit(WearableDataLoading());
    try {
      debugPrint(
        '[HealthBloc] 🔄 Loading wearable data from Rook API for ${event.date}',
      );

      final userId = event.userId.isNotEmpty ? event.userId : await TestUser.getUserId();
      debugPrint('[HealthBloc] Using user ID: $userId');

      final physicalData = await _repository.getPhysicalHealthSummary(
        userId: userId,
        date: event.date,
        forceRefresh: true,
      );

      Map<String, dynamic>? sleepData;
      try {
        sleepData = await _repository.getSleepHealthSummary(
          userId: userId,
          date: event.date,
          forceRefresh: true,
        );
      } catch (e) {
        debugPrint('[HealthBloc] ✗ Error fetching sleep data: $e');
      }

      int? steps;
      double? heartRate;
      Duration? sleepDuration;

      if (physicalData != null) {
        final data = physicalData['data'] as Map<String, dynamic>?;
        if (data != null) {
          final physicalHealth =
              data['physical_health'] as Map<String, dynamic>?;
          if (physicalHealth != null) {
            final summary = physicalHealth['summary'] as Map<String, dynamic>?;
            if (summary != null) {
              final physicalSummary =
                  summary['physical_summary'] as Map<String, dynamic>?;

              if (physicalSummary != null) {
                debugPrint(
                  '[HealthBloc] physical_summary keys: ${physicalSummary.keys}',
                );

                final activity =
                    physicalSummary['activity'] as Map<String, dynamic>?;
                if (activity != null) {
                  steps = activity['steps_count_int'] as int?;
                  debugPrint('[HealthBloc] Found steps: $steps');
                }

                final heartRateObj =
                    physicalSummary['heart_rate'] as Map<String, dynamic>?;
                if (heartRateObj != null) {
                  heartRate =
                      (heartRateObj['avg_bpm_double'] as num?)?.toDouble() ??
                      (heartRateObj['hr_avg_bpm_int'] as int?)?.toDouble();
                  debugPrint('[HealthBloc] Found heart rate: $heartRate');
                }
              }
            }
          }
        }
      }

      if (sleepData != null) {
        debugPrint('[HealthBloc] ✓ Sleep data received');

        final data = sleepData['data'] as Map<String, dynamic>?;
        if (data != null) {
          final sleepHealth = data['sleep_health'] as Map<String, dynamic>?;
          if (sleepHealth != null) {
            final summary = sleepHealth['summary'] as Map<String, dynamic>?;
            if (summary != null) {
              final sleepSummary =
                  summary['sleep_summary'] as Map<String, dynamic>?;

              if (sleepSummary != null) {
                final duration =
                    sleepSummary['sleep_duration'] as Map<String, dynamic>?;
                if (duration != null) {
                  final seconds = duration['seconds_int'] as int?;
                  if (seconds != null && seconds > 0) {
                    sleepDuration = Duration(seconds: seconds);
                    debugPrint(
                      '[HealthBloc] Found sleep: ${sleepDuration.inMinutes} minutes',
                    );
                  }
                }
              }
            }
          }
        }
      }

      emit(
        WearableDataLoaded(
          steps: steps,
          heartRate: heartRate,
          sleepDuration: sleepDuration,
          physicalData: physicalData,
          sleepData: sleepData,
        ),
      );
    } catch (e) {
      emit(WearableDataError(e.toString()));
    }
  }
}
