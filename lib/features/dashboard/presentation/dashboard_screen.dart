import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../models/blood_pressure_data.dart';
import '../widgets/health_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<BloodPressureData> bloodPressureData = [
    BloodPressureData('90/60 mmHg', '2025-07-01', 'Low', Colors.yellow),
    BloodPressureData('118/76 mmHg', '2025-07-02', 'Normal', Colors.green),
    BloodPressureData('132/84', '2025-07-03', 'High', Colors.red),
    BloodPressureData('132/84', '2025-07-04', 'High', Colors.red),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (MediaQuery.of(context).size.width > 1024)
              // const SizedBox(width: 270, child: Sidebar()),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1470),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 24),
                        _buildMainContent(),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Review your details',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        /*      if (MediaQuery.of(context).size.width > 768) ...[
          // _buildUserAvatars(),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue[800],
              side: BorderSide(color: Colors.blue[800]!, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Assign'),
          ),
        ], */
      ],
    );
  }

  /*  Widget _buildUserAvatars() {
    final avatars = [
      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
      'https://images.unsplash.com/photo-1506863530036-1efeddceb993?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGUlMjB1c2VyfGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60',
      'https://images.unsplash.com/photo-1505033575518-a36ea2ef75ae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZSUyMHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
    ];

    return Row(
      children: avatars
          .map(
            (avatar) => Container(
              margin: const EdgeInsets.only(right: 4),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue[800]!, width: 2),
              ),
              child: ClipOval(
                child: Image.network(
                  avatar,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person, color: Colors.grey),
                ),
              ),
            ),
          )
          .toList(),
    );
  } */

  Widget _buildMainContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 12,
          child: Column(
            children: [
              _buildHealthCards(),
              const SizedBox(height: 16),
              _buildChartSection(),
              const SizedBox(height: 16),
              _buildDataTable(),
            ],
          ),
        ),
        if (MediaQuery.of(context).size.width > 1024) ...[
          const SizedBox(width: 16),
          // const SizedBox(width: 370, child: ActivityFeed()),
        ],
      ],
    );
  }

  Widget _buildHealthCards() {
    return Row(
      children: [
        Expanded(
          child: HealthCard(
            title: 'Blood Pressure',
            value: '120/80',
            unit: 'mmHg',
            change: '32.2%',
            isPositive: true,
            icon: Icons.favorite,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: HealthCard(
            title: 'Body Mass Index',
            value: '18.5',
            unit: 'kg/m²',
            change: '45.5%',
            isPositive: true,
            icon: Icons.accessibility,
          ),
        ),
      ],
    );
  }

  Widget _buildChartSection() {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Blood Pressure',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 3),
                          const FlSpot(1, 1),
                          const FlSpot(2, 4),
                          const FlSpot(3, 2),
                          const FlSpot(4, 5),
                        ],
                        isCurved: true,
                        color: Colors.blue,
                        barWidth: 2,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.blue.withValues(alpha: 0.1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Date--->', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataTable() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                if (MediaQuery.of(context).size.width > 768)
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('Add New'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      foregroundColor: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
          _buildTableHeader(),
          ...bloodPressureData.map((data) => _buildTableRow(data)),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Expanded(
              flex: 3,
              child: Text(
                'Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (MediaQuery.of(context).size.width > 768)
              const Expanded(
                flex: 2,
                child: Text(
                  'Due Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            const Expanded(
              flex: 2,
              child: Text(
                'Status',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (MediaQuery.of(context).size.width > 768)
              const Expanded(
                flex: 1,
                child: Text(
                  'Actions',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableRow(BloodPressureData data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.reading,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.date,
                    style: TextStyle(color: Colors.blue[800], fontSize: 12),
                  ),
                ],
              ),
            ),
            if (MediaQuery.of(context).size.width > 768)
              const Expanded(flex: 2, child: Text('Fri. Aug 11th')),
            Expanded(
              flex: 2,
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                  color: data.statusColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: data.statusColor),
                ),
                child: Center(
                  child: Text(
                    data.status,
                    style: TextStyle(
                      color: data.statusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            if (MediaQuery.of(context).size.width > 768)
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert, color: Colors.grey),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
