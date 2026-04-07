// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;

class UrlLauncher {
  final String url;
  final bool sameTab;

  UrlLauncher({
    required this.url,
    this.sameTab = true,
  }) {
    html.window.open(url, sameTab ? '_self' : '_blank');
  }
}
