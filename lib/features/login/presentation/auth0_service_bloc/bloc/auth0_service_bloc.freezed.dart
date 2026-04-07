// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth0_service_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Auth0ServiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AuthModel model) login,
    required TResult Function() logout,
    required TResult Function() googlelogin,
    required TResult Function() googlelogout,
    required TResult Function() applelogin,
    required TResult Function() applelogout,
    required TResult Function() signup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AuthModel model)? login,
    TResult? Function()? logout,
    TResult? Function()? googlelogin,
    TResult? Function()? googlelogout,
    TResult? Function()? applelogin,
    TResult? Function()? applelogout,
    TResult? Function()? signup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AuthModel model)? login,
    TResult Function()? logout,
    TResult Function()? googlelogin,
    TResult Function()? googlelogout,
    TResult Function()? applelogin,
    TResult Function()? applelogout,
    TResult Function()? signup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) login,
    required TResult Function(_LogOut value) logout,
    required TResult Function(_GoogleLogIn value) googlelogin,
    required TResult Function(_GoogleLogOut value) googlelogout,
    required TResult Function(_AppleLogIn value) applelogin,
    required TResult Function(_AppleLogOut value) applelogout,
    required TResult Function(_SignUp value) signup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? login,
    TResult? Function(_LogOut value)? logout,
    TResult? Function(_GoogleLogIn value)? googlelogin,
    TResult? Function(_GoogleLogOut value)? googlelogout,
    TResult? Function(_AppleLogIn value)? applelogin,
    TResult? Function(_AppleLogOut value)? applelogout,
    TResult? Function(_SignUp value)? signup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? login,
    TResult Function(_LogOut value)? logout,
    TResult Function(_GoogleLogIn value)? googlelogin,
    TResult Function(_GoogleLogOut value)? googlelogout,
    TResult Function(_AppleLogIn value)? applelogin,
    TResult Function(_AppleLogOut value)? applelogout,
    TResult Function(_SignUp value)? signup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Auth0ServiceEventCopyWith<$Res> {
  factory $Auth0ServiceEventCopyWith(
          Auth0ServiceEvent value, $Res Function(Auth0ServiceEvent) then) =
      _$Auth0ServiceEventCopyWithImpl<$Res, Auth0ServiceEvent>;
}

/// @nodoc
class _$Auth0ServiceEventCopyWithImpl<$Res, $Val extends Auth0ServiceEvent>
    implements $Auth0ServiceEventCopyWith<$Res> {
  _$Auth0ServiceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$Auth0ServiceEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl with DiagnosticableTreeMixin implements _Started {
  const _$StartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Auth0ServiceEvent.started'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AuthModel model) login,
    required TResult Function() logout,
    required TResult Function() googlelogin,
    required TResult Function() googlelogout,
    required TResult Function() applelogin,
    required TResult Function() applelogout,
    required TResult Function() signup,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AuthModel model)? login,
    TResult? Function()? logout,
    TResult? Function()? googlelogin,
    TResult? Function()? googlelogout,
    TResult? Function()? applelogin,
    TResult? Function()? applelogout,
    TResult? Function()? signup,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AuthModel model)? login,
    TResult Function()? logout,
    TResult Function()? googlelogin,
    TResult Function()? googlelogout,
    TResult Function()? applelogin,
    TResult Function()? applelogout,
    TResult Function()? signup,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) login,
    required TResult Function(_LogOut value) logout,
    required TResult Function(_GoogleLogIn value) googlelogin,
    required TResult Function(_GoogleLogOut value) googlelogout,
    required TResult Function(_AppleLogIn value) applelogin,
    required TResult Function(_AppleLogOut value) applelogout,
    required TResult Function(_SignUp value) signup,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? login,
    TResult? Function(_LogOut value)? logout,
    TResult? Function(_GoogleLogIn value)? googlelogin,
    TResult? Function(_GoogleLogOut value)? googlelogout,
    TResult? Function(_AppleLogIn value)? applelogin,
    TResult? Function(_AppleLogOut value)? applelogout,
    TResult? Function(_SignUp value)? signup,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? login,
    TResult Function(_LogOut value)? logout,
    TResult Function(_GoogleLogIn value)? googlelogin,
    TResult Function(_GoogleLogOut value)? googlelogout,
    TResult Function(_AppleLogIn value)? applelogin,
    TResult Function(_AppleLogOut value)? applelogout,
    TResult Function(_SignUp value)? signup,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements Auth0ServiceEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$LogInImplCopyWith<$Res> {
  factory _$$LogInImplCopyWith(
          _$LogInImpl value, $Res Function(_$LogInImpl) then) =
      __$$LogInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthModel model});
}

/// @nodoc
class __$$LogInImplCopyWithImpl<$Res>
    extends _$Auth0ServiceEventCopyWithImpl<$Res, _$LogInImpl>
    implements _$$LogInImplCopyWith<$Res> {
  __$$LogInImplCopyWithImpl(
      _$LogInImpl _value, $Res Function(_$LogInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$LogInImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AuthModel,
    ));
  }
}

/// @nodoc

class _$LogInImpl with DiagnosticableTreeMixin implements _LogIn {
  const _$LogInImpl(this.model);

