
import 'package:flutter/material.dart';

class SummarizationShimmerLoader extends StatefulWidget {
  const SummarizationShimmerLoader({super.key});

  @override
  State<SummarizationShimmerLoader> createState() =>
      _SummarizationShimmerLoaderState();
}

class _SummarizationShimmerLoaderState extends State<SummarizationShimmerLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _shimmerAnimation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );

    _shimmerController.repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  Widget _buildShimmerBox({
    required double width,
    required double height,
    BorderRadius? borderRadius,
  }) {
    return AnimatedBuilder(
      animation: _shimmerAnimation,
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
                _shimmerAnimation.value - 0.5,
                _shimmerAnimation.value,
                _shimmerAnimation.value + 0.5,
              ].map((stop) => stop.clamp(0.0, 1.0)).toList(),
            ).createShader(bounds);
          },
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth < 900;
    
    final maxWidth = isMobile 
        ? double.infinity 
        : (isTablet ? 800.0 : 1000.0);
    final padding = isMobile ? 12.0 : 16.0;
    final containerPadding = isMobile ? 16.0 : 20.0;
    
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(padding),
      child: Center(
        child: SizedBox(
          width: maxWidth,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(containerPadding),
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
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildShimmerBox(
                            width: double.infinity,
                            height: isMobile ? 20 : 22,
                          ),
                        ),
                        const SizedBox(width: 16),
                        _buildShimmerBox(
                          width: isMobile ? 120 : 140,
                          height: isMobile ? 32 : 36,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(height: 1, thickness: 1),
                    const SizedBox(height: 20),
                    
                    Container(
                      padding: EdgeInsets.all(isMobile ? 16 : 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _buildShimmerBox(
                                width: isMobile ? 44 : 48,
                                height: isMobile ? 44 : 48,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildShimmerBox(width: 60, height: 12),
                                    const SizedBox(height: 6),
                                    _buildShimmerBox(width: 120, height: 18),
                                  ],
                                ),
                              ),
                              _buildShimmerBox(
                                width: isMobile ? 60 : 70,
                                height: isMobile ? 32 : 36,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildShimmerBox(
                            width: double.infinity,
                            height: isMobile ? 40 : 48,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: isMobile ? 20 : 24),
              
              Container(
                padding: EdgeInsets.all(containerPadding),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmerBox(
                      width: double.infinity,
                      height: isMobile ? 40 : 48,
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 2 : (isTablet ? 2 : 4),
                        childAspectRatio: 1.1,
                        crossAxisSpacing: isMobile ? 12 : 16,
                        mainAxisSpacing: isMobile ? 12 : 16,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(isMobile ? 12 : 16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildShimmerBox(
                                    width: 32,
                                    height: 32,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  _buildShimmerBox(
                                    width: 50,
                                    height: 20,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              _buildShimmerBox(width: 70, height: 12),
                              const SizedBox(height: 6),
                              _buildShimmerBox(width: 50, height: 18),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: isMobile ? 20 : 24),
              
              Container(
                padding: EdgeInsets.all(containerPadding),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildShimmerBox(
                          width: 34,
                          height: 34,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        const SizedBox(width: 12),
                        _buildShimmerBox(width: 120, height: 18),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(isMobile ? 16 : 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: List.generate(
                          isMobile ? 3 : 4,
                          (index) => Padding(
                            padding: EdgeInsets.only(bottom: index < 3 ? 12 : 0),
                            child: _buildShimmerBox(
                              width: double.infinity,
                              height: isMobile ? 12 : 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}