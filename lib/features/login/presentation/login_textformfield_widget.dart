import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextFormfieldWidget extends StatelessWidget {
  const LoginTextFormfieldWidget({
    super.key,
    required this.placeholder,
    required this.hintText,
    this.controller,
    required this.isRequired,
    this.focusNode,
    this.hasHeader,
    this.suffixIcon,
    this.onTap,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onSaved,
    this.isDisabled,
    this.onFieldSubmitted,
    this.obscureText,
  });
  final bool isRequired;
  final bool? hasHeader;
  final bool? obscureText;
  final String placeholder;
  final String hintText;
  final TextEditingController? controller;
  final bool?
      isDisabled; //To Fill the textfield color with grey color and disable textfield
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (hasHeader == null || hasHeader!)
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SizedBox(
                    width: 200,
                    child: SelectableText(
                      placeholder,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              : const SizedBox(),
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textCapitalization: TextCapitalization.words,
                validator: validator ??
                    (isRequired
                        ? (value) {
                            if (value == null || value.isEmpty) {
                              return '*Required';
                            }
                            return null;
                          }
                        : null),
                onSaved: onSaved,
                onTap: onTap,
                obscureText: obscureText ?? false,
                onFieldSubmitted: onFieldSubmitted,
                focusNode: focusNode,
                mouseCursor: SystemMouseCursors.text,
                controller: controller,
                keyboardType: keyboardType ?? TextInputType.multiline,
                inputFormatters: inputFormatters,
                style: Theme.of(context).textTheme.bodyMedium,
                textInputAction: textInputAction ?? TextInputAction.done,
                decoration: InputDecoration(
                  fillColor: (isDisabled ?? false)
                      ? Colors.grey.shade400
                      : Theme.of(context).cardColor,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white
                            : Colors.black26,
                        width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
