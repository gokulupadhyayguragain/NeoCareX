// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_contact_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmergencyContactEvent {
  String get patientId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String patientId) loadContacts,
    required TResult Function(String patientId, EmergencyContactModel contact)
        addContact,
    required TResult Function(String patientId, int contactIndex) deleteContact,
    required TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)
        updateContact,
    required TResult Function(String patientId) refreshContacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String patientId)? loadContacts,
    TResult? Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult? Function(String patientId, int contactIndex)? deleteContact,
    TResult? Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult? Function(String patientId)? refreshContacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String patientId)? loadContacts,
    TResult Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult Function(String patientId, int contactIndex)? deleteContact,
    TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult Function(String patientId)? refreshContacts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_AddContact value) addContact,
    required TResult Function(_DeleteContact value) deleteContact,
    required TResult Function(_UpdateContact value) updateContact,
    required TResult Function(_RefreshContacts value) refreshContacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_AddContact value)? addContact,
    TResult? Function(_DeleteContact value)? deleteContact,
    TResult? Function(_UpdateContact value)? updateContact,
    TResult? Function(_RefreshContacts value)? refreshContacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_AddContact value)? addContact,
    TResult Function(_DeleteContact value)? deleteContact,
    TResult Function(_UpdateContact value)? updateContact,
    TResult Function(_RefreshContacts value)? refreshContacts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmergencyContactEventCopyWith<EmergencyContactEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyContactEventCopyWith<$Res> {
  factory $EmergencyContactEventCopyWith(EmergencyContactEvent value,
          $Res Function(EmergencyContactEvent) then) =
      _$EmergencyContactEventCopyWithImpl<$Res, EmergencyContactEvent>;
  @useResult
  $Res call({String patientId});
}

/// @nodoc
class _$EmergencyContactEventCopyWithImpl<$Res,
        $Val extends EmergencyContactEvent>
    implements $EmergencyContactEventCopyWith<$Res> {
  _$EmergencyContactEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
  }) {
    return _then(_value.copyWith(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadContactsImplCopyWith<$Res>
    implements $EmergencyContactEventCopyWith<$Res> {
  factory _$$LoadContactsImplCopyWith(
          _$LoadContactsImpl value, $Res Function(_$LoadContactsImpl) then) =
      __$$LoadContactsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String patientId});
}

/// @nodoc
class __$$LoadContactsImplCopyWithImpl<$Res>
    extends _$EmergencyContactEventCopyWithImpl<$Res, _$LoadContactsImpl>
    implements _$$LoadContactsImplCopyWith<$Res> {
  __$$LoadContactsImplCopyWithImpl(
      _$LoadContactsImpl _value, $Res Function(_$LoadContactsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
  }) {
    return _then(_$LoadContactsImpl(
      null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadContactsImpl implements _LoadContacts {
  const _$LoadContactsImpl(this.patientId);

  @override
  final String patientId;

  @override
  String toString() {
    return 'EmergencyContactEvent.loadContacts(patientId: $patientId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadContactsImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadContactsImplCopyWith<_$LoadContactsImpl> get copyWith =>
      __$$LoadContactsImplCopyWithImpl<_$LoadContactsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String patientId) loadContacts,
    required TResult Function(String patientId, EmergencyContactModel contact)
        addContact,
    required TResult Function(String patientId, int contactIndex) deleteContact,
    required TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)
        updateContact,
    required TResult Function(String patientId) refreshContacts,
  }) {
    return loadContacts(patientId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String patientId)? loadContacts,
    TResult? Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult? Function(String patientId, int contactIndex)? deleteContact,
    TResult? Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult? Function(String patientId)? refreshContacts,
  }) {
    return loadContacts?.call(patientId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String patientId)? loadContacts,
    TResult Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult Function(String patientId, int contactIndex)? deleteContact,
    TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult Function(String patientId)? refreshContacts,
    required TResult orElse(),
  }) {
    if (loadContacts != null) {
      return loadContacts(patientId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_AddContact value) addContact,
    required TResult Function(_DeleteContact value) deleteContact,
    required TResult Function(_UpdateContact value) updateContact,
    required TResult Function(_RefreshContacts value) refreshContacts,
  }) {
    return loadContacts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_AddContact value)? addContact,
    TResult? Function(_DeleteContact value)? deleteContact,
    TResult? Function(_UpdateContact value)? updateContact,
    TResult? Function(_RefreshContacts value)? refreshContacts,
  }) {
    return loadContacts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_AddContact value)? addContact,
    TResult Function(_DeleteContact value)? deleteContact,
    TResult Function(_UpdateContact value)? updateContact,
    TResult Function(_RefreshContacts value)? refreshContacts,
    required TResult orElse(),
  }) {
    if (loadContacts != null) {
      return loadContacts(this);
    }
    return orElse();
  }
}

abstract class _LoadContacts implements EmergencyContactEvent {
  const factory _LoadContacts(final String patientId) = _$LoadContactsImpl;

  @override
  String get patientId;
  @override
  @JsonKey(ignore: true)
  _$$LoadContactsImplCopyWith<_$LoadContactsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddContactImplCopyWith<$Res>
    implements $EmergencyContactEventCopyWith<$Res> {
  factory _$$AddContactImplCopyWith(
          _$AddContactImpl value, $Res Function(_$AddContactImpl) then) =
      __$$AddContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String patientId, EmergencyContactModel contact});

  $EmergencyContactModelCopyWith<$Res> get contact;
}

