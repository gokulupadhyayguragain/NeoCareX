import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fhir/r4.dart';
import 'package:patient_app/core/auth/dio.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
// import 'package:firebase_auth/firebase_auth.dart';

part 'profile_bloc_event.dart';
part 'profile_bloc_state.dart';

class ProfileBlocBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileBlocBloc() : super(ProfileBlocInitial()) {
    on<ProfileBlocEvent>((event, emit) {});

    on<LoadPatientProfile>((event, emit) async {
      emit(ProfileLoading());
      // User? user = FirebaseAuth.instance.currentUser;

      // if (user == null) return; // Not logged in

      // DocumentSnapshot snapshot = await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(user.uid)
      //     .get();
      //Map<String, dynamic> payload = {};
      // if (snapshot.exists) {
      //   payload = (snapshot.data() as Map<String, dynamic>);
      // }
      // final dio = Dio();

      // // Basic Auth credentials
      // const username = 'rpm-demo-client';
      // const password = 'MoJpReAK7yvh4';

      // // Encode username:password to Base64
      // final basicAuth =
      //     'Basic ${base64Encode(utf8.encode('$username:$password'))}';

      // final storage = SecureStorageService();
      // final idToken = await storage.readString("access_token");
      DioClient dioclient = DioClient();
      final storage = SecureStorageService();
      final patientId =
          await storage.readString("patientId") ??
          "093266f6-6417-4e07-9219-e55bcd8a4e73";

      try {
        final response = await dioclient.dio.get(
          '/patient/get_patient_info/$patientId',
        );
        Patient patient = Patient.fromJson(response.data);
        // print("The patient data is");
        // print(patient);
        final deviceResponse = await dioclient.dio.get(
          '/patient/get_all_devices/$patientId',
          //'https://aidboxdev.gheit.co/Device?_patient=093266f6-6417-4e07-9219-e55bcd8a4e73',
        );
        // print("the device response is");
        // print(deviceResponse);
        if (deviceResponse.data["entry"] != null) {
          // Device device = Device.fromJson(
          //   deviceResponse.data["entry"][0]["resource"],
          // );
          List<Device> devices = [];

          for (int k = 0; k < deviceResponse.data["entry"].length; k++) {
            Device device = Device.fromJson(
              deviceResponse.data["entry"][k]["resource"],
            );
            devices.add(device);
          }
          // print("The device connected are");
          // print(devices);
          emit(ProfileLoaded(patient, devices));
        } else {
          emit(ProfileLoaded(patient, []));
        }
      } catch (e) {
        print("The error is");
        print(e.toString());
        emit(ProfileLoadingFailed());
      }
    });

    on<UpdatePatientProfile>((event, emit) async {
      emit(UpdatingProfile());

      // final dio = Dio();

      // // Basic Auth credentials
      // const username = 'rpm-demo-client';
      // const password = 'MoJpReAK7yvh4';

      // // Encode username:password to Base64
      // final basicAuth =
      //     'Basic ${base64Encode(utf8.encode('$username:$password'))}';

      // final storage = SecureStorageService();
      // final idToken = await storage.readString("access_token");
      final storage = SecureStorageService();
      final patientId =
          await storage.readString("patientId") ??
          "093266f6-6417-4e07-9219-e55bcd8a4e73";
      DioClient dioclient = DioClient();
      try {
        final response = await dioclient.dio.put(
          //'https://aidboxdev.gheit.co/Patient/${event.patientId}',
          '/patient/${patientId}',
          data: event.patient.toJson(),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(ProfileUpdated());
        } else {
          emit(ProfileUpdateFailed());
        }
      } catch (e) {
        emit(ProfileUpdateFailed());
      }
    });
  }
}
