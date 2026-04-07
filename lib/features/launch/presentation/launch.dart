// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:patient_app/features/launch/presentation/openemr_launch_page.dart';

// class EHRLaunch extends StatefulWidget {
//   const EHRLaunch({required this.queryParameters, super.key});

//   final Map<String, String> queryParameters;

//   @override
//   State<EHRLaunch> createState() => _EHRLaunchState();
// }

// class _EHRLaunchState extends State<EHRLaunch> {
//   @override
//   void initState() {
//     super.initState();
//     navigateToCorrectPage();
//     print("The path is");
//     print(widget.queryParameters);
//     // if (widget.queryParameters['iss'] == Environment.openEMRFhirURL) {
//     // ehrlist = EhrSelectList.openEMR;
//     // context.read<EhrControllerBloc>().add(
//     //   const SetEhrState(status: EhrSelectList.openEMR),
//     // );
//     // }
//   }

//   Future<void> navigateToCorrectPage() async {
//     await Future.delayed(Duration(seconds: 2));
//     // ignore: use_build_context_synchronously
//     context.goNamed('home');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return OpenEMRLaunchPage(queryParameters: widget.queryParameters);
//   }
// }
