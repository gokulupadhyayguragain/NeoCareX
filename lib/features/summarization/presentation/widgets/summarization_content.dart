
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/summarization_model.dart';

class SummarizationContent extends StatelessWidget {
  final SummarizationData data;

  const SummarizationContent({super.key, required this.data});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'critical':
        return const Color(0xFFDC2626);
      case 'elevated':
      case 'high':
        return const Color(0xFFF59E0B);
      case 'low':
        return const Color(0xFF3B82F6);
      case 'normal':
        return const Color(0xFF10B981);
      default:
        return const Color(0xFF6B7280);
    }
  }

  Color _getStatusBackground(String status) {
    switch (status.toLowerCase()) {
      case 'critical':
        return const Color(0xFFFEE2E2);
      case 'elevated':
      case 'high':
        return const Color(0xFFFEF3C7);
      case 'low':
        return const Color(0xFFDBEAFE);
      case 'normal':
        return const Color(0xFFD1FAE5);
      default:
        return const Color(0xFFF3F4F6);
    }
  }

  String _getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'critical':
        return 'CRITICAL';
      case 'elevated':
      case 'high':
        return 'ELEVATED';
      case 'low':
        return 'LOW';
      case 'normal':
        return 'NORMAL';
      default:
        return status.toUpperCase();
    }
  }

  IconData _getMetricIcon(String label) {
    final lowerLabel = label.toLowerCase();
    if (lowerLabel.contains('sleep')) {
      return Icons.nightlight_round;
    } else if (lowerLabel.contains('bmi')) {
      return Icons.monitor_weight;
    } else if (lowerLabel.contains('blood pressure') ||
        lowerLabel.contains('bp')) {
      return Icons.favorite_border;
    } else if (lowerLabel.contains('cholesterol')) {
      return Icons.water_drop;
    } else if (lowerLabel.contains('glucose')) {
      return Icons.egg_alt;
    } else if (lowerLabel.contains('heart')) {
      return Icons.favorite;
    } else {
      return Icons.health_and_safety;
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM d, yyyy • h:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet =
        MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 900;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              isMobile ? 20 : 24,
              isMobile ? 20 : 24,
              isMobile ? 20 : 24,
              isMobile ? 12 : 16,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xFFF9FAFB), Colors.white],
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Your ASCVD Risk in the next 10 years is:',
                    style: TextStyle(
                      fontSize: isMobile ? 15 : 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 12 : 16,
                    vertical: isMobile ? 6 : 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 14,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _formatDate(data.createdAt),
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),

          Padding(
            padding: EdgeInsets.all(isMobile ? 20 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRiskAssessment(isMobile),

                SizedBox(height: isMobile ? 16 : 20),

                Container(
                  padding: EdgeInsets.all(isMobile ? 16 : 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 13,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(text: 'ASCVD stands for '),
                        TextSpan(
                          text: 'Atherosclerotic Cardiovascular Disease',
                          style: TextStyle(
                            color: const Color(0xFF2563EB),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(
                              0xFF2563EB,
                            ).withOpacity(0.3),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final url = Uri.parse(
                                'https://www.heart.org/en/professional/quality-improvement/ascvd',
                              );
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                        ),
                        const TextSpan(
                          text:
                              '. This is calculated by a formula jointly developed by American Heart Association and American College of Cardiology.',
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: isMobile ? 24 : 28),

                if (data.metrics.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Your measurement predictions in the next two weeks based on your current diet and activity levels will be:',
                      style: TextStyle(
                        fontSize: isMobile ? 15 : 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1F2937),
                        height: 1.4,
                      ),
                    ),
                  ),
                  _buildMetricsGrid(isMobile, isTablet),
                ],

                SizedBox(height: isMobile ? 24 : 28),

                _buildFullSummary(isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskAssessment(bool isMobile) {
    final statusColor = _getStatusColor(data.riskLevel);
    final statusBg = _getStatusBackground(data.riskLevel);
    final isNormal = data.riskLevel.toLowerCase() == 'normal';

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [statusBg, Colors.white],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: statusColor.withOpacity(0.3), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 12 : 14),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  isNormal ? Icons.check_circle_rounded : Icons.warning_rounded,
                  color: statusColor,
                  size: isMobile ? 24 : 28,
                ),
              ),
              SizedBox(width: isMobile ? 16 : 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Risk Level',
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      data.assessmentType,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.w700,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
              if (data.riskConfidence > 0)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 14 : 18,
                    vertical: isMobile ? 8 : 12,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: statusColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    '${data.riskConfidence.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: isMobile ? 16 : 20),
          Container(
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: statusColor.withOpacity(0.2), width: 1),
            ),
            child: Text(
              data.riskStatus,
              style: TextStyle(
                fontSize: isMobile ? 14 : 15,
                fontWeight: FontWeight.w500,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid(bool isMobile, bool isTablet) {
    final crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);
    final aspectRatio = isMobile ? 1.1 : 1.2;
    final spacing = isMobile ? 12.0 : 16.0;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.metrics.length,
      itemBuilder: (context, index) {
        final metric = data.metrics[index];
        final statusColor = _getStatusColor(metric.status);
        final statusBg = _getStatusBackground(metric.status);
        final statusLabel = _getStatusLabel(metric.status);
        final icon = _getMetricIcon(metric.label);

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: statusColor.withOpacity(0.2), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 14 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(isMobile ? 8 : 10),
                      decoration: BoxDecoration(
                        color: statusBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icon,
                        color: statusColor,
                        size: isMobile ? 18 : 20,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 6 : 8,
                        vertical: isMobile ? 2 : 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        statusLabel,
                        style: TextStyle(
                          fontSize: isMobile ? 9 : 10,
                          fontWeight: FontWeight.w700,
                          color: statusColor,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  metric.label,
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: isMobile ? 6 : 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      metric.value,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.w800,
                        color: statusColor,
                      ),
                    ),
                    if (metric.unit.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          metric.unit,
                          style: TextStyle(
                            fontSize: isMobile ? 10 : 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                  ],
                ),
                if (metric.normalRange != null &&
                    metric.normalRange!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Normal: ${metric.normalRange}',
                      style: TextStyle(
                        fontSize: isMobile ? 9 : 10,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFullSummary(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Icon(
                  Icons.article_rounded,
                  size: isMobile ? 18 : 20,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Clinical Summary',
                style: TextStyle(
                  fontSize: isMobile ? 15 : 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 16 : 20),
          Container(
            padding: EdgeInsets.all(isMobile ? 16 : 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Text(
              data.textSummarization,
              style: TextStyle(
                fontSize: isMobile ? 14 : 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
