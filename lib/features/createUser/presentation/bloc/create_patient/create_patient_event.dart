part of 'create_patient_bloc.dart';

sealed class CreatePatientEvent extends Equatable {
  const CreatePatientEvent();

  @override
  List<Object> get props => [];
}

final class CreatePatient extends CreatePatientEvent {
  final Patient patient;
  final List<Device> deviceWithRegistrationNumber;
  final String deviceId;
  final String email;
  final String password;
  final String role;

  const CreatePatient(
    this.patient,
    this.deviceWithRegistrationNumber,
    this.deviceId,
    this.email,
    this.password,
    this.role,
  );

  @override
  List<Object> get props => [
    patient,
    deviceWithRegistrationNumber,
    deviceId,
    email,
    password,
    role,
  ];
}
final class ResetPatientCreation extends CreatePatientEvent {}
