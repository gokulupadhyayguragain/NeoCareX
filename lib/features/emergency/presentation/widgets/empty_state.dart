import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onActionPressed;
  final String? actionLabel;

  const EmptyStateWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.contact_emergency,
    this.onActionPressed,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          if (onActionPressed != null && actionLabel != null) ...[
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onActionPressed,
              icon: const Icon(Icons.add),
              label: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}
