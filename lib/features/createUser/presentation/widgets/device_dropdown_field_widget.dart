import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/createUser/presentation/bloc/update_device/bloc/update_device_bloc.dart';

import 'device_dialogbox.dart';

// ignore: must_be_immutable
class DeviceDropdownFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final List<Device> options;
  final List<Device> selectedDevice;
  bool device;
  bool compulsory;
  GlobalKey<FormState> formkey;
  Function addDeviceToDeviceTable;
  Function removeDeviceToDeviceTable;

  DeviceDropdownFieldWidget({
    super.key,
    required this.controller,
    required this.name,
    required this.options,
    required this.selectedDevice,
    required this.device,
    required this.compulsory,
    required this.formkey,
    required this.addDeviceToDeviceTable,
    required this.removeDeviceToDeviceTable,
  });

  @override
  State<DeviceDropdownFieldWidget> createState() =>
      _DeviceDropdownFieldWidgetState();
}

class _DeviceDropdownFieldWidgetState extends State<DeviceDropdownFieldWidget> {
  Device? selectedValue;
  List<String> allSelectedOptions = ["Hello", "Hi"];
  TextEditingController deviceRegistrationNumber = TextEditingController();

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
            _sectionTitle(
              widget.name,
              selectedValue?.deviceName?[0].name,
              widget.device,
            ),
            DropdownButtonFormField<Device>(
              //key: widget.formkey,
              validator: (value) {
                if (value == null) {
                  return "Please select a device";
                }
                return null;
              },
              initialValue: selectedValue,
              decoration: _inputDecoration(widget.name),
              items: widget.options
                  .map(
                    (option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.deviceName?[0].name ?? ''),
                    ),
                  )
                  .toList(),

              onChanged: (value) {
                showDialog(
                  context: context,
                  builder: (context) => BlocProvider(
                    create: (context) => UpdateDeviceBloc()
                      ..add(
                        GetDeviceData(
                          Device(),
                          (value.type?.coding?[0].code ?? '').toString(),
                        ),
                      ),
                    child: DeviceDialog(
                      title: "Add device registration number",
                      device: value!,
                      deviceRegistrationNumber: deviceRegistrationNumber,
                      onConfirm: (Device device) {
                        // Do something when OK is pressed

                        debugPrint("Confirmed!");
                        widget.addDeviceToDeviceTable(
                          device,
                          deviceRegistrationNumber.text,
                        );
                        // setState(() {
                        //   widget.selectedDevice.add(value);
                        // });
                      },
                    ),
                  ),
                );
                // setState(() {
                //   selectedValue = value;
                //   // widget.controller.text =
                //   //     value?.deviceName?.first.name ??
                //   //     ''; // 🔹 Keep controller updated
                // });
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
