import 'package:equatable/equatable.dart';

class Medication extends Equatable {
  final String id;
  final String name;
  final String dosage;
  final String frequency;
  final List<TimeOfDay> times;
  final DateTime startDate;
  final DateTime? endDate;
  final String? notes;
  final bool isActive;
  final String? prescribedBy;

  const Medication({
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

  @override
  List<Object?> get props => [
        id,
        name,
        dosage,
        frequency,
        times,
        startDate,
        endDate,
        notes,
        isActive,
        prescribedBy,
      ];
}

class TimeOfDay extends Equatable {
  final int hour;
  final int minute;

  const TimeOfDay({required this.hour, required this.minute});

  String get formatted {
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    final displayMinute = minute.toString().padLeft(2, '0');
    return '$displayHour:$displayMinute $period';
  }

  @override
  List<Object?> get props => [hour, minute];
}
