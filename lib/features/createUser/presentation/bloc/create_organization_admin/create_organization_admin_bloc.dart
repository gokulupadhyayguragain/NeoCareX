import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patient_app/features/createUser/domain/user_api.dart';

part 'create_organization_admin_event.dart';
part 'create_organization_admin_state.dart';

class CreateOrganizationAdminBloc
    extends Bloc<CreateOrganizationAdminEvent, CreateOrganizationAdminState> {
  CreateOrganizationAdminBloc()
      : super(CreateOrganizationAdminInitial()) {
    on<CreateOrganizationAdmin>((event, emit) async {
      emit(OrganizationAdminCreating());

      try {
        UserApi userApi = UserApi();

        Map<String, dynamic>? auth0User = await userApi.createUserInAuth0(
          email: event.email,
          password: event.password,
          givenName: event.givenName,
          familyName: event.familyName,
          patientId: event.organizationId,
          role: event.role,
        );

        if (auth0User == null) {
          emit(OrganizationAdminCreationFailed());
          return;
        }
        if (auth0User.containsKey('error') ||
            auth0User.containsKey('statusCode')) {
          String errorMessage =
              auth0User['message'] ?? "Unknown error occurred";
          emit(OrganizationAdminCreationFailed(errorMessage: errorMessage));
          return;
        }

        emit(OrganizationAdminCreated());
      } catch (e) {
        emit(OrganizationAdminCreationFailed());
      }
    });
    on<ResetOrganizationAdminCreation>((event, emit) {
      emit(CreateOrganizationAdminInitial());
    });
  }
}
