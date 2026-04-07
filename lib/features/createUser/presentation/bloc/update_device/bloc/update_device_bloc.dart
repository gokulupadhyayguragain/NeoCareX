import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fhir/r4.dart';
import 'package:patient_app/features/createUser/domain/user_api.dart';

part 'update_device_event.dart';
part 'update_device_state.dart';

class UpdateDeviceBloc extends Bloc<UpdateDeviceEvent, UpdateDeviceState> {
  UpdateDeviceBloc() : super(UpdateDeviceInitial()) {
    on<UpdateDeviceEvent>((event, emit) {
    });
    on<GetDeviceData>((event, emit) async {
      emit(LoadingDevice());
      UserApi userApi = UserApi();
      Device? device = await userApi.getDevice(event.deviceId);
      emit(DeviceLoaded(device!));
    });

    on<UpdateDeviceData>((event, emit) {
    });
  }
}
