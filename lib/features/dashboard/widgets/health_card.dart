import 'package:flutter/material.dart';

class HealthCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String change;
  final bool isPositive;
  final IconData icon;

  const HealthCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.change,
    required this.isPositive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (MediaQuery.of(context).size.width > 1200) ...[
              Icon(icon, color: Colors.blue, size: 44),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      if (MediaQuery.of(context).size.width > 768)
                        const Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                          size: 20,
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          value,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        isPositive
                            ? Icons.arrow_upward_rounded
                            : Icons.arrow_downward_rounded,
                        color: isPositive ? Colors.green : Colors.red,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      if (MediaQuery.of(context).size.width > 1200)
                        Text(
                          change,
                          style: TextStyle(
                            color: isPositive ? Colors.green : Colors.red,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                  Text(
                    unit,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