  @override
  final AuthModel model;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceEvent.login(model: $model)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Auth0ServiceEvent.login'))
      ..add(DiagnosticsProperty('model', model));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInImplCopyWith<_$LogInImpl> get copyWith =>
      __$$LogInImplCopyWithImpl<_$LogInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AuthModel model) login,
    required TResult Function() logout,
    required TResult Function() googlelogin,
    required TResult Function() googlelogout,
    required TResult Function() applelogin,
    required TResult Function() applelogout,
    required TResult Function() signup,
  }) {
    return login(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AuthModel model)? login,
    TResult? Function()? logout,
    TResult? Function()? googlelogin,
    TResult? Function()? googlelogout,
    TResult? Function()? applelogin,
    TResult? Function()? applelogout,
    TResult? Function()? signup,
  }) {
    return login?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AuthModel model)? login,
    TResult Function()? logout,
    TResult Function()? googlelogin,
    TResult Function()? googlelogout,
    TResult Function()? applelogin,
    TResult Function()? applelogout,
    TResult Function()? signup,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) login,
    required TResult Function(_LogOut value) logout,
    required TResult Function(_GoogleLogIn value) googlelogin,
    required TResult Function(_GoogleLogOut value) googlelogout,
    required TResult Function(_AppleLogIn value) applelogin,
    required TResult Function(_AppleLogOut value) applelogout,
    required TResult Function(_SignUp value) signup,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? login,
    TResult? Function(_LogOut value)? logout,
    TResult? Function(_GoogleLogIn value)? googlelogin,
    TResult? Function(_GoogleLogOut value)? googlelogout,
    TResult? Function(_AppleLogIn value)? applelogin,
    TResult? Function(_AppleLogOut value)? applelogout,
    TResult? Function(_SignUp value)? signup,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? login,
    TResult Function(_LogOut value)? logout,
    TResult Function(_GoogleLogIn value)? googlelogin,
    TResult Function(_GoogleLogOut value)? googlelogout,
    TResult Function(_AppleLogIn value)? applelogin,
    TResult Function(_AppleLogOut value)? applelogout,
    TResult Function(_SignUp value)? signup,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _LogIn implements Auth0ServiceEvent {
  const factory _LogIn(final AuthModel model) = _$LogInImpl;

  AuthModel get model;
  @JsonKey(ignore: true)
  _$$LogInImplCopyWith<_$LogInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogOutImplCopyWith<$Res> {
  factory _$$LogOutImplCopyWith(
          _$LogOutImpl value, $Res Function(_$LogOutImpl) then) =
      __$$LogOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogOutImplCopyWithImpl<$Res>
    extends _$Auth0ServiceEventCopyWithImpl<$Res, _$LogOutImpl>
    implements _$$LogOutImplCopyWith<$Res> {
  __$$LogOutImplCopyWithImpl(
      _$LogOutImpl _value, $Res Function(_$LogOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogOutImpl with DiagnosticableTreeMixin implements _LogOut {
  const _$LogOutImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceEvent.logout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Auth0ServiceEvent.logout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AuthModel model) login,
    required TResult Function() logout,
    required TResult Function() googlelogin,
    required TResult Function() googlelogout,
    required TResult Function() applelogin,
    required TResult Function() applelogout,
    required TResult Function() signup,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AuthModel model)? login,
    TResult? Function()? logout,
    TResult? Function()? googlelogin,
    TResult? Function()? googlelogout,
    TResult? Function()? applelogin,
    TResult? Function()? applelogout,
    TResult? Function()? signup,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AuthModel model)? login,
    TResult Function()? logout,
    TResult Function()? googlelogin,
    TResult Function()? googlelogout,
    TResult Function()? applelogin,
    TResult Function()? applelogout,
    TResult Function()? signup,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) login,
    required TResult Function(_LogOut value) logout,
    required TResult Function(_GoogleLogIn value) googlelogin,
    required TResult Function(_GoogleLogOut value) googlelogout,
    required TResult Function(_AppleLogIn value) applelogin,
    required TResult Function(_AppleLogOut value) applelogout,
    required TResult Function(_SignUp value) signup,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? login,
    TResult? Function(_LogOut value)? logout,
    TResult? Function(_GoogleLogIn value)? googlelogin,
    TResult? Function(_GoogleLogOut value)? googlelogout,
    TResult? Function(_AppleLogIn value)? applelogin,
    TResult? Function(_AppleLogOut value)? applelogout,
    TResult? Function(_SignUp value)? signup,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? login,
    TResult Function(_LogOut value)? logout,
    TResult Function(_GoogleLogIn value)? googlelogin,
    TResult Function(_GoogleLogOut value)? googlelogout,
    TResult Function(_AppleLogIn value)? applelogin,
    TResult Function(_AppleLogOut value)? applelogout,
    TResult Function(_SignUp value)? signup,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _LogOut implements Auth0ServiceEvent {
  const factory _LogOut() = _$LogOutImpl;
}

/// @nodoc
abstract class _$$GoogleLogInImplCopyWith<$Res> {
  factory _$$GoogleLogInImplCopyWith(
          _$GoogleLogInImpl value, $Res Function(_$GoogleLogInImpl) then) =
      __$$GoogleLogInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLogInImplCopyWithImpl<$Res>
    extends _$Auth0ServiceEventCopyWithImpl<$Res, _$GoogleLogInImpl>
    implements _$$GoogleLogInImplCopyWith<$Res> {
  __$$GoogleLogInImplCopyWithImpl(
      _$GoogleLogInImpl _value, $Res Function(_$GoogleLogInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleLogInImpl with DiagnosticableTreeMixin implements _GoogleLogIn {
  const _$GoogleLogInImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceEvent.googlelogin()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceEvent.googlelogin'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleLogInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AuthModel model) login,
    required TResult Function() logout,
    required TResult Function() googlelogin,
    required TResult Function() googlelogout,
    required TResult Function() applelogin,
    required TResult Function() applelogout,
    required TResult Function() signup,
  }) {
    return googlelogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AuthModel model)? login,
    TResult? Function()? logout,
    TResult? Function()? googlelogin,
    TResult? Function()? googlelogout,
    TResult? Function()? applelogin,
    TResult? Function()? applelogout,
    TResult? Function()? signup,
  }) {
    return googlelogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AuthModel model)? login,
    TResult Function()? logout,
    TResult Function()? googlelogin,
    TResult Function()? googlelogout,
    TResult Function()? applelogin,
    TResult Function()? applelogout,
    TResult Function()? signup,
    required TResult orElse(),
  }) {
    if (googlelogin != null) {
      return googlelogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) login,
    required TResult Function(_LogOut value) logout,
    required TResult Function(_GoogleLogIn value) googlelogin,
    required TResult Function(_GoogleLogOut value) googlelogout,
    required TResult Function(_AppleLogIn value) applelogin,
    required TResult Function(_AppleLogOut value) applelogout,
    required TResult Function(_SignUp value) signup,
  }) {
    return googlelogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? login,
    TResult? Function(_LogOut value)? logout,
    TResult? Function(_GoogleLogIn value)? googlelogin,
    TResult? Function(_GoogleLogOut value)? googlelogout,
    TResult? Function(_AppleLogIn value)? applelogin,
    TResult? Function(_AppleLogOut value)? applelogout,
    TResult? Function(_SignUp value)? signup,
  }) {
    return googlelogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? login,
    TResult Function(_LogOut value)? logout,
    TResult Function(_GoogleLogIn value)? googlelogin,
    TResult Function(_GoogleLogOut value)? googlelogout,
    TResult Function(_AppleLogIn value)? applelogin,
    TResult Function(_AppleLogOut value)? applelogout,
    TResult Function(_SignUp value)? signup,
    required TResult orElse(),
  }) {
    if (googlelogin != null) {
      return googlelogin(this);
    }
    return orElse();
  }
}

abstract class _GoogleLogIn implements Auth0ServiceEvent {
  const factory _GoogleLogIn() = _$GoogleLogInImpl;
}

