// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/web/url_launcher.dart';
import 'package:patient_app/features/launch/presentation/bloc/openEmrBloc/open_emr_bloc.dart';
import 'package:patient_app/features/launch/presentation/bloc/openEmrBloc/open_emr_state.dart';
import 'package:patient_app/features/login/presentation/error_message_service.dart';
import 'package:patient_app/constants/environment.dart';
import 'bloc/openEmrBloc/open_emr_event.dart';

class EHRLaunch extends StatefulWidget {
  const EHRLaunch({required this.queryParameters, super.key});

  /// query parameters of current launched url.
  final Map<String, String> queryParameters;

  @override
  State<EHRLaunch> createState() => _EHRLaunchState();
}

class _EHRLaunchState extends State<EHRLaunch> {
  @override
  void initState() {
    print("Instance Running is");
    print(Environment.instance);
    print("I am in open EMR page");
    super.initState();
    print("The query parmeter is");
    print(widget.queryParameters);
    context.read<OpenemrEhrLaunchBloc>().add(
      LaunchAndHandle(
        launch: widget.queryParameters['launch'],
        callBack: (url) {
          final completer = Completer<Uri>();
          final urlLauncher = UrlLauncherAndListenerUniversal(
            url,
            context,
          ).instance;

          urlLauncher.stream
              .listen((event) {
                completer.complete(event);
              })
              .onDone(() {
                urlLauncher.close(); // should close the stream
              });

          return completer.future;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocListener<OpenemrEhrLaunchBloc, OpenemrEhrLaunchState>(
      listener: (context, state) async {
        if (state is OpenemrEhrFailure) {
          print("Open EMR failed");
          showErrorMessage(state.message, context);
        }
        if (state is OpenemrEhrLoaded) {
          print("Open EMR Success");
          context.go("/home");
          // context.goNamed(
          //   'home',
          //   // extra: {'bundle': state.bundle},
          // );
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [CircularProgressIndicator(), Text("Loading...")],
        ),
      ),
    ),
  );
}
