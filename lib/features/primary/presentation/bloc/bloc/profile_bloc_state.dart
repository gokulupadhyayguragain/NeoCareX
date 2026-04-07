part of 'profile_bloc_bloc.dart';

sealed class ProfileBlocState extends Equatable {
  const ProfileBlocState();

  @override
  List<Object> get props => [];
}

final class ProfileBlocInitial extends ProfileBlocState {}

final class ProfileLoading extends ProfileBlocState {}

final class ProfileLoaded extends ProfileBlocState {
  final Patient patient;
  final List<Device> deviceList;
  const ProfileLoaded(this.patient, this.deviceList);
  @override
  List<Object> get props => [patient, deviceList];
}

final class ProfileLoadingFailed extends ProfileBlocState {}

final class UpdatingProfile extends ProfileBlocState {}

final class ProfileUpdated extends ProfileBlocState {}

final class ProfileUpdateFailed extends ProfileBlocState {}