/// @nodoc
class __$$AddContactImplCopyWithImpl<$Res>
    extends _$EmergencyContactEventCopyWithImpl<$Res, _$AddContactImpl>
    implements _$$AddContactImplCopyWith<$Res> {
  __$$AddContactImplCopyWithImpl(
      _$AddContactImpl _value, $Res Function(_$AddContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? contact = null,
  }) {
    return _then(_$AddContactImpl(
      null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as EmergencyContactModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EmergencyContactModelCopyWith<$Res> get contact {
    return $EmergencyContactModelCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value));
    });
  }
}

/// @nodoc

class _$AddContactImpl implements _AddContact {
  const _$AddContactImpl(this.patientId, this.contact);

  @override
  final String patientId;
  @override
  final EmergencyContactModel contact;

  @override
  String toString() {
    return 'EmergencyContactEvent.addContact(patientId: $patientId, contact: $contact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddContactImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patientId, contact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddContactImplCopyWith<_$AddContactImpl> get copyWith =>
      __$$AddContactImplCopyWithImpl<_$AddContactImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String patientId) loadContacts,
    required TResult Function(String patientId, EmergencyContactModel contact)
        addContact,
    required TResult Function(String patientId, int contactIndex) deleteContact,
    required TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)
        updateContact,
    required TResult Function(String patientId) refreshContacts,
  }) {
    return addContact(patientId, contact);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String patientId)? loadContacts,
    TResult? Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult? Function(String patientId, int contactIndex)? deleteContact,
    TResult? Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult? Function(String patientId)? refreshContacts,
  }) {
    return addContact?.call(patientId, contact);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String patientId)? loadContacts,
    TResult Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult Function(String patientId, int contactIndex)? deleteContact,
    TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult Function(String patientId)? refreshContacts,
    required TResult orElse(),
  }) {
    if (addContact != null) {
      return addContact(patientId, contact);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_AddContact value) addContact,
    required TResult Function(_DeleteContact value) deleteContact,
    required TResult Function(_UpdateContact value) updateContact,
    required TResult Function(_RefreshContacts value) refreshContacts,
  }) {
    return addContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_AddContact value)? addContact,
    TResult? Function(_DeleteContact value)? deleteContact,
    TResult? Function(_UpdateContact value)? updateContact,
    TResult? Function(_RefreshContacts value)? refreshContacts,
  }) {
    return addContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_AddContact value)? addContact,
    TResult Function(_DeleteContact value)? deleteContact,
    TResult Function(_UpdateContact value)? updateContact,
    TResult Function(_RefreshContacts value)? refreshContacts,
    required TResult orElse(),
  }) {
    if (addContact != null) {
      return addContact(this);
    }
    return orElse();
  }
}

abstract class _AddContact implements EmergencyContactEvent {
  const factory _AddContact(
          final String patientId, final EmergencyContactModel contact) =
      _$AddContactImpl;

  @override
  String get patientId;
  EmergencyContactModel get contact;
  @override
  @JsonKey(ignore: true)
  _$$AddContactImplCopyWith<_$AddContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteContactImplCopyWith<$Res>
    implements $EmergencyContactEventCopyWith<$Res> {
  factory _$$DeleteContactImplCopyWith(
          _$DeleteContactImpl value, $Res Function(_$DeleteContactImpl) then) =
      __$$DeleteContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String patientId, int contactIndex});
}

/// @nodoc
class __$$DeleteContactImplCopyWithImpl<$Res>
    extends _$EmergencyContactEventCopyWithImpl<$Res, _$DeleteContactImpl>
    implements _$$DeleteContactImplCopyWith<$Res> {
  __$$DeleteContactImplCopyWithImpl(
      _$DeleteContactImpl _value, $Res Function(_$DeleteContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? contactIndex = null,
  }) {
    return _then(_$DeleteContactImpl(
      null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      null == contactIndex
          ? _value.contactIndex
          : contactIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteContactImpl implements _DeleteContact {
  const _$DeleteContactImpl(this.patientId, this.contactIndex);

  @override
  final String patientId;
  @override
  final int contactIndex;

  @override
  String toString() {
    return 'EmergencyContactEvent.deleteContact(patientId: $patientId, contactIndex: $contactIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteContactImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.contactIndex, contactIndex) ||
                other.contactIndex == contactIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patientId, contactIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteContactImplCopyWith<_$DeleteContactImpl> get copyWith =>
      __$$DeleteContactImplCopyWithImpl<_$DeleteContactImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String patientId) loadContacts,
    required TResult Function(String patientId, EmergencyContactModel contact)
        addContact,
    required TResult Function(String patientId, int contactIndex) deleteContact,
    required TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)
        updateContact,
    required TResult Function(String patientId) refreshContacts,
  }) {
    return deleteContact(patientId, contactIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String patientId)? loadContacts,
    TResult? Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult? Function(String patientId, int contactIndex)? deleteContact,
    TResult? Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult? Function(String patientId)? refreshContacts,
  }) {
    return deleteContact?.call(patientId, contactIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String patientId)? loadContacts,
    TResult Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult Function(String patientId, int contactIndex)? deleteContact,
    TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult Function(String patientId)? refreshContacts,
    required TResult orElse(),
  }) {
    if (deleteContact != null) {
      return deleteContact(patientId, contactIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_AddContact value) addContact,
    required TResult Function(_DeleteContact value) deleteContact,
    required TResult Function(_UpdateContact value) updateContact,
    required TResult Function(_RefreshContacts value) refreshContacts,
  }) {
    return deleteContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_AddContact value)? addContact,
    TResult? Function(_DeleteContact value)? deleteContact,
    TResult? Function(_UpdateContact value)? updateContact,
    TResult? Function(_RefreshContacts value)? refreshContacts,
  }) {
    return deleteContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_AddContact value)? addContact,
    TResult Function(_DeleteContact value)? deleteContact,
    TResult Function(_UpdateContact value)? updateContact,
    TResult Function(_RefreshContacts value)? refreshContacts,
    required TResult orElse(),
  }) {
    if (deleteContact != null) {
      return deleteContact(this);
    }
    return orElse();
  }
}

