import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhir/r4.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:patient_app/features/createUser/presentation/widgets/device_table.dart';
import 'package:patient_app/features/createUser/presentation/widgets/dropdown_field_widget.dart';
import 'package:patient_app/features/createUser/presentation/widgets/form_field_widget.dart';

import '../bloc/create_patient/create_patient_bloc.dart';
import 'device_dropdown_field_widget.dart';

class PatientForm extends StatefulWidget {
  const PatientForm({super.key});

  @override
  State<PatientForm> createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  void showToast(String message, Color color) {
    final fToast = FToast();
    fToast.removeCustomToast();
    fToast.init(context);
    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: color,
        ),
        child: Text(message, style: const TextStyle(color: Colors.white)),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController prefixController = TextEditingController();
  final TextEditingController givenController = TextEditingController();
  final TextEditingController familyController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController lineController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController deviceController = TextEditingController();
  String? gender;
  String? birthSex;
  String? genderIdentity;
  List<Device> selectedDevice = [];

  void _clearForm() {
    prefixController.clear();
    givenController.clear();
    familyController.clear();
    birthDateController.clear();
    genderController.clear();
    emailController.clear();
    cityController.clear();
    lineController.clear();
    stateController.clear();
    postalCodeController.clear();
    countryController.clear();
    passwordController.clear();
    deviceController.clear();

    setState(() {
      selectedDevice.clear();
    });

    _formKey.currentState?.reset();
  }

  @override
  void dispose() {
    prefixController.dispose();
    givenController.dispose();
    familyController.dispose();
    birthDateController.dispose();
    genderController.dispose();
    emailController.dispose();
    cityController.dispose();
    lineController.dispose();
    stateController.dispose();
    postalCodeController.dispose();
    countryController.dispose();
    passwordController.dispose();
    deviceController.dispose();

    super.dispose();
  }

  void addDeviceToDeviceTable(Device device, String registrationNumber) {
    setState(() {
      device = device.copyWith(
        fhirId: null,
        meta: null,
        patient: null,
        udiCarrier: [DeviceUdiCarrier(deviceIdentifier: registrationNumber)],
      );
      selectedDevice.add(device);
    });
  }

