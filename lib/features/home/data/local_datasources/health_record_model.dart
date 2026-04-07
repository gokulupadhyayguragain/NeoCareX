import 'package:hive/hive.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';

part 'health_record_model.g.dart';

@HiveType(typeId: 0)
class HealthRecordModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime timestamp;

  @HiveField(2)
  final int systolic;

  @HiveField(3)
  final int diastolic;

  @HiveField(4)
  final int pulse;

  @HiveField(5)
  final double weight;

  @HiveField(6)
  final String hypertensionStage;

  @HiveField(7)
  final double bloodSugar;

  @HiveField(8)
  final double spo2;

  HealthRecordModel({
    required this.id,
    required this.timestamp,
    required this.systolic,
    required this.diastolic,
    required this.pulse,
    required this.weight,
    required this.hypertensionStage,
    required this.bloodSugar,
    required this.spo2,
  });

  HealthRecord toEntity() {
    return HealthRecord(
      id: id,
      timestamp: timestamp,
      systolic: systolic,
      diastolic: diastolic,
      pulse: pulse,
      weight: weight,
      hypertensionStage: hypertensionStage,
      bloodSugar: bloodSugar,
      spo2: spo2,
    );
  }

  factory HealthRecordModel.fromEntity(HealthRecord entity) {
    return HealthRecordModel(
      id: entity.id,
      timestamp: entity.timestamp,
      systolic: entity.systolic,
      diastolic: entity.diastolic,
      pulse: entity.pulse,
      weight: entity.weight,
      hypertensionStage: entity.hypertensionStage,
      bloodSugar: entity.bloodSugar,
      spo2: entity.spo2,
    );
  }
}
