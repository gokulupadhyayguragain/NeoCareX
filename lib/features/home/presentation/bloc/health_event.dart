import 'package:equatable/equatable.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';

abstract class HealthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadHealthRecords extends HealthEvent {}

class AddHealthRecord extends HealthEvent {
  final HealthRecord record;
  
  AddHealthRecord(this.record);
  
  @override
  List<Object?> get props => [record];
}

class LoadWearableData extends HealthEvent {
  final String userId;
  final String date;
  
  LoadWearableData({required this.userId, required this.date});
  
  @override
  List<Object?> get props => [userId, date];
}

/// Event to sync Apple Health data (iOS only)
class SyncAppleHealthEvent extends HealthEvent {
  final String userId;
  final int daysToSync;
  
  SyncAppleHealthEvent({
    required this.userId,
    this.daysToSync = 7,
  });
  
  @override
  List<Object?> get props => [userId, daysToSync];
}

/// Event to sync Health Connect data (Android only)
class SyncHealthConnectEvent extends HealthEvent {
  final String userId;
  final DateTime? startDate;
  final DateTime? endDate;
  
  SyncHealthConnectEvent({
    required this.userId,
    this.startDate,
    this.endDate,
  });
  
  @override
  List<Object?> get props => [userId, startDate, endDate];
}

/// Event to request native SDK permissions
class RequestNativePermissionsEvent extends HealthEvent {
  final String sdkType; // 'apple_health' or 'health_connect'
  
  RequestNativePermissionsEvent({required this.sdkType});
  
  @override
  List<Object?> get props => [sdkType];
}

/// Event to check native SDK initialization status
class CheckNativeSDKStatusEvent extends HealthEvent {
  final String sdkType; // 'apple_health' or 'health_connect'
  
  CheckNativeSDKStatusEvent({required this.sdkType});
  
  @override
  List<Object?> get props => [sdkType];
}
