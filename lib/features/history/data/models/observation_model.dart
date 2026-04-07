import 'package:freezed_annotation/freezed_annotation.dart';

part 'observation_model.freezed.dart';
part 'observation_model.g.dart';

@freezed
class ObservationResponse with _$ObservationResponse {
  const factory ObservationResponse({
    required List<ObservationEntry> entry,
  }) = _ObservationResponse;

  factory ObservationResponse.fromJson(Map<String, dynamic> json) =>
      _$ObservationResponseFromJson(json);
}

@freezed
class ObservationEntry with _$ObservationEntry {
  const factory ObservationEntry({
    required Observation resource,
  }) = _ObservationEntry;

  factory ObservationEntry.fromJson(Map<String, dynamic> json) =>
      _$ObservationEntryFromJson(json);
}

@freezed
class Observation with _$Observation {
  const factory Observation({
    ObservationMeta? meta,
    ObservationValue? value,
    List<ObservationComponent>? component,
  }) = _Observation;

  factory Observation.fromJson(Map<String, dynamic> json) =>
      _$ObservationFromJson(json);
}

@freezed
class ObservationMeta with _$ObservationMeta {
  const factory ObservationMeta({
    String? lastUpdated,
  }) = _ObservationMeta;

  factory ObservationMeta.fromJson(Map<String, dynamic> json) =>
      _$ObservationMetaFromJson(json);
}

@freezed
class ObservationValue with _$ObservationValue {
  const factory ObservationValue({
    @JsonKey(name: 'Quantity') ObservationQuantity? quantity,
  }) = _ObservationValue;

  factory ObservationValue.fromJson(Map<String, dynamic> json) =>
      _$ObservationValueFromJson(json);
}

@freezed
class ObservationQuantity with _$ObservationQuantity {
  const factory ObservationQuantity({
    num? value,
  }) = _ObservationQuantity;

  factory ObservationQuantity.fromJson(Map<String, dynamic> json) =>
      _$ObservationQuantityFromJson(json);
}

@freezed
class ObservationComponent with _$ObservationComponent {
  const factory ObservationComponent({
    ObservationValue? value,
  }) = _ObservationComponent;

  factory ObservationComponent.fromJson(Map<String, dynamic> json) =>
      _$ObservationComponentFromJson(json);
}
