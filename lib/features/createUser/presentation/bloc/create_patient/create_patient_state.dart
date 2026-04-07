part of 'create_patient_bloc.dart';

sealed class CreatePatientState extends Equatable {
  const CreatePatientState();

  @override
  List<Object> get props => [];
}

final class CreatePatientInitial extends CreatePatientState {}

final class PatientCreating extends CreatePatientState {}

final class PatientCreated extends CreatePatientState {}

final class PatientCreationFailed extends CreatePatientState {
  final String? errorMessage;
  const PatientCreationFailed({this.errorMessage});
  @override
  List<Object> get props => [errorMessage ?? ''];
}
