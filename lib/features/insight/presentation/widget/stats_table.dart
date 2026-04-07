import 'package:flutter/material.dart';

class TableRowData {
  final String title;
  final String average;
  final String latest;

  TableRowData({
    required this.title,
    required this.average,
    required this.latest,
  });
}

class StatsTable extends StatelessWidget {
  final List<TableRowData> rows;
  final bool? isMobile;
  StatsTable({super.key, required this.rows, this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Row
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Parameter",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: (isMobile == true) ? 12 : 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Average Value",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: (isMobile == true) ? 12 : 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Latest Value",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: (isMobile == true) ? 12 : 14,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1),

            // Data Rows
            ...rows.map(
              (row) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        row.title,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        row.average,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        row.latest,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
