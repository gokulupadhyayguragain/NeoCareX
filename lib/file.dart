// import 'package:flutter/material.dart';
// import 'dart:math';

// class PatientMonitoringApp extends StatelessWidget {
//   const PatientMonitoringApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Patient Monitoring Dashboard',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         // cardTheme: CardTheme(
//         //   elevation: 4,
//         //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         // ),
//       ),
//       home: LoginScreen(),
//     );
//   }
// }

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   LoginScreenState createState() => LoginScreenState();
// }

// class LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   String _userType = 'patient';

//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       // Simulate login process
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => DashboardScreen(
//             userType: _userType,
//             username: _usernameController.text,
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.blue.shade400, Colors.blue.shade800],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(32.0),
//             child: Card(
//               child: Padding(
//                 padding: EdgeInsets.all(24.0),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.local_hospital, size: 64, color: Colors.blue),
//                       SizedBox(height: 16),
//                       Text(
//                         'Patient Monitoring',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue.shade800,
//                         ),
//                       ),
//                       SizedBox(height: 32),
//                       DropdownButtonFormField<String>(
//                         initialValue: _userType,
//                         decoration: InputDecoration(
//                           labelText: 'User Type',
//                           border: OutlineInputBorder(),
//                         ),
//                         items: [
//                           DropdownMenuItem(
//                             value: 'patient',
//                             child: Text('Patient'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'provider',
//                             child: Text('Healthcare Provider'),
//                           ),
//                         ],
//                         onChanged: (value) {
//                           setState(() {
//                             _userType = value!;
//                           });
//                         },
//                       ),
//                       SizedBox(height: 16),
//                       TextFormField(
//                         controller: _usernameController,
//                         decoration: InputDecoration(
//                           labelText: 'Username',
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.person),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your username';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 16),
//                       TextFormField(
//                         controller: _passwordController,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.lock),
//                         ),
//                         obscureText: true,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 24),
//                       ElevatedButton(
//                         onPressed: _login,
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(double.infinity, 48),
//                         ),
//                         child: Text('Login'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DashboardScreen extends StatefulWidget {
//   final String userType;
//   final String username;

//   const DashboardScreen({super.key, required this.userType, required this.username});

//   @override
//   DashboardScreenState createState() => DashboardScreenState();
// }

// class DashboardScreenState extends State<DashboardScreen> {
//   final FHIRService _fhirService = FHIRService();
//   late PatientData _patientData;
//   bool _isLoading = true;
//   bool _showWeightInKg = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadPatientData();
//   }

//   void _loadPatientData() async {
//     setState(() {
//       _isLoading = true;
//     });

//     // Simulate API call delay
//     await Future.delayed(Duration(milliseconds: 1500));

