import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:patient_app/features/createUser/presentation/bloc/create_organization_admin/create_organization_admin_bloc.dart';
import 'package:patient_app/features/createUser/presentation/widgets/form_field_widget.dart';

class OrganizationAdminForm extends StatefulWidget {
  const OrganizationAdminForm({super.key});

  @override
  State<OrganizationAdminForm> createState() => _OrganizationAdminFormState();
}

class _OrganizationAdminFormState extends State<OrganizationAdminForm> {
  final fToast = FToast();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController givenNameController = TextEditingController();
  final TextEditingController familyNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? adminPhoneNumber;

  @override
  void dispose() {
    givenNameController.dispose();
    familyNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void showToast(String message, Color color) {
    fToast.removeCustomToast();
    fToast.init(context);
    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Text(message, style: const TextStyle(color: Colors.white)),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  void _clearForm() {
    givenNameController.clear();
    familyNameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    adminPhoneNumber = null;
    _formKey.currentState?.reset();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+(?:\.[a-zA-Z]+)?$',
    );

    if (!emailRegex.hasMatch(value)) return 'Invalid email';

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password required';

    if (value.length < 6) return 'Min 6 characters';
    if (!value.contains(RegExp(r'[A-Z]'))) return 'Add uppercase';
    if (!value.contains(RegExp(r'[0-9]'))) return 'Add number';

    return null;
  }

  String? validateName(String? value, String field) {
    if (value == null || value.isEmpty) return '$field required';

    if (value.length < 2) return '$field too short';

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isSmallScreen = width < 600;

    return BlocListener<
      CreateOrganizationAdminBloc,
      CreateOrganizationAdminState
    >(
      listener: (context, state) {
        if (state is OrganizationAdminCreated) {
          showToast("Organization Admin Created successfully", Colors.green);
          _clearForm();

          context.read<CreateOrganizationAdminBloc>().add(
            ResetOrganizationAdminCreation(),
          );
        } else if (state is OrganizationAdminCreationFailed) {
          showToast(state.errorMessage ?? "Error", Colors.red);
        }
      },
      child:
          BlocBuilder<
            CreateOrganizationAdminBloc,
            CreateOrganizationAdminState
          >(
            builder: (context, state) {
              if (state is OrganizationAdminCreating) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Organization Admin Information",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        isSmallScreen
                            ? Column(
                                children: _buildFields()
                                    .map(
                                      (field) => Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 16,
                                        ),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: field,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: _buildFields()[0]),
                                      
                                      const SizedBox(width: 16),
                                      Expanded(child: _buildFields()[1]),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(child: _buildFields()[2]),
                                      const SizedBox(width: 16),
                                      Expanded(child: _buildFields()[3]),
                                    ],
                                  ),
                                ],
                              ),

                        const SizedBox(height: 30),

                        Center(
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                FocusScope.of(context).unfocus();

                                if (_formKey.currentState!.validate()) {
                                  adminPhoneNumber = phoneController.text;

                                  context
                                      .read<CreateOrganizationAdminBloc>()
                                      .add(
                                        CreateOrganizationAdmin(
                                          givenName: givenNameController.text,
                                          familyName: familyNameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          organizationId: '',
                                          role: 'organizationadmin',
                                        ),
                                      );
                                }
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }

  List<Widget> _buildFields() {
    return [
      FormFieldWidget(
        name: "Given Name",
        controller: givenNameController,
        compulsory: true,
        isDate: false,
        customValidator: (v) => validateName(v, "Given name"),
        expand: false, 
      ),
      FormFieldWidget(
        name: "Family Name",
        controller: familyNameController,
        compulsory: true,
        isDate: false,
        customValidator: (v) => validateName(v, "Family name"),
        expand: false,
      ),
      FormFieldWidget(
        name: "Email",
        controller: emailController,
        compulsory: true,
        isDate: false,
        customValidator: validateEmail,
        expand: false,
      ),
      FormFieldWidget(
        name: "Password",
        controller: passwordController,
        compulsory: true,
        isDate: false,
        obscureText: true,
        customValidator: validatePassword,
        expand: false,
      ),
    ];
  }
}
