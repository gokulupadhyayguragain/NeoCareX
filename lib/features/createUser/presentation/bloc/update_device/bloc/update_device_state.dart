part of 'update_device_bloc.dart';

sealed class UpdateDeviceState extends Equatable {
  const UpdateDeviceState();

  @override
  List<Object> get props => [];
}

final class UpdateDeviceInitial extends UpdateDeviceState {}

final class LoadingDevice extends UpdateDeviceState {}

final class DeviceLoaded extends UpdateDeviceState {
  final Device device;

  const DeviceLoaded(this.device);

  @override
  List<Object> get props => [device];
}
