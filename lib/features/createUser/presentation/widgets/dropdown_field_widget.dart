import 'package:flutter/material.dart';


// ignore: must_be_immutable
class DropdownFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final List<String> options;
  bool device;
  bool compulsory;
  GlobalKey<FormState> formkey;

  DropdownFieldWidget({
    super.key,
    required this.controller,
    required this.name,
    required this.options,
    required this.device,
    required this.compulsory,
    required this.formkey,
  });

  @override
  State<DropdownFieldWidget> createState() => _DropdownFieldWidgetState();
}

class _DropdownFieldWidgetState extends State<DropdownFieldWidget> {
  String? selectedValue;

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
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(widget.name, selectedValue, widget.device),
            DropdownButtonFormField<String>(
              //key: widget.formkey,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Field is required";
                }
                return null;
              },
              initialValue: selectedValue,
              decoration: _inputDecoration(widget.name),
              items: widget.options
                  .map(
                    (option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ),
                  )
                  .toList(),

              onChanged: (value) {
                // showDialog(
                //   context: context,
                //   builder: (context) => DeviceDialog(
                //     title: "Add device registration number",
                //     content: "$value",
                //     onConfirm: () {
                //       // Do something when OK is pressed
                //       debugPrint("Confirmed!");
                //     },
                //   ),
                // );
                setState(() {
                  selectedValue = value;
                  widget.controller.text =
                      value ?? ''; // 🔹 Keep controller updated
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _sectionTitle(String title, String? selectedValue, bool isDevice) {
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
          Text(
            ' *',
            style: const TextStyle(
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

Widget selectedOption(String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
