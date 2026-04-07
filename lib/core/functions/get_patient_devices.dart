import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:patient_app/features/home/data/models/observations_model.dart';

// getPatientID() async {
//   final user = FirebaseAuth.instance.currentUser;
//   Map<String, dynamic> payload = {};
//   final authBox = Hive.box('authBox');
//   String? idToken = '';
//   if (user != null) {
//     idToken = await user.getIdToken();
//     DocumentSnapshot snapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .get();

//     if (snapshot.exists) {
//       payload = (snapshot.data() as Map<String, dynamic>);
//     }
//   } else {
//     idToken = authBox.get('accessToken');
//   }

//   final patientId = payload["patient_id"] ?? 'patient id';
//   return patientId;
// }

getPatientDeviceIDList(String patientId) async {
  final dio = Dio();
  const username = 'rpm-demo-client';
  const password = 'MoJpReAK7yvh4';
  final basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  List deviceIDs = [];
  if (patientId != "093266f6-6417-4e07-9219-e55bcd8a4e73") {
    final deviceResponse = await dio.get(
      'https://aidboxdev.gheit.co/Device?_patient=${patientId}',
      options: Options(
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
      ),
    );
    print("The device id is");
    deviceIDs.clear();
    if (deviceResponse.data["entry"] != null) {
      Device device = Device.fromJson(
        deviceResponse.data["entry"][0]["resource"],
      );
      print(deviceResponse.data["entry"][0]["resource"]);
      print(device);
      List<Device> devices = [];

      for (int k = 0; k < deviceResponse.data["entry"].length; k++) {
        Device device = Device.fromJson(
          deviceResponse.data["entry"][k]["resource"],
        );
        devices.add(device);
        deviceIDs.add(device.id ?? '');
      }
    }
    print(deviceIDs);
  }
  return deviceIDs;
}