//     _patientData = await _fhirService.getPatientData();

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Monitoring Dashboard'),
//         backgroundColor: Colors.blue.shade700,
//         foregroundColor: Colors.white,
//         actions: [
//           IconButton(icon: Icon(Icons.refresh), onPressed: _loadPatientData),
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => LoginScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 16),
//                   Text('Loading patient data...'),
//                 ],
//               ),
//             )
//           : RefreshIndicator(
//               onRefresh: () async {
//                 _loadPatientData();
//               },
//               child: SingleChildScrollView(
//                 physics: AlwaysScrollableScrollPhysics(),
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildUserHeader(),
//                     SizedBox(height: 20),
//                     _buildVitalSignsSection(),
//                     SizedBox(height: 20),
//                     _buildPhysicalMetricsSection(),
//                     SizedBox(height: 20),
//                     _buildHealthMonitoringSection(),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _buildUserHeader() {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 30,
//               backgroundColor: Colors.blue.shade100,
//               child: Icon(
//                 widget.userType == 'patient'
//                     ? Icons.person
//                     : Icons.medical_services,
//                 size: 30,
//                 color: Colors.blue.shade700,
//               ),
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Welcome, ${widget.username}',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     widget.userType == 'patient'
//                         ? 'Patient View'
//                         : 'Healthcare Provider',
//                     style: TextStyle(color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),
//             Icon(Icons.verified_user, color: Colors.green, size: 24),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildVitalSignsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Vital Signs',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 12),
//         GridView.count(
//           crossAxisCount: 2,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           childAspectRatio: 1.2,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 12,
//           children: [
//             _buildVitalSignCard(
//               'Blood Pressure',
//               '${_patientData.bloodPressure.systolic}/${_patientData.bloodPressure.diastolic}',
//               'mmHg',
//               Icons.favorite,
//               _getBPColor(
//                 _patientData.bloodPressure.systolic,
//                 _patientData.bloodPressure.diastolic,
//               ),
//             ),
//             _buildVitalSignCard(
//               'Heart Rate',
//               '${_patientData.heartRate}',
//               'bpm',
//               Icons.monitor_heart,
//               _getHeartRateColor(_patientData.heartRate),
//             ),
//             _buildVitalSignCard(
//               'Blood Glucose',
//               '${_patientData.bloodGlucose}',
//               'mg/dL',
//               Icons.water_drop,
//               _getGlucoseColor(_patientData.bloodGlucose),
//             ),
//             _buildVitalSignCard(
//               'Pulse',
//               '${_patientData.pulse}',
//               'bpm',
//               Icons.add,
//               _getPulseColor(_patientData.pulse),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildPhysicalMetricsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Physical Metrics',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Text('kg'),
//                 Switch(
//                   value: !_showWeightInKg,
//                   onChanged: (value) {
//                     setState(() {
//                       _showWeightInKg = !value;
//                     });
//                   },
//                 ),
//                 Text('lbs'),
//               ],
//             ),
//           ],
//         ),
//         SizedBox(height: 12),
//         GridView.count(
//           crossAxisCount: 2,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           childAspectRatio: 1.2,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 12,
//           children: [
//             _buildMetricCard(
//               'Body Weight',
//               _showWeightInKg
//                   ? _patientData.weightKg.toStringAsFixed(1)
//                   : (_patientData.weightKg * 2.20462).toStringAsFixed(1),
//               _showWeightInKg ? 'kg' : 'lbs',
//               Icons.monitor_weight,
//               Colors.orange,
//             ),
//             _buildMetricCard(
//               'Steps',
//               '${_patientData.steps}',
//               'steps',
//               Icons.directions_walk,
//               Colors.green,
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildHealthMonitoringSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Health Monitoring',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 12),
//         GridView.count(
//           crossAxisCount: 2,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           childAspectRatio: 1.2,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 12,
//           children: [
//             _buildMetricCard(
//               'Sleep Duration',
//               _patientData.sleepHours.toStringAsFixed(1),
//               'hours',
//               Icons.bedtime,
//               Colors.indigo,
//             ),
//             _buildMetricCard(
//               'Calorie Intake',
//               '${_patientData.calorieIntake}',
//               'kcal',
//               Icons.restaurant,
//               Colors.red,
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildVitalSignCard(
//     String title,
//     String value,
//     String unit,
//     IconData icon,
//     Color color,
//   ) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 32, color: color),
//             SizedBox(height: 8),
//             Text(
//               title,
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 4),
//             Text(
//               value,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: color,
//               ),
//             ),
//             Text(unit, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMetricCard(
//     String title,
//     String value,
//     String unit,
//     IconData icon,
//     Color color,
//   ) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 32, color: color),
//             SizedBox(height: 8),
//             Text(
//               title,
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 4),
//             Text(
//               value,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: color,
//               ),
//             ),
//             Text(unit, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//           ],
//         ),
//       ),
//     );
//   }

//   Color _getBPColor(int systolic, int diastolic) {
//     if (systolic >= 140 || diastolic >= 90) return Colors.red;
//     if (systolic >= 130 || diastolic >= 80) return Colors.orange;
//     return Colors.green;
//   }

//   Color _getHeartRateColor(int heartRate) {
//     if (heartRate < 60 || heartRate > 100) return Colors.red;
//     if (heartRate < 70 || heartRate > 90) return Colors.orange;
//     return Colors.green;
//   }

//   Color _getGlucoseColor(int glucose) {
//     if (glucose < 70 || glucose > 180) return Colors.red;
//     if (glucose < 80 || glucose > 140) return Colors.orange;
//     return Colors.green;
//   }