/// @nodoc
abstract class _$$GoogleLogOutImplCopyWith<$Res> {
  factory _$$GoogleLogOutImplCopyWith(
          _$GoogleLogOutImpl value, $Res Function(_$GoogleLogOutImpl) then) =
      __$$GoogleLogOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLogOutImplCopyWithImpl<$Res>
    extends _$Auth0ServiceEventCopyWithImpl<$Res, _$GoogleLogOutImpl>
    implements _$$GoogleLogOutImplCopyWith<$Res> {
  __$$GoogleLogOutImplCopyWithImpl(
      _$GoogleLogOutImpl _value, $Res Function(_$GoogleLogOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleLogOutImpl with DiagnosticableTreeMixin implements _GoogleLogOut {
  const _$GoogleLogOutImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceEvent.googlelogout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceEvent.googlelogout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleLogOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AuthModel model) login,
    required TResult Function() logout,
    required TResult Function() googlelogin,
    required TResult Function() googlelogout,
    required TResult Function() applelogin,
    required TResult Function() applelogout,
    required TResult Function() signup,
  }) {
    return googlelogout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AuthModel model)? login,
    TResult? Function()? logout,
    TResult? Function()? googlelogin,
    TResult? Function()? googlelogout,
    TResult? Function()? applelogin,
    TResult? Function()? applelogout,
    TResult? Function()? signup,
  }) {
    return googlelogout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AuthModel model)? login,
    TResult Function()? logout,
    TResult Function()? googlelogin,
    TResult Function()? googlelogout,
    TResult Function()? applelogin,
    TResult Function()? applelogout,
    TResult Function()? signup,
    required TResult orElse(),
  }) {
    if (googlelogout != null) {
      return googlelogout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) login,
    required TResult Function(_LogOut value) logout,
    required TResult Function(_GoogleLogIn value) googlelogin,
    required TResult Function(_GoogleLogOut value) googlelogout,
    required TResult Function(_AppleLogIn value) applelogin,
    required TResult Function(_AppleLogOut value) applelogout,
    required TResult Function(_SignUp value) signup,
  }) {
    return googlelogout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? login,
    TResult? Function(_LogOut value)? logout,
    TResult? Function(_GoogleLogIn value)? googlelogin,
    TResult? Function(_GoogleLogOut value)? googlelogout,
    TResult? Function(_AppleLogIn value)? applelogin,
    TResult? Function(_AppleLogOut value)? applelogout,
    TResult? Function(_SignUp value)? signup,
  }) {
    return googlelogout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? login,
    TResult Function(_LogOut value)? logout,
    TResult Function(_GoogleLogIn value)? googlelogin,
    TResult Function(_GoogleLogOut value)? googlelogout,
    TResult Function(_AppleLogIn value)? applelogin,
    TResult Function(_AppleLogOut value)? applelogout,
    TResult Function(_SignUp value)? signup,
    required TResult orElse(),
  }) {
    if (googlelogout != null) {
      return googlelogout(this);
    }
    return orElse();
  }
}

abstract class _GoogleLogOut implements Auth0ServiceEvent {
  const factory _GoogleLogOut() = _$GoogleLogOutImpl;
}

/// @nodoc
abstract class _$$AppleLogInImplCopyWith<$Res> {
  factory _$$AppleLogInImplCopyWith(
          _$AppleLogInImpl value, $Res Function(_$AppleLogInImpl) then) =
      __$$AppleLogInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleLogInImplCopyWithImpl<$Res>
    extends _$Auth0ServiceEventCopyWithImpl<$Res, _$AppleLogInImpl>
    implements _$$AppleLogInImplCopyWith<$Res> {
  __$$AppleLogInImplCopyWithImpl(
      _$AppleLogInImpl _value, $Res Function(_$AppleLogInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppleLogInImpl with DiagnosticableTreeMixin implements _AppleLogIn {
  const _$AppleLogInImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceEvent.applelogin()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Auth0ServiceEvent.applelogin'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppleLogInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AuthModel model) login,
    required TResult Function() logout,
    required TResult Function() googlelogin,
    required TResult Function() googlelogout,
    required TResult Function() applelogin,
    required TResult Function() applelogout,
    required TResult Function() signup,
  }) {
    return applelogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AuthModel model)? login,
    TResult? Function()? logout,
    TResult? Function()? googlelogin,
    TResult? Function()? googlelogout,
    TResult? Function()? applelogin,
    TResult? Function()? applelogout,
    TResult? Function()? signup,
  }) {
    return applelogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AuthModel model)? login,
    TResult Function()? logout,
    TResult Function()? googlelogin,
    TResult Function()? googlelogout,
    TResult Function()? applelogin,
    TResult Function()? applelogout,
    TResult Function()? signup,
    required TResult orElse(),
  }) {
    if (applelogin != null) {
      return applelogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) login,
    required TResult Function(_LogOut value) logout,
    required TResult Function(_GoogleLogIn value) googlelogin,
    required TResult Function(_GoogleLogOut value) googlelogout,
    required TResult Function(_AppleLogIn value) applelogin,
    required TResult Function(_AppleLogOut value) applelogout,
    required TResult Function(_SignUp value) signup,
  }) {
    return applelogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? login,
    TResult? Function(_LogOut value)? logout,
    TResult? Function(_GoogleLogIn value)? googlelogin,
    TResult? Function(_GoogleLogOut value)? googlelogout,
    TResult? Function(_AppleLogIn value)? applelogin,
    TResult? Function(_AppleLogOut value)? applelogout,
    TResult? Function(_SignUp value)? signup,
  }) {
    return applelogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? login,
    TResult Function(_LogOut value)? logout,
    TResult Function(_GoogleLogIn value)? googlelogin,
    TResult Function(_GoogleLogOut value)? googlelogout,
    TResult Function(_AppleLogIn value)? applelogin,
    TResult Function(_AppleLogOut value)? applelogout,
    TResult Function(_SignUp value)? signup,
    required TResult orElse(),
  }) {
    if (applelogin != null) {
      return applelogin(this);
    }
    return orElse();
  }
}

abstract class _AppleLogIn implements Auth0ServiceEvent {
  const factory _AppleLogIn() = _$AppleLogInImpl;
}

/// @nodoc
abstract class _$$AppleLogOutImplCopyWith<$Res> {
  factory _$$AppleLogOutImplCopyWith(
          _$AppleLogOutImpl value, $Res Function(_$AppleLogOutImpl) then) =
      __$$AppleLogOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleLogOutImplCopyWithImpl<$Res>
    extends _$Auth0ServiceEventCopyWithImpl<$Res, _$AppleLogOutImpl>
    implements _$$AppleLogOutImplCopyWith<$Res> {
  __$$AppleLogOutImplCopyWithImpl(
      _$AppleLogOutImpl _value, $Res Function(_$AppleLogOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppleLogOutImpl with DiagnosticableTreeMixin implements _AppleLogOut {
  const _$AppleLogOutImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceEvent.applelogout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceEvent.applelogout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppleLogOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AuthModel model) login,
    required TResult Function() logout,
    required TResult Function() googlelogin,
    required TResult Function() googlelogout,
    required TResult Function() applelogin,
    required TResult Function() applelogout,
    required TResult Function() signup,
  }) {
    return applelogout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AuthModel model)? login,
    TResult? Function()? logout,
    TResult? Function()? googlelogin,
    TResult? Function()? googlelogout,
    TResult? Function()? applelogin,
    TResult? Function()? applelogout,
    TResult? Function()? signup,
  }) {
    return applelogout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AuthModel model)? login,
    TResult Function()? logout,
    TResult Function()? googlelogin,
    TResult Function()? googlelogout,
    TResult Function()? applelogin,
    TResult Function()? applelogout,
    TResult Function()? signup,
    required TResult orElse(),
  }) {
    if (applelogout != null) {
      return applelogout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) login,
    required TResult Function(_LogOut value) logout,
    required TResult Function(_GoogleLogIn value) googlelogin,
    required TResult Function(_GoogleLogOut value) googlelogout,
    required TResult Function(_AppleLogIn value) applelogin,
    required TResult Function(_AppleLogOut value) applelogout,
    required TResult Function(_SignUp value) signup,
  }) {
    return applelogout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? login,
    TResult? Function(_LogOut value)? logout,
    TResult? Function(_GoogleLogIn value)? googlelogin,
    TResult? Function(_GoogleLogOut value)? googlelogout,
    TResult? Function(_AppleLogIn value)? applelogin,
    TResult? Function(_AppleLogOut value)? applelogout,
    TResult? Function(_SignUp value)? signup,
  }) {
    return applelogout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? login,
    TResult Function(_LogOut value)? logout,
    TResult Function(_GoogleLogIn value)? googlelogin,
    TResult Function(_GoogleLogOut value)? googlelogout,
    TResult Function(_AppleLogIn value)? applelogin,
    TResult Function(_AppleLogOut value)? applelogout,
    TResult Function(_SignUp value)? signup,
    required TResult orElse(),
  }) {
    if (applelogout != null) {
      return applelogout(this);
    }
    return orElse();
  }
}

