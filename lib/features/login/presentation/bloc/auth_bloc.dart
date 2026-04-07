// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:patient_app/core/storage/secure_storage.dart';
// import 'package:patient_app/features/login/data/auth_model.dart';
// import 'package:patient_app/features/login/data/auth_service.dart';
// import 'package:patient_app/features/login/domain/google_signin.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';
// part 'auth_bloc.freezed.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final AuthService authService;

//   AuthBloc(this.authService) : super(AuthState.initial()) {
//     on<_CheckAuthStatus>(_onCheckAuthStatus);
//     on<_SignIn>(_onSignIn);
//     on<_SignOut>(_onSignOut);
//   }

//   Future<void> _onCheckAuthStatus(
//     _CheckAuthStatus event,
//     Emitter<AuthState> emit,
//   ) async {
//     emit(AuthState.loading());
//     try {
//       Map<String, dynamic> payload = {};
//       final user = authService.getCurrentUser();
//       final token = authService.getAccessToken();

//       if (user != null) {
//         DocumentSnapshot snapshot = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .get();

//         if (snapshot.exists && snapshot.data() != null) {
//           final rawData = snapshot.data() as Map<String, dynamic>;
//           // print("The payload data is");
//           // print(payload);
//           payload = Map<String, dynamic>.from(rawData)..remove("createdAt");
//         } else {
//           //print("No payload data found for this user.");
//         }
//       }

//       if (user != null) {
//         emit(AuthState.authenticated(user, payload));
//       } else if (token != null) {
//         emit(AuthState.authenticated(null, payload));
//       } else {
//         emit(AuthState.unauthenticated());
//       }
//     } catch (e) {
//       emit(AuthState.error(e.toString()));
//     }
//   }

//   Future<void> _onSignIn(_SignIn event, Emitter<AuthState> emit) async {
//     emit(AuthState.loading());
//     try {
//       Map<String, dynamic> payload = {};
//       if (event.model.type == AuthType.manual) {
//         final credential = await authService.signIn(event.model);

//         User? user = FirebaseAuth.instance.currentUser;
//         if (user != null) {
//           DocumentSnapshot snapshot = await FirebaseFirestore.instance
//               .collection('users')
//               .doc(user.uid)
//               .get();

//           if (snapshot.exists && snapshot.data() != null) {
//             final rawData = snapshot.data() as Map<String, dynamic>;
//             // print("The payload data is");
//             // print(payload);
//             payload = Map<String, dynamic>.from(rawData)..remove("createdAt");
//           } else {
//             //print("No payload data found for this user.");
//           }
//         }
//         final storage = SecureStorageService();
//         await storage.saveMap("userPayload", payload);
//         emit(AuthState.authenticated(credential.user!, payload));
//       } else if (event.model.type == AuthType.google) {
//         final usercredential = await signInWithGoogle();

//         User? user = FirebaseAuth.instance.currentUser;

//         if (user != null) {
//           // final storage = SecureStorageService();
//           // await storage.saveMap(
//           //   "userPayload",
//           //   usercredential.credential as Map<String, dynamic>,
//           // );
//         }
//         emit(AuthState.authenticated(usercredential.user, payload));
//       }
//     } catch (e) {
//       // print("The error is emitted");
//       emit(AuthState.error(e.toString()));
//     }
//   }

//   Future<void> _onSignOut(_SignOut event, Emitter<AuthState> emit) async {
//     emit(AuthState.loading());
//     try {
//       await authService.signOut();
//       emit(AuthState.unauthenticated());
//     } catch (e) {
//       emit(AuthState.error(e.toString()));
//     }
//   }
// }