abstract class _DeleteContact implements EmergencyContactEvent {
  const factory _DeleteContact(final String patientId, final int contactIndex) =
      _$DeleteContactImpl;

  @override
  String get patientId;
  int get contactIndex;
  @override
  @JsonKey(ignore: true)
  _$$DeleteContactImplCopyWith<_$DeleteContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateContactImplCopyWith<$Res>
    implements $EmergencyContactEventCopyWith<$Res> {
  factory _$$UpdateContactImplCopyWith(
          _$UpdateContactImpl value, $Res Function(_$UpdateContactImpl) then) =
      __$$UpdateContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String patientId, int contactIndex, EmergencyContactModel contact});

  $EmergencyContactModelCopyWith<$Res> get contact;
}

/// @nodoc
class __$$UpdateContactImplCopyWithImpl<$Res>
    extends _$EmergencyContactEventCopyWithImpl<$Res, _$UpdateContactImpl>
    implements _$$UpdateContactImplCopyWith<$Res> {
  __$$UpdateContactImplCopyWithImpl(
      _$UpdateContactImpl _value, $Res Function(_$UpdateContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? contactIndex = null,
    Object? contact = null,
  }) {
    return _then(_$UpdateContactImpl(
      null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      null == contactIndex
          ? _value.contactIndex
          : contactIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as EmergencyContactModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EmergencyContactModelCopyWith<$Res> get contact {
    return $EmergencyContactModelCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value));
    });
  }
}

/// @nodoc

class _$UpdateContactImpl implements _UpdateContact {
  const _$UpdateContactImpl(this.patientId, this.contactIndex, this.contact);

  @override
  final String patientId;
  @override
  final int contactIndex;
  @override
  final EmergencyContactModel contact;

  @override
  String toString() {
    return 'EmergencyContactEvent.updateContact(patientId: $patientId, contactIndex: $contactIndex, contact: $contact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateContactImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.contactIndex, contactIndex) ||
                other.contactIndex == contactIndex) &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, patientId, contactIndex, contact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateContactImplCopyWith<_$UpdateContactImpl> get copyWith =>
      __$$UpdateContactImplCopyWithImpl<_$UpdateContactImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String patientId) loadContacts,
    required TResult Function(String patientId, EmergencyContactModel contact)
        addContact,
    required TResult Function(String patientId, int contactIndex) deleteContact,
    required TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)
        updateContact,
    required TResult Function(String patientId) refreshContacts,
  }) {
    return updateContact(patientId, contactIndex, contact);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String patientId)? loadContacts,
    TResult? Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult? Function(String patientId, int contactIndex)? deleteContact,
    TResult? Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult? Function(String patientId)? refreshContacts,
  }) {
    return updateContact?.call(patientId, contactIndex, contact);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String patientId)? loadContacts,
    TResult Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult Function(String patientId, int contactIndex)? deleteContact,
    TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult Function(String patientId)? refreshContacts,
    required TResult orElse(),
  }) {
    if (updateContact != null) {
      return updateContact(patientId, contactIndex, contact);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_AddContact value) addContact,
    required TResult Function(_DeleteContact value) deleteContact,
    required TResult Function(_UpdateContact value) updateContact,
    required TResult Function(_RefreshContacts value) refreshContacts,
  }) {
    return updateContact(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_AddContact value)? addContact,
    TResult? Function(_DeleteContact value)? deleteContact,
    TResult? Function(_UpdateContact value)? updateContact,
    TResult? Function(_RefreshContacts value)? refreshContacts,
  }) {
    return updateContact?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_AddContact value)? addContact,
    TResult Function(_DeleteContact value)? deleteContact,
    TResult Function(_UpdateContact value)? updateContact,
    TResult Function(_RefreshContacts value)? refreshContacts,
    required TResult orElse(),
  }) {
    if (updateContact != null) {
      return updateContact(this);
    }
    return orElse();
  }
}

abstract class _UpdateContact implements EmergencyContactEvent {
  const factory _UpdateContact(final String patientId, final int contactIndex,
      final EmergencyContactModel contact) = _$UpdateContactImpl;

  @override
  String get patientId;
  int get contactIndex;
  EmergencyContactModel get contact;
  @override
  @JsonKey(ignore: true)
  _$$UpdateContactImplCopyWith<_$UpdateContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshContactsImplCopyWith<$Res>
    implements $EmergencyContactEventCopyWith<$Res> {
  factory _$$RefreshContactsImplCopyWith(_$RefreshContactsImpl value,
          $Res Function(_$RefreshContactsImpl) then) =
      __$$RefreshContactsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String patientId});
}

