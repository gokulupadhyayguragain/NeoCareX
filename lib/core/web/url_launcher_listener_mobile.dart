import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UrlLauncherListener {
  final Uri url;
  final bool sameTab;

  final StreamController<Uri> _streamController =
      StreamController<Uri>.broadcast();

  UrlLauncherListener(this.url, BuildContext context, {this.sameTab = false}) {
    _showWebOnDialog(context);
  }

  /// provides stream of uri
  Stream<Uri> get stream => _streamController.stream;

  void close() {
    _streamController.sink.close();
  }

  WebViewController _getController(ValueSetter<String> onNavigationPrevented) {
    final redirectUrl = url.queryParameters['redirect_uri'] ?? '';

    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        "Mozilla/5.0 (Linux; Android 10; Mobile; rv:89.0) Gecko/89.0 Firefox/89.0",
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            if (request.url.startsWith(redirectUrl)) {
              onNavigationPrevented(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(url);
  }

  /// Display web browser inside the box.
  Future<void> _showWebOnDialog(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing when tapping outside
      builder: (context) {
        final controller = _getController((value) {
          _streamController.add(Uri.parse(value));
          Navigator.of(context).pop();
        });

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 300,
                    maxWidth: 300,
                  ),
                  child: WebViewWidget(controller: controller),
                ),
              ),
              // Close (X) button
              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Pops the current screen
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
