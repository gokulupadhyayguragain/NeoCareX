import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final bool compulsory;
  final bool isDate;
  final bool obscureText;
  final String? Function(String?)? customValidator;
  final List<TextInputFormatter>? inputFormatters;
  final bool expand;  

  const FormFieldWidget({
    super.key,
    required this.controller,
    required this.name,
    required this.compulsory,
    required this.isDate,
    this.obscureText = false,
    this.customValidator,
    this.inputFormatters,
    this.expand = true,  
  });

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: label,
      labelStyle: Theme.of(context).textTheme.labelLarge,
      filled: true,
      fillColor: Colors.blue.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      suffixIcon: widget.obscureText 
          ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey.shade600,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
          : null,
    );
  }

  Widget _buildFieldContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(widget.name, widget.compulsory),
          TextFormField(
            validator: (value) {
              if (widget.compulsory && (value == null || value.isEmpty)) {
                return "${widget.name} is required";
              }

              if (!widget.compulsory && (value == null || value.isEmpty)) {
                return null;
              }

              if (widget.customValidator != null) {
                return widget.customValidator!(value);
              }

              return null;
            },
            controller: widget.controller,
            obscureText: widget.obscureText ? _obscureText : false,
            decoration: _inputDecoration(widget.name),
            keyboardType: widget.isDate
                ? TextInputType.datetime
                : (widget.obscureText
                    ? TextInputType.visiblePassword
                    : TextInputType.text),
            inputFormatters: widget.inputFormatters,
            onTap: () async {
              if (widget.isDate) {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  widget.controller.text = pickedDate.toString().split(' ')[0];
                }
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.expand) {
      return Expanded(child: _buildFieldContent());
    }
    return _buildFieldContent();
  }
}

Widget _sectionTitle(String title, bool compulsory) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          if (compulsory)
            const Text(
              ' *',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
        ],
      ),
    ),
  );
}