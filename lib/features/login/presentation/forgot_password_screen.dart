import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:patient_app/features/login/presentation/email_sent_widget.dart';
import 'package:patient_app/features/login/presentation/enter_email_widget.dart';
import 'package:patient_app/features/login/presentation/error_message_service.dart';

import '../../../core/auth/dio.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key, required this.isRecovery});
  final bool isRecovery;

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool showEmailPage = true;
  TextEditingController emailEditingController = TextEditingController();

  @override
  void dispose() {
    emailEditingController.dispose();
    super.dispose();
  }

  bool loading = false;

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      setState(() {
        loading = true;
      });
      // Dio dio = Dio();
      // final storage = SecureStorageService();
      // final idToken = await storage.readString("access_token");
      DioClient dioclient = DioClient();
      final response = await dioclient.dio.post(
        '/auth/reset_password',
        data: {"email": email},
      );
      setState(() {
        loading = false;
      });
      if (response.statusCode == 200) {
        showSuccessMessage("${response.data}", context);
        setState(() {
          showEmailPage = false;
        });
      } else {
        showErrorMessage(
          "Unexpected response: ${response.statusCode}",
          context,
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        showErrorMessage("Error: ${e.response?.data}", context);
      } else {
        showErrorMessage("Request failed: ${e.message}", context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Center(
            child: showEmailPage
                ? EnterEmailWidget(
                    isRecovery: widget.isRecovery,
                    makeEmailFalse: makeEmailFalse,
                    emailEditingController: emailEditingController,
                    resetPassword: resetPassword,
                    loading: loading,
                  )
                : EmailSentWidget(
                    isRecovery: widget.isRecovery,
                    makeEmailTrue: makeEmailTrue,
                    emailEditingControllere: emailEditingController,
                  ),
          ),
        ],
      ),
    );
  }

  void makeEmailTrue() {
    showEmailPage = true;
    setState(() {});
  }

  void makeEmailFalse() {
    showEmailPage = false;
    setState(() {});
  }
}