/// @nodoc
class __$$RefreshContactsImplCopyWithImpl<$Res>
    extends _$EmergencyContactEventCopyWithImpl<$Res, _$RefreshContactsImpl>
    implements _$$RefreshContactsImplCopyWith<$Res> {
  __$$RefreshContactsImplCopyWithImpl(
      _$RefreshContactsImpl _value, $Res Function(_$RefreshContactsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
  }) {
    return _then(_$RefreshContactsImpl(
      null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshContactsImpl implements _RefreshContacts {
  const _$RefreshContactsImpl(this.patientId);

  @override
  final String patientId;

  @override
  String toString() {
    return 'EmergencyContactEvent.refreshContacts(patientId: $patientId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshContactsImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, patientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshContactsImplCopyWith<_$RefreshContactsImpl> get copyWith =>
      __$$RefreshContactsImplCopyWithImpl<_$RefreshContactsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String patientId) loadContacts,
    required TResult Function(String patientId, EmergencyContactModel contact)
        addContact,
    required TResult Function(String patientId, int contactIndex) deleteContact,
    required TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)
        updateContact,
    required TResult Function(String patientId) refreshContacts,
  }) {
    return refreshContacts(patientId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String patientId)? loadContacts,
    TResult? Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult? Function(String patientId, int contactIndex)? deleteContact,
    TResult? Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult? Function(String patientId)? refreshContacts,
  }) {
    return refreshContacts?.call(patientId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String patientId)? loadContacts,
    TResult Function(String patientId, EmergencyContactModel contact)?
        addContact,
    TResult Function(String patientId, int contactIndex)? deleteContact,
    TResult Function(
            String patientId, int contactIndex, EmergencyContactModel contact)?
        updateContact,
    TResult Function(String patientId)? refreshContacts,
    required TResult orElse(),
  }) {
    if (refreshContacts != null) {
      return refreshContacts(patientId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadContacts value) loadContacts,
    required TResult Function(_AddContact value) addContact,
    required TResult Function(_DeleteContact value) deleteContact,
    required TResult Function(_UpdateContact value) updateContact,
    required TResult Function(_RefreshContacts value) refreshContacts,
  }) {
    return refreshContacts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadContacts value)? loadContacts,
    TResult? Function(_AddContact value)? addContact,
    TResult? Function(_DeleteContact value)? deleteContact,
    TResult? Function(_UpdateContact value)? updateContact,
    TResult? Function(_RefreshContacts value)? refreshContacts,
  }) {
    return refreshContacts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadContacts value)? loadContacts,
    TResult Function(_AddContact value)? addContact,
    TResult Function(_DeleteContact value)? deleteContact,
    TResult Function(_UpdateContact value)? updateContact,
    TResult Function(_RefreshContacts value)? refreshContacts,
    required TResult orElse(),
  }) {
    if (refreshContacts != null) {
      return refreshContacts(this);
    }
    return orElse();
  }
}

abstract class _RefreshContacts implements EmergencyContactEvent {
  const factory _RefreshContacts(final String patientId) =
      _$RefreshContactsImpl;

  @override
  String get patientId;
  @override
  @JsonKey(ignore: true)
  _$$RefreshContactsImplCopyWith<_$RefreshContactsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmergencyContactState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EmergencyContactModel> contacts) loaded,
    required TResult Function(String message) error,
    required TResult Function(EmergencyContactModel contact) contactAdded,
    required TResult Function() contactDeleted,
    required TResult Function(EmergencyContactModel contact) contactUpdated,
    required TResult Function() syncing,
    required TResult Function() syncCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EmergencyContactModel> contacts)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(EmergencyContactModel contact)? contactAdded,
    TResult? Function()? contactDeleted,
    TResult? Function(EmergencyContactModel contact)? contactUpdated,
    TResult? Function()? syncing,
    TResult? Function()? syncCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EmergencyContactModel> contacts)? loaded,
    TResult Function(String message)? error,
    TResult Function(EmergencyContactModel contact)? contactAdded,
    TResult Function()? contactDeleted,
    TResult Function(EmergencyContactModel contact)? contactUpdated,
    TResult Function()? syncing,
    TResult Function()? syncCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ContactAdded value) contactAdded,
    required TResult Function(_ContactDeleted value) contactDeleted,
    required TResult Function(_ContactUpdated value) contactUpdated,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_SyncCompleted value) syncCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ContactAdded value)? contactAdded,
    TResult? Function(_ContactDeleted value)? contactDeleted,
    TResult? Function(_ContactUpdated value)? contactUpdated,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_SyncCompleted value)? syncCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ContactAdded value)? contactAdded,
    TResult Function(_ContactDeleted value)? contactDeleted,
    TResult Function(_ContactUpdated value)? contactUpdated,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_SyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyContactStateCopyWith<$Res> {
  factory $EmergencyContactStateCopyWith(EmergencyContactState value,
          $Res Function(EmergencyContactState) then) =
      _$EmergencyContactStateCopyWithImpl<$Res, EmergencyContactState>;
}

