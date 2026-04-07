import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/router/app_router.dart';
import 'package:patient_app/core/storage/secure_storage.dart';

class EmailVerifiedPage extends StatelessWidget {
  const EmailVerifiedPage({super.key});
  Future<void> _goToLogin(BuildContext context) async {
    final storage = SecureStorageService();
    await storage.remove("access_token");
    isEmailVerificationRoute = false;
    if (context.mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            const Text("Email Verified!", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            const Text(
              "Your email has been successfully verified.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () => _goToLogin(context),
              child: const Text(
                "Go to Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
