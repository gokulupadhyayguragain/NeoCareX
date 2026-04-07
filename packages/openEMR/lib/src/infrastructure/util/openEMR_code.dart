
import 'package:freezed_annotation/freezed_annotation.dart';

part 'openEMR_code.freezed.dart';
part 'openEMR_code.g.dart';

/// {@template cerner_code}
///
/// {@endtemplate}
@freezed
class OpenEMRCode with _$OpenEMRCode {
  /// {@macro cerner_code}
  const factory OpenEMRCode({
    required String code,
    @JsonKey(name: 'redirect_uri') required String redirectUri,
    @JsonKey(name: 'client_id') required String clientId,
    @Default('authorization_code')
    @JsonKey(name: 'grant_type')
    String grantType,
  }) = _OpenEMRCode;

  /// Converts [json] into [OpenEMRCode].
  factory OpenEMRCode.fromJson(Map<String, dynamic> json) =>
      _$OpenEMRCodeFromJson(json);
}
