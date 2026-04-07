import 'package:flutter/material.dart';

class ChartShimmer extends StatefulWidget {
  const ChartShimmer({super.key});

  @override
  State<ChartShimmer> createState() => _ChartShimmerState();
}

class _ChartShimmerState extends State<ChartShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();

    _animation = Tween<double>(begin: -1, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildShimmerBox(12, 12, isCircle: true),
                  const SizedBox(width: 8),
                  _buildShimmerBox(120, 16),
                  const Spacer(),
                  _buildShimmerBox(40, 40, isCircle: true),
                ],
              ),
              const SizedBox(height: 16),
              _buildShimmerBox(double.infinity, 32),
              const SizedBox(height: 16),
              _buildShimmerBox(double.infinity, 200),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShimmerBox(
    double width,
    double height, {
    bool isCircle = false,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: isCircle ? null : BorderRadius.circular(8),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: const [
            Color(0xFFE0E0E0),
            Color(0xFFF5F5F5),
            Color(0xFFE0E0E0),
          ],
          stops: [0.0, _animation.value.clamp(0.0, 1.0), 1.0],
        ),
      ),
    );
  }
}
