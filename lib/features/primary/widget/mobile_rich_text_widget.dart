import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MobileRichTextWidget extends StatelessWidget {
  String? placeholder;
  String? text;
   MobileRichTextWidget({super.key,required this.placeholder,required this.text});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    return Container(
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          color: Colors.blueGrey.shade50.withValues(alpha: 0.4),
          border: Border.all(color: Colors.blueGrey.shade50)),
      width: screenWidth-20,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
                  children:  [
                    SizedBox(
                      width: (screenWidth-60)/3,
                      child: Text(
                       placeholder!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                       width: (screenWidth-60)/1.8,
                      child: SelectableText(
                       text!,
                       maxLines: 1,
                        style: const TextStyle(
                          fontSize: 14.0,
                          
                        ),
                      ),
                    ),
                  ],
                ),
              
      ),
    );
  }
}