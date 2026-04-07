part of 'create_organization_admin_bloc.dart';

sealed class CreateOrganizationAdminState extends Equatable {
  const CreateOrganizationAdminState();

  @override
  List<Object> get props => [];
}

final class CreateOrganizationAdminInitial extends CreateOrganizationAdminState {}

final class OrganizationAdminCreating extends CreateOrganizationAdminState {}

final class OrganizationAdminCreated extends CreateOrganizationAdminState {}

final class OrganizationAdminCreationFailed extends CreateOrganizationAdminState {
  final String? errorMessage;
  const OrganizationAdminCreationFailed({this.errorMessage});
  @override
  List<Object> get props => [errorMessage ?? ''];
}
