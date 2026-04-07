import 'package:flutter/material.dart';

import 'widgets/patient_form.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Patient")),
      body: PatientForm(),
    );
  }
}
