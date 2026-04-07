import 'package:freezed_annotation/freezed_annotation.dart';

part 'openEMR_patient_search_parameter.freezed.dart';
part 'openEMR_patient_search_parameter.g.dart';

/// {@template cerner_patient_search_parameter}
///
/// Should provide all the parameters to search patient. If not then it will
/// returns multiple patient information.
///
/// __birthDate__ : yyyy-MM-dd.
///
/// __phoneNumber__ : should be the length of 10.
///
/// __gender__ : should be the male,female or unknown.
///
/// {@endtemplate}
@freezed
class OpenEMRPatientSearch with _$OpenEMRPatientSearch {
  /// {@macro cerner_patient_search_parameter}
  const factory OpenEMRPatientSearch({
    required String given,
    required String family,
    @CustomDateTimeConverter() required DateTime birthDate,
    required String gender,
    String? phone,
  }) = _OpenEMRPatientSearch;

  /// Converts [json] into [OpenEMRPatientSearch].
  factory OpenEMRPatientSearch.fromJson(Map<String, dynamic> json) =>
      _$OpenEMRPatientSearchFromJson(json);
}

/// Cerner patient gender.
enum OpenEMRPatientGender {
  /// male
  male('Male'),

  /// female
  female('Female'),

  /// other than male and female.
  unknown('Unknown');

  const OpenEMRPatientGender(this.displayName);

  /// Display name of the enum value.
  final String displayName;
}

///
class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  ///
  const CustomDateTimeConverter();
  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String().split('T').first;
}
