import 'dart:convert';
import 'dart:developer';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:patient_app/constants/environment.dart';
import 'package:patient_app/core/auth/dio.dart';

import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:patient_app/features/login/data/auth_model.dart';
import 'package:patient_app/features/login/data/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth0_service_event.dart';
part 'auth0_service_state.dart';
part 'auth0_service_bloc.freezed.dart';

class Auth0ServiceBloc extends Bloc<Auth0ServiceEvent, Auth0ServiceState> {
  Credentials? credentials;
  UserProfile? _user;
  final AuthService authService;
  late Auth0 auth0;
  late Auth0Web auth0Web;
  Auth0ServiceBloc(this.authService) : super(const _Initial()) {
    if (kIsWeb) {
      auth0Web = Auth0Web(
        Environment.auth0Domain,
        Environment.auth0ClientId,
        redirectUrl: Environment.auth0RedirectUrl,
      );
    } else {
      auth0 = Auth0(Environment.auth0Domain, Environment.auth0ClientId);
    }
    on<_Started>(_onStarted);
    on<_GoogleLogIn>(_onGoogleLogin);
    on<_AppleLogIn>(_onAppleLogIn);
    on<_AppleLogOut>(_onAppleLogOut);
    on<_GoogleLogOut>(_onGoogleLogOut);
    on<_LogIn>(_onLogIn);
    on<_LogOut>(_onLogOut);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<Auth0ServiceState> emit,
  ) async {
    auth0Web = Auth0Web(
      Environment.auth0Domain,
      Environment.auth0ClientId,
      redirectUrl: Environment.auth0RedirectUrl,
    );
    await auth0Web
        .onLoad(audience: "https://dev-hzeb55fj.us.auth0.com/api/v2/")
        .then((final credentials) {});
    // try {
    //   print("starting");
    //   Credentials? userCredentials;

    //   // final result = await auth0Web
    //   //     .onLoad(audience: "https://dev-hzeb55fj.us.auth0.com/api/v2/")
    //   //     .then((final credentials) async {
    //   //       print("The credentials of user are");
    //   //       print(credentials);
    //   //       print(credentials?.accessToken);
    //   //       if (credentials?.accessToken != null) {
    //   //         final storage = SecureStorageService();
    //   //         await storage.saveString(
    //   //           "access_token",
    //   //           credentials?.accessToken.toString() ?? '',
    //   //         );
    //   //         await storage.saveString("method", "google");
    //   //         _user = credentials?.user;
    //   //         userCredentials = credentials;
    //   //       }
    //   //     });
    //   // if (_user != null) {
    //   //   print("The credentials are");
    //   //   print(_user?.toMap().toString());
    //   //   emit(Auth0ServiceState.googleloginSuccessful());
    //   // }
    // } catch (e) {
    //   print("printing error");
    //   print(e);
    // }
  }

  Future<void> _onAppleLogIn(
    _AppleLogIn event,
    Emitter<Auth0ServiceState> emit,
  ) async {
    emit(Auth0ServiceState.appleloggingin());
    try {
      print('loggin in apple');
      final storage = SecureStorageService();
      await storage.saveString("method", 'apple');
      if (kIsWeb) {
        // Web login
        // await auth0Web.loginWithRedirect(
        //   redirectUrl: Environment.auth0RedirectUrl,
        //   audience: "https://dev-hzeb55fj.us.auth0.com/api/v2/",
        //   parameters: {'connection': 'google-oauth2'},
        // );

        //   credentials = await auth0Web.onLoad();
        //    await storage.saveString(
        //   "access_token",
        //   credentials?.accessToken ?? "null",
        // );
      } else {
        // Android + iOS login
        log("I am logging in google");
        try {
          credentials = await auth0
              .webAuthentication(scheme: "co.gheit.vitalcarex")
              .login(
                // redirectUrl:
                //     'https://dev-hzeb55fj.us.auth0.com/ios/co.gheit.vitalcarex/callback',
                useHTTPS: false,
                audience: "https://dev-hzeb55fj.us.auth0.com/api/v2/",
                parameters: {'connection': 'apple'},
              );
        } catch (e) {
          print("AUTH ERROR: $e");
        }

        log(
          "The credentials are" + {credentials?.accessToken ?? ' '}.toString(),
        );
        await storage.saveString(
          "access_token",
          credentials?.accessToken ?? "null",
        );
        await storage.saveString("method", "apple");
        emit(Auth0ServiceState.appleloginSuccessful());
        _user = credentials?.user;
        if (_user != null) {
          print("The credentials are");
          print(_user?.toMap().toString());
          emit(Auth0ServiceState.appleloginSuccessful());
        }
      }

      // if (kIsWeb) {
      // await auth0Web.loginWithRedirect(
      //   redirectUrl: Environment.auth0RedirectUrl,
      //   audience: "https://dev-hzeb55fj.us.auth0.com/api/v2/",
      //   parameters: {'connection': 'google-oauth2'},
      // );
      // final result = await auth0Web.onLoad().then((final credentials) async {
      //   final storage = SecureStorageService();
      //   await storage.saveString(
      //     "access_token",
      //     credentials?.accessToken ?? 'null',
      //   );
      // });
    } catch (e) {
      print(e);
      emit(Auth0ServiceState.appleloginFailure());
    }
  }