abstract class _AppleLogOut implements Auth0ServiceEvent {
  const factory _AppleLogOut() = _$AppleLogOutImpl;
}

/// @nodoc
abstract class _$$SignUpImplCopyWith<$Res> {
  factory _$$SignUpImplCopyWith(
          _$SignUpImpl value, $Res Function(_$SignUpImpl) then) =
      __$$SignUpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpImplCopyWithImpl<$Res>
    extends _$Auth0ServiceEventCopyWithImpl<$Res, _$SignUpImpl>
    implements _$$SignUpImplCopyWith<$Res> {
  __$$SignUpImplCopyWithImpl(
      _$SignUpImpl _value, $Res Function(_$SignUpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpImpl with DiagnosticableTreeMixin implements _SignUp {
  const _$SignUpImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceEvent.signup()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Auth0ServiceEvent.signup'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AuthModel model) login,
    required TResult Function() logout,
    required TResult Function() googlelogin,
    required TResult Function() googlelogout,
    required TResult Function() applelogin,
    required TResult Function() applelogout,
    required TResult Function() signup,
  }) {
    return signup();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AuthModel model)? login,
    TResult? Function()? logout,
    TResult? Function()? googlelogin,
    TResult? Function()? googlelogout,
    TResult? Function()? applelogin,
    TResult? Function()? applelogout,
    TResult? Function()? signup,
  }) {
    return signup?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AuthModel model)? login,
    TResult Function()? logout,
    TResult Function()? googlelogin,
    TResult Function()? googlelogout,
    TResult Function()? applelogin,
    TResult Function()? applelogout,
    TResult Function()? signup,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LogIn value) login,
    required TResult Function(_LogOut value) logout,
    required TResult Function(_GoogleLogIn value) googlelogin,
    required TResult Function(_GoogleLogOut value) googlelogout,
    required TResult Function(_AppleLogIn value) applelogin,
    required TResult Function(_AppleLogOut value) applelogout,
    required TResult Function(_SignUp value) signup,
  }) {
    return signup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LogIn value)? login,
    TResult? Function(_LogOut value)? logout,
    TResult? Function(_GoogleLogIn value)? googlelogin,
    TResult? Function(_GoogleLogOut value)? googlelogout,
    TResult? Function(_AppleLogIn value)? applelogin,
    TResult? Function(_AppleLogOut value)? applelogout,
    TResult? Function(_SignUp value)? signup,
  }) {
    return signup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LogIn value)? login,
    TResult Function(_LogOut value)? logout,
    TResult Function(_GoogleLogIn value)? googlelogin,
    TResult Function(_GoogleLogOut value)? googlelogout,
    TResult Function(_AppleLogIn value)? applelogin,
    TResult Function(_AppleLogOut value)? applelogout,
    TResult Function(_SignUp value)? signup,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(this);
    }
    return orElse();
  }
}

abstract class _SignUp implements Auth0ServiceEvent {
  const factory _SignUp() = _$SignUpImpl;
}

/// @nodoc
mixin _$Auth0ServiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Auth0ServiceStateCopyWith<$Res> {
  factory $Auth0ServiceStateCopyWith(
          Auth0ServiceState value, $Res Function(Auth0ServiceState) then) =
      _$Auth0ServiceStateCopyWithImpl<$Res, Auth0ServiceState>;
}

