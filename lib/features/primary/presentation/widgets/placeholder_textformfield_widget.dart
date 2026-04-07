// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlaceholderTextFormFieldWidget extends StatelessWidget {
  const PlaceholderTextFormFieldWidget({
    super.key,
    this.isMediumScreen,
    required this.placeholder,
    required this.hintText,
    this.controller,
    this.readOnly,
    this.keyboardType,
    this.inputFormatters,
    required this.isRequired,
    this.validator,
  });
  final bool isRequired;
  final String? Function(String?)? validator;
  final bool? isMediumScreen;
  final String placeholder;
  final String hintText;
  final TextEditingController? controller;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            // width: isMediumScreen == null ? (screenWidth-400)/2 : isMediumScreen! ? (screenWidth-250)/2 :(screenWidth-350)/2,
            width: isMediumScreen == null
                ? (screenWidth - 400) / 2
                : isMediumScreen!
                ? (screenWidth - 250) / 2
                : (screenWidth - 260) / 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                placeholder,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width:
                // isMediumScreen == null ? (screenWidth-400)/2 : isMediumScreen! ? (screenWidth-250)/2 :(screenWidth-350)/2,
                isMediumScreen == null
                ? (screenWidth - 400) / 2
                : isMediumScreen!
                ? (screenWidth - 250) / 2
                : (screenWidth - 260) / 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:
                      validator ??
                      (isRequired
                          ? (value) {
                              if (value == null || value.isEmpty) {
                                return '*Required';
                              }
                              return null;
                            }
                          : null),
                  inputFormatters: inputFormatters,
                  readOnly: readOnly ?? false,
                  controller: controller,
                  keyboardType: keyboardType,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    isCollapsed: false,
                    hoverColor:
                        (Theme.of(context).brightness == Brightness.dark)
                        ? Colors.black26
                        : Colors.blueGrey.shade50.withValues(alpha: 0.4),
                    fillColor: (Theme.of(context).brightness == Brightness.dark)
                        ? Colors.black26
                        : Colors.blue.shade50,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: hintText,
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