  Future<void> _onGoogleLogin(
    _GoogleLogIn event,
    Emitter<Auth0ServiceState> emit,
  ) async {
    emit(Auth0ServiceState.googleloggingin());
    try {
      print('loggin in google');
      final storage = SecureStorageService();
      await storage.saveString("method", 'google');
      if (kIsWeb) {
        // Web login
        print("This is web");
        Credentials credentials = await auth0Web.loginWithPopup(
          audience: "https://dev-hzeb55fj.us.auth0.com/api/v2/",
          parameters: {'connection': 'google-oauth2'},
        );
        if (credentials?.accessToken != null) {
          final storage = SecureStorageService();
          await storage.saveString(
            "access_token",
            credentials.accessToken.toString() ?? '',
          );
          await storage.saveString("method", "google");
          _user = credentials.user;
          //userCredentials = credentials;
        }
        if (_user != null) {
          print("The credentials are");
          print(_user?.toMap().toString());
          emit(Auth0ServiceState.googleloginSuccessful());
        }
        // await auth0Web.loginWithRedirect(
        //   redirectUrl: Environment.auth0RedirectUrl,
        //   audience: "https://dev-hzeb55fj.us.auth0.com/api/v2/",
        //   parameters: {'connection': 'google-oauth2'},
        // );

        //   credentials = await auth0Web.onLoad();
        //    await storage.saveString(
        //   "access_token",
        //   credentials?.accessToken ?? "null",
        // );
      } else {
        // Android + iOS login
        log("I am logging in google");
        credentials = await auth0
            .webAuthentication(scheme: "co.gheit.vitalcarex")
            .login(
              useHTTPS: false,
              audience: "https://dev-hzeb55fj.us.auth0.com/api/v2/",
              parameters: {'connection': 'google-oauth2'},
            );
        log(
          "The credentials are" + {credentials?.accessToken ?? ' '}.toString(),
        );
        await storage.saveString(
          "access_token",
          credentials?.accessToken ?? "null",
        );
        await storage.saveString("method", "google");
        emit(Auth0ServiceState.googleloginSuccessful());
        _user = credentials?.user;
        if (_user != null) {
          print("The credentials are");
          print(_user?.toMap().toString());
          emit(Auth0ServiceState.googleloginSuccessful());
        }
      }

      // if (kIsWeb) {
      // await auth0Web.loginWithRedirect(
      //   redirectUrl: Environment.auth0RedirectUrl,
      //   audience: "https://dev-hzeb55fj.us.auth0.com/api/v2/",
      //   parameters: {'connection': 'google-oauth2'},
      // );
      // final result = await auth0Web.onLoad().then((final credentials) async {
      //   final storage = SecureStorageService();
      //   await storage.saveString(
      //     "access_token",
      //     credentials?.accessToken ?? 'null',
      //   );
      // });
    } catch (e) {
      print(e);
      emit(Auth0ServiceState.googleloginFailure());
    }
  }

  Future<void> _onGoogleLogOut(
    _GoogleLogOut event,
    Emitter<Auth0ServiceState> emit,
  ) async {
    emit(Auth0ServiceState.googleloggingout());
    try {
      final storage = SecureStorageService();
      await storage.remove("userPayload");
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      if (kIsWeb) {
        await auth0Web.logout(returnToUrl: Environment.auth0LogouttUrl);
      } else {
        await auth0
            .webAuthentication(scheme: "co.gheit.vitalcarex")
            .logout(useHTTPS: false);
      }

      emit(Auth0ServiceState.googlelogoutSuccessful());
    } catch (e) {
      print(e);
      emit(Auth0ServiceState.googlelogoutFailure());
    }
  }

