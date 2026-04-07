import 'dart:convert';

import 'package:openEMR/openEMR.dart';

import 'package:openEMR/src/infrastructure/data_sources/local/openEMR_dao.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// {@template cerner_capability_statement_dao}
/// Implementation of [OpenEMRDao] to store [OpenEMRCapabilityStatement].
/// {@endtemplate}
class OpenEMRCapabilityStatementDao
    implements OpenEMRDao<OpenEMRCapabilityStatement> {
  /// {@macro cerner_capability_statement_dao}
  OpenEMRCapabilityStatementDao(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  /// cached version of [OpenEMRCredential].
  @visibleForTesting
  OpenEMRCapabilityStatement? cachedCapabilityStatement;

  /// Key for credential storage.
  @visibleForTesting
  static const String key = 'OpenEMR_CAPABILITY_STATEMENT';

  @override
  Future<void> create(OpenEMRCapabilityStatement entity) async {
    cachedCapabilityStatement = entity;
    await _secureStorage.write(key: key, value: jsonEncode(entity.toJson()));
  }

  @override
  Future<void> delete() async {
    cachedCapabilityStatement = null;
    await _secureStorage.delete(key: key);
  }

  @override
  Future<OpenEMRCapabilityStatement?> read() async {
    if (cachedCapabilityStatement != null) return cachedCapabilityStatement!;
    final jsonString = await _secureStorage.read(key: key);
    if (jsonString == null) return null;
    return cachedCapabilityStatement = OpenEMRCapabilityStatement.fromJson(
      jsonDecode(jsonString) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> update(OpenEMRCapabilityStatement entity) => create(entity);
}
