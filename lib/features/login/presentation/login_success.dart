import 'package:flutter/material.dart';

class LoginSuccessfullPage extends StatefulWidget {
  const LoginSuccessfullPage({super.key});

  @override
  State<LoginSuccessfullPage> createState() => _LoginSuccessfullPageState();
}

class _LoginSuccessfullPageState extends State<LoginSuccessfullPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Login was successfull")],
    );
  }
}
