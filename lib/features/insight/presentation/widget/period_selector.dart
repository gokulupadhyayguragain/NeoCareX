import 'package:flutter/material.dart';

class PeriodSelector extends StatelessWidget {
  final String currentPeriod;
  final Function(String) onPeriodSelected;

  const PeriodSelector({
    super.key,
    required this.currentPeriod,
    required this.onPeriodSelected,
  });

  @override
  Widget build(BuildContext context) {
    final periods = ['1D', '1W', '1M', '1Y', 'All'];
    return Row(
      children: periods.map((period) {
        final isSelected = currentPeriod == period;
        return GestureDetector(
          onTap: () => onPeriodSelected(period),
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? Colors.grey.shade200 : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              period,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
