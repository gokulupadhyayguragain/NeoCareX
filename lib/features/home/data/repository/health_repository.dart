import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:patient_app/features/home/data/local_datasources/health_record_model.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';
import 'package:patient_app/features/home/data/services/rook_service_web.dart';

abstract class HealthRepository {
  Future<List<HealthRecord>> getHealthRecords();
  Future<void> addHealthRecord(HealthRecord record);
  Future<void> deleteHealthRecord(String id);
  Future<HealthRecord?> getLatestRecord();
  Future<Map<String, dynamic>?> getPhysicalHealthSummary({
    required String userId,
    required String date,
    bool forceRefresh = false,
  });
  Future<Map<String, dynamic>?> getSleepHealthSummary({
    required String userId,
    required String date,
    bool forceRefresh = false,
  });
  Future<Map<String, dynamic>?> getHeartRateEvent({
    required String userId,
    required String date,
    bool forceRefresh = false,
  });
  Future<Map<String, dynamic>?> getStepsEvent({
    required String userId,
    required String date,
    bool forceRefresh = false,
  });
  Future<Map<String, dynamic>?> getAggregatedHealthData({
    required String userId,
    required String date,
    bool forceRefresh = false,
  });
}

@LazySingleton(as: HealthRepository)
class HealthRepositoryImpl implements HealthRepository {
  static const String _boxName = 'health_records';
  bool _sampleDataAdded = false;
  final RookService _rookService;

  HealthRepositoryImpl(this._rookService);

  Future<Box<HealthRecordModel>> get _box async {
    if (!Hive.isBoxOpen(_boxName)) {
      Hive.registerAdapter(HealthRecordModelAdapter());
      return await Hive.openBox<HealthRecordModel>(_boxName);
    }
    return Hive.box<HealthRecordModel>(_boxName);
  }

  @override
  Future<List<HealthRecord>> getHealthRecords() async {
    try {
      final box = await _box;

      if (box.isEmpty && !_sampleDataAdded) {
        await _addSampleData();
        _sampleDataAdded = true;
      }

      final records = box.values.toList();
      records.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      return records.map((model) => model.toEntity()).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> _addSampleData() async {
    try {
      final sampleRecords = [
        HealthRecord(
          id: '1',
          timestamp: DateTime.now().subtract(const Duration(days: 1)),
          systolic: 120,
          diastolic: 80,
          pulse: 72,
          weight: 70.5,
          hypertensionStage: 'Normal',
          bloodSugar: 90.3,
          spo2: 98.2,
        ),
        HealthRecord(
          id: '2',
          timestamp: DateTime.now().subtract(const Duration(days: 2)),
          systolic: 125,
          diastolic: 82,
          pulse: 75,
          weight: 70.3,
          hypertensionStage: 'Normal',
          bloodSugar: 70.4,
          spo2: 96,
        ),
        HealthRecord(
          id: '3',
          timestamp: DateTime.now().subtract(const Duration(days: 3)),
          systolic: 118,
          diastolic: 78,
          pulse: 68,
          weight: 70.1,
          hypertensionStage: 'Normal',
          bloodSugar: 80.4,
          spo2: 93.6,
        ),
        HealthRecord(
          id: '4',
          timestamp: DateTime.now().subtract(const Duration(days: 4)),
          systolic: 122,
          diastolic: 79,
          pulse: 71,
          weight: 70.0,
          hypertensionStage: 'Normal',
          bloodSugar: 100.5,
          spo2: 94.5,
        ),
      ];

      for (final record in sampleRecords) {
        await addHealthRecord(record);
      }
    } catch (e) {
      debugPrint('Error adding sample data: $e');
    }
  }

  @override
  Future<void> addHealthRecord(HealthRecord record) async {
    try {
      final box = await _box;
      final model = HealthRecordModel.fromEntity(record);
      await box.put(record.id, model);
    } catch (e) {
      debugPrint('Error adding health record: $e');
    }
  }

  @override
  Future<void> deleteHealthRecord(String id) async {
    try {
      final box = await _box;
      await box.delete(id);
    } catch (e) {
      debugPrint('Error deleting health record: $e');
    }
  }

  @override
  Future<HealthRecord?> getLatestRecord() async {
    try {
      final records = await getHealthRecords();
      return records.isNotEmpty ? records.first : null;
    } catch (e) {
      debugPrint('Error getting latest record: $e');
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getPhysicalHealthSummary({
    required String userId,
    required String date,
    bool forceRefresh = false,
  }) async {
    try {
      if (!_rookService.isInitialized) {
        await _rookService.init(userId: userId);
      }
      return await _rookService.getPhysicalHealthSummary(
        userId: userId,
        date: date,
        forceRefresh: forceRefresh,
      );
    } catch (e) {
      debugPrint('Error getting physical health summary: $e');
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getSleepHealthSummary({
    required String userId,
    required String date,
    bool forceRefresh = false,
  }) async {
    try {
      if (!_rookService.isInitialized) {
        await _rookService.init(userId: userId);
      }
      return await _rookService.getSleepHealthSummary(
        userId: userId,
        date: date,
        forceRefresh: forceRefresh,
      );
    } catch (e) {
      debugPrint('Error getting sleep health summary: $e');
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getHeartRateEvent({
    required String userId,
    required String date,
    bool forceRefresh = false,
  }) async {
    try {
      if (!_rookService.isInitialized) {
        await _rookService.init(userId: userId);
      }
      return await _rookService.getHeartRateEvent(
        userId: userId,
        date: date,
      );
    } catch (e) {
      debugPrint('Error getting heart rate event: $e');
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getStepsEvent({
    required String userId,
    required String date,
    bool forceRefresh = false,
  }) async {
    try {
      if (!_rookService.isInitialized) {
        await _rookService.init(userId: userId);
      }
      return await _rookService.getStepsEvent(
        userId: userId,
        date: date,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getAggregatedHealthData({
    required String userId,
    required String date,
    bool forceRefresh = false,
  }) async {
    try {
      if (!_rookService.isInitialized) {
        await _rookService.init(userId: userId);
      }
      return await _rookService.getAggregatedHealthData(
        userId,
        date,
        forceRefresh: forceRefresh,
      );
    } catch (e) {
      return null;
    }
  }
}