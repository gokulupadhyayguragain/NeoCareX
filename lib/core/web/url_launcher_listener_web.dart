// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
// ignore: deprecated_member_use
import 'dart:html';

import 'package:flutter/material.dart';

/// {@template url_launcher_listener}
/// ### UrlLauncherListener
/// This is helper class for launching the provided [url]
/// in new tab of the browser
/// and listening to redirected url provided inside that [url]
///
/// When the lunched url redirect back to the redirection url
/// it will listen to that redirected url and adds this url in
///
/// ***
/// **Steps:**
/// 1. It will launch the [url] in new tab of browser
/// 2. When the redirection happens *static.html* file script will return
/// the redirected url back to main script
/// 3. This class will add the return url to the [stream]
/// 4. This class will close the current tab
/// [stream]
///
/// **Example code**
/// ```
///   final url = Uri.parse('your_url');
///
///   final urlLauncher = UrlLauncherListenerHelper(url);
///
///   urlLauncher.stream.listen((event) {
///     print(event); // http://www.example.com?code=dofskdf
///   }).onDone(() {
///     urlLauncher.close(); // should close the stream
///   });
/// ```
/// {@endtemplate}
///
/// ***
///
/// **Warning**
///
/// To work properly you need to add the static.html file inside
/// the web directory with the following script
/// ```
///   window.opener.postMessage(window.location.href, '*')
/// ```
/// Otherwise, it will never returns any url stream back
class UrlLauncherListener {
  WindowBase? _popupWin;

  /// to which this class will pop new tab in browser
  
  final Uri url;

  /// pop window to which this class will.
  final bool sameTab;

  final StreamController<Uri> _streamController =
      StreamController<Uri>.broadcast();

  /// provides stream of uri
  Stream<Uri> get stream => _streamController.stream;

  /// {@macro url_launcher_listener}
  UrlLauncherListener(this.url, BuildContext context, {this.sameTab = false}) {
    _popupWin = window.open(
      url.toString(),
      sameTab ? "_self" : "_blank",
    );

    _listenToRedirectLink();
  }

  /// Listen to message
  void _listenToRedirectLink() {
    window.onMessage.listen((event) {
      // if (event.data.toString().contains('access_token=')) {
      _login(event.data);
      // }
    });
  }

  void _login(String data) {
    final receiveUri = Uri.parse(data);

    _streamController.sink.add(receiveUri);

    if (_popupWin != null) {
      _popupWin!.close();
      _popupWin = null;
    }
  }

  /// should call this function after stream will output the url
  /// to close the stream
  void close() {
    _streamController.sink.close();
  }
}
