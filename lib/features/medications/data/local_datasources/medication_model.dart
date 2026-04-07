import 'package:hive/hive.dart';
import 'package:patient_app/features/medications/data/entity/medication.dart';

part 'medication_model.g.dart';

@HiveType(typeId: 1)
class MedicationModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String dosage;

  @HiveField(3)
  final String frequency;

  @HiveField(4)
  final List<TimeOfDayModel> times;

  @HiveField(5)
  final DateTime startDate;

  @HiveField(6)
  final DateTime? endDate;

  @HiveField(7)
  final String? notes;

  @HiveField(8)
  final bool isActive;

  @HiveField(9)
  final String? prescribedBy;

  MedicationModel({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.times,
    required this.startDate,
    this.endDate,
    this.notes,
    this.isActive = true,
    this.prescribedBy,
  });

  Medication toEntity() {
    return Medication(
      id: id,
      name: name,
      dosage: dosage,
      frequency: frequency,
      times: times.map((t) => t.toEntity()).toList(),
      startDate: startDate,
      endDate: endDate,
      notes: notes,
      isActive: isActive,
      prescribedBy: prescribedBy,
    );
  }

  factory MedicationModel.fromEntity(Medication entity) {
    return MedicationModel(
      id: entity.id,
      name: entity.name,
      dosage: entity.dosage,
      frequency: entity.frequency,
      times: entity.times.map((t) => TimeOfDayModel.fromEntity(t)).toList(),
      startDate: entity.startDate,
      endDate: entity.endDate,
      notes: entity.notes,
      isActive: entity.isActive,
      prescribedBy: entity.prescribedBy,
    );
  }
}

@HiveType(typeId: 2)
class TimeOfDayModel extends HiveObject {
  @HiveField(0)
  final int hour;

  @HiveField(1)
  final int minute;

  TimeOfDayModel({required this.hour, required this.minute});

  TimeOfDay toEntity() {
    return TimeOfDay(hour: hour, minute: minute);
  }

  factory TimeOfDayModel.fromEntity(TimeOfDay entity) {
    return TimeOfDayModel(hour: entity.hour, minute: entity.minute);
  }
}
