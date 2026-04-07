// ignore_for_file: use_build_context_synchronously

import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patient_app/core/theme/responsive_widget.dart';
import 'package:patient_app/core/widgets/toast_widget.dart' as toast_util;
import 'package:patient_app/features/primary/data/models/user_resource_model.dart';
import 'package:patient_app/features/primary/presentation/bloc/bloc/profile_bloc_bloc.dart';
import 'package:patient_app/features/primary/presentation/widgets/mobile_placeholder_textformfield_widget.dart';
import 'package:patient_app/features/primary/presentation/widgets/placeholder_textformfield_widget.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    super.key,
    required this.isDark,
    required this.isEditable,
    required this.patient,
  });

  final bool isDark;
  final Function isEditable;
  final Patient patient;

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  void showToast(String message, Color color) {
    final fToast = FToast();
    fToast.removeCustomToast();
    fToast.init(context);
    fToast.showToast(
      child: toast_util.showToast(context, message, backgroundColor: color),
    );
  }

  final _formKey = GlobalKey<FormState>();

  XFile? _selectedImage;
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController streetAddressEditingController =
      TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController countryEditingController = TextEditingController();
  TextEditingController stateEditingController = TextEditingController();
  TextEditingController zipCodeEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController officePhoneNumberController = TextEditingController();
  TextEditingController mobilePhoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController organizationEditingController = TextEditingController();
  TextEditingController roleEditingController = TextEditingController();
  bool? emailNotification;
  bool? textNotification;
  String apiMobileNumber = '';
  final profileBloc = ProfileBlocBloc();
  @override
  void initState() {
    firstNameEditingController.text =
        widget.patient.name?[0].given?[0] ?? ''.toString();
    lastNameEditingController.text = widget.patient.name?[0].family ?? '';
    streetAddressEditingController.text =
        widget.patient.address?[0].line?[0] ?? '';
    cityEditingController.text = widget.patient.address?[0].city ?? '';
    zipCodeEditingController.text = widget.patient.address?[0].postalCode ?? '';
    stateEditingController.text = widget.patient.address?[0].state ?? '';
    emailEditingController.text = widget.patient.telecom?[0].value ?? '';
    roleEditingController.text = widget.patient.resourceType.name;
    mobilePhoneNumberController.text =
        (widget.patient.telecom != null &&
            widget.patient.telecom!.length > 1 &&
            widget.patient.telecom![1].value != null)
        ? widget.patient.telecom![1].value!
        : '';
    countryEditingController.text = widget.patient.address?[0].country ?? '';
    super.initState();
  }

  String convertIntoDigitOnly(String rawPhoneNumber) {
    // Remove all non-digit characters
    final digitsOnly = rawPhoneNumber.replaceAll(RegExp(r'\D'), '');

    // Check if the number has more than 10 digits (e.g., includes country code)
    if (digitsOnly.length > 10) {
      // Extract the last 10 digits
      return digitsOnly.substring(digitsOnly.length - 10);
    } else {
      // Return the original number if it's already 10 digits long
      return digitsOnly;
    }
  }

  bool showOTPField = false;
  bool phoneNumberVerified = false;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        (ResponsiveWidget.isSmall(context) ||
        ResponsiveWidget.isXSmall(context));

    final isMediumScreen = (ResponsiveWidget.isMedium(context));

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => PrimaryPage()),
            // );
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => profileBloc,
        child: BlocListener<ProfileBlocBloc, ProfileBlocState>(
          listener: (context, state) {
            if (state is ProfileUpdated) {
              Navigator.pop(context);
              widget.isEditable();
              showToast("Profile Updated Successfully!!", Colors.green);
            } else if (state is ProfileUpdateFailed) {
              showToast("Profile Update Was Failed", Colors.red);
            }
          },
          child: SingleChildScrollView(
            child: BlocBuilder<ProfileBlocBloc, ProfileBlocState>(
              builder: (context, state) {
                // final profilePicture = null;
                return LayoutBuilder(
                  builder: (context, constraint) {
                    bool screenSizeLarge = (constraint.maxWidth > 1200);
                    bool screenSizeMedium =
                        (constraint.maxWidth < 1200 ||
                        constraint.maxWidth > 600);
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSizeLarge
                            ? 48
                            : screenSizeMedium
                            ? 20
                            : 16,
                        vertical: 1.0,
                      ),
                      child: (isSmallScreen)
                          ?
                            //****************
                            //For Small Screen
                            //****************
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                            color: widget.isDark
                                                ? Theme.of(
                                                    context,
                                                  ).bottomAppBarTheme.color
                                                : const Color(0xff24488E),
                                          ),
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Personal Information",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              const Row(children: [
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 25),
                                            // _selectedImage != null
                                            //     ? Container(
                                            //         height: 90,
                                            //         width: 90,
                                            //         decoration: BoxDecoration(
                                            //           shape: BoxShape.circle,
                                            //           image: DecorationImage(
                                            //             fit: BoxFit.cover,
                                            //             image: kIsWeb
                                            //                 ? NetworkImage(
                                            //                         _selectedImage!
                                            //                             .path,
                                            //                       )
                                            //                       as ImageProvider
                                            //                 : FileImage(
                                            //                     File(
                                            //                       _selectedImage!
                                            //                           .path,
                                            //                     ),
                                            //                   ),
                                            //           ),
                                            //         ),
                                            //       )
                                            // : profilePicture != null
                                            // ? Container(
                                            //     height: 90,
                                            //     width: 90,
                                            //     decoration: BoxDecoration(
                                            //       shape: BoxShape.circle,
                                            //       image: DecorationImage(
                                            //         fit: BoxFit.cover,
                                            //         image: NetworkImage(
                                            //           profilePicture,
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   )
                                            // : Container(
                                            //     height: 90,
                                            //     width: 90,
                                            //     decoration: const BoxDecoration(
                                            //       shape: BoxShape.circle,
                                            //       image: DecorationImage(
                                            //         fit: BoxFit.cover,
                                            //         image: AssetImage(
                                            //           "assets/images/profile.jpg",
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ),
                                          ],
                                        ),
                                        // const SizedBox(height: 5),
                                        // Wrap(
                                        //   direction: Axis.horizontal,
                                        //   children: [
                                        //     TextButton(
                                        //       style: ButtonStyle(
                                        //         shape:
                                        //             WidgetStateProperty.all<
                                        //               RoundedRectangleBorder
                                        //             >(
                                        //               RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(
                                        //                       5,
                                        //                     ), // Adjust the radius as needed
                                        //               ),
                                        //             ),
                                        //         backgroundColor:
                                        //             WidgetStateProperty.all<Color>(
                                        //               Colors.blueGrey.shade50,
                                        //             ),
                                        //       ),
                                        //       onPressed: () {
                                        //         _onImageButtonPressed(
                                        //           context: context,
                                        //         );
                                        //       },
                                        //       child: const Text(
                                        //         "Pick an image",
                                        //         style: TextStyle(
                                        //           color: Color(0xff24488E),
                                        //           fontWeight: FontWeight.bold,
                                        //         ),
                                        //       ),
                                        //     ),
                                        //     const SizedBox(height: 5, width: 15),
                                        //     TextButton(
                                        //       style: ButtonStyle(
                                        //         shape:
                                        //             WidgetStateProperty.all<
                                        //               RoundedRectangleBorder
                                        //             >(
                                        //               RoundedRectangleBorder(
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(
                                        //                       5,
                                        //                     ), // Adjust the radius as needed
                                        //               ),
                                        //             ),
                                        //         backgroundColor:
                                        //             WidgetStateProperty.all<Color>(
                                        //               Colors.blueGrey.shade50,
                                        //             ),
                                        //       ),
                                        //       onPressed: () {
                                        //         if (profilePicture == null) {
                                        //           print(
                                        //             "You have not uploaded your profile picture\n you cannot remove it",
                                        //           );
                                        //           return;
                                        //         }
                                        //         _onDeletedProfilePicture(
                                        //           context: context,
                                        //         );
                                        //       },
                                        //       child: const Text(
                                        //         "Remove",
                                        //         style: TextStyle(
                                        //           color: Colors.red,
                                        //           fontWeight: FontWeight.bold,
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),

                                        // const SizedBox(height: 10),
                                        const SizedBox(height: 10),
                                        MobilePlaceholderTextFormFieldWidget(
                                          isRequired: true,
                                          hintText: 'First Name',
                                          placeholder: "First Name",
                                          controller:
                                              firstNameEditingController,
                                        ),
                                        MobilePlaceholderTextFormFieldWidget(
                                          isRequired: true,
                                          hintText: 'Last Name',
                                          placeholder: "Last Name",
                                          controller: lastNameEditingController,
                                        ),
                                        MobilePlaceholderTextFormFieldWidget(
                                          isRequired: false,
                                          hintText: 'Street Address',
                                          placeholder: "Street Address",
                                          controller:
                                              streetAddressEditingController,
                                        ),
                                        MobilePlaceholderTextFormFieldWidget(
                                          isRequired: false,
                                          hintText: 'City',
                                          placeholder: "City",
                                          controller: cityEditingController,
                                        ),
                                        MobilePlaceholderTextFormFieldWidget(
                                          isRequired: false,
                                          hintText: 'State',
                                          placeholder: "State",
                                          controller: stateEditingController,
                                        ),
                                        MobilePlaceholderTextFormFieldWidget(
                                          isRequired: false,
                                          hintText: 'Zip Code',
                                          placeholder: "Zip Code",
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(5),
                                          ],
                                          keyboardType: TextInputType.number,
                                          controller: zipCodeEditingController,
                                        ),
                                        MobilePlaceholderTextFormFieldWidget(
                                          isRequired: true,
                                          hintText: 'Email',
                                          placeholder: "Email",
                                          readOnly: true,
                                          controller: emailEditingController,
                                        ),
                                        MobilePlaceholderTextFormFieldWidget(
                                          isRequired: true,
                                          hintText: 'Mobile Phone',
                                          placeholder: "Mobile Phone",
                                          keyboardType: TextInputType.phone,
                                          controller:
                                              mobilePhoneNumberController,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(
                                              10,
                                            ),
                                          ],
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return '*Required';
                                            }
                                            if (value.length != 10) {
                                              return 'Mobile Phone Number must be of 10 digits';
                                            }
                                            return null;
                                          },
                                        ),

                                        MobilePlaceholderTextFormFieldWidget(
                                          isRequired: true,
                                          hintText: 'Country',
                                          placeholder: "Country",
                                          controller: countryEditingController,
                                          readOnly: false,
                                        ),
                                        // MobilePlaceholderTextFormFieldWidget(
                                        //   isRequired: true,
                                        //   hintText: 'Role',
                                        //   placeholder: "Role",
                                        //   readOnly: true,
                                        //   controller: roleEditingController,
                                        // ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: const Border(
                                              top: BorderSide(
                                                color: Colors.black26,
                                              ),
                                            ),
                                            color: Theme.of(
                                              context,
                                            ).bottomAppBarTheme.color,
                                          ),
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 20,
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                spacing: 10,
                                                runSpacing: 10,
                                                alignment:
                                                    WrapAlignment.spaceAround,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        Patient
                                                        newPatientProfile = widget.patient.copyWith(
                                                          fhirId: null,
                                                          extension_: [
                                                            FhirExtension(
                                                              url: FhirUri(
                                                                "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex",
                                                              ),
                                                              valueCode:
                                                                  FhirCode('M'),
                                                            ),
                                                          ],
                                                          name: [
                                                            HumanName(
                                                              given: [
                                                                firstNameEditingController
                                                                    .text,
                                                              ],
                                                              family:
                                                                  lastNameEditingController
                                                                      .text,
                                                            ),
                                                          ],
                                                          address: [
                                                            Address(
                                                              line: [
                                                                streetAddressEditingController
                                                                    .text,
                                                              ],
                                                              city:
                                                                  cityEditingController
                                                                      .text,
                                                              postalCode:
                                                                  zipCodeEditingController
                                                                      .text,
                                                              state:
                                                                  stateEditingController
                                                                      .text,
                                                              country:
                                                                  countryEditingController
                                                                      .text,
                                                            ),
                                                          ],
                                                          telecom: [
                                                            ContactPoint(
                                                              value:
                                                                  emailEditingController
                                                                      .text,
                                                              system:
                                                                  ContactPointSystem
                                                                      .email,
                                                            ),
                                                            ContactPoint(
                                                              value:
                                                                  mobilePhoneNumberController
                                                                      .text,
                                                              system:
                                                                  ContactPointSystem
                                                                      .phone,
                                                            ),
                                                          ],
                                                        );
                                                        profileBloc.add(
                                                          UpdatePatientProfile(
                                                            newPatientProfile,
                                                            widget
                                                                .patient
                                                                .fhirId
                                                                .toString(),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: Theme.of(
                                                        context,
                                                      ).primaryColor,
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 30,
                                                            vertical: 10,
                                                          ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              5,
                                                            ),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      'Save',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                      //  widget.isEditable();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.red,
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 30,
                                                            vertical: 10,
                                                          ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              5,
                                                            ),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          //*******************************
                          //For Normal and Large Screen
                          //*******************************
                          : Form(
                              key: _formKey,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Card(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                      10,
                                                    ),
                                                    topRight: Radius.circular(
                                                      10,
                                                    ),
                                                  ),
                                              color: widget.isDark
                                                  ? Theme.of(
                                                      context,
                                                    ).colorScheme.onSecondary
                                                  : const Color(0xff24488E),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 20,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 40,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Personal Information",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge!
                                                            .copyWith(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20),

                                          //Profile Add Widget
                                          // Column(
                                          //   mainAxisAlignment: MainAxisAlignment.center,
                                          //   children: [
                                          //     // const SizedBox(
                                          //     //   width: 20,
                                          //     // ),
                                          //     _selectedImage != null
                                          //         ? Container(
                                          //             height: 90,
                                          //             width: 90,
                                          //             decoration: BoxDecoration(
                                          //               shape: BoxShape.circle,
                                          //               image: DecorationImage(
                                          //                 fit: BoxFit.cover,
                                          //                 image: kIsWeb
                                          //                     ? NetworkImage(
                                          //                             _selectedImage!
                                          //                                 .path,
                                          //                           )
                                          //                           as ImageProvider
                                          //                     : FileImage(
                                          //                         File(
                                          //                           _selectedImage!
                                          //                               .path,
                                          //                         ),
                                          //                       ),
                                          //               ),
                                          //             ),
                                          //           )
                                          //         : profilePicture != null
                                          //         ? Container(
                                          //             height: 90,
                                          //             width: 90,
                                          //             decoration: BoxDecoration(
                                          //               shape: BoxShape.circle,
                                          //               image: DecorationImage(
                                          //                 fit: BoxFit.cover,
                                          //                 image: NetworkImage(
                                          //                   profilePicture,
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //           )
                                          //         : Container(
                                          //             height: 90,
                                          //             width: 90,
                                          //             decoration: const BoxDecoration(
                                          //               shape: BoxShape.circle,
                                          //               image: DecorationImage(
                                          //                 fit: BoxFit.cover,
                                          //                 image: AssetImage(
                                          //                   "assets/images/profile.jpg",
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //           ),
                                          //     const SizedBox(width: 30),
                                          //     Padding(
                                          //       padding: const EdgeInsets.fromLTRB(
                                          //         0,
                                          //         10,
                                          //         40,
                                          //         0,
                                          //       ),
                                          //       child: Wrap(
                                          //         direction: Axis.horizontal,
                                          //         children: [
                                          //           TextButton(
                                          //             style: ButtonStyle(
                                          //               shape:
                                          //                   WidgetStateProperty.all<
                                          //                     RoundedRectangleBorder
                                          //                   >(
                                          //                     RoundedRectangleBorder(
                                          //                       borderRadius:
                                          //                           BorderRadius.circular(
                                          //                             5,
                                          //                           ), // Adjust the radius as needed
                                          //                     ),
                                          //                   ),
                                          //               backgroundColor:
                                          //                   WidgetStateProperty.all<
                                          //                     Color
                                          //                   >(Colors.blueGrey.shade50),
                                          //             ),
                                          //             onPressed: () {
                                          //               _onImageButtonPressed(
                                          //                 context: context,
                                          //               );
                                          //             },
                                          //             child: const Text(
                                          //               "Upload image",
                                          //               style: TextStyle(
                                          //                 color: Color(0xff24488E),
                                          //                 fontWeight: FontWeight.bold,
                                          //               ),
                                          //             ),
                                          //           ),
                                          //           const SizedBox(width: 10),
                                          //           TextButton(
                                          //             style: ButtonStyle(
                                          //               shape:
                                          //                   WidgetStateProperty.all<
                                          //                     RoundedRectangleBorder
                                          //                   >(
                                          //                     RoundedRectangleBorder(
                                          //                       borderRadius:
                                          //                           BorderRadius.circular(
                                          //                             5,
                                          //                           ), // Adjust the radius as needed
                                          //                     ),
                                          //                   ),
                                          //               backgroundColor:
                                          //                   WidgetStateProperty.all<
                                          //                     Color
                                          //                   >(Colors.blueGrey.shade50),
                                          //             ),
                                          //             onPressed: () {
                                          //               if (profilePicture == null) {
                                          //                 print(
                                          //                   "You have not uploaded your profile picture\n you cannot remove it",
                                          //                 );
                                          //                 return;
                                          //               }
                                          //               _onDeletedProfilePicture(
                                          //                 context: context,
                                          //               );
                                          //             },
                                          //             child: const Text(
                                          //               "Remove",
                                          //               style: TextStyle(
                                          //                 color: Colors.red,
                                          //                 fontWeight: FontWeight.bold,
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              PlaceholderTextFormFieldWidget(
                                                isRequired: true,
                                                isMediumScreen: isMediumScreen,
                                                hintText: 'First Name',
                                                placeholder: "First Name",
                                                controller:
                                                    firstNameEditingController,
                                              ),
                                              PlaceholderTextFormFieldWidget(
                                                isRequired: true,
                                                isMediumScreen: isMediumScreen,
                                                hintText: 'Last Name',
                                                placeholder: "Last Name",
                                                controller:
                                                    lastNameEditingController,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              PlaceholderTextFormFieldWidget(
                                                isRequired: true,
                                                isMediumScreen: isMediumScreen,
                                                hintText: 'Street Address',
                                                placeholder: "Street Address",
                                                controller:
                                                    streetAddressEditingController,
                                              ),
                                              PlaceholderTextFormFieldWidget(
                                                isRequired: true,
                                                isMediumScreen: isMediumScreen,
                                                hintText: 'City',
                                                placeholder: "City",
                                                controller:
                                                    cityEditingController,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              PlaceholderTextFormFieldWidget(
                                                isRequired: true,
                                                isMediumScreen: isMediumScreen,
                                                hintText: 'State',
                                                placeholder: "State",
                                                controller:
                                                    stateEditingController,
                                              ),
                                              PlaceholderTextFormFieldWidget(
                                                isRequired: true,
                                                isMediumScreen: isMediumScreen,
                                                hintText: 'Zip Code',
                                                placeholder: "Zip Code",
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                    5,
                                                  ),
                                                ],
                                                keyboardType:
                                                    TextInputType.phone,
                                                controller:
                                                    zipCodeEditingController,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              PlaceholderTextFormFieldWidget(
                                                isRequired: true,
                                                isMediumScreen: isMediumScreen,
                                                hintText: 'Email',
                                                placeholder: "Email",
                                                readOnly: true,
                                                controller:
                                                    emailEditingController,
                                              ),
                                              PlaceholderTextFormFieldWidget(
                                                isRequired: true,
                                                isMediumScreen: isMediumScreen,
                                                hintText: 'Mobile Phone',
                                                placeholder: "Mobile Phone",
                                                keyboardType:
                                                    TextInputType.phone,
                                                controller:
                                                    mobilePhoneNumberController,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                    10,
                                                  ),
                                                ],
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return '*Required';
                                                  } else if (value.length !=
                                                      10) {
                                                    return 'Mobile Phone Number must be of 10 digits';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              PlaceholderTextFormFieldWidget(
                                                isRequired: true,
                                                isMediumScreen: isMediumScreen,
                                                hintText: 'Country',
                                                placeholder: "Country",
                                                readOnly: false,
                                                controller:
                                                    countryEditingController,
                                              ),
                                            ],
                                          ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     PlaceholderTextFormFieldWidget(
                                          //       isRequired: true,
                                          //       isMediumScreen: isMediumScreen,
                                          //       hintText: 'Organization',
                                          //       placeholder: "Organization",
                                          //       controller:
                                          //           organizationEditingController,
                                          //       readOnly: true,
                                          //     ),
                                          //     // PlaceholderTextFormFieldWidget(
                                          //     //   isRequired: true,
                                          //     //   isMediumScreen: isMediumScreen,
                                          //     //   hintText: 'Role',
                                          //     //   placeholder: "Role",
                                          //     //   readOnly: true,
                                          //     //   controller: roleEditingController,
                                          //     // ),
                                          //   ],
                                          // ),

                                          //   ],
                                          // ),
                                          //           Responsiveness.responsiveForm(
                                          //           children: [
                                          //                   MobileNumberVerificationWidget(
                                          //                     sendOTP:sendOTP,
                                          //                     showOTPField:showOTPField,
                                          //                     phoneNumberVerified:phoneNumberVerified,
                                          //       controller: mobilePhoneNumberController,
                                          //                         placeholder: "Mobile Phone",
                                          //                         hintText: "Mobile Number",
                                          //                         keyboardType: TextInputType.phone,
                                          //                         inputFormatters: [
                                          //                           FilteringTextInputFormatter
                                          //                               .digitsOnly
                                          //                         ],
                                          //                         validator: (value) {
                                          //                           if (value == null ||
                                          //                               value.isEmpty) {
                                          //                             return '*Required';
                                          //                           } else if (value.length != 10) {
                                          //                             return 'Mobile Number must be of 10 digit';
                                          //                           }
                                          //                           return null;
                                          //                         },
                                          //                         isRequired: true

                                          // ),
                                          //   showOTPField ?OTPVerificationWidget(
                                          //     verifyOTP:verifyOTP,
                                          //     showOTPField:showOTPField,
                                          //                     phoneNumberVerified:phoneNumberVerified,
                                          //       controller: otpController,
                                          //                         placeholder: "OTP Verification",
                                          //                         hintText: "Mobile Number",
                                          //                         keyboardType: TextInputType.phone,
                                          //                         inputFormatters: [
                                          //                           FilteringTextInputFormatter
                                          //                               .digitsOnly
                                          //                         ],
                                          //                         validator: (value) {
                                          //                           if (value == null ||
                                          //                               value.isEmpty) {
                                          //                             return '*Required';
                                          //                           } else if (value.length != 10) {
                                          //                             return 'Mobile Number must be of 10 digit';
                                          //                           }
                                          //                           return null;
                                          //                         },
                                          //                         isRequired: true

                                          // ):Container(),
                                          //           ]),
                                          const SizedBox(height: 30),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: const Border(
                                                top: BorderSide(
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              color: Theme.of(
                                                context,
                                              ).bottomAppBarTheme.color,
                                            ),
                                            padding: const EdgeInsets.only(
                                              top: 20,
                                              bottom: 20,
                                              left: 20,
                                              right: 20,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        if (_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          // print(apiMobileNumber);
                                                          // print(mobilePhoneNumberController.text);
                                                          if (
                                                          // apiMobileNumber ==
                                                          //       mobilePhoneNumberController
                                                          //           .text ||
                                                          //   phoneNumberVerified ==
                                                          true) {
                                                            //                                                       firstNameEditingController.text =
                                                            //     widget.patient.name?[0].given?[0] ?? ''.toString();
                                                            // lastNameEditingController.text = widget.patient.name?[0].family ?? '';
                                                            // streetAddressEditingController.text =
                                                            //     widget.patient.address?[0].line?[0] ?? '';
                                                            // cityEditingController.text = widget.patient.address?[0].city ?? '';
                                                            // zipCodeEditingController.text = widget.patient.address?[0].postalCode ?? '';
                                                            // stateEditingController.text = widget.patient.address?[0].state ?? '';
                                                            // emailEditingController.text = widget.patient.telecom?[0].value ?? '';
                                                            // roleEditingController.text = widget.patient.resourceType.name;
                                                            Patient
                                                            newPatientProfile = widget.patient.copyWith(
                                                              fhirId: null,
                                                              extension_: [
                                                                FhirExtension(
                                                                  url: FhirUri(
                                                                    "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex",
                                                                  ),
                                                                  valueCode:
                                                                      FhirCode(
                                                                        'M',
                                                                      ),
                                                                ),
                                                              ],
                                                              name: [
                                                                HumanName(
                                                                  given: [
                                                                    firstNameEditingController
                                                                        .text,
                                                                  ],
                                                                  family:
                                                                      lastNameEditingController
                                                                          .text,
                                                                ),
                                                              ],
                                                              address: [
                                                                Address(
                                                                  line: [
                                                                    streetAddressEditingController
                                                                        .text,
                                                                  ],
                                                                  city:
                                                                      cityEditingController
                                                                          .text,
                                                                  postalCode:
                                                                      zipCodeEditingController
                                                                          .text,
                                                                  state:
                                                                      stateEditingController
                                                                          .text,
                                                                  country:
                                                                      countryEditingController
                                                                          .text,
                                                                ),
                                                              ],
                                                              telecom: [
                                                                ContactPoint(
                                                                  value:
                                                                      emailEditingController
                                                                          .text,
                                                                  system:
                                                                      ContactPointSystem
                                                                          .email,
                                                                ),
                                                                ContactPoint(
                                                                  value:
                                                                      mobilePhoneNumberController
                                                                          .text,
                                                                  system:
                                                                      ContactPointSystem
                                                                          .phone,
                                                                ),
                                                              ],
                                                            );
                                                            profileBloc.add(
                                                              UpdatePatientProfile(
                                                                newPatientProfile,
                                                                widget
                                                                    .patient
                                                                    .fhirId
                                                                    .toString(),
                                                              ),
                                                            );
                                                            // context.read<profileBloc>().add(
                                                            //   UpdatePatientProfile(
                                                            //     newPatientProfile,
                                                            //     newPatientProfile
                                                            //         .fhirId
                                                            //         .toString(),
                                                            //   ),
                                                            // );

                                                            // updateProfile(
                                                            //   userResource: context
                                                            //       .read<ProfileBloc>()
                                                            //       .state
                                                            //       .userResource!,
                                                            //   streetAddress:
                                                            //       streetAddressEditingController
                                                            //           .text,
                                                            //   city:
                                                            //       cityEditingController
                                                            //           .text,
                                                            //   officePhone:
                                                            //       officePhoneNumberController
                                                            //           .text,
                                                            //   mobilePhone:
                                                            //       mobilePhoneNumberController
                                                            //           .text,
                                                            //   firstName:
                                                            //       firstNameEditingController
                                                            //           .text,
                                                            //   lastName:
                                                            //       lastNameEditingController
                                                            //           .text,
                                                            //   state:
                                                            //       stateEditingController
                                                            //           .text,
                                                            //   zipCode:
                                                            //       zipCodeEditingController
                                                            //           .text,
                                                            // );
                                                          }
                                                          /*       else {
                                                                    showErrorMessage(
                                                                        'Mobile Number should be verified first',
                                                                        context);
                                                                  } */
                                                        }
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Theme.of(
                                                              context,
                                                            ).primaryColor,
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 30,
                                                              vertical: 10,
                                                            ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                5,
                                                              ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          const Text(
                                                            'Save',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          BlocBuilder<
                                                            ProfileBlocBloc,
                                                            ProfileBlocState
                                                          >(
                                                            builder: (context, state) {
                                                              if (state
                                                                  is UpdatingProfile) {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                      ),
                                                                  child: SizedBox(
                                                                    width: 20,
                                                                    height: 20,
                                                                    child: CircularProgressIndicator(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              return Container();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 30),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(
                                                          context,
                                                        ).pop();
                                                        // widget.isEditable();
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.red,
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 30,
                                                              vertical: 10,
                                                            ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                5,
                                                              ),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /*   Future<void> _onImageButtonPressed({required BuildContext context}) async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (returnImage == null) return;
    final bytes = await returnImage.readAsBytes();

    // Decode the image
    final image = await decodeImageFromList(bytes);

    if (image.width < 1024 && image.height < 1024) {
      _selectedImage = XFile(returnImage.path);
      setState(() {});
      return;
    }
    if (!mounted) return;
    print("Image must be less than 1024X1024 pixel ");
    setState(() {});
  } */
  /* 
  Future<void> _onDeletedProfilePicture({required BuildContext context}) async {
    context.read<ProfileBlocBloc>().add(const DeleteProfilePicture());
    _selectedImage = null;
    setState(() {});
  } */

  void updateProfile({
    required UserResourceModel userResource,
    required String firstName,
    required String lastName,
    required String streetAddress,
    required String city,
    required String state,
    required String zipCode,
    required String officePhone,
    required String mobilePhone,
  }) {
    /*   String formatPhoneNumber(
      String phoneNumber, {
      String countryCode = '+1',
      String type = 'work',
    }) {
      // Ensure the phone number is exactly 10 digits
      if (phoneNumber.length != 10 ||
          !RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
        return '';
      }

      // Split the phone number into area code, prefix, and line number
      final areaCode = phoneNumber.substring(0, 3);
      final prefix = phoneNumber.substring(3, 6);
      final lineNumber = phoneNumber.substring(6);

      // Format the number according to RFC 3966
      return 'tel:$countryCode-$areaCode-$prefix-$lineNumber';
    } */

    /*    final userRes = userResource.resource?.copyWith(
      addresses: [
        UserProfileAddress(
          streetAddress: streetAddress,
          country: userResource.resource?.addresses?.first.country ?? "USA",
          locality: city,
          postalCode: zipCode,
          region: state,
          type: "home",
        ),
      ],
      name: UserProfileName(
        formatted: '$firstName $lastName',
        familyName: lastName,
        givenName: firstName,
      ),
      phoneNumber: mobilePhone,
      phoneNumbers: [
        {"value": formatPhoneNumber(officePhone), "type": "work"},
      ],
      extension: [
        FhirExtension(
          url: FhirUri('http://gheit-extension/user-auth0Id'),
          valueString: getAuth0Id(userResource.resource?.extension),
        ),
        FhirExtension(
          url: FhirUri('http://gheit-extension/user-textNotification'),
          valueBoolean: FhirBoolean(textNotification),
        ),
        FhirExtension(
          url: FhirUri('http://gheit-extension/user-emailNotification'),
          valueBoolean: FhirBoolean(emailNotification),
        ),
      ],
    ); */
    // context.read<ProfileBlocBloc>().add(
    //   UpdateProfile(userResource: userRes!, selectedImage: _selectedImage),
    // );

    if (_selectedImage != null) {
      // context.read<ProfileBloc>().add(
      //   UpdateProfilePicture(selectedImage: _selectedImage),
      // );
    }
  }

  String getAuth0Id(List<dynamic>? extensions) {
    final auth0IdExt = extensions!.firstWhere(
      (ext) => ext.url == FhirUri('http://gheit-extension/user-auth0Id'),
      orElse: () => FhirExtension(),
    );

    return auth0IdExt.valueString ?? '';
  }
}
