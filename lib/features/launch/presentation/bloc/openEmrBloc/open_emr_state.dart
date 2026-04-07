import 'package:fhir/r4/resource_types/foundation/other/other.dart';

abstract class OpenemrEhrLaunchState {}

class OpenemrEhrInitial extends OpenemrEhrLaunchState {}

class OpenemrEhrLoading extends OpenemrEhrLaunchState {}

class OpenemrEhrLoaded extends OpenemrEhrLaunchState {
  final Bundle bundle;
  final List observationsList;

  OpenemrEhrLoaded({required this.bundle, required this.observationsList});
}

class OpenemrEhrFailure extends OpenemrEhrLaunchState {
  final String message;

  OpenemrEhrFailure({required this.message});
}
