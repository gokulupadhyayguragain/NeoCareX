import 'package:flutter/material.dart';

import 'url_launcher_listener_mobile.dart'
    if (dart.library.html) 'url_launcher_listener_web.dart';

class UrlLauncherAndListenerUniversal {
  final Uri url;
  final bool sameTab;
  late UrlLauncherListener launcherListener;

  UrlLauncherAndListenerUniversal(
    this.url,
    BuildContext context, {
    this.sameTab = false,
  }) {
    launcherListener = UrlLauncherListener(url, context, sameTab: sameTab);
  }

  UrlLauncherListener get instance => launcherListener;
}
