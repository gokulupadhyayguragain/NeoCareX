import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobilePlaceholderTextFormFieldWidget extends StatelessWidget {
  const MobilePlaceholderTextFormFieldWidget({
    super.key,
    required this.placeholder,
    required this.hintText,
    this.controller,
    this.readOnly,
    this.keyboardType,
    this.inputFormatters,
    required this.isRequired,
    this.validator,
  });
  final String? Function(String?)? validator;
  final String placeholder;
  final String hintText;
  final TextEditingController? controller;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Column(
        children: [
          SizedBox(
            width: (screenWidth - 80),
            child: SelectableText.rich(
              TextSpan(
                text: placeholder,
                style: Theme.of(context).textTheme.titleSmall,
                children: <TextSpan>[
                  TextSpan(
                    text: isRequired ? " *" : " ",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: (screenWidth - 80),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                child: TextFormField(
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: inputFormatters,
                  readOnly: readOnly ?? false,
                  controller: controller,
                  keyboardType: keyboardType,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    fillColor: (readOnly ?? false)
                        ? Colors.blueGrey.shade50.withValues(alpha: 0.4)
                        : Theme.of(context).cardColor,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white
                            : Colors.blueGrey.shade50,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.red.shade50
                            : Colors.red.shade50,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white
                            : Colors.blueGrey.shade50,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: hintText,
                    labelStyle: Theme.of(context).textTheme.labelMedium,
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