/// @nodoc
class _$Auth0ServiceStateCopyWithImpl<$Res, $Val extends Auth0ServiceState>
    implements $Auth0ServiceStateCopyWith<$Res> {
  _$Auth0ServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Auth0ServiceState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements Auth0ServiceState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoggingInImplCopyWith<$Res> {
  factory _$$LoggingInImplCopyWith(
          _$LoggingInImpl value, $Res Function(_$LoggingInImpl) then) =
      __$$LoggingInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggingInImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$LoggingInImpl>
    implements _$$LoggingInImplCopyWith<$Res> {
  __$$LoggingInImplCopyWithImpl(
      _$LoggingInImpl _value, $Res Function(_$LoggingInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoggingInImpl with DiagnosticableTreeMixin implements _LoggingIn {
  const _$LoggingInImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.loggingin()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Auth0ServiceState.loggingin'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggingInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return loggingin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return loggingin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loggingin != null) {
      return loggingin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return loggingin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return loggingin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loggingin != null) {
      return loggingin(this);
    }
    return orElse();
  }
}

abstract class _LoggingIn implements Auth0ServiceState {
  const factory _LoggingIn() = _$LoggingInImpl;
}

/// @nodoc
abstract class _$$LoginSuccessfulImplCopyWith<$Res> {
  factory _$$LoginSuccessfulImplCopyWith(_$LoginSuccessfulImpl value,
          $Res Function(_$LoginSuccessfulImpl) then) =
      __$$LoginSuccessfulImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginSuccessfulImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$LoginSuccessfulImpl>
    implements _$$LoginSuccessfulImplCopyWith<$Res> {
  __$$LoginSuccessfulImplCopyWithImpl(
      _$LoginSuccessfulImpl _value, $Res Function(_$LoginSuccessfulImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginSuccessfulImpl
    with DiagnosticableTreeMixin
    implements _LoginSuccessful {
  const _$LoginSuccessfulImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.loginSuccessful()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceState.loginSuccessful'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginSuccessfulImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return loginSuccessful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return loginSuccessful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loginSuccessful != null) {
      return loginSuccessful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return loginSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return loginSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loginSuccessful != null) {
      return loginSuccessful(this);
    }
    return orElse();
  }
}

abstract class _LoginSuccessful implements Auth0ServiceState {
  const factory _LoginSuccessful() = _$LoginSuccessfulImpl;
}

/// @nodoc
abstract class _$$LoginFailureImplCopyWith<$Res> {
  factory _$$LoginFailureImplCopyWith(
          _$LoginFailureImpl value, $Res Function(_$LoginFailureImpl) then) =
      __$$LoginFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginFailureImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$LoginFailureImpl>
    implements _$$LoginFailureImplCopyWith<$Res> {
  __$$LoginFailureImplCopyWithImpl(
      _$LoginFailureImpl _value, $Res Function(_$LoginFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginFailureImpl with DiagnosticableTreeMixin implements _LoginFailure {
  const _$LoginFailureImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.loginFailure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceState.loginFailure'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return loginFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return loginFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loginFailure != null) {
      return loginFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return loginFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return loginFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loginFailure != null) {
      return loginFailure(this);
    }
    return orElse();
  }
}

abstract class _LoginFailure implements Auth0ServiceState {
  const factory _LoginFailure() = _$LoginFailureImpl;
}

/// @nodoc
abstract class _$$LoggingOutImplCopyWith<$Res> {
  factory _$$LoggingOutImplCopyWith(
          _$LoggingOutImpl value, $Res Function(_$LoggingOutImpl) then) =
      __$$LoggingOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggingOutImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$LoggingOutImpl>
    implements _$$LoggingOutImplCopyWith<$Res> {
  __$$LoggingOutImplCopyWithImpl(
      _$LoggingOutImpl _value, $Res Function(_$LoggingOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoggingOutImpl with DiagnosticableTreeMixin implements _LoggingOut {
  const _$LoggingOutImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.loggingout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Auth0ServiceState.loggingout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggingOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return loggingout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return loggingout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loggingout != null) {
      return loggingout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return loggingout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return loggingout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loggingout != null) {
      return loggingout(this);
    }
    return orElse();
  }
}

abstract class _LoggingOut implements Auth0ServiceState {
  const factory _LoggingOut() = _$LoggingOutImpl;
}

/// @nodoc
abstract class _$$LogOutSuccessfulImplCopyWith<$Res> {
  factory _$$LogOutSuccessfulImplCopyWith(_$LogOutSuccessfulImpl value,
          $Res Function(_$LogOutSuccessfulImpl) then) =
      __$$LogOutSuccessfulImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogOutSuccessfulImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$LogOutSuccessfulImpl>
    implements _$$LogOutSuccessfulImplCopyWith<$Res> {
  __$$LogOutSuccessfulImplCopyWithImpl(_$LogOutSuccessfulImpl _value,
      $Res Function(_$LogOutSuccessfulImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogOutSuccessfulImpl
    with DiagnosticableTreeMixin
    implements _LogOutSuccessful {
  const _$LogOutSuccessfulImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.logoutSuccessful()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceState.logoutSuccessful'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogOutSuccessfulImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return logoutSuccessful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return logoutSuccessful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (logoutSuccessful != null) {
      return logoutSuccessful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return logoutSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return logoutSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (logoutSuccessful != null) {
      return logoutSuccessful(this);
    }
    return orElse();
  }
}

abstract class _LogOutSuccessful implements Auth0ServiceState {
  const factory _LogOutSuccessful() = _$LogOutSuccessfulImpl;
}

/// @nodoc
abstract class _$$LogOutFailureImplCopyWith<$Res> {
  factory _$$LogOutFailureImplCopyWith(
          _$LogOutFailureImpl value, $Res Function(_$LogOutFailureImpl) then) =
      __$$LogOutFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogOutFailureImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$LogOutFailureImpl>
    implements _$$LogOutFailureImplCopyWith<$Res> {
  __$$LogOutFailureImplCopyWithImpl(
      _$LogOutFailureImpl _value, $Res Function(_$LogOutFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogOutFailureImpl
    with DiagnosticableTreeMixin
    implements _LogOutFailure {
  const _$LogOutFailureImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.logoutFailure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceState.logoutFailure'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogOutFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return logoutFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return logoutFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (logoutFailure != null) {
      return logoutFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return logoutFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return logoutFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (logoutFailure != null) {
      return logoutFailure(this);
    }
    return orElse();
  }
}

abstract class _LogOutFailure implements Auth0ServiceState {
  const factory _LogOutFailure() = _$LogOutFailureImpl;
}

/// @nodoc
abstract class _$$GoogleLoggingInImplCopyWith<$Res> {
  factory _$$GoogleLoggingInImplCopyWith(_$GoogleLoggingInImpl value,
          $Res Function(_$GoogleLoggingInImpl) then) =
      __$$GoogleLoggingInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLoggingInImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$GoogleLoggingInImpl>
    implements _$$GoogleLoggingInImplCopyWith<$Res> {
  __$$GoogleLoggingInImplCopyWithImpl(
      _$GoogleLoggingInImpl _value, $Res Function(_$GoogleLoggingInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleLoggingInImpl
    with DiagnosticableTreeMixin
    implements _GoogleLoggingIn {
  const _$GoogleLoggingInImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.googleloggingin()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceState.googleloggingin'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleLoggingInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return googleloggingin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return googleloggingin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (googleloggingin != null) {
      return googleloggingin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return googleloggingin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return googleloggingin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (googleloggingin != null) {
      return googleloggingin(this);
    }
    return orElse();
  }
}

abstract class _GoogleLoggingIn implements Auth0ServiceState {
  const factory _GoogleLoggingIn() = _$GoogleLoggingInImpl;
}

/// @nodoc
abstract class _$$GoogleLoginSuccessfulImplCopyWith<$Res> {
  factory _$$GoogleLoginSuccessfulImplCopyWith(
          _$GoogleLoginSuccessfulImpl value,
          $Res Function(_$GoogleLoginSuccessfulImpl) then) =
      __$$GoogleLoginSuccessfulImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLoginSuccessfulImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$GoogleLoginSuccessfulImpl>
    implements _$$GoogleLoginSuccessfulImplCopyWith<$Res> {
  __$$GoogleLoginSuccessfulImplCopyWithImpl(_$GoogleLoginSuccessfulImpl _value,
      $Res Function(_$GoogleLoginSuccessfulImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleLoginSuccessfulImpl
    with DiagnosticableTreeMixin
    implements _GoogleLoginSuccessful {
  const _$GoogleLoginSuccessfulImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.googleloginSuccessful()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'Auth0ServiceState.googleloginSuccessful'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleLoginSuccessfulImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return googleloginSuccessful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return googleloginSuccessful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (googleloginSuccessful != null) {
      return googleloginSuccessful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return googleloginSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return googleloginSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (googleloginSuccessful != null) {
      return googleloginSuccessful(this);
    }
    return orElse();
  }
}

abstract class _GoogleLoginSuccessful implements Auth0ServiceState {
  const factory _GoogleLoginSuccessful() = _$GoogleLoginSuccessfulImpl;
}

/// @nodoc
abstract class _$$GoogleLoginFailureImplCopyWith<$Res> {
  factory _$$GoogleLoginFailureImplCopyWith(_$GoogleLoginFailureImpl value,
          $Res Function(_$GoogleLoginFailureImpl) then) =
      __$$GoogleLoginFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLoginFailureImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$GoogleLoginFailureImpl>
    implements _$$GoogleLoginFailureImplCopyWith<$Res> {
  __$$GoogleLoginFailureImplCopyWithImpl(_$GoogleLoginFailureImpl _value,
      $Res Function(_$GoogleLoginFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleLoginFailureImpl
    with DiagnosticableTreeMixin
    implements _GoogleLoginFailure {
  const _$GoogleLoginFailureImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.googleloginFailure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'Auth0ServiceState.googleloginFailure'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleLoginFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return googleloginFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return googleloginFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (googleloginFailure != null) {
      return googleloginFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return googleloginFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return googleloginFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (googleloginFailure != null) {
      return googleloginFailure(this);
    }
    return orElse();
  }
}

abstract class _GoogleLoginFailure implements Auth0ServiceState {
  const factory _GoogleLoginFailure() = _$GoogleLoginFailureImpl;
}

/// @nodoc
abstract class _$$GoogleLoggingOutImplCopyWith<$Res> {
  factory _$$GoogleLoggingOutImplCopyWith(_$GoogleLoggingOutImpl value,
          $Res Function(_$GoogleLoggingOutImpl) then) =
      __$$GoogleLoggingOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLoggingOutImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$GoogleLoggingOutImpl>
    implements _$$GoogleLoggingOutImplCopyWith<$Res> {
  __$$GoogleLoggingOutImplCopyWithImpl(_$GoogleLoggingOutImpl _value,
      $Res Function(_$GoogleLoggingOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleLoggingOutImpl
    with DiagnosticableTreeMixin
    implements _GoogleLoggingOut {
  const _$GoogleLoggingOutImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.googleloggingout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceState.googleloggingout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleLoggingOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return googleloggingout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return googleloggingout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (googleloggingout != null) {
      return googleloggingout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return googleloggingout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return googleloggingout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (googleloggingout != null) {
      return googleloggingout(this);
    }
    return orElse();
  }
}

abstract class _GoogleLoggingOut implements Auth0ServiceState {
  const factory _GoogleLoggingOut() = _$GoogleLoggingOutImpl;
}

/// @nodoc
abstract class _$$GoogleLogOutSuccessfulImplCopyWith<$Res> {
  factory _$$GoogleLogOutSuccessfulImplCopyWith(
          _$GoogleLogOutSuccessfulImpl value,
          $Res Function(_$GoogleLogOutSuccessfulImpl) then) =
      __$$GoogleLogOutSuccessfulImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLogOutSuccessfulImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$GoogleLogOutSuccessfulImpl>
    implements _$$GoogleLogOutSuccessfulImplCopyWith<$Res> {
  __$$GoogleLogOutSuccessfulImplCopyWithImpl(
      _$GoogleLogOutSuccessfulImpl _value,
      $Res Function(_$GoogleLogOutSuccessfulImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleLogOutSuccessfulImpl
    with DiagnosticableTreeMixin
    implements _GoogleLogOutSuccessful {
  const _$GoogleLogOutSuccessfulImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.googlelogoutSuccessful()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty(
        'type', 'Auth0ServiceState.googlelogoutSuccessful'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleLogOutSuccessfulImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return googlelogoutSuccessful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return googlelogoutSuccessful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (googlelogoutSuccessful != null) {
      return googlelogoutSuccessful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return googlelogoutSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return googlelogoutSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (googlelogoutSuccessful != null) {
      return googlelogoutSuccessful(this);
    }
    return orElse();
  }
}

abstract class _GoogleLogOutSuccessful implements Auth0ServiceState {
  const factory _GoogleLogOutSuccessful() = _$GoogleLogOutSuccessfulImpl;
}

/// @nodoc
abstract class _$$GoogleLogOutFailureImplCopyWith<$Res> {
  factory _$$GoogleLogOutFailureImplCopyWith(_$GoogleLogOutFailureImpl value,
          $Res Function(_$GoogleLogOutFailureImpl) then) =
      __$$GoogleLogOutFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLogOutFailureImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$GoogleLogOutFailureImpl>
    implements _$$GoogleLogOutFailureImplCopyWith<$Res> {
  __$$GoogleLogOutFailureImplCopyWithImpl(_$GoogleLogOutFailureImpl _value,
      $Res Function(_$GoogleLogOutFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleLogOutFailureImpl
    with DiagnosticableTreeMixin
    implements _GoogleLogOutFailure {
  const _$GoogleLogOutFailureImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.googlelogoutFailure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'Auth0ServiceState.googlelogoutFailure'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleLogOutFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return googlelogoutFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return googlelogoutFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (googlelogoutFailure != null) {
      return googlelogoutFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return googlelogoutFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return googlelogoutFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (googlelogoutFailure != null) {
      return googlelogoutFailure(this);
    }
    return orElse();
  }
}

abstract class _GoogleLogOutFailure implements Auth0ServiceState {
  const factory _GoogleLogOutFailure() = _$GoogleLogOutFailureImpl;
}

/// @nodoc
abstract class _$$AppleLoggingInImplCopyWith<$Res> {
  factory _$$AppleLoggingInImplCopyWith(_$AppleLoggingInImpl value,
          $Res Function(_$AppleLoggingInImpl) then) =
      __$$AppleLoggingInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleLoggingInImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$AppleLoggingInImpl>
    implements _$$AppleLoggingInImplCopyWith<$Res> {
  __$$AppleLoggingInImplCopyWithImpl(
      _$AppleLoggingInImpl _value, $Res Function(_$AppleLoggingInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppleLoggingInImpl
    with DiagnosticableTreeMixin
    implements _AppleLoggingIn {
  const _$AppleLoggingInImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.appleloggingin()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceState.appleloggingin'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppleLoggingInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return appleloggingin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return appleloggingin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (appleloggingin != null) {
      return appleloggingin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return appleloggingin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return appleloggingin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (appleloggingin != null) {
      return appleloggingin(this);
    }
    return orElse();
  }
}

abstract class _AppleLoggingIn implements Auth0ServiceState {
  const factory _AppleLoggingIn() = _$AppleLoggingInImpl;
}

/// @nodoc
abstract class _$$AppleLoginSuccessfulImplCopyWith<$Res> {
  factory _$$AppleLoginSuccessfulImplCopyWith(_$AppleLoginSuccessfulImpl value,
          $Res Function(_$AppleLoginSuccessfulImpl) then) =
      __$$AppleLoginSuccessfulImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleLoginSuccessfulImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$AppleLoginSuccessfulImpl>
    implements _$$AppleLoginSuccessfulImplCopyWith<$Res> {
  __$$AppleLoginSuccessfulImplCopyWithImpl(_$AppleLoginSuccessfulImpl _value,
      $Res Function(_$AppleLoginSuccessfulImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppleLoginSuccessfulImpl
    with DiagnosticableTreeMixin
    implements _AppleLoginSuccessful {
  const _$AppleLoginSuccessfulImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.appleloginSuccessful()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'Auth0ServiceState.appleloginSuccessful'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleLoginSuccessfulImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return appleloginSuccessful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return appleloginSuccessful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (appleloginSuccessful != null) {
      return appleloginSuccessful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return appleloginSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return appleloginSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (appleloginSuccessful != null) {
      return appleloginSuccessful(this);
    }
    return orElse();
  }
}

abstract class _AppleLoginSuccessful implements Auth0ServiceState {
  const factory _AppleLoginSuccessful() = _$AppleLoginSuccessfulImpl;
}

/// @nodoc
abstract class _$$AppleLoginFailureImplCopyWith<$Res> {
  factory _$$AppleLoginFailureImplCopyWith(_$AppleLoginFailureImpl value,
          $Res Function(_$AppleLoginFailureImpl) then) =
      __$$AppleLoginFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleLoginFailureImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$AppleLoginFailureImpl>
    implements _$$AppleLoginFailureImplCopyWith<$Res> {
  __$$AppleLoginFailureImplCopyWithImpl(_$AppleLoginFailureImpl _value,
      $Res Function(_$AppleLoginFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppleLoginFailureImpl
    with DiagnosticableTreeMixin
    implements _AppleLoginFailure {
  const _$AppleLoginFailureImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.appleloginFailure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'Auth0ServiceState.appleloginFailure'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppleLoginFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return appleloginFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return appleloginFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (appleloginFailure != null) {
      return appleloginFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return appleloginFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return appleloginFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (appleloginFailure != null) {
      return appleloginFailure(this);
    }
    return orElse();
  }
}

abstract class _AppleLoginFailure implements Auth0ServiceState {
  const factory _AppleLoginFailure() = _$AppleLoginFailureImpl;
}

/// @nodoc
abstract class _$$AppleLoggingOutImplCopyWith<$Res> {
  factory _$$AppleLoggingOutImplCopyWith(_$AppleLoggingOutImpl value,
          $Res Function(_$AppleLoggingOutImpl) then) =
      __$$AppleLoggingOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleLoggingOutImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$AppleLoggingOutImpl>
    implements _$$AppleLoggingOutImplCopyWith<$Res> {
  __$$AppleLoggingOutImplCopyWithImpl(
      _$AppleLoggingOutImpl _value, $Res Function(_$AppleLoggingOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppleLoggingOutImpl
    with DiagnosticableTreeMixin
    implements _AppleLoggingOut {
  const _$AppleLoggingOutImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.appleloggingout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceState.appleloggingout'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppleLoggingOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return appleloggingout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return appleloggingout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (appleloggingout != null) {
      return appleloggingout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return appleloggingout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return appleloggingout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (appleloggingout != null) {
      return appleloggingout(this);
    }
    return orElse();
  }
}

abstract class _AppleLoggingOut implements Auth0ServiceState {
  const factory _AppleLoggingOut() = _$AppleLoggingOutImpl;
}

/// @nodoc
abstract class _$$AppleLogOutSuccessfulImplCopyWith<$Res> {
  factory _$$AppleLogOutSuccessfulImplCopyWith(
          _$AppleLogOutSuccessfulImpl value,
          $Res Function(_$AppleLogOutSuccessfulImpl) then) =
      __$$AppleLogOutSuccessfulImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleLogOutSuccessfulImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$AppleLogOutSuccessfulImpl>
    implements _$$AppleLogOutSuccessfulImplCopyWith<$Res> {
  __$$AppleLogOutSuccessfulImplCopyWithImpl(_$AppleLogOutSuccessfulImpl _value,
      $Res Function(_$AppleLogOutSuccessfulImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppleLogOutSuccessfulImpl
    with DiagnosticableTreeMixin
    implements _AppleLogOutSuccessful {
  const _$AppleLogOutSuccessfulImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.applelogoutSuccessful()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'Auth0ServiceState.applelogoutSuccessful'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleLogOutSuccessfulImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return applelogoutSuccessful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return applelogoutSuccessful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (applelogoutSuccessful != null) {
      return applelogoutSuccessful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return applelogoutSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return applelogoutSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (applelogoutSuccessful != null) {
      return applelogoutSuccessful(this);
    }
    return orElse();
  }
}

abstract class _AppleLogOutSuccessful implements Auth0ServiceState {
  const factory _AppleLogOutSuccessful() = _$AppleLogOutSuccessfulImpl;
}

/// @nodoc
abstract class _$$AppleLogOutFailureImplCopyWith<$Res> {
  factory _$$AppleLogOutFailureImplCopyWith(_$AppleLogOutFailureImpl value,
          $Res Function(_$AppleLogOutFailureImpl) then) =
      __$$AppleLogOutFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleLogOutFailureImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$AppleLogOutFailureImpl>
    implements _$$AppleLogOutFailureImplCopyWith<$Res> {
  __$$AppleLogOutFailureImplCopyWithImpl(_$AppleLogOutFailureImpl _value,
      $Res Function(_$AppleLogOutFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppleLogOutFailureImpl
    with DiagnosticableTreeMixin
    implements _AppleLogOutFailure {
  const _$AppleLogOutFailureImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.applelogoutFailure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'Auth0ServiceState.applelogoutFailure'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppleLogOutFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return applelogoutFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return applelogoutFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (applelogoutFailure != null) {
      return applelogoutFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return applelogoutFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return applelogoutFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (applelogoutFailure != null) {
      return applelogoutFailure(this);
    }
    return orElse();
  }
}

abstract class _AppleLogOutFailure implements Auth0ServiceState {
  const factory _AppleLogOutFailure() = _$AppleLogOutFailureImpl;
}

/// @nodoc
abstract class _$$SigningUpImplCopyWith<$Res> {
  factory _$$SigningUpImplCopyWith(
          _$SigningUpImpl value, $Res Function(_$SigningUpImpl) then) =
      __$$SigningUpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SigningUpImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$SigningUpImpl>
    implements _$$SigningUpImplCopyWith<$Res> {
  __$$SigningUpImplCopyWithImpl(
      _$SigningUpImpl _value, $Res Function(_$SigningUpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SigningUpImpl with DiagnosticableTreeMixin implements _SigningUp {
  const _$SigningUpImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.signingup()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Auth0ServiceState.signingup'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SigningUpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return signingup();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return signingup?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (signingup != null) {
      return signingup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return signingup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return signingup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (signingup != null) {
      return signingup(this);
    }
    return orElse();
  }
}

abstract class _SigningUp implements Auth0ServiceState {
  const factory _SigningUp() = _$SigningUpImpl;
}

/// @nodoc
abstract class _$$SignUpSuccessfulImplCopyWith<$Res> {
  factory _$$SignUpSuccessfulImplCopyWith(_$SignUpSuccessfulImpl value,
          $Res Function(_$SignUpSuccessfulImpl) then) =
      __$$SignUpSuccessfulImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpSuccessfulImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$SignUpSuccessfulImpl>
    implements _$$SignUpSuccessfulImplCopyWith<$Res> {
  __$$SignUpSuccessfulImplCopyWithImpl(_$SignUpSuccessfulImpl _value,
      $Res Function(_$SignUpSuccessfulImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpSuccessfulImpl
    with DiagnosticableTreeMixin
    implements _SignUpSuccessful {
  const _$SignUpSuccessfulImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.signupSuccessful()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceState.signupSuccessful'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpSuccessfulImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return signupSuccessful();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return signupSuccessful?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (signupSuccessful != null) {
      return signupSuccessful();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return signupSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return signupSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (signupSuccessful != null) {
      return signupSuccessful(this);
    }
    return orElse();
  }
}

abstract class _SignUpSuccessful implements Auth0ServiceState {
  const factory _SignUpSuccessful() = _$SignUpSuccessfulImpl;
}

/// @nodoc
abstract class _$$SignUpFailureImplCopyWith<$Res> {
  factory _$$SignUpFailureImplCopyWith(
          _$SignUpFailureImpl value, $Res Function(_$SignUpFailureImpl) then) =
      __$$SignUpFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpFailureImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$SignUpFailureImpl>
    implements _$$SignUpFailureImplCopyWith<$Res> {
  __$$SignUpFailureImplCopyWithImpl(
      _$SignUpFailureImpl _value, $Res Function(_$SignUpFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpFailureImpl
    with DiagnosticableTreeMixin
    implements _SignUpFailure {
  const _$SignUpFailureImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.signupFailure()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'Auth0ServiceState.signupFailure'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return signupFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return signupFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (signupFailure != null) {
      return signupFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return signupFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return signupFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (signupFailure != null) {
      return signupFailure(this);
    }
    return orElse();
  }
}

abstract class _SignUpFailure implements Auth0ServiceState {
  const factory _SignUpFailure() = _$SignUpFailureImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Auth0ServiceState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements Auth0ServiceState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$Auth0ServiceStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0ServiceState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'Auth0ServiceState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loggingin,
    required TResult Function() loginSuccessful,
    required TResult Function() loginFailure,
    required TResult Function() loggingout,
    required TResult Function() logoutSuccessful,
    required TResult Function() logoutFailure,
    required TResult Function() googleloggingin,
    required TResult Function() googleloginSuccessful,
    required TResult Function() googleloginFailure,
    required TResult Function() googleloggingout,
    required TResult Function() googlelogoutSuccessful,
    required TResult Function() googlelogoutFailure,
    required TResult Function() appleloggingin,
    required TResult Function() appleloginSuccessful,
    required TResult Function() appleloginFailure,
    required TResult Function() appleloggingout,
    required TResult Function() applelogoutSuccessful,
    required TResult Function() applelogoutFailure,
    required TResult Function() signingup,
    required TResult Function() signupSuccessful,
    required TResult Function() signupFailure,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loggingin,
    TResult? Function()? loginSuccessful,
    TResult? Function()? loginFailure,
    TResult? Function()? loggingout,
    TResult? Function()? logoutSuccessful,
    TResult? Function()? logoutFailure,
    TResult? Function()? googleloggingin,
    TResult? Function()? googleloginSuccessful,
    TResult? Function()? googleloginFailure,
    TResult? Function()? googleloggingout,
    TResult? Function()? googlelogoutSuccessful,
    TResult? Function()? googlelogoutFailure,
    TResult? Function()? appleloggingin,
    TResult? Function()? appleloginSuccessful,
    TResult? Function()? appleloginFailure,
    TResult? Function()? appleloggingout,
    TResult? Function()? applelogoutSuccessful,
    TResult? Function()? applelogoutFailure,
    TResult? Function()? signingup,
    TResult? Function()? signupSuccessful,
    TResult? Function()? signupFailure,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loggingin,
    TResult Function()? loginSuccessful,
    TResult Function()? loginFailure,
    TResult Function()? loggingout,
    TResult Function()? logoutSuccessful,
    TResult Function()? logoutFailure,
    TResult Function()? googleloggingin,
    TResult Function()? googleloginSuccessful,
    TResult Function()? googleloginFailure,
    TResult Function()? googleloggingout,
    TResult Function()? googlelogoutSuccessful,
    TResult Function()? googlelogoutFailure,
    TResult Function()? appleloggingin,
    TResult Function()? appleloginSuccessful,
    TResult Function()? appleloginFailure,
    TResult Function()? appleloggingout,
    TResult Function()? applelogoutSuccessful,
    TResult Function()? applelogoutFailure,
    TResult Function()? signingup,
    TResult Function()? signupSuccessful,
    TResult Function()? signupFailure,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoggingIn value) loggingin,
    required TResult Function(_LoginSuccessful value) loginSuccessful,
    required TResult Function(_LoginFailure value) loginFailure,
    required TResult Function(_LoggingOut value) loggingout,
    required TResult Function(_LogOutSuccessful value) logoutSuccessful,
    required TResult Function(_LogOutFailure value) logoutFailure,
    required TResult Function(_GoogleLoggingIn value) googleloggingin,
    required TResult Function(_GoogleLoginSuccessful value)
        googleloginSuccessful,
    required TResult Function(_GoogleLoginFailure value) googleloginFailure,
    required TResult Function(_GoogleLoggingOut value) googleloggingout,
    required TResult Function(_GoogleLogOutSuccessful value)
        googlelogoutSuccessful,
    required TResult Function(_GoogleLogOutFailure value) googlelogoutFailure,
    required TResult Function(_AppleLoggingIn value) appleloggingin,
    required TResult Function(_AppleLoginSuccessful value) appleloginSuccessful,
    required TResult Function(_AppleLoginFailure value) appleloginFailure,
    required TResult Function(_AppleLoggingOut value) appleloggingout,
    required TResult Function(_AppleLogOutSuccessful value)
        applelogoutSuccessful,
    required TResult Function(_AppleLogOutFailure value) applelogoutFailure,
    required TResult Function(_SigningUp value) signingup,
    required TResult Function(_SignUpSuccessful value) signupSuccessful,
    required TResult Function(_SignUpFailure value) signupFailure,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoggingIn value)? loggingin,
    TResult? Function(_LoginSuccessful value)? loginSuccessful,
    TResult? Function(_LoginFailure value)? loginFailure,
    TResult? Function(_LoggingOut value)? loggingout,
    TResult? Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult? Function(_LogOutFailure value)? logoutFailure,
    TResult? Function(_GoogleLoggingIn value)? googleloggingin,
    TResult? Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult? Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult? Function(_GoogleLoggingOut value)? googleloggingout,
    TResult? Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult? Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult? Function(_AppleLoggingIn value)? appleloggingin,
    TResult? Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult? Function(_AppleLoginFailure value)? appleloginFailure,
    TResult? Function(_AppleLoggingOut value)? appleloggingout,
    TResult? Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult? Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult? Function(_SigningUp value)? signingup,
    TResult? Function(_SignUpSuccessful value)? signupSuccessful,
    TResult? Function(_SignUpFailure value)? signupFailure,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoggingIn value)? loggingin,
    TResult Function(_LoginSuccessful value)? loginSuccessful,
    TResult Function(_LoginFailure value)? loginFailure,
    TResult Function(_LoggingOut value)? loggingout,
    TResult Function(_LogOutSuccessful value)? logoutSuccessful,
    TResult Function(_LogOutFailure value)? logoutFailure,
    TResult Function(_GoogleLoggingIn value)? googleloggingin,
    TResult Function(_GoogleLoginSuccessful value)? googleloginSuccessful,
    TResult Function(_GoogleLoginFailure value)? googleloginFailure,
    TResult Function(_GoogleLoggingOut value)? googleloggingout,
    TResult Function(_GoogleLogOutSuccessful value)? googlelogoutSuccessful,
    TResult Function(_GoogleLogOutFailure value)? googlelogoutFailure,
    TResult Function(_AppleLoggingIn value)? appleloggingin,
    TResult Function(_AppleLoginSuccessful value)? appleloginSuccessful,
    TResult Function(_AppleLoginFailure value)? appleloginFailure,
    TResult Function(_AppleLoggingOut value)? appleloggingout,
    TResult Function(_AppleLogOutSuccessful value)? applelogoutSuccessful,
    TResult Function(_AppleLogOutFailure value)? applelogoutFailure,
    TResult Function(_SigningUp value)? signingup,
    TResult Function(_SignUpSuccessful value)? signupSuccessful,
    TResult Function(_SignUpFailure value)? signupFailure,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements Auth0ServiceState {
  const factory _Loading() = _$LoadingImpl;
}
