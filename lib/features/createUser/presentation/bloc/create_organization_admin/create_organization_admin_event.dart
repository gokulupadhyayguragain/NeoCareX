part of 'create_organization_admin_bloc.dart';

sealed class CreateOrganizationAdminEvent extends Equatable {
  const CreateOrganizationAdminEvent();

  @override
  List<Object> get props => [];
}

final class CreateOrganizationAdmin extends CreateOrganizationAdminEvent {
  final String givenName;
  final String familyName;
  final String email;
  final String password;
  final String organizationId;
  final String role;

  const CreateOrganizationAdmin({
    required this.givenName,
    required this.familyName,
    required this.email,
    required this.password,
    required this.organizationId,
    required this.role,
  });

  @override
  List<Object> get props => [
    givenName,
    familyName,
    email,
    password,
    organizationId,
    role,
  ];
}

final class ResetOrganizationAdminCreation extends CreateOrganizationAdminEvent {}
