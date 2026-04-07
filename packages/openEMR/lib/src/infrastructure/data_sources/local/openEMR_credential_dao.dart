import 'dart:convert';

import 'package:openEMR/openEMR.dart';
import 'package:openEMR/src/infrastructure/data_sources/local/openEMR_dao.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// {@template cerner_credential_dao}
/// Implementation of [OpenEMRDao] to store [OpenEMRCredential].
/// {@endtemplate}
class OpenEMRCredentialDao implements OpenEMRDao<OpenEMRCredential> {
  /// {@macro cerner_credential_dao}
  OpenEMRCredentialDao(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  /// cached version of [OpenEMRCredential].
  @visibleForTesting
  OpenEMRCredential? cachedCredential;

  /// Key for credential storage.
  @visibleForTesting
  static const String key = 'OpenEMR_CREDENTIAL';

  @override
  Future<void> create(OpenEMRCredential entity) async {
    // cachedCredential = entity;
    await _secureStorage.write(key: key, value: jsonEncode(entity.toJson()));
  }

  @override
  Future<void> delete() async {
    cachedCredential = null;
    await _secureStorage.delete(key: key);
  }

  @override
  Future<OpenEMRCredential?> read() async {
    // if (cachedCredential != null) return cachedCredential;
    final jsonString = await _secureStorage.read(key: key);
    if (jsonString == null) return null;
    return cachedCredential = OpenEMRCredential.fromJson(
      jsonDecode(jsonString) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> update(OpenEMRCredential entity) async {
    await create(entity);
  }
}
