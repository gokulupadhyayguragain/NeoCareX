/* import 'package:flutter/material.dart';

class LoadingShimmer extends StatefulWidget {
  final bool isDesktop;

  const LoadingShimmer({super.key, required this.isDesktop});

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer>
    with TickerProviderStateMixin {
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _shimmerAnimation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );

    _shimmerController.repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SizedBox(
          width: widget.isDesktop ? 1000 : double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildShimmerReadingsCards(widget.isDesktop),
              const SizedBox(height: 24),
              _buildShimmerWearableCard(),
              const SizedBox(height: 24),
              _buildShimmerQuickActions(widget.isDesktop),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerEffect({required Widget child}) {
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      child: child,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
              stops: [
                _shimmerAnimation.value - 0.3,
                _shimmerAnimation.value,
                _shimmerAnimation.value + 0.3,
              ].map((stop) => stop.clamp(0.0, 1.0)).toList(),
            ).createShader(bounds);
          },
          child: child,
        );
      },
    );
  }

  Widget _buildShimmerBox({
    required double width,
    required double height,
    BorderRadius? borderRadius,
  }) {
    return _buildShimmerEffect(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _buildShimmerReadingsCards(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        isDesktop
            ? Row(
                children: [
                  Expanded(child: _buildShimmerHealthCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildShimmerHealthCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildShimmerHealthCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildShimmerHealthCard()),
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildShimmerHealthCard()),
                      const SizedBox(width: 16),
                      Expanded(child: _buildShimmerHealthCard()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildShimmerHealthCard()),
                      const SizedBox(width: 16),
                      Expanded(child: _buildShimmerHealthCard()),
                    ],
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildShimmerHealthCard() {
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
          _buildShimmerBox(
            width: 40,
            height: 40,
            borderRadius: BorderRadius.circular(20),
          ),
          const SizedBox(height: 16),
          _buildShimmerBox(width: 80, height: 18),
          const SizedBox(height: 8),
          _buildShimmerBox(width: 100, height: 24),
          const SizedBox(height: 12),
          _buildShimmerBox(width: 120, height: 14),
        ],
      ),
    );
  }

  Widget _buildShimmerWearableCard() {
    return Container(
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
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green.shade600, Colors.teal.shade600],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withValues(alpha: 0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.watch_sharp, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Wearable Summary (24hrs)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(child: _buildShimmerWearableMetric()),
                Container(width: 1, height: 60, color: Colors.grey.shade300),
                Expanded(child: _buildShimmerWearableMetric()),
                Container(width: 1, height: 60, color: Colors.grey.shade300),
                Expanded(child: _buildShimmerWearableMetric()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerWearableMetric() {
    return Column(
      children: [
        _buildShimmerBox(
          width: 48,
          height: 48,
          borderRadius: BorderRadius.circular(12),
        ),
        const SizedBox(height: 8),
        _buildShimmerBox(width: 60, height: 18),
        const SizedBox(height: 4),
        _buildShimmerBox(width: 40, height: 12),
      ],
    );
  }

  Widget _buildShimmerQuickActions(bool isDesktop) {
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
              _buildShimmerBox(
                width: 20,
                height: 20,
                borderRadius: BorderRadius.circular(10),
              ),
              const SizedBox(width: 8),
              _buildShimmerBox(width: 120, height: 18),
            ],
          ),
          const SizedBox(height: 16),
          isDesktop
              ? Row(
                  children: [
                    Expanded(child: _buildShimmerActionCard()),
                    const SizedBox(width: 12),
                    Expanded(child: _buildShimmerActionCard()),
                    const SizedBox(width: 12),
                    Expanded(child: _buildShimmerActionCard()),
                    const SizedBox(width: 12),
                    Expanded(child: _buildShimmerActionCard()),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: _buildShimmerActionCard()),
                        const SizedBox(width: 12),
                        Expanded(child: _buildShimmerActionCard()),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildShimmerActionCard()),
                        const SizedBox(width: 12),
                        Expanded(child: _buildShimmerActionCard()),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildShimmerActionCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        children: [
          _buildShimmerBox(
            width: 28,
            height: 28,
            borderRadius: BorderRadius.circular(14),
          ),
          const SizedBox(height: 8),
          _buildShimmerBox(width: 80, height: 14),
        ],
      ),
    );
  }
}
 */