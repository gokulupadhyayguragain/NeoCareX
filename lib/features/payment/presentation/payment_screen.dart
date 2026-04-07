import 'package:flutter/material.dart';
import 'package:patient_app/features/payment/presentation/payment_webview.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(
          //       //     builder: (_) => WebviewPage01(callback: () {}),
          //       //   ),
          //       // );
          //     },
          //     child: Container(
          //       width: 300,
          //       height: 80,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(25),
          //         border: Border.all(color: Colors.blue),
          //         color: Colors.white,
          //       ),
          //       child: Center(
          //         child: const Text(
          //           "",
          //           style: TextStyle(
          //             color: Colors.black,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
