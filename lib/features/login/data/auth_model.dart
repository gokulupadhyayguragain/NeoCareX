enum AuthType { manual, google, apple }

class AuthModel {
  final String? email;
  final String? password;
  final AuthType type;

  AuthModel({this.email, this.password, required this.type});
}