/// @nodoc
class _$EmergencyContactStateCopyWithImpl<$Res,
        $Val extends EmergencyContactState>
    implements $EmergencyContactStateCopyWith<$Res> {
  _$EmergencyContactStateCopyWithImpl(this._value, this._then);

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
    extends _$EmergencyContactStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'EmergencyContactState.initial()';
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
    required TResult Function() loading,
    required TResult Function(List<EmergencyContactModel> contacts) loaded,
    required TResult Function(String message) error,
    required TResult Function(EmergencyContactModel contact) contactAdded,
    required TResult Function() contactDeleted,
    required TResult Function(EmergencyContactModel contact) contactUpdated,
    required TResult Function() syncing,
    required TResult Function() syncCompleted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EmergencyContactModel> contacts)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(EmergencyContactModel contact)? contactAdded,
    TResult? Function()? contactDeleted,
    TResult? Function(EmergencyContactModel contact)? contactUpdated,
    TResult? Function()? syncing,
    TResult? Function()? syncCompleted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EmergencyContactModel> contacts)? loaded,
    TResult Function(String message)? error,
    TResult Function(EmergencyContactModel contact)? contactAdded,
    TResult Function()? contactDeleted,
    TResult Function(EmergencyContactModel contact)? contactUpdated,
    TResult Function()? syncing,
    TResult Function()? syncCompleted,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ContactAdded value) contactAdded,
    required TResult Function(_ContactDeleted value) contactDeleted,
    required TResult Function(_ContactUpdated value) contactUpdated,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_SyncCompleted value) syncCompleted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ContactAdded value)? contactAdded,
    TResult? Function(_ContactDeleted value)? contactDeleted,
    TResult? Function(_ContactUpdated value)? contactUpdated,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_SyncCompleted value)? syncCompleted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ContactAdded value)? contactAdded,
    TResult Function(_ContactDeleted value)? contactDeleted,
    TResult Function(_ContactUpdated value)? contactUpdated,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_SyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EmergencyContactState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$EmergencyContactStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'EmergencyContactState.loading()';
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
    required TResult Function() loading,
    required TResult Function(List<EmergencyContactModel> contacts) loaded,
    required TResult Function(String message) error,
    required TResult Function(EmergencyContactModel contact) contactAdded,
    required TResult Function() contactDeleted,
    required TResult Function(EmergencyContactModel contact) contactUpdated,
    required TResult Function() syncing,
    required TResult Function() syncCompleted,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EmergencyContactModel> contacts)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(EmergencyContactModel contact)? contactAdded,
    TResult? Function()? contactDeleted,
    TResult? Function(EmergencyContactModel contact)? contactUpdated,
    TResult? Function()? syncing,
    TResult? Function()? syncCompleted,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EmergencyContactModel> contacts)? loaded,
    TResult Function(String message)? error,
    TResult Function(EmergencyContactModel contact)? contactAdded,
    TResult Function()? contactDeleted,
    TResult Function(EmergencyContactModel contact)? contactUpdated,
    TResult Function()? syncing,
    TResult Function()? syncCompleted,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ContactAdded value) contactAdded,
    required TResult Function(_ContactDeleted value) contactDeleted,
    required TResult Function(_ContactUpdated value) contactUpdated,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_SyncCompleted value) syncCompleted,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ContactAdded value)? contactAdded,
    TResult? Function(_ContactDeleted value)? contactDeleted,
    TResult? Function(_ContactUpdated value)? contactUpdated,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_SyncCompleted value)? syncCompleted,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ContactAdded value)? contactAdded,
    TResult Function(_ContactDeleted value)? contactDeleted,
    TResult Function(_ContactUpdated value)? contactUpdated,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_SyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements EmergencyContactState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<EmergencyContactModel> contacts});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$EmergencyContactStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacts = null,
  }) {
    return _then(_$LoadedImpl(
      null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<EmergencyContactModel>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<EmergencyContactModel> contacts)
      : _contacts = contacts;

  final List<EmergencyContactModel> _contacts;
  @override
  List<EmergencyContactModel> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'EmergencyContactState.loaded(contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EmergencyContactModel> contacts) loaded,
    required TResult Function(String message) error,
    required TResult Function(EmergencyContactModel contact) contactAdded,
    required TResult Function() contactDeleted,
    required TResult Function(EmergencyContactModel contact) contactUpdated,
    required TResult Function() syncing,
    required TResult Function() syncCompleted,
  }) {
    return loaded(contacts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EmergencyContactModel> contacts)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(EmergencyContactModel contact)? contactAdded,
    TResult? Function()? contactDeleted,
    TResult? Function(EmergencyContactModel contact)? contactUpdated,
    TResult? Function()? syncing,
    TResult? Function()? syncCompleted,
  }) {
    return loaded?.call(contacts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EmergencyContactModel> contacts)? loaded,
    TResult Function(String message)? error,
    TResult Function(EmergencyContactModel contact)? contactAdded,
    TResult Function()? contactDeleted,
    TResult Function(EmergencyContactModel contact)? contactUpdated,
    TResult Function()? syncing,
    TResult Function()? syncCompleted,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(contacts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ContactAdded value) contactAdded,
    required TResult Function(_ContactDeleted value) contactDeleted,
    required TResult Function(_ContactUpdated value) contactUpdated,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_SyncCompleted value) syncCompleted,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ContactAdded value)? contactAdded,
    TResult? Function(_ContactDeleted value)? contactDeleted,
    TResult? Function(_ContactUpdated value)? contactUpdated,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_SyncCompleted value)? syncCompleted,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ContactAdded value)? contactAdded,
    TResult Function(_ContactDeleted value)? contactDeleted,
    TResult Function(_ContactUpdated value)? contactUpdated,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_SyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements EmergencyContactState {
  const factory _Loaded(final List<EmergencyContactModel> contacts) =
      _$LoadedImpl;

  List<EmergencyContactModel> get contacts;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$EmergencyContactStateCopyWithImpl<$Res, _$ErrorImpl>
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

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EmergencyContactState.error(message: $message)';
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
    required TResult Function() loading,
    required TResult Function(List<EmergencyContactModel> contacts) loaded,
    required TResult Function(String message) error,
    required TResult Function(EmergencyContactModel contact) contactAdded,
    required TResult Function() contactDeleted,
    required TResult Function(EmergencyContactModel contact) contactUpdated,
    required TResult Function() syncing,
    required TResult Function() syncCompleted,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EmergencyContactModel> contacts)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(EmergencyContactModel contact)? contactAdded,
    TResult? Function()? contactDeleted,
    TResult? Function(EmergencyContactModel contact)? contactUpdated,
    TResult? Function()? syncing,
    TResult? Function()? syncCompleted,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EmergencyContactModel> contacts)? loaded,
    TResult Function(String message)? error,
    TResult Function(EmergencyContactModel contact)? contactAdded,
    TResult Function()? contactDeleted,
    TResult Function(EmergencyContactModel contact)? contactUpdated,
    TResult Function()? syncing,
    TResult Function()? syncCompleted,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ContactAdded value) contactAdded,
    required TResult Function(_ContactDeleted value) contactDeleted,
    required TResult Function(_ContactUpdated value) contactUpdated,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_SyncCompleted value) syncCompleted,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ContactAdded value)? contactAdded,
    TResult? Function(_ContactDeleted value)? contactDeleted,
    TResult? Function(_ContactUpdated value)? contactUpdated,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_SyncCompleted value)? syncCompleted,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ContactAdded value)? contactAdded,
    TResult Function(_ContactDeleted value)? contactDeleted,
    TResult Function(_ContactUpdated value)? contactUpdated,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_SyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements EmergencyContactState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContactAddedImplCopyWith<$Res> {
  factory _$$ContactAddedImplCopyWith(
          _$ContactAddedImpl value, $Res Function(_$ContactAddedImpl) then) =
      __$$ContactAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EmergencyContactModel contact});

  $EmergencyContactModelCopyWith<$Res> get contact;
}

