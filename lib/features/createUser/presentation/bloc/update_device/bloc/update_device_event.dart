part of 'update_device_bloc.dart';

sealed class UpdateDeviceEvent extends Equatable {
  const UpdateDeviceEvent();

  @override
  List<Object> get props => [];
}

final class GetDeviceData extends UpdateDeviceEvent {
  final Device device;
  final String deviceId;

  const GetDeviceData(this.device, this.deviceId);

  @override
  List<Object> get props => [device];
}

final class UpdateDeviceData extends UpdateDeviceEvent {
  final Device device;

  const UpdateDeviceData(this.device);

  @override
  List<Object> get props => [device];
}
