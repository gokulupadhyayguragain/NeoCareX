import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/summarization/presentation/bloc/summarization_state.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../data/models/summarization_model.dart';
import '../../data/services/summarization_service.dart';
import '../bloc/summarization_bloc.dart';
import '../bloc/summarization_event.dart';
import '../widgets/summarization_content.dart';
import '../widgets/summarization_shimmer_loader.dart';
import '../widgets/empty_state_widget.dart';

class SummarizationScreen extends StatefulWidget {
  final io.Socket? socket;

  const SummarizationScreen({super.key, this.socket});

  @override
  State<SummarizationScreen> createState() => _SummarizationScreenState();
}

class _SummarizationScreenState extends State<SummarizationScreen> {
  late SummarizationBloc _bloc;
  String socketStatus = 'Disconnected';
  bool socketConnected = false;

  @override
  void initState() {
    super.initState();
    _initializeBloc();
  }

  void _initializeBloc() {
    _bloc = SummarizationBloc(
      service: SummarizationService(),
      socket: widget.socket,
    );

    if (widget.socket != null) {
      widget.socket!.onConnect((_) {
        setState(() {
          socketConnected = true;
          socketStatus = 'Connected';
        });
      });

      widget.socket!.onDisconnect((_) {
        setState(() {
          socketConnected = false;
          socketStatus = 'Disconnected';
        });
      });
    }

    _fetchSummarization();
  }

  void _fetchSummarization() {
    _bloc.add(const FetchSummarization());
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return BlocProvider<SummarizationBloc>.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FA),
        appBar: AppBar(
          title: Text(
            'Summary by Intelligent Companion',
            style: TextStyle(
              fontSize: isMobile ? 20 : 22,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1F2937),
              letterSpacing: -0.3,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, const Color(0xFFF5F7FA)],
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
        ),
        body: BlocBuilder<SummarizationBloc, SummarizationState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const SummarizationShimmerLoader(),
              loaded: (data) => _buildLoadedContent(data),
              updated: (data) => _buildSingleUpdateContent(data),
              error: (message) => _buildErrorState(message),
              loadingMore: (data) => _buildLoadingMoreContent(data),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadedContent(PaginatedSummarization data) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isMobile = screenWidth < 600;
        final isTablet = screenWidth < 900;

        final maxWidth = isMobile
            ? double.infinity
            : (isTablet ? 800.0 : 1000.0);
        final padding = isMobile ? 12.0 : 16.0;

        return RefreshIndicator(
          onRefresh: () async => _fetchSummarization(),
          color: const Color(0xFF1F2937),
          backgroundColor: Colors.white,
          strokeWidth: 2,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(padding),
            child: Center(
              child: SizedBox(
                width: maxWidth,
                child: Column(
                  children: [
                    if (data.summaries.isEmpty)
                      const EmptyStateWidget()
                    else
                      ...data.summaries.map(
                        (summary) => Padding(
                          padding: EdgeInsets.only(
                            bottom: isMobile ? 16.0 : 20.0,
                          ),
                          child: SummarizationContent(data: summary),
                        ),
                      ),
                    if (data.summaries.isNotEmpty)
                      _buildPaginationControls(data.paginationMeta, isMobile),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaginationControls(PaginationMeta meta, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: isMobile ? 20 : 24),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 16,
        vertical: isMobile ? 8 : 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPageButton(
            icon: Icons.chevron_left,
            onPressed: meta.hasPreviousPage
                ? () => _bloc.add(const LoadPreviousPage())
                : null,
            isMobile: isMobile,
          ),
          SizedBox(width: isMobile ? 8 : 16),
          ..._buildPageNumbers(meta, isMobile),
          SizedBox(width: isMobile ? 8 : 16),
          _buildPageButton(
            icon: Icons.chevron_right,
            onPressed: meta.hasNextPage
                ? () => _bloc.add(const LoadNextPage())
                : null,
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildPageButton({
    required IconData icon,
    required VoidCallback? onPressed,
    required bool isMobile,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: isMobile ? 36 : 40,
          height: isMobile ? 36 : 40,
          decoration: BoxDecoration(
            color: onPressed != null
                ? const Color(0xFFF3F4F6)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: onPressed != null
                  ? Colors.transparent
                  : Colors.grey.shade200,
            ),
          ),
          child: Icon(
            icon,
            size: isMobile ? 18 : 20,
            color: onPressed != null
                ? const Color(0xFF1F2937)
                : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageNumbers(PaginationMeta meta, bool isMobile) {
    final List<Widget> pageButtons = [];
    final currentPage = meta.currentPage;
    final totalPages = meta.totalPages;

    int startPage = (currentPage - 2).clamp(1, totalPages);
    int endPage = (currentPage + 2).clamp(1, totalPages);

    if (endPage - startPage < 4) {
      if (startPage == 1) {
        endPage = (startPage + 4).clamp(1, totalPages);
      } else {
        startPage = (endPage - 4).clamp(1, totalPages);
      }
    }

    for (int i = startPage; i <= endPage; i++) {
      final isCurrentPage = i == currentPage;
      pageButtons.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isCurrentPage ? null : () => _bloc.add(GoToPage(i)),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: isMobile ? 36 : 40,
              height: isMobile ? 36 : 40,
              margin: EdgeInsets.symmetric(horizontal: isMobile ? 2 : 4),
              decoration: BoxDecoration(
                color: isCurrentPage
                    ? const Color(0xFF1F2937)
                    : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  '$i',
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 14,
                    fontWeight: FontWeight.w600,
                    color: isCurrentPage
                        ? Colors.white
                        : const Color(0xFF6B7280),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return pageButtons;
  }

  Widget _buildLoadingMoreContent(PaginatedSummarization data) {
    return Stack(
      children: [
        _buildLoadedContent(data),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.02),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1F2937)),
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSingleUpdateContent(PaginatedSummarization data) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isMobile = screenWidth < 600;
        final isTablet = screenWidth < 900;

        final maxWidth = isMobile
            ? double.infinity
            : (isTablet ? 800.0 : 1000.0);
        final padding = isMobile ? 12.0 : 16.0;

        return RefreshIndicator(
          onRefresh: () async => _fetchSummarization(),
          color: const Color(0xFF1F2937),
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(padding),
            child: Center(
              child: SizedBox(
                width: maxWidth,
                child: data.summaries.isNotEmpty
                    ? SummarizationContent(data: data.summaries.first)
                    : const EmptyStateWidget(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorState(String message) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Center(
      child: Container(
        padding: EdgeInsets.all(isMobile ? 20 : 32),
        margin: EdgeInsets.all(isMobile ? 16 : 24),
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFFFEE2E2), const Color(0xFFFEF2F2)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFDC2626).withOpacity(0.1),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: isMobile ? 48 : 56,
                color: const Color(0xFFDC2626),
              ),
            ),
            SizedBox(height: isMobile ? 20 : 24),
            Text(
              'Unable to load summary',
              style: TextStyle(
                fontSize: isMobile ? 18 : 20,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: isMobile ? 8 : 12),
            // Text(
            //   message,
            //   style: TextStyle(
            //     fontSize: isMobile ? 14 : 15,
            //     color: Colors.grey.shade500,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            SizedBox(height: isMobile ? 24 : 32),
            ElevatedButton(
              onPressed: _fetchSummarization,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F2937),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 32,
                  vertical: isMobile ? 12 : 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.refresh_rounded, size: 18),
                  SizedBox(width: isMobile ? 8 : 10),
                  Text(
                    'Try Again',
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
