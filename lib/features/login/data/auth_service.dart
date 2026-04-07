import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'auth_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Box _authBox = Hive.box('authBox');

  Future<UserCredential> signIn(AuthModel model) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: model.email!,
        password: model.password!,
      );

      final idToken = await credential.user?.getIdToken();
      if (idToken != null) {
        await _authBox.put('accessToken', idToken);
      }

      return credential;
    } on FirebaseAuthException catch (e) {
      // Handle all FirebaseAuth-specific errors
      // print("The error is");
      // print(e);
      switch (e.code) {
        case 'invalid-email':
          throw Exception('The email address is badly formatted.');
        case 'user-disabled':
          throw Exception('This user has been disabled.');
        case 'user-not-found':
          throw Exception('No user found with this email.');
        case 'wrong-password':
          throw Exception('Incorrect password.');
        case 'too-many-requests':
          throw Exception('Too many attempts. Try again later.');
        case 'invalid-credential':
          throw Exception('Invalid credentials. Please check and try again.');
        default:
          throw Exception('Authentication failed: ${e.message}');
      }
    } catch (e) {
      // Generic error fallback
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _authBox.delete('accessToken');
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  String? getAccessToken() {
    return _authBox.get('accessToken');
  }
}
