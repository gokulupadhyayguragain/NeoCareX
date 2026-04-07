part of 'auth0_service_bloc.dart';

@freezed
class Auth0ServiceState with _$Auth0ServiceState {
  const factory Auth0ServiceState.initial() = _Initial;
  const factory Auth0ServiceState.loggingin() = _LoggingIn;
  const factory Auth0ServiceState.loginSuccessful() = _LoginSuccessful;
  const factory Auth0ServiceState.loginFailure() = _LoginFailure;
  const factory Auth0ServiceState.loggingout() = _LoggingOut;
  const factory Auth0ServiceState.logoutSuccessful() = _LogOutSuccessful;
  const factory Auth0ServiceState.logoutFailure() = _LogOutFailure;
  const factory Auth0ServiceState.googleloggingin() = _GoogleLoggingIn;
  const factory Auth0ServiceState.googleloginSuccessful() =
      _GoogleLoginSuccessful;
  const factory Auth0ServiceState.googleloginFailure() = _GoogleLoginFailure;
  const factory Auth0ServiceState.googleloggingout() = _GoogleLoggingOut;
  const factory Auth0ServiceState.googlelogoutSuccessful() =
      _GoogleLogOutSuccessful;
  const factory Auth0ServiceState.googlelogoutFailure() = _GoogleLogOutFailure;
  const factory Auth0ServiceState.appleloggingin() = _AppleLoggingIn;
  const factory Auth0ServiceState.appleloginSuccessful() =
      _AppleLoginSuccessful;
  const factory Auth0ServiceState.appleloginFailure() = _AppleLoginFailure;
  const factory Auth0ServiceState.appleloggingout() = _AppleLoggingOut;
  const factory Auth0ServiceState.applelogoutSuccessful() =
      _AppleLogOutSuccessful;
  const factory Auth0ServiceState.applelogoutFailure() = _AppleLogOutFailure;
  const factory Auth0ServiceState.signingup() = _SigningUp;
  const factory Auth0ServiceState.signupSuccessful() = _SignUpSuccessful;
  const factory Auth0ServiceState.signupFailure() = _SignUpFailure;
  const factory Auth0ServiceState.error(String message) = _Error;
  const factory Auth0ServiceState.loading() = _Loading;
}
