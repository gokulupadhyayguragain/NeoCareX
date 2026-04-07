import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/createUser/presentation/bloc/create_organization_admin/create_organization_admin_bloc.dart';

import 'widgets/organization_admin_form.dart';

class CreateOrganizationAdmin extends StatelessWidget {
  const CreateOrganizationAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateOrganizationAdminBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Create Organization Admin")),
        body: const OrganizationAdminForm(),
      ),
    );
  }
}