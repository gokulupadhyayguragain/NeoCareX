import 'package:fhir/r4/r4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/createUser/presentation/bloc/update_device/bloc/update_device_bloc.dart';

class DeviceDialog extends StatefulWidget {
  final String title;
  final Device device;
  final Function onConfirm;
  final TextEditingController deviceRegistrationNumber;

  const DeviceDialog({
    super.key,
    required this.title,
    required this.device,
    required this.onConfirm,
    required this.deviceRegistrationNumber,
  });

  @override
  State<DeviceDialog> createState() => _DeviceDialogState();
}

class _DeviceDialogState extends State<DeviceDialog> {
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: label,
      labelStyle: Theme.of(context).textTheme.labelLarge,
      filled: true,
      fillColor: Colors.blue.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none, // 🔹 Removes border line
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateDeviceBloc, UpdateDeviceState>(
      builder: (context, state) {
        return AlertDialog(
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          content: (state is DeviceLoaded)
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Device Name : ${state.device.deviceName?.first.name}",
                    ),
                    SizedBox(height: 15),
                    // Text("Type : ${state.device.type?.coding?.first.display}"),
                    // SizedBox(height: 15),
                    _sectionTitle("Registration Number"),

                    TextFormField(
                      decoration: _inputDecoration("Registration Number"),
                      controller: widget.deviceRegistrationNumber,
                    ),
                    SizedBox(height: 15),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
          actions: [
            (state is DeviceLoaded)
                ? TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  )
                : Container(),
            (state is DeviceLoaded)
                ? TextButton(
                    onPressed: () {
                      widget.onConfirm(state.device);
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}

Widget _sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
