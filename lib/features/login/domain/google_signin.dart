// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:hive/hive.dart';

// Future<UserCredential> signInWithGoogle() async {
//   final Box _authBox = Hive.box('authBox');

//   try {
//     // Check Firebase initialization
//     if (FirebaseAuth.instance.app.options.projectId == null) {
//       throw "Firebase is not initialized properly.";
//     }

//     // 🌐 Web sign-in
//     if (kIsWeb) {
//       GoogleAuthProvider googleProvider = GoogleAuthProvider();
//       googleProvider.addScope(
//         'https://www.googleapis.com/auth/contacts.readonly',
//       );
//       googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

//       final response = await FirebaseAuth.instance.signInWithPopup(
//         googleProvider,
//       );

//       final idToken = await response.user?.getIdToken();
//       if (idToken != null) await _authBox.put('accessToken', idToken);

//       return response;
//     }
//     // 📱 Mobile sign-in
//     else {
//       if (Platform.isAndroid) {
//         await GoogleSignIn().signOut(); // Ensure fresh login
//       }

//       final GoogleSignInAccount? googleUser = await GoogleSignIn(
//         clientId: Platform.isAndroid
//             ? null
//             : "886089009947-2tojc20icc1qdrr6cnh1stbs9061f7mr.apps.googleusercontent.com",
//       ).signIn();

//       if (googleUser == null) {
//         throw "Google sign-in was aborted.";
//       }

//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final response = await FirebaseAuth.instance.signInWithCredential(
//         credential,
//       );

//       final idToken = await response.user?.getIdToken();
//       if (idToken != null) await _authBox.put('accessToken', idToken);

//       return response;
//     }
//   } on FirebaseAuthException catch (e) {
//     // Map Firebase errors to friendly messages
//     String message;
//     switch (e.code) {
//       case 'account-exists-with-different-credential':
//         message = "Account exists with different credentials.";
//         break;
//       case 'invalid-credential':
//         message = "Invalid Google credentials.";
//         break;
//       case 'operation-not-allowed':
//         message = "Google sign-in is not enabled.";
//         break;
//       case 'user-disabled':
//         message = "This account has been disabled.";
//         break;
//       case 'user-not-found':
//         message = "No user found with this account.";
//         break;
//       case 'wrong-password':
//         message = "Wrong credentials provided.";
//         break;
//       default:
//         message = "Authentication failed. Please try again.";
//     }
//     throw message;
//   } catch (e) {
//     // Generic fallback for unexpected errors
//     throw e.toString().replaceAll('Exception: ', '');
//   }
// }