/// @nodoc
class __$$ContactAddedImplCopyWithImpl<$Res>
    extends _$EmergencyContactStateCopyWithImpl<$Res, _$ContactAddedImpl>
    implements _$$ContactAddedImplCopyWith<$Res> {
  __$$ContactAddedImplCopyWithImpl(
      _$ContactAddedImpl _value, $Res Function(_$ContactAddedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = null,
  }) {
    return _then(_$ContactAddedImpl(
      null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as EmergencyContactModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EmergencyContactModelCopyWith<$Res> get contact {
    return $EmergencyContactModelCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value));
    });
  }
}

/// @nodoc

class _$ContactAddedImpl implements _ContactAdded {
  const _$ContactAddedImpl(this.contact);

  @override
  final EmergencyContactModel contact;

  @override
  String toString() {
    return 'EmergencyContactState.contactAdded(contact: $contact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactAddedImpl &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactAddedImplCopyWith<_$ContactAddedImpl> get copyWith =>
      __$$ContactAddedImplCopyWithImpl<_$ContactAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EmergencyContactModel> contacts) loaded,
    required TResult Function(String message) error,
    required TResult Function(EmergencyContactModel contact) contactAdded,
    required TResult Function() contactDeleted,
    required TResult Function(EmergencyContactModel contact) contactUpdated,
    required TResult Function() syncing,
    required TResult Function() syncCompleted,
  }) {
    return contactAdded(contact);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EmergencyContactModel> contacts)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(EmergencyContactModel contact)? contactAdded,
    TResult? Function()? contactDeleted,
    TResult? Function(EmergencyContactModel contact)? contactUpdated,
    TResult? Function()? syncing,
    TResult? Function()? syncCompleted,
  }) {
    return contactAdded?.call(contact);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EmergencyContactModel> contacts)? loaded,
    TResult Function(String message)? error,
    TResult Function(EmergencyContactModel contact)? contactAdded,
    TResult Function()? contactDeleted,
    TResult Function(EmergencyContactModel contact)? contactUpdated,
    TResult Function()? syncing,
    TResult Function()? syncCompleted,
    required TResult orElse(),
  }) {
    if (contactAdded != null) {
      return contactAdded(contact);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ContactAdded value) contactAdded,
    required TResult Function(_ContactDeleted value) contactDeleted,
    required TResult Function(_ContactUpdated value) contactUpdated,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_SyncCompleted value) syncCompleted,
  }) {
    return contactAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ContactAdded value)? contactAdded,
    TResult? Function(_ContactDeleted value)? contactDeleted,
    TResult? Function(_ContactUpdated value)? contactUpdated,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_SyncCompleted value)? syncCompleted,
  }) {
    return contactAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ContactAdded value)? contactAdded,
    TResult Function(_ContactDeleted value)? contactDeleted,
    TResult Function(_ContactUpdated value)? contactUpdated,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_SyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (contactAdded != null) {
      return contactAdded(this);
    }
    return orElse();
  }
}

abstract class _ContactAdded implements EmergencyContactState {
  const factory _ContactAdded(final EmergencyContactModel contact) =
      _$ContactAddedImpl;