//   Color _getPulseColor(int pulse) {
//     if (pulse < 60 || pulse > 100) return Colors.red;
//     if (pulse < 70 || pulse > 90) return Colors.orange;
//     return Colors.green;
//   }
// }

// // FHIR Service to handle backend communication
// class FHIRService {
//   // Simulate FHIR API calls to Aidbox server
//   Future<PatientData> getPatientData() async {
//     // In real implementation, this would make HTTP requests to Aidbox FHIR server
//     // Example: GET /fhir/Observation?patient=123&category=vital-signs

//     // Simulate random but realistic data
//     final random = Random();

//     return PatientData(
//       patientId: 'patient-123',
//       bloodPressure: BloodPressure(
//         systolic: 120 + random.nextInt(40),
//         diastolic: 80 + random.nextInt(20),
//       ),
//       heartRate: 65 + random.nextInt(30),
//       bloodGlucose: 90 + random.nextInt(60),
//       pulse: 68 + random.nextInt(25),
//       weightKg: 70.0 + random.nextDouble() * 20,
//       steps: 5000 + random.nextInt(10000),
//       sleepHours: 6.0 + random.nextDouble() * 3,
//       calorieIntake: 1800 + random.nextInt(800),
//     );
//   }

//   Future<List<PatientData>> getPatientHistory(String patientId) async {
//     // Simulate getting historical data for trends
//     // In real implementation: GET /fhir/Observation?patient={patientId}&_sort=-date
//     return [];
//   }

//   Future<void> updatePatientData(
//     String patientId,
//     Map<String, dynamic> fhirObservation,
//   ) async {
//     // Simulate updating patient data
//     // In real implementation: POST /fhir/Observation with FHIR-compliant JSON
//   }
// }

// // Data models for FHIR observations
// class PatientData {
//   final String patientId;
//   final BloodPressure bloodPressure;
//   final int heartRate;
//   final int bloodGlucose;
//   final int pulse;
//   final double weightKg;
//   final int steps;
//   final double sleepHours;
//   final int calorieIntake;

//   PatientData({
//     required this.patientId,
//     required this.bloodPressure,
//     required this.heartRate,
//     required this.bloodGlucose,
//     required this.pulse,
//     required this.weightKg,
//     required this.steps,
//     required this.sleepHours,
//     required this.calorieIntake,
//   });

//   // Convert to FHIR Observation format
//   Map<String, dynamic> toFHIRObservations() {
//     return {
//       'resourceType': 'Bundle',
//       'type': 'collection',
//       'entry': [
//         _createObservation(
//           'blood-pressure',
//           '${bloodPressure.systolic}/${bloodPressure.diastolic}',
//           'mmHg',
//         ),
//         _createObservation('heart-rate', heartRate.toString(), 'bpm'),
//         _createObservation('blood-glucose', bloodGlucose.toString(), 'mg/dL'),
//         _createObservation('pulse', pulse.toString(), 'bpm'),
//         _createObservation('body-weight', weightKg.toString(), 'kg'),
//         _createObservation('steps', steps.toString(), 'steps'),
//         _createObservation('sleep-duration', sleepHours.toString(), 'hours'),
//         _createObservation('calorie-intake', calorieIntake.toString(), 'kcal'),
//       ],
//     };
//   }

//   Map<String, dynamic> _createObservation(
//     String code,
//     String value,
//     String unit,
//   ) {
//     return {
//       'resourceType': 'Observation',
//       'status': 'final',
//       'category': [
//         {
//           'coding': [
//             {
//               'system':
//                   'http://terminology.hl7.org/CodeSystem/observation-category',
//               'code': 'vital-signs',
//               'display': 'Vital Signs',
//             },
//           ],
//         },
//       ],
//       'code': {
//         'coding': [
//           {'system': 'http://loinc.org', 'code': code},
//         ],
//       },
//       'subject': {'reference': 'Patient/$patientId'},
//       'valueQuantity': {'value': value, 'unit': unit},
//       'effectiveDateTime': DateTime.now().toIso8601String(),
//     };
//   }
// }

// class BloodPressure {
//   final int systolic;
//   final int diastolic;

//   BloodPressure({required this.systolic, required this.diastolic});
// }
