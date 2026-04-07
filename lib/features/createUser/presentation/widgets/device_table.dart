import 'dart:math';

import 'package:fhir/r4.dart';
import 'package:flutter/material.dart';

Widget buildDeviceTable(
  List<Device>? devices,
  BuildContext context,
  Function removeDeviceToDeviceTable,
) {
  const double imageSize = 50;
  if (devices == null || devices.isEmpty) {
    return const SizedBox();
  }
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return LayoutBuilder(
    builder: (context, constraints) {
      final width = min(constraints.maxWidth, 650);
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          color: isDark ? Colors.black26 : Colors.grey.shade200,
          child: Table(
            border: TableBorder.symmetric(
              inside: BorderSide(
                color: Theme.of(context).cardColor,
                width: 2.0,
                style: BorderStyle.solid,
              ),
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FixedColumnWidth(width * 0.65),
              1: const FixedColumnWidth(100.0),
              2: const FixedColumnWidth(80.0),
              3: const FixedColumnWidth(70.0),
            },
            children: [
              TableRow(
                children: [
                  _buildTableHeader(context, "Device"),
                  // _buildTableHeader(context, "Quantity"),
                  // _buildTableHeader(context, "Supplier"),
                  _buildTableHeader(context, "Delete"),
                ],
              ),
              for (var device in devices)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   width: imageSize,
                          //   height: imageSize,
                          //   child: Image.network(''),
                          // ),
                          SizedBox(
                            width: width * 0.65 - (imageSize + 20),
                            child: Text(
                              device.deviceName?.first.name?.replaceAll(
                                    '',
                                    '',
                                  ) ??
                                  '',
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: SizedBox(
                    //     width: imageSize,
                    //     height: imageSize,
                    //     child: Text(""),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: SizedBox(
                    //     width: imageSize,
                    //     height: imageSize,
                    //     child: Text(""),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          removeDeviceToDeviceTable(device);
                        },
                        icon: const Icon(Icons.clear, color: Colors.red),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
    },
  );
}

Padding _buildTableHeader(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
  );
}