  EmergencyContactModel get contact;
  @JsonKey(ignore: true)
  _$$ContactAddedImplCopyWith<_$ContactAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContactDeletedImplCopyWith<$Res> {
  factory _$$ContactDeletedImplCopyWith(_$ContactDeletedImpl value,
          $Res Function(_$ContactDeletedImpl) then) =
      __$$ContactDeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContactDeletedImplCopyWithImpl<$Res>
    extends _$EmergencyContactStateCopyWithImpl<$Res, _$ContactDeletedImpl>
    implements _$$ContactDeletedImplCopyWith<$Res> {
  __$$ContactDeletedImplCopyWithImpl(
      _$ContactDeletedImpl _value, $Res Function(_$ContactDeletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ContactDeletedImpl implements _ContactDeleted {
  const _$ContactDeletedImpl();

  @override
  String toString() {
    return 'EmergencyContactState.contactDeleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ContactDeletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EmergencyContactModel> contacts) loaded,
    required TResult Function(String message) error,
    required TResult Function(EmergencyContactModel contact) contactAdded,
    required TResult Function() contactDeleted,
    required TResult Function(EmergencyContactModel contact) contactUpdated,
    required TResult Function() syncing,
    required TResult Function() syncCompleted,
  }) {
    return contactDeleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EmergencyContactModel> contacts)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(EmergencyContactModel contact)? contactAdded,
    TResult? Function()? contactDeleted,
    TResult? Function(EmergencyContactModel contact)? contactUpdated,
    TResult? Function()? syncing,
    TResult? Function()? syncCompleted,
  }) {
    return contactDeleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EmergencyContactModel> contacts)? loaded,
    TResult Function(String message)? error,
    TResult Function(EmergencyContactModel contact)? contactAdded,
    TResult Function()? contactDeleted,
    TResult Function(EmergencyContactModel contact)? contactUpdated,
    TResult Function()? syncing,
    TResult Function()? syncCompleted,
    required TResult orElse(),
  }) {
    if (contactDeleted != null) {
      return contactDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ContactAdded value) contactAdded,
    required TResult Function(_ContactDeleted value) contactDeleted,
    required TResult Function(_ContactUpdated value) contactUpdated,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_SyncCompleted value) syncCompleted,
  }) {
    return contactDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ContactAdded value)? contactAdded,
    TResult? Function(_ContactDeleted value)? contactDeleted,
    TResult? Function(_ContactUpdated value)? contactUpdated,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_SyncCompleted value)? syncCompleted,
  }) {
    return contactDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ContactAdded value)? contactAdded,
    TResult Function(_ContactDeleted value)? contactDeleted,
    TResult Function(_ContactUpdated value)? contactUpdated,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_SyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (contactDeleted != null) {
      return contactDeleted(this);
    }
    return orElse();
  }
}

abstract class _ContactDeleted implements EmergencyContactState {
  const factory _ContactDeleted() = _$ContactDeletedImpl;
}

/// @nodoc
abstract class _$$ContactUpdatedImplCopyWith<$Res> {
  factory _$$ContactUpdatedImplCopyWith(_$ContactUpdatedImpl value,
          $Res Function(_$ContactUpdatedImpl) then) =
      __$$ContactUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EmergencyContactModel contact});

  $EmergencyContactModelCopyWith<$Res> get contact;
}

/// @nodoc
class __$$ContactUpdatedImplCopyWithImpl<$Res>
    extends _$EmergencyContactStateCopyWithImpl<$Res, _$ContactUpdatedImpl>
    implements _$$ContactUpdatedImplCopyWith<$Res> {
  __$$ContactUpdatedImplCopyWithImpl(
      _$ContactUpdatedImpl _value, $Res Function(_$ContactUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = null,
  }) {
    return _then(_$ContactUpdatedImpl(
      null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as EmergencyContactModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EmergencyContactModelCopyWith<$Res> get contact {
    return $EmergencyContactModelCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value));
    });
  }
}

/// @nodoc

class _$ContactUpdatedImpl implements _ContactUpdated {
  const _$ContactUpdatedImpl(this.contact);

  @override
  final EmergencyContactModel contact;

  @override
  String toString() {
    return 'EmergencyContactState.contactUpdated(contact: $contact)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactUpdatedImpl &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactUpdatedImplCopyWith<_$ContactUpdatedImpl> get copyWith =>
      __$$ContactUpdatedImplCopyWithImpl<_$ContactUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EmergencyContactModel> contacts) loaded,
    required TResult Function(String message) error,
    required TResult Function(EmergencyContactModel contact) contactAdded,
    required TResult Function() contactDeleted,
    required TResult Function(EmergencyContactModel contact) contactUpdated,
    required TResult Function() syncing,
    required TResult Function() syncCompleted,
  }) {
    return contactUpdated(contact);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EmergencyContactModel> contacts)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(EmergencyContactModel contact)? contactAdded,
    TResult? Function()? contactDeleted,
    TResult? Function(EmergencyContactModel contact)? contactUpdated,
    TResult? Function()? syncing,
    TResult? Function()? syncCompleted,
  }) {
    return contactUpdated?.call(contact);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EmergencyContactModel> contacts)? loaded,
    TResult Function(String message)? error,
    TResult Function(EmergencyContactModel contact)? contactAdded,
    TResult Function()? contactDeleted,
    TResult Function(EmergencyContactModel contact)? contactUpdated,
    TResult Function()? syncing,
    TResult Function()? syncCompleted,
    required TResult orElse(),
  }) {
    if (contactUpdated != null) {
      return contactUpdated(contact);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ContactAdded value) contactAdded,
    required TResult Function(_ContactDeleted value) contactDeleted,
    required TResult Function(_ContactUpdated value) contactUpdated,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_SyncCompleted value) syncCompleted,
  }) {
    return contactUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ContactAdded value)? contactAdded,
    TResult? Function(_ContactDeleted value)? contactDeleted,
    TResult? Function(_ContactUpdated value)? contactUpdated,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_SyncCompleted value)? syncCompleted,
  }) {
    return contactUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ContactAdded value)? contactAdded,
    TResult Function(_ContactDeleted value)? contactDeleted,
    TResult Function(_ContactUpdated value)? contactUpdated,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_SyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (contactUpdated != null) {
      return contactUpdated(this);
    }
    return orElse();
  }
}

