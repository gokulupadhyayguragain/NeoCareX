part of 'profile_bloc_bloc.dart';

sealed class ProfileBlocEvent extends Equatable {
  const ProfileBlocEvent();

  @override
  List<Object> get props => [];
}

final class LoadPatientProfile extends ProfileBlocEvent {
  final String patientId;
  const LoadPatientProfile(this.patientId);
  @override
  List<Object> get props => [patientId];
}

final class UpdatePatientProfile extends ProfileBlocEvent {
  final Patient patient;
  final String patientId;
  const UpdatePatientProfile(this.patient, this.patientId);
  @override
  List<Object> get props => [patient, patientId];
}
