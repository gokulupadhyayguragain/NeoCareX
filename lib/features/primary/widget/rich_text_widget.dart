import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RichTextWidget extends StatelessWidget {
  
  RichTextWidget({super.key,required this.column, required this.placeholder,required this.text,this.isMediumScreen});
  int column;
  String? placeholder;
  String? text;
  bool? isMediumScreen;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    final placeholderStyle = Theme.of(context).textTheme.titleMedium;
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    return SizedBox(width: isMediumScreen! ? (screenWidth-220)/2:
    //column ==1 ? (screenWidth-360)/2:(screenWidth-380)/2,
    column ==1 ? (screenWidth-250)/2:(screenWidth-250)/2,
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                      children: [
                        SizedBox(
                           width: isMediumScreen! ? (screenWidth-250)/5:
                           //column == 1 ? (screenWidth-600)/5 :(screenWidth-450)/5,
                          column == 1 ? (screenWidth-600)/5 :(screenWidth-300)/5,
                          child: Text(
                            placeholder!,
                            style: placeholderStyle
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: isMediumScreen! ? (screenWidth-250)/4:
                          //column ==1 ? (screenWidth-250)/3.8 :(screenWidth-450)/3.8,
                          column == 1 ? (screenWidth-300)/4 :(screenWidth-300)/4,
                          child: SelectableText(
                            text!,
                            maxLines: 1,
                            style: textStyle ,
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
            
    );
  }
}