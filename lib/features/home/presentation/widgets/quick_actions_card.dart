import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuickActionsCard extends StatelessWidget {
  final bool isDesktop;

  const QuickActionsCard({
    super.key,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.flash_on, color: Colors.amber.shade600, size: 20),
              const SizedBox(width: 8),
              Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          isDesktop
              ? Row(
                  children: [
                    Expanded(
                      child: _buildActionCard(
                        context,
                        'Medications',
                        Icons.medication,
                        Colors.blue,
                        () => context.push('/medications'),
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      child: _buildActionCard(
                        context,
                        'Emergency',
                        Icons.emergency,
                        Colors.red,
                        () => context.push('/emergency-contacts'),
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      child: _buildActionCard(
                        context,
                        'Reminders',
                        Icons.alarm,
                        Colors.orange,
                        () {},
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      child: _buildActionCard(
                        context,
                        'Notifications',
                        Icons.notifications_active,
                        Colors.teal,
                        () {},
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildActionCard(
                            context,
                            'Medications',
                            Icons.medication,
                            Colors.blue,
                            () => context.push('/medications'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildActionCard(
                            context,
                            'Emergency',
                            Icons.emergency,
                            Colors.red,
                            () => context.push('/emergency-contacts'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildActionCard(
                            context,
                            'Reminders',
                            Icons.alarm,
                            Colors.orange,
                            () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildActionCard(
                            context,
                            'Notifications',
                            Icons.notifications_active,
                            Colors.teal,
                            () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
