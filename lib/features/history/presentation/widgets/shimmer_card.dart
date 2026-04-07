import 'package:flutter/material.dart';

class ShimmerCard extends StatelessWidget {
  final bool isDesktop;
  final Animation<double> shimmerAnimation;

  const ShimmerCard({
    super.key,
    required this.isDesktop,
    required this.shimmerAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: shimmerAnimation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Colors.grey.shade200,
                Colors.grey.shade100,
                Colors.grey.shade50,
                Colors.grey.shade100,
                Colors.grey.shade200,
              ],
              stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
              begin: Alignment(-2.0 + shimmerAnimation.value * 4.0, 0.0),
              end: Alignment(-1.0 + shimmerAnimation.value * 4.0, 0.0),
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: isDesktop ? 12 : 16),
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 20 : 16,
          vertical: isDesktop ? 16 : 14,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: isDesktop ? 20 : 0),
            Container(
              width: isDesktop ? 50 : 44,
              height: isDesktop ? 50 : 44,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(width: isDesktop ? 24 : 16),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: isDesktop ? 18 : 16,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: isDesktop ? 14 : 12,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: isDesktop ? 2 : 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 15,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 12,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: isDesktop ? 40 : 0),
          ],
        ),
      ),
    );
  }
}
