import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:patient_app/core/auth/dio.dart';

import '../../login/presentation/error_message_service.dart';

class WebviewPage01 extends StatefulWidget {
  final Function callback;
  const WebviewPage01({Key? key, required this.callback}) : super(key: key);

  @override
  _WebviewPage01State createState() => _WebviewPage01State();
}

class _WebviewPage01State extends State<WebviewPage01> {
  InAppWebViewController? webViewController;
  late String ticketNo;

  @override
  void initState() {
    super.initState();
    print("Hello There");
    ticketNo = generateTicketNumber();
  }

  String generateTicketNumber() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        10,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  Future<void> callApiAfterSuccess() async {
    print("API is called 123");
    // final flaskRepository = sl.get<IFlaskRepository>();
    // final saveTransactionResponse =
    //     await flaskRepository.saveTransaction(amount, ticketNo);
    DioClient dioclient = DioClient();
    String url = '/sphere/save_transactions';
    final response = await dioclient.dio.post(
      url,
      data: {"amount": amount, "ticket_id": ticketNo},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      showSuccessMessage(
        "The transaction was completed successfully.",
        context,
      );
    }

    //saveTransactionResponse;
    widget.callback();
    Navigator.pop(context);
  }

  double amount = 33.77;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final paymentUrl =
        "https://stagepremier.trustcommerce.com/trustcommerce_payment/index.php"
        "?trxcustid=1387500"
        "&trxcustid_licensekey=0UPRddq64KlPJYA7nCWtBiAKk5O68mCilaIOdcWFMNC3urGxa2eETZ7DdXjru2UL"
        "&amount=$amount"
        "&ticketno=$ticketNo"
        "&css_style=2";
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(paymentUrl)),
        onWebViewCreated: (controller) async {
          webViewController = controller;
        },
        onLoadStop: (controller, url) async {
          print("Loding Stopped");
          final result = await controller.evaluateJavascript(
            source: "window.location.href;",
          );
          result;
          count++;
          if (count == 2) {
            await callApiAfterSuccess();
            //if (mounted) Navigator.pop(context);
          }
        },
      ),
    );
  }
}
