// ignore_for_file: avoid_print

import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/theme/responsive_widget.dart';
import 'package:patient_app/features/primary/presentation/bloc/bloc/profile_bloc_bloc.dart';
import 'package:patient_app/features/primary/presentation/edit_profile_widget.dart';
import 'package:patient_app/features/primary/widget/mobile_rich_text_widget.dart';
import 'package:patient_app/features/primary/widget/rich_text_widget.dart';

class PrimaryPage extends StatefulWidget {
  const PrimaryPage({super.key});

  @override
  State<PrimaryPage> createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  @override
  void initState() {
    // fetchPatientData();

    super.initState();
  }

  bool loading = false;
  bool loaded = false;
  bool loadingfailed = false;
  Patient? model;
  // void fetchPatientData() async {
  //   User? user = FirebaseAuth.instance.currentUser;

  //   if (user == null) return null; // Not logged in

  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.uid)
  //       .get();
  //   Map<String, dynamic> payload = {};
  //   if (snapshot.exists) {
  //     payload = (snapshot.data() as Map<String, dynamic>);
  //   }

  //   setState(() {
  //     loading = true;
  //     loaded = false;
  //     loadingfailed = false;
  //   });
  //   final dio = Dio();

  //   // Basic Auth credentials
  //   const username = 'rpm-demo-client';
  //   const password = 'MoJpReAK7yvh4';

  //   // Encode username:password to Base64
  //   final basicAuth =
  //       'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  //   try {
  //     final response = await dio.get(
  //       'https://aidboxdev.gheit.co/Patient/${payload["patient_id"]}',
  //       options: Options(
  //         headers: {
  //           'Authorization': basicAuth,
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );
  //     // print("The response data is");
  //     // print(jsonEncode(response.data["entry"][0]["resource"]).toString());
  //     // Map<String, dynamic> jsondata = jsonDecode(
  //     //   response.data["entry"][0]["resource"],
  //     // );
  //     //model = Observation.fromJson(response.data["entry"][0]["resource"]);
  //     model = Patient.fromJson(response.data);
  //     print("The Patient Model is");
  //     print(model);
  //     setState(() {
  //       loading = false;
  //       loaded = true;
  //       loadingfailed = false;
  //     });
  //     // print('Response: ${response.data}');
  //     // print(model);
  //   } catch (e) {
  //     setState(() {
  //       loading = false;
  //       loaded = false;
  //       loadingfailed = true;
  //     });
  //     print('Error: $e');
  //   }
  // }

  // Devices with IDs
  final Map<String, String> devices = {
    "Blood glucose monitor": "381A100610E",
    "Blood pressure monitor": "100251303404",
    "Weight scale": "200242101321",
  };
  void refreshPage() {
    profileBloc.add(LoadPatientProfile(''));
  }

  // getDeviceDataAndPutDeviceReference(String deviceID) async {
  //   final dio = Dio();

  //   // Basic Auth credentials
  //   const username = 'rpm-demo-client';
  //   const password = 'MoJpReAK7yvh4';

  //   // Encode username:password to Base64
  //   final basicAuth =
  //       'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  //   final response = await dio.get(
  //     'https://aidboxdev.gheit.co/Device/$deviceID',
  //     options: Options(
  //       headers: {
  //         'Authorization': basicAuth,
  //         'Content-Type': 'application/json',
  //       },
  //     ),
  //   );

  //   Device device = Device.fromJson(response.data);

  //   device = device.copyWith(
  //     patient: Reference(
  //       reference: "Patient/093266f6-6417-4e07-9219-e55bcd8a4e73",
  //     ),
  //   );
  //   try {
  //     final response = await dio.put(
  //       'https://aidboxdev.gheit.co/Device/$deviceID',
  //       data: device,
  //       options: Options(
  //         headers: {
  //           'Authorization': basicAuth,
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  final profileBloc = ProfileBlocBloc();

  Device device = Device(patient: Reference(fhirId: ''));
  // Track checked state
  final Map<String, bool> selectedDevices = {};
  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        (ResponsiveWidget.isSmall(context) ||
        ResponsiveWidget.isXSmall(context));
    final isMediumScreen = (ResponsiveWidget.isMedium(context));
    return BlocProvider(
      create: (context) => profileBloc..add(LoadPatientProfile('')),
      child: BlocBuilder<ProfileBlocBloc, ProfileBlocState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            appBar: AppBar(
              title: Text(
                'Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              foregroundColor: Colors.black,
            ),
            body: (state is ProfileLoadingFailed)
                ? Center(child: Text("Patient Id not found"))
                : (state is ProfileLoaded)
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      20,
                                      10,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Personal Information',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      final isMobileLayout =
                                          constraints.maxWidth < 600;

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                    20,
                                                    8,
                                                    8,
                                                    8,
                                                  ),
                                              child: ClipOval(
                                                child: SizedBox(
                                                  height: isMobileLayout
                                                      ? 80
                                                      : 100,
                                                  width: isMobileLayout
                                                      ? 80
                                                      : 100,
                                                  child: Image.asset(
                                                    'assets/images/profile.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                  18,
                                                  isMobileLayout ? 18 : 20,
                                                  isMobileLayout ? 10 : 20,
                                                  0,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '${state.patient.name?.first.given?.first ?? ''} ${state.patient.name?.first.family ?? ''}',
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .titleMedium!
                                                                    .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                              Text(
                                                                '${state.patient.address?.first.city ?? ''}, ${state.patient.address?.first.country ?? ''}',
                                                                style: Theme.of(context)
                                                                    .textTheme
                                                                    .titleMedium!
                                                                    .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          isMobileLayout
                                                                          ? 14
                                                                          : 16,
                                                                    ),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (isMobileLayout) ...[
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          SizedBox(
                                                            child: ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => BlocProvider(
                                                                      create:
                                                                          (
                                                                            context,
                                                                          ) =>
                                                                              ProfileBlocBloc(),
                                                                      child: EditProfileWidget(
                                                                        isDark:
                                                                            false,
                                                                        isEditable:
                                                                            refreshPage,
                                                                        patient:
                                                                            state.patient,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                                setState(() {});
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                padding:
                                                                    const EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          12,
                                                                      vertical:
                                                                          8,
                                                                    ),
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        8,
                                                                      ),
                                                                ),
                                                              ),
                                                              child: const Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Icon(
                                                                    Icons.edit,
                                                                    size: 16,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 4,
                                                                  ),
                                                                  Text('Edit'),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (!isMobileLayout)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 15.0,
                                                  top: 8.0,
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => BlocProvider(
                                                          create: (context) =>
                                                              ProfileBlocBloc(),
                                                          child:
                                                              EditProfileWidget(
                                                                isDark: false,
                                                                isEditable:
                                                                    refreshPage,
                                                                patient: state
                                                                    .patient,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                    setState(() {});
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 20,
                                                          vertical: 15,
                                                        ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                  ),
                                                  child: const Row(
                                                    children: [
                                                      Icon(Icons.edit),
                                                      SizedBox(width: 8),
                                                      Text('Edit'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          isSmallScreen == true
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Details",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleMedium,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        MobileRichTextWidget(
                                          text:
                                              (state
                                                  .patient
                                                  .address
                                                  ?.first
                                                  .line
                                                  ?.first ??
                                              ''),
                                          placeholder: "Street Address",
                                        ),
                                        const SizedBox(height: 10),
                                        MobileRichTextWidget(
                                          text:
                                              (state
                                                  .patient
                                                  .address
                                                  ?.first
                                                  .state ??
                                              ''),
                                          placeholder: "State",
                                        ),
                                        const SizedBox(height: 10),
                                        MobileRichTextWidget(
                                          text:
                                              (state
                                                  .patient
                                                  .address
                                                  ?.first
                                                  .postalCode ??
                                              ''),
                                          placeholder: "Zip Code",
                                        ),
                                        const SizedBox(height: 10),
                                        MobileRichTextWidget(
                                          text:
                                              (state
                                                  .patient
                                                  .telecom
                                                  ?.first
                                                  .value ??
                                              ''),
                                          placeholder: "Email",
                                        ),
                                        const SizedBox(height: 10),
                                        MobileRichTextWidget(
                                          text:
                                              (state.patient.telecom != null &&
                                                  state
                                                          .patient
                                                          .telecom!
                                                          .length >
                                                      1 &&
                                                  state
                                                          .patient
                                                          .telecom![1]
                                                          .value !=
                                                      null)
                                              ? state.patient.telecom![1].value!
                                              : '',
                                          placeholder: "Mobile Phone",
                                        ),

                                        const SizedBox(height: 10),

                                        const SizedBox(height: 10),
                                        MobileRichTextWidget(
                                          text: "Patient",
                                          placeholder: "Role",
                                        ),
                                        const SizedBox(height: 10),
                                        MobileRichTextWidget(
                                          text:
                                              (state
                                                  .patient
                                                  .address?[0]
                                                  .country ??
                                              ''),
                                          placeholder: "Country",
                                        ),
                                        const SizedBox(height: 30),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color:
                                        (Theme.of(context).brightness ==
                                            Brightness.dark)
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.onInverseSurface
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      isMediumScreen ? 10.0 : 10.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  (Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark)
                                                  ? Theme.of(
                                                      context,
                                                    ).colorScheme.inversePrimary
                                                  : Colors.blue.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                    10,
                                                    2,
                                                    15,
                                                    2,
                                                  ),
                                              child: Text(
                                                "Details",
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.titleMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichTextWidget(
                                              column: 1,
                                              isMediumScreen: isMediumScreen,
                                              placeholder: "Street Address  ",
                                              text:
                                                  (state
                                                      .patient
                                                      .address
                                                      ?.first
                                                      .line
                                                      ?.first ??
                                                  ''),
                                            ),
                                            RichTextWidget(
                                              column: 2,
                                              isMediumScreen: isMediumScreen,
                                              placeholder: "City  ",
                                              text:
                                                  (state
                                                      .patient
                                                      .address
                                                      ?.first
                                                      .city ??
                                                  ''),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichTextWidget(
                                              column: 1,
                                              isMediumScreen: isMediumScreen,
                                              placeholder: "Zip Code  ",
                                              text:
                                                  (state
                                                      .patient
                                                      .address
                                                      ?.first
                                                      .postalCode ??
                                                  ''),
                                            ),
                                            RichTextWidget(
                                              column: 2,
                                              isMediumScreen: isMediumScreen,
                                              placeholder: "State  ",
                                              text:
                                                  (state
                                                      .patient
                                                      .address
                                                      ?.first
                                                      .state ??
                                                  ''),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichTextWidget(
                                              column: 1,
                                              isMediumScreen: isMediumScreen,
                                              placeholder: "Email  ",
                                              text:
                                                  (state
                                                      .patient
                                                      .telecom
                                                      ?.first
                                                      .value ??
                                                  ''),
                                            ),
                                            RichTextWidget(
                                              column: 2,
                                              isMediumScreen: isMediumScreen,
                                              placeholder: "Role  ",
                                              text: //state.roleProfileModel?.resource?.name?.toLowerCase() ==
                                                  "Patient",
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichTextWidget(
                                              column: 1,
                                              isMediumScreen: isMediumScreen,
                                              placeholder: "Mobile Phone  ",
                                              text:
                                                  (state.patient.telecom !=
                                                          null &&
                                                      state
                                                              .patient
                                                              .telecom!
                                                              .length >
                                                          1 &&
                                                      state
                                                              .patient
                                                              .telecom![1]
                                                              .value !=
                                                          null)
                                                  ? state
                                                        .patient
                                                        .telecom![1]
                                                        .value!
                                                  : '',
                                            ),
                                            RichTextWidget(
                                              column: 2,
                                              isMediumScreen: isMediumScreen,
                                              placeholder: "Country",
                                              text:
                                                  (state
                                                      .patient
                                                      .address?[0]
                                                      .country ??
                                                  ''),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              'Connected Devices',
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(16),
                            children: state.deviceList.map((entry) {
                              final deviceName = entry.deviceName?[0].name;
                              final deviceId = entry.fhirId;
                              // final isChecked =
                              //     selectedDevices[deviceName] ?? true;
                              // print("The device name is");
                              // print(deviceName);
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 8),
                                elevation: 3,
                                child: ListTile(
                                  title: Text(
                                    deviceName ?? '',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Text(
                                    deviceId ?? '',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  // value: isChecked,
                                  // activeColor: Colors.indigo,
                                  // checkboxShape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(6),
                                  // ),
                                  // onChanged: (val) {
                                  //   // getDeviceDataAndPutDeviceReference(deviceId);
                                  //   setState(() {
                                  //     selectedDevices[deviceName!] =
                                  //         val ?? false;
                                  //   });
                                  // },
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
