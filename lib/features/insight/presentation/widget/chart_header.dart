import 'package:flutter/material.dart';

class ChartHeader extends StatelessWidget {
  final String title;
  final Color color;
  final List<LegendItem>? legendItems;
  final VoidCallback? onFullscreen;

  const ChartHeader({
    super.key,
    required this.title,
    required this.color,
    this.legendItems,
    this.onFullscreen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        if (legendItems != null) ...[
          const Spacer(),
          ...legendItems!.expand((item) => [
            Icon(Icons.remove, color: item.color, size: 16),
            const SizedBox(width: 4),
            Text(
              item.label,
              style: TextStyle(color: item.color, fontSize: 12),
            ),
            const SizedBox(width: 12),
          ]),
        ],
        const Spacer(),
        if (onFullscreen != null)
          IconButton(
            icon: const Icon(Icons.fullscreen, color: Colors.grey),
            onPressed: onFullscreen,
          ),
      ],
    );
  }
}

class LegendItem {
  final String label;
  final Color color;

  const LegendItem({required this.label, required this.color});
}
