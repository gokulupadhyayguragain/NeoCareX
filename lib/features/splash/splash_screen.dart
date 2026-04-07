import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/features/login/presentation/auth0_service_bloc/bloc/auth0_service_bloc.dart';
import 'package:patient_app/features/login/presentation/bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  final bool? fromLogin;
  final Map<String, String>? queryParameters;
  const SplashScreen({super.key, this.fromLogin, this.queryParameters});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print(" I am in Splash Screen");
    print(widget.fromLogin);
    if (widget.fromLogin == true) {
      context.go('/login');
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<Auth0ServiceBloc, Auth0ServiceState>(
      listener: (context, state) {
        state.maybeWhen(
          initial: () {},
          orElse: () {},
          // loginSuccessful: () {
          //   return '/launch';
          // },
          googleloginSuccessful: () {
            return '/home';
          },
          appleloginSuccessful: () {
            return '/home';
          },
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_hospital, size: 80, color: Colors.white),
              SizedBox(height: 24),
              Text(
                'Patient App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Loading...',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
