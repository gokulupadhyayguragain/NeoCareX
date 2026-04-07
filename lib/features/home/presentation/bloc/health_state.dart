import 'package:equatable/equatable.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';

abstract class HealthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HealthInitial extends HealthState {}

class HealthLoading extends HealthState {}

class HealthLoaded extends HealthState {
  final List<HealthRecord> records;
  final HealthRecord? latestRecord;
  
  HealthLoaded({required this.records, this.latestRecord});
  
  @override
  List<Object?> get props => [records, latestRecord];
}

class HealthError extends HealthState {
  final String message;
  
  HealthError(this.message);
  
  @override
  List<Object?> get props => [message];
}

class WearableDataLoading extends HealthState {}

class WearableDataLoaded extends HealthState {
  final int? steps;
  final double? heartRate;
  final Duration? sleepDuration;
  final Map<String, dynamic>? physicalData;
  final Map<String, dynamic>? sleepData;
  
  WearableDataLoaded({
    this.steps,
    this.heartRate,
    this.sleepDuration,
    this.physicalData,
    this.sleepData,
  });
  
  @override
  List<Object?> get props => [steps, heartRate, sleepDuration, physicalData, sleepData];
}

class WearableDataError extends HealthState {
  final String message;
  
  WearableDataError(this.message);
  
  @override
  List<Object?> get props => [message];
}
