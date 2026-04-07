
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 40 : 60),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFEEF2FF),
                  const Color(0xFFF5F3FF),
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4F46E5).withOpacity(0.15),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Icon(
              Icons.article_outlined,
              size: isMobile ? 48 : 56,
              color: const Color(0xFF4F46E5),
            ),
          ),
          SizedBox(height: isMobile ? 24 : 32),
          Text(
            'No Summaries Yet',
            style: TextStyle(
              fontSize: isMobile ? 20 : 22,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1F2937),
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Text(
            'Your health summaries will appear here once available',
            style: TextStyle(
              fontSize: isMobile ? 15 : 16,
              color: Colors.grey.shade500,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 32 : 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(const Color(0xFF4F46E5)),
              SizedBox(width: isMobile ? 8 : 10),
              _buildDot(const Color(0xFF7C3AED)),
              SizedBox(width: isMobile ? 8 : 10),
              _buildDot(const Color(0xFFEC4899)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
    );
  }
}