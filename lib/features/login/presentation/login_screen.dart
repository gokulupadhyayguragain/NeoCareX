import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/constants/environment.dart';
import 'package:patient_app/features/login/data/auth_model.dart';
import 'package:patient_app/features/login/presentation/auth0_service_bloc/bloc/auth0_service_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  final String? redirect;
  const LoginScreen({super.key, this.redirect});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  // Credentials? _credentials;

  // late Auth0Web auth0Web;
  // late Auth0 auth0;
  // UserProfile? _user;
  @override
  void initState() {
    print("Instance Running is");
    print(Environment.instance);
    print("the redirect value is 00..");
    print(widget.redirect);
    super.initState();
    // auth0 = Auth0(
    //   "dev-hzeb55fj.us.auth0.com",
    //   "vx65DZrup2e1iBu5vZRddyDtVkR0gskK",
    // );
    // auth0Web = Auth0Web(
    //   "dev-hzeb55fj.us.auth0.com",
    //   "vx65DZrup2e1iBu5vZRddyDtVkR0gskK",
    // );

    // if (kIsWeb) {
    //   auth0Web.onLoad().then(
    //     (final credentials) => setState(() {
    //       _user = credentials?.user;
    //     }),
    //   );
    // }
    BlocProvider.of<Auth0ServiceBloc>(context).add(Auth0ServiceEvent.started());
    if (widget.redirect == 'true') {
      BlocProvider.of<Auth0ServiceBloc>(
        context,
      ).add(Auth0ServiceEvent.googlelogin());
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<Auth0ServiceBloc, Auth0ServiceState>(
        listener: (context, state) {
          state.maybeWhen(googleloginSuccessful: () {}, orElse: () {});
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWideScreen = constraints.maxWidth > 900;
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isWideScreen ? 500 : double.infinity,
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          child: _buildLoginForm(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'VitalCareX',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                SizedBox(width: 15),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF374151),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  final emailValue = value?.trim();
                  if (emailValue == null || emailValue.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(emailValue)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF374151),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                onFieldSubmitted: (val) {
                  if (_formKey.currentState!.validate()) {
                    context.read<Auth0ServiceBloc>().add(
                      Auth0ServiceEvent.login(
                        AuthModel(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          type: AuthType.manual,
                        ),
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                    activeColor: const Color(0xFF1E293B),
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(fontSize: 14, color: Color(0xFF374151)),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  context.goNamed('forgot-password');
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1E293B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<Auth0ServiceBloc, Auth0ServiceState>(
            builder: (context, state) {
              var errorMessage = state.whenOrNull(error: (msg) => msg);
              if (errorMessage != null) {
                if (errorMessage.contains("Exception:")) {
                  errorMessage = errorMessage.toString().split("Exception:")[1];
                }
                return Align(
                  alignment: Alignment.center,
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 16),
          BlocBuilder<Auth0ServiceBloc, Auth0ServiceState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size.fromHeight(45),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<Auth0ServiceBloc>().add(
                            Auth0ServiceEvent.login(
                              AuthModel(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                type: AuthType.manual,
                              ),
                            ),
                          );
                        }
                      },
                child: isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          //fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
              );
            },
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey[300])),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'or',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ),
              Expanded(child: Divider(color: Colors.grey[300])),
            ],
          ),
          const SizedBox(height: 24),

          OutlinedButton.icon(
            onPressed: () async {
              context.read<Auth0ServiceBloc>().add(
                const Auth0ServiceEvent.googlelogin(),
              );
            },

            icon: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/google_logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            label: const Text(
              'Sign in with Google',
              style: TextStyle(
                color: Color(0xFF374151),
                fontWeight: FontWeight.w500,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Color(0xFFE2E8F0)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 32),
          (!kIsWeb && Platform.isIOS)
              ? OutlinedButton.icon(
                  onPressed: () async {
                    context.read<Auth0ServiceBloc>().add(
                      const Auth0ServiceEvent.applelogin(),
                    );
                  },
                  icon: FaIcon(FontAwesomeIcons.apple, color: Colors.white),
                  label: const Text(
                    ' Sign in with Apple',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )
              : Container(),
          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              TextButton(
                onPressed: openContactPage,
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Color(0xFF1E293B),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> openContactPage() async {
  final Uri url = Uri.parse('https://gheit.co/contact/');

  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication, // opens in browser
  )) {
    throw Exception('Could not launch $url');
  }
}

    // auth0Web = Auth0Web(
    //   'dev-hzeb55fj.us.auth0.com',
    //   'SEAxyCOSHw67mj29fH2HdtfwTFeDrLSe',
    //   redirectUrl: "http://localhost:5000",
    // );
    // auth0Web
    //     .onLoad(
    //       issuer: "https://dev-hzeb55fj.us.auth0.com",
    //       scopes: {'openid', 'profile', 'email'},
    //       parameters: {'connection': 'google-oauth2'},
    //     )
    //     .then(
    //       (final credentials) => setState(() {
    //         _credentials = credentials;
    //       }),
    //     )
    //     .catchError((error) {
    //       Fluttertoast.showToast(
    //         msg: error.toString(),
    //         toastLength: Toast.LENGTH_LONG,
    //         gravity: ToastGravity.BOTTOM,
    //       );
    //     });

          // await auth0Web.loginWithRedirect(
            //   redirectUrl: window.location.origin,
            //   scopes: {'openid', 'profile', 'email'},
            //   parameters: {},
            // );
            // Credentials credentials = await auth0Web.loginWithPopup(

            //   // scopes: {
            //   //   'openid',
            //   //   'profile',
            //   //   'email',
            //   //   'read:users',
            //   //   'read:user_idp_tokens',
            //   // },
            //   // audience: 'https://dev-hzeb55fj.us.auth0.com/api/v2/',
            //   // parameters: {'connection': 'google-oauth2'},
            // );
            // print("The credentials is");
            // print(credentials);

            // print("The result is");
            // print(result);
            // Dio dio = Dio();
            // dio.post(
            //   "https://dev-hzeb55fj.us.auth0.com/oauth/token",
            //   options: Options(
            //     headers: {
            //       "content-type": "application/x-www-form-urlencoded",
            //     },
            //   ),
            //   data: {
            //     "grant_type": "client_credentials",
            //     "client_id": "SEAxyCOSHw67mj29fH2HdtfwTFeDrLSe",
            //     "client_secret":
            //         "cg_o8tJYUFGFcQEDb4mB03lVsejAjQrNQK3guFJixN7GyAD_bXjiuUd7RXLdczgm",
            //     "audience": "https://dev-hzeb55fj.us.auth0.com/api/v2/",
            //   },
            // );

            // Dio dio = Dio();
            // dio.post(
            //   "https://cors-anywhere.herokuapp.com/https://dev-hzeb55fj.us.auth0.com/oauth/token",
            //   options: Options(
            //     headers: {
            //       "content-type": "application/x-www-form-urlencoded",
            //     },
            //   ),
            //   data: {
            //     "grant_type": "authorization_code",
            //     "client_id": "SEAxyCOSHw67mj29fH2HdtfwTFeDrLSe",
            //     "code_verifier":
            //         "H90MWy5MfmaoWj0Jfk~u885YBuRymxzoHd~bck5uboh",
            //     "code": "V1YiVdpFNf7d3voTVRLKgdByaffialM1K90xk6czNWyVX",
            //     "redirect_uri": "http://localhost:5000",
            //     "audience": "https://dev-hzeb55fj.us.auth0.com/api/v2/",
            //   },
            // );
            //},