  void removeDeviceToDeviceTable(Device device) {
    setState(() {
      selectedDevice.remove(device);
    });
  }

  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+(?:\.[a-zA-Z]+)?$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    return null;
  }

  String? validatePostalCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Postal code is required';
    }

    final trimmedValue = value.trim();

    final numbersOnlyRegex = RegExp(r'^\d+$');
    if (!numbersOnlyRegex.hasMatch(trimmedValue)) {
      return 'Postal code must contain only numbers';
    }

    if (trimmedValue.length < 4 || trimmedValue.length > 10) {
      return 'Postal code must be between 4 and 10 digits';
    }

    return null;
  }

  String? validateName(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    final nameRegex = RegExp(r"^[a-zA-Z\s\-']+$");
    if (!nameRegex.hasMatch(value)) {
      return '$fieldName can only contain letters, spaces, hyphens and apostrophes';
    }

    if (value.length < 2) {
      return '$fieldName must be at least 2 characters';
    }

    return null;
  }

  String? validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Birth date is required';
    }

    final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegex.hasMatch(value)) {
      return 'Please use YYYY-MM-DD format';
    }

    try {
      final parts = value.split('-');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);

      // Basic validation
      if (year < 1900 || year > DateTime.now().year) {
        return 'Please enter a valid year';
      }
      if (month < 1 || month > 12) {
        return 'Please enter a valid month';
      }
      if (day < 1 || day > 31) {
        return 'Please enter a valid day';
      }

      final date = DateTime(year, month, day);
      if (date.year != year || date.month != month || date.day != day) {
        return 'Please enter a valid date';
      }

      if (date.isAfter(DateTime.now())) {
        return 'Birth date cannot be in the future';
      }
    } catch (e) {
      return 'Please enter a valid date';
    }

    return null;
  }

  String? validateCityState(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    final locationRegex = RegExp(r"^[a-zA-Z\s\-]+$");
    if (!locationRegex.hasMatch(value)) {
      return '$fieldName can only contain letters, spaces and hyphens';
    }

    return null;
  }

  String? validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Country is required';
    }

    final countryRegex = RegExp(r"^[a-zA-Z\s]+$");
    if (!countryRegex.hasMatch(value)) {
      return 'Country can only contain letters and spaces';
    }

    return null;
  }

  String? validateStreetAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Street address is required';
    }

    if (value.length < 5) {
      return 'Please enter a complete street address';
    }

    return null;
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  List<Device> alldevices = [
    Device(
      deviceName: [DeviceDeviceName(name: "Blood glucose monitor")],
      type: CodeableConcept(coding: [Coding(code: FhirCode("381A100610E"))]),
    ),
    Device(
      deviceName: [DeviceDeviceName(name: "Blood pressure monitor")],
      type: CodeableConcept(coding: [Coding(code: FhirCode("100251303404"))]),
    ),
    Device(
      deviceName: [DeviceDeviceName(name: "Weight scale")],
      type: CodeableConcept(coding: [Coding(code: FhirCode("200242101321"))]),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePatientBloc(),
      child: BlocListener<CreatePatientBloc, CreatePatientState>(
        listener: (context, state) {
          if (state is PatientCreated) {
            showToast("Patient was created", Colors.green);

            WidgetsBinding.instance.addPostFrameCallback((_) {
              _clearForm();
              context.read<CreatePatientBloc>().add(ResetPatientCreation());
            });
          } else if (state is PatientCreationFailed) {
            String message = state.errorMessage ?? "Error Occurred";
            showToast(message, Colors.red);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<CreatePatientBloc, CreatePatientState>(
            builder: (context, createPatientState) {
              if (createPatientState is PatientCreated) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isDesktop = constraints.maxWidth > 900;
                      if (!isDesktop) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "Prefix",
                                  controller: prefixController,
                                  compulsory: true,
                                  isDate: false,
                                  customValidator: (value) =>
                                      validateName(value, "Prefix"),
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "Given Name",
                                  controller: givenController,
                                  compulsory: true,
                                  isDate: false,
                                  customValidator: (value) =>
                                      validateName(value, "Given name"),
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "Family Name",
                                  controller: familyController,
                                  compulsory: true,
                                  isDate: false,
                                  customValidator: (value) =>
                                      validateName(value, "Family name"),
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "Birth Date (YYYY-MM-DD)",
                                  controller: birthDateController,
                                  compulsory: true,
                                  isDate: true,
                                  customValidator: validateBirthDate,
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownFieldWidget(
                                  name: "Gender",
                                  controller: genderController,
                                  options: [
                                    "Male",
                                    "Female",
                                    "Other",
                                    "Unknown",
                                  ],
                                  compulsory: true,
                                  device: false,
                                  formkey: _formKey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "Street Line",
                                  controller: lineController,
                                  compulsory: true,
                                  isDate: false,
                                  customValidator: validateStreetAddress,
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "City",
                                  controller: cityController,
                                  compulsory: true,
                                  isDate: false,
                                  customValidator: (value) =>
                                      validateCityState(value, "City"),
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "State",
                                  controller: stateController,
                                  compulsory: true,
                                  isDate: false,
                                  customValidator: (value) =>
                                      validateCityState(value, "State"),
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "Postal Code",
                                  controller: postalCodeController,
                                  compulsory: true,
                                  isDate: false,
                                  customValidator: validatePostalCode,
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "Country",
                                  controller: countryController,
                                  compulsory: true,
                                  isDate: false,
                                  customValidator: validateCountry,
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "Email",
                                  controller: emailController,
                                  compulsory: true,
                                  isDate: false,
                                  customValidator: validateEmail,
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FormFieldWidget(
                                  name: "Password",
                                  controller: passwordController,
                                  compulsory: true,
                                  isDate: false,
                                  obscureText: true,
                                  customValidator: validatePassword,
                                  expand: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                DeviceDropdownFieldWidget(
                                  formkey: _formKey,
                                  name: "Device",
                                  controller: deviceController,
                                  compulsory: true,
                                  device: true,
                                  selectedDevice: selectedDevice,
                                  options: alldevices,
                                  addDeviceToDeviceTable:
                                      addDeviceToDeviceTable,
                                  removeDeviceToDeviceTable:
                                      removeDeviceToDeviceTable,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: buildDeviceTable(
                                selectedDevice,
                                context,
                                removeDeviceToDeviceTable,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(
                                      context,
                                    ).primaryColor,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      Patient patient = Patient(
                                        name: [
                                          HumanName(
                                            prefix: [prefixController.text],
                                            given: [givenController.text],
                                            family: familyController.text,
                                          ),
                                        ],
                                        birthDate: FhirDate(
                                          birthDateController.text,
                                        ),
                                        gender: FhirCode(genderController.text),
                                        address: [
                                          Address(
                                            line: [lineController.text],
                                            city: cityController.text,
                                            state: stateController.text,
                                            postalCode:
                                                postalCodeController.text,
                                            country: countryController.text,
                                          ),
                                        ],
                                        telecom: [
                                          ContactPoint(
                                            system: ContactPointSystem.email,
                                            value: emailController.text,
                                          ),
                                        ],
                                      );
                                      context.read<CreatePatientBloc>().add(
                                        CreatePatient(
                                          patient,
                                          selectedDevice,
                                          '',
                                          emailController.text,
                                          passwordController.text,
                                          "Patient",
                                        ),
                                      );
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      if (createPatientState is PatientCreating)
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child:
                                              CircularProgressIndicator.adaptive(
                                                backgroundColor: Colors.white,
                                              ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _sectionTitle("Patient Information"),
                            Row(
                              children: [
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "Prefix",
                                    controller: prefixController,
                                    compulsory: true,
                                    isDate: false,
                                    customValidator: (value) =>
                                        validateName(value, "Prefix"),
                                    expand: false,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "Given Name",
                                    controller: givenController,
                                    compulsory: true,
                                    isDate: false,
                                    customValidator: (value) =>
                                        validateName(value, "Given name"),
                                    expand: false,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "Family Name",
                                    controller: familyController,
                                    compulsory: true,
                                    isDate: false,
                                    customValidator: (value) =>
                                        validateName(value, "Family name"),
                                    expand: false,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "Birth Date (YYYY-MM-DD)",
                                    controller: birthDateController,
                                    compulsory: true,
                                    isDate: true,
                                    customValidator: validateBirthDate,
                                    expand: false,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: DropdownFieldWidget(
                                    name: "Gender",
                                    controller: genderController,
                                    options: [
                                      "Male",
                                      "Female",
                                      "Other",
                                      "Unknown",
                                    ],
                                    compulsory: true,
                                    device: false,
                                    formkey: _formKey,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "Street Line",
                                    controller: lineController,
                                    compulsory: true,
                                    isDate: false,
                                    customValidator: validateStreetAddress,
                                    expand: false,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "City",
                                    controller: cityController,
                                    compulsory: true,
                                    isDate: false,
                                    customValidator: (value) =>
                                        validateCityState(value, "City"),
                                    expand: false,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "State",
                                    controller: stateController,
                                    compulsory: true,
                                    isDate: false,
                                    customValidator: (value) =>
                                        validateCityState(value, "State"),
                                    expand: false,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "Postal Code",
                                    controller: postalCodeController,
                                    compulsory: true,
                                    isDate: false,
                                    customValidator: validatePostalCode,
                                    expand: false,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "Country",
                                    controller: countryController,
                                    compulsory: true,
                                    isDate: false,
                                    customValidator: validateCountry,
                                    expand: false,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "Email",
                                    controller: emailController,
                                    compulsory: true,
                                    isDate: false,
                                    customValidator: validateEmail,
                                    expand: false,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: FormFieldWidget(
                                    name: "Password",
                                    controller: passwordController,
                                    compulsory: true,
                                    isDate: false,
                                    obscureText: true,
                                    customValidator: validatePassword,
                                    expand: false,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: DeviceDropdownFieldWidget(
                                    formkey: _formKey,
                                    name: "Device",
                                    controller: TextEditingController(),
                                    compulsory: true,
                                    device: true,
                                    selectedDevice: selectedDevice,
                                    options: alldevices,
                                    addDeviceToDeviceTable:
                                        addDeviceToDeviceTable,
                                    removeDeviceToDeviceTable:
                                        removeDeviceToDeviceTable,
                                  ),
                                ),
                                const Spacer(flex: 2),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: buildDeviceTable(
                                selectedDevice,
                                context,
                                removeDeviceToDeviceTable,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(
                                      context,
                                    ).primaryColor,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      Patient patient = Patient(
                                        name: [
                                          HumanName(
                                            prefix: [prefixController.text],
                                            given: [givenController.text],
                                            family: familyController.text,
                                          ),
                                        ],
                                        birthDate: FhirDate(
                                          birthDateController.text,
                                        ),
                                        gender: FhirCode(genderController.text),
                                        address: [
                                          Address(
                                            line: [lineController.text],
                                            city: cityController.text,
                                            state: stateController.text,
                                            postalCode:
                                                postalCodeController.text,
                                            country: countryController.text,
                                          ),
                                        ],
                                        telecom: [
                                          ContactPoint(
                                            system: ContactPointSystem.email,
                                            value: emailController.text,
                                          ),
                                        ],
                                      );

                                      context.read<CreatePatientBloc>().add(
                                        CreatePatient(
                                          patient,
                                          selectedDevice,
                                          '',
                                          emailController.text,
                                          passwordController.text,
                                          "Patient",
                                        ),
                                      );
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      if (createPatientState is PatientCreating)
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child:
                                              CircularProgressIndicator.adaptive(
                                                backgroundColor: Colors.white,
                                              ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Future<void> createUserInFirebase({
  required String email,
  required String password,
  required String role,
  required String patientId,
}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    String uid = userCredential.user!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      "email": email,
      "role": role,
      "patient_id": patientId,
      "createdAt": FieldValue.serverTimestamp(),
    });
  } catch (e) {
    debugPrint('$e');
  }
}
