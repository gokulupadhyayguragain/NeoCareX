/* import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    required String email,
    required String password,
    @Default('') String uid,
    @Default('') String displayName,
    @Default(false) bool emailVerified,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  factory AuthModel.fromFirebaseUser(User user) {
    return AuthModel(
      email: user.email ?? '',
      password: '', 
      uid: user.uid,
      displayName: user.displayName ?? '',
      emailVerified: user.emailVerified,
    );
  }
}

extension AuthModelExtension on AuthModel {
  String get displayEmail => email;
  String get displayNameOrEmail => displayName.isNotEmpty ? displayName : email;
  bool get hasValidEmail => email.isNotEmpty && email.contains('@');
} */