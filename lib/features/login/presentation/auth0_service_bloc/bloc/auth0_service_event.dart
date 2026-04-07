part of 'auth0_service_bloc.dart';

@freezed
class Auth0ServiceEvent with _$Auth0ServiceEvent {
  const factory Auth0ServiceEvent.started() = _Started;
  const factory Auth0ServiceEvent.login(AuthModel model) = _LogIn;
  const factory Auth0ServiceEvent.logout() = _LogOut;
  const factory Auth0ServiceEvent.googlelogin() = _GoogleLogIn;
  const factory Auth0ServiceEvent.googlelogout() = _GoogleLogOut;
  const factory Auth0ServiceEvent.applelogin() = _AppleLogIn;
  const factory Auth0ServiceEvent.applelogout() = _AppleLogOut;
  const factory Auth0ServiceEvent.signup() = _SignUp;
}
