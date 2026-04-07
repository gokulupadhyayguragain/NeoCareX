import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fhir/r4.dart';
import 'package:patient_app/features/createUser/domain/user_api.dart';

part 'create_patient_event.dart';
part 'create_patient_state.dart';

class CreatePatientBloc extends Bloc<CreatePatientEvent, CreatePatientState> {
  CreatePatientBloc() : super(CreatePatientInitial()) {
    on<CreatePatient>((event, emit) async {
      emit(PatientCreating());

      try {
        UserApi userApi = UserApi();

        String? patientId = await userApi.createPatientInAdibox(event.patient);

        if (patientId == null) {
          emit(PatientCreationFailed());
          return;
        }

        Map<String, dynamic>? auth0User = await userApi.createUserInAuth0(
          email: event.email,
          password: event.password,
          givenName: event.patient.name?[0].given?[0] ?? 'User',
          familyName: event.patient.name?[0].family ?? 'User',
          patientId: patientId,
          role: event.role,
        );

        if (auth0User == null) {
          emit(PatientCreationFailed());
          return;
        }
        if (auth0User.containsKey('error') ||
            auth0User.containsKey('statusCode')) {
          String errorMessage =
              auth0User['message'] ?? "Unknown error occurred";
          emit(PatientCreationFailed(errorMessage: errorMessage));
          return;
        }

        String userId = auth0User['user_id'] ?? '';

        Patient patientWithAuth0ID = event.patient.copyWith(
          identifier: [
            Identifier(
              use: IdentifierUse.official,
              value: userId,
              system: FhirUri("https://auth0.com/"),
            ),
          ],
        );

        for (int i = 0; i < event.deviceWithRegistrationNumber.length; i++) {
          Map<String, dynamic> newdevice = event.deviceWithRegistrationNumber[i]
              .toJson();

          newdevice['patient'] = {'id': patientId, 'resourceType': 'Patient'};

          await userApi.addPatientIdReferenceInDevice(
            patientId,
            newdevice,
            event.deviceId,
          );
        }

        emit(PatientCreated());
      } catch (e) {
        emit(PatientCreationFailed());
      }
    });
    on<ResetPatientCreation>((event, emit) {
      emit(CreatePatientInitial());
    });
  }
}