  Future<void> _onAppleLogOut(
    _AppleLogOut event,
    Emitter<Auth0ServiceState> emit,
  ) async {
    emit(Auth0ServiceState.appleloggingout());
    try {
      final storage = SecureStorageService();
      await storage.remove("userPayload");
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      if (kIsWeb) {
        await auth0Web.logout(returnToUrl: Environment.auth0LogouttUrl);
      } else {
        await auth0
            .webAuthentication(scheme: "co.gheit.vitalcarex")
            .logout(useHTTPS: false);
      }

      emit(Auth0ServiceState.applelogoutSuccessful());
    } catch (e) {
      print(e);
      emit(Auth0ServiceState.applelogoutFailure());
    }
  }

  Future<void> _onLogIn(_LogIn event, Emitter<Auth0ServiceState> emit) async {
    try {
      emit(Auth0ServiceState.loading());
      DioClient dioclient = DioClient();

      Response response = await dioclient.dio.post(
        "/auth/login",
        data: {"username": event.model.email, "password": event.model.password},
      );
      // print("The access token that will be saved is");
      // print(response.data["access_token"]);
      Map<String, dynamic> payload = {};
      payload = Map<String, dynamic>.from(response.data)..remove("createdAt");
      final storage = SecureStorageService();
      await storage.saveString("access_token", response.data["access_token"]);
      await storage.saveString("refresh_token", response.data["refresh_token"]);

      print("[v0] Login response keys: ${response.data.keys}");

      try {
        final String accessToken = response.data["access_token"];
        final tokenPreview = accessToken.length > 50
            ? accessToken.substring(0, 50)
            : accessToken;
        print("[v0] Access token (first 50 chars): $tokenPreview");
        final parts = accessToken.split('.');
        print("[v0] JWT parts count: ${parts.length}");

        if (parts.length == 3) {
          String jwtPayload = parts[1];

          switch (jwtPayload.length % 4) {
            case 1:
              jwtPayload += '===';
              break;
            case 2:
              jwtPayload += '==';
              break;
            case 3:
              jwtPayload += '=';
              break;
          }

          try {
            final decodedBytes = base64Url.decode(jwtPayload);
            final decodedJson = jsonDecode(utf8.decode(decodedBytes));

            print("[v0] JWT decoded claims: $decodedJson");
            print("role is ${decodedJson['http://example.com/role']}");
            final patientId = decodedJson['http://example.com/patient_id'];
            final role = decodedJson['http://example.com/role'];
            if (role != null) {
              await storage.saveString('role', role.toString());
            }
            if (patientId != null) {
              await storage.saveString("patientId", patientId.toString());
              print("[v0] PatientId saved successfully: $patientId");
            } else {
              print(
                "[v0] PatientId claim not found in JWT. Available claims: ${decodedJson.keys.toList()}",
              );
            }
          } catch (decodeError) {
            print("[v0] JWT decode error: $decodeError");
          }
        }
      } catch (e) {
        print("[v0] Error extracting patientId from JWT: $e");
      }

      await storage.saveMap("userPayload", payload);
      await storage.saveString("method", 'email-password');
      emit(Auth0ServiceState.loginSuccessful());

      // final credential = await authService.signIn(event.model);

      // User? user = FirebaseAuth.instance.currentUser;
      // if (user != null) {
      //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
      //       .collection('users')
      //       .doc(user.uid)
      //       .get();

      //   if (snapshot.exists && snapshot.data() != null) {
      //     final rawData = snapshot.data() as Map<String, dynamic>;
      //     // print("The payload data is");
      //     // print(payload);
      //     payload = Map<String, dynamic>.from(rawData)..remove("createdAt");
      //   } else {
      //     //print("No payload data found for this user.");
      //   }
      // }
    } on DioError catch (e) {
      print("printing error");
      print(e);
      emit(Auth0ServiceState.error(e.response!.data['Error'] ?? ''));
    }
  }

  Future<void> _onLogOut(_LogOut event, Emitter<Auth0ServiceState> emit) async {
    emit(Auth0ServiceState.loggingout());
    try {
      Dio dio = Dio();

      final storage = SecureStorageService();
      Map<String, dynamic>? userData = await storage.readMap("userPayload");
      Response response = await dio.post(
        "https://dev.vitalcarex.backend.gheit.co/auth/revoke",
        data: {"refresh_token": userData?["refresh_token"] ?? ''},
      );
      await storage.remove("userPayload");
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      emit(Auth0ServiceState.logoutSuccessful());
    } catch (e) {
      print(e);
      emit(Auth0ServiceState.logoutFailure());
    }
  }
}