abstract class _ContactUpdated implements EmergencyContactState {
  const factory _ContactUpdated(final EmergencyContactModel contact) =
      _$ContactUpdatedImpl;

  EmergencyContactModel get contact;
  @JsonKey(ignore: true)
  _$$ContactUpdatedImplCopyWith<_$ContactUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncingImplCopyWith<$Res> {
  factory _$$SyncingImplCopyWith(
          _$SyncingImpl value, $Res Function(_$SyncingImpl) then) =
      __$$SyncingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncingImplCopyWithImpl<$Res>
    extends _$EmergencyContactStateCopyWithImpl<$Res, _$SyncingImpl>
    implements _$$SyncingImplCopyWith<$Res> {
  __$$SyncingImplCopyWithImpl(
      _$SyncingImpl _value, $Res Function(_$SyncingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncingImpl implements _Syncing {
  const _$SyncingImpl();

  @override
  String toString() {
    return 'EmergencyContactState.syncing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EmergencyContactModel> contacts) loaded,
    required TResult Function(String message) error,
    required TResult Function(EmergencyContactModel contact) contactAdded,
    required TResult Function() contactDeleted,
    required TResult Function(EmergencyContactModel contact) contactUpdated,
    required TResult Function() syncing,
    required TResult Function() syncCompleted,
  }) {
    return syncing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EmergencyContactModel> contacts)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(EmergencyContactModel contact)? contactAdded,
    TResult? Function()? contactDeleted,
    TResult? Function(EmergencyContactModel contact)? contactUpdated,
    TResult? Function()? syncing,
    TResult? Function()? syncCompleted,
  }) {
    return syncing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EmergencyContactModel> contacts)? loaded,
    TResult Function(String message)? error,
    TResult Function(EmergencyContactModel contact)? contactAdded,
    TResult Function()? contactDeleted,
    TResult Function(EmergencyContactModel contact)? contactUpdated,
    TResult Function()? syncing,
    TResult Function()? syncCompleted,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ContactAdded value) contactAdded,
    required TResult Function(_ContactDeleted value) contactDeleted,
    required TResult Function(_ContactUpdated value) contactUpdated,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_SyncCompleted value) syncCompleted,
  }) {
    return syncing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ContactAdded value)? contactAdded,
    TResult? Function(_ContactDeleted value)? contactDeleted,
    TResult? Function(_ContactUpdated value)? contactUpdated,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_SyncCompleted value)? syncCompleted,
  }) {
    return syncing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ContactAdded value)? contactAdded,
    TResult Function(_ContactDeleted value)? contactDeleted,
    TResult Function(_ContactUpdated value)? contactUpdated,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_SyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class _Syncing implements EmergencyContactState {
  const factory _Syncing() = _$SyncingImpl;
}

/// @nodoc
abstract class _$$SyncCompletedImplCopyWith<$Res> {
  factory _$$SyncCompletedImplCopyWith(
          _$SyncCompletedImpl value, $Res Function(_$SyncCompletedImpl) then) =
      __$$SyncCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncCompletedImplCopyWithImpl<$Res>
    extends _$EmergencyContactStateCopyWithImpl<$Res, _$SyncCompletedImpl>
    implements _$$SyncCompletedImplCopyWith<$Res> {
  __$$SyncCompletedImplCopyWithImpl(
      _$SyncCompletedImpl _value, $Res Function(_$SyncCompletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncCompletedImpl implements _SyncCompleted {
  const _$SyncCompletedImpl();

  @override
  String toString() {
    return 'EmergencyContactState.syncCompleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncCompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<EmergencyContactModel> contacts) loaded,
    required TResult Function(String message) error,
    required TResult Function(EmergencyContactModel contact) contactAdded,
    required TResult Function() contactDeleted,
    required TResult Function(EmergencyContactModel contact) contactUpdated,
    required TResult Function() syncing,
    required TResult Function() syncCompleted,
  }) {
    return syncCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<EmergencyContactModel> contacts)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(EmergencyContactModel contact)? contactAdded,
    TResult? Function()? contactDeleted,
    TResult? Function(EmergencyContactModel contact)? contactUpdated,
    TResult? Function()? syncing,
    TResult? Function()? syncCompleted,
  }) {
    return syncCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<EmergencyContactModel> contacts)? loaded,
    TResult Function(String message)? error,
    TResult Function(EmergencyContactModel contact)? contactAdded,
    TResult Function()? contactDeleted,
    TResult Function(EmergencyContactModel contact)? contactUpdated,
    TResult Function()? syncing,
    TResult Function()? syncCompleted,
    required TResult orElse(),
  }) {
    if (syncCompleted != null) {
      return syncCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_ContactAdded value) contactAdded,
    required TResult Function(_ContactDeleted value) contactDeleted,
    required TResult Function(_ContactUpdated value) contactUpdated,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_SyncCompleted value) syncCompleted,
  }) {
    return syncCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_ContactAdded value)? contactAdded,
    TResult? Function(_ContactDeleted value)? contactDeleted,
    TResult? Function(_ContactUpdated value)? contactUpdated,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_SyncCompleted value)? syncCompleted,
  }) {
    return syncCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_ContactAdded value)? contactAdded,
    TResult Function(_ContactDeleted value)? contactDeleted,
    TResult Function(_ContactUpdated value)? contactUpdated,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_SyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (syncCompleted != null) {
      return syncCompleted(this);
    }
    return orElse();
  }
}

abstract class _SyncCompleted implements EmergencyContactState {
  const factory _SyncCompleted() = _$SyncCompletedImpl;
}
