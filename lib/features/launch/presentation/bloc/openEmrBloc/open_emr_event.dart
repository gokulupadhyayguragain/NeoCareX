abstract class OpenemrEhrLaunchEvent {}

class LaunchAndHandle extends OpenemrEhrLaunchEvent {
  final String? launch;
  final Future<Uri> Function(Uri url) callBack;

  LaunchAndHandle({required this.launch, required this.callBack});
}
