import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:patient_app/features/login/presentation/error_message_service.dart';
import 'package:patient_app/features/login/presentation/login_textformfield_widget.dart';

class EnterEmailWidget extends StatefulWidget {
  EnterEmailWidget({
    super.key,
    required this.makeEmailFalse,
    required this.emailEditingController,
    required this.isRecovery,
    required this.resetPassword,
    required this.loading,
  });
  final bool isRecovery;
  final Function resetPassword;
  final Function makeEmailFalse;
  final TextEditingController emailEditingController;
  final bool loading;

  @override
  State<EnterEmailWidget> createState() => _EnterEmailWidgetState();
}

class _EnterEmailWidgetState extends State<EnterEmailWidget> {
  final _formKey = GlobalKey<FormState>();

  final emailRedirectText =
      "Please enter your registered email address to get instructions for password recovery";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final isMobile = MediaQuery.of(context).size.width < 600;

    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Form(
      key: _formKey,
      child: isMobile
          ? mobileView(
              context: context,
              isDark: isDark,
              size: size,
              loading: widget.loading,
              // sendingRequest: SendingRequest,
              // requestSent: RequestSent,
            )
          : webView(
              context: context,
              isDark: isDark,
              size: size,
              loading: widget.loading,
              // sendingRequest: SendingRequest,
              // requestSent: RequestSent,
            ),
    );
  }

  Widget webView({
    required BuildContext context,
    required bool isDark,
    required Size size,
    required bool loading,
    // required Function sendingRequest,
    // required Function requestSent,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          ),
                        ),
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Recovery ",
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(
                                      color: isDark
                                          ? Colors.white
                                          : Theme.of(context).primaryColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(height: 1, color: Colors.grey),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * .02,
                      right: size.width * .02,
                      bottom: size.height * .05,
                      top: size.height * .02,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                emailRedirectText,
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        LoginTextFormfieldWidget(
                          hasHeader: false,
                          placeholder: "Email",
                          hintText: "Email",
                          isRequired: true,
                          controller: widget.emailEditingController,
                          validator: validateEmail,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (widget.emailEditingController.text == "") {
                              showErrorMessage("Enter Email", context);
                              return;
                            }

                            if (_formKey.currentState!.validate()) {
                              //sendingRequest();
                              widget.resetPassword(
                                widget.emailEditingController.text,
                                context,
                              );
                              //requestSent();
                              // context.read<RecoveryCubit>().fetchRecoveryPassword(
                              //     email: emailEditingController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: const Color(0xff24488E),
                          ),
                          child: loading
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Submit',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            widget.isRecovery
                                ? context.goNamed('login')
                                : context.goNamed('login');
                          },
                          child: Text(
                            widget.isRecovery
                                ? 'Go Back to Login'
                                : 'Go back to Profile',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileView({
    required BuildContext context,
    required bool isDark,
    required Size size,
    required bool loading,
    // required Function sendingRequest,
    // required Function requestSent,
  }) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Recovery",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: isDark ? Colors.white : Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * .02,
                    right: size.width * .02,
                    bottom: size.height * .05,
                    top: size.height * .02,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          emailRedirectText,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        LoginTextFormfieldWidget(
                          hasHeader: false,
                          placeholder: "Email",
                          hintText: "Email",
                          isRequired: true,
                          controller: widget.emailEditingController,
                          validator: validateEmail,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (widget.emailEditingController.text == "") {
                              showErrorMessage("Enter Email", context);
                              return;
                            }

                            if (_formKey.currentState!.validate()) {
                              // sendingRequest();
                              widget.resetPassword(
                                widget.emailEditingController.text,
                                context,
                              );
                              //requestSent();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xff24488E),
                          ),
                          child: widget.loading
                              ? CircularProgressIndicator()
                              : Text(
                                  'Submit',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            widget.isRecovery
                                ? context.goNamed('login')
                                : context.goNamed('login');
                          },
                          child: Text(
                            widget.isRecovery
                                ? 'Go Back to Login'
                                : 'Go back to Profile',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    const pattern =
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    if (value == null || value == "" || value.isEmpty) {
      return 'The field is empty';
    }

    return value.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }
}
