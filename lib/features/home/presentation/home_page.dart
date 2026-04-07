import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health/health.dart';
import 'package:patient_app/core/auth/dio.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:patient_app/features/home/data/services/health_data_processor.dart';
import 'package:patient_app/features/home/data/services/rook_service_web.dart';
import 'package:patient_app/features/home/data/services/rook_webhook_listener.dart';
import 'package:patient_app/test_user.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:fhir/r4.dart' as r4;
import 'package:patient_app/features/home/presentation/bloc/health_bloc.dart';
import 'package:patient_app/features/home/presentation/bloc/health_state.dart';

import '../data/models/observations_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool loading = false;
  bool loaded = false;
  bool loadingfailed = false;
  List<Observation?> models = [];

  bool _wearableInitComplete = false;

  late io.Socket socket;
  bool socketConnected = false;
  String socketStatus = 'Disconnected';

  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  List<String> deviceIDs = ["381A100610E", "100251303404", "200242101321"];
  final Health health = Health();

  int _realtimeSteps = 0;
  double _realtimeHeartRate = 0.0;
  int _realtimeCalories = 0;
  String _realtimeLastUpdated = '';
  bool _isRealtimeConnected = false;

  int _historicalSleepMinutes = 0;

  bool _isLoadingWearable = false;

  RookWebhookListener? _webhookListener;
  StreamSubscription? _webhookDataReadySub;

  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: false);

    _shimmerAnimation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeServices();
    });
  }

  Future<void> _initializeServices() async {
    await Future.wait([
      _initSocket(),
      fetchObservation(deviceIDs),
      _initWearableData(),
    ]);

    _initWebhookListener();

    _refreshTimer = Timer.periodic(const Duration(minutes: 5), (timer) {
      if (mounted) {
        _refreshRealTimeData();
      }
    });
  }

  void _initWebhookListener() async {
    final userId = await TestUser.getUserId();

    _webhookListener = RookWebhookListener();

    _webhookListener!.startListening(userId);

    _webhookDataReadySub = _webhookListener!.onDataReady.listen((event) {
      _refreshRealTimeData();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('New health data received!'),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  Future<void> _initWearableData() async {
    setState(() {
      _isLoadingWearable = true;
      _wearableInitComplete = false;
    });

    try {
      final rookService = context.read<RookService>();
      final userId = await TestUser.getUserId();

      rookService.startRealtimeUpdates(userId);
      rookService.addListener(_updateFromRealtime);

      await rookService.refreshTodayData(userId);

      _updateFromRealtime();

      setState(() {});
    } catch (e) {
      setState(() {});
    } finally {
      setState(() {
        _isLoadingWearable = false;
        _wearableInitComplete = true;
      });
    }
  }

  void _updateFromRealtime() {
    final rookService = context.read<RookService>();

    setState(() {
      if (rookService.realtimeSteps > 0) {
        _realtimeSteps = rookService.realtimeSteps;
      }

      if (rookService.realtimeHeartRate > 0) {
        _realtimeHeartRate = rookService.realtimeHeartRate;
      }

      if (rookService.realtimeCalories > 0) {
        _realtimeCalories = rookService.realtimeCalories;
      }

      _isRealtimeConnected = rookService.isRealtimeConnected;

      if (rookService.historicalSleepMinutes > 0) {
        _historicalSleepMinutes = rookService.historicalSleepMinutes;
      }
      if (rookService.historicalWeightKg > 0) {}
      if (rookService.historicalBmi > 0) {}
      if (rookService.historicalHeightCm > 0) {}
    });
  }

  Future<void> _refreshRealTimeData() async {
    try {
      final rookService = context.read<RookService>();
      final userId = await TestUser.getUserId();

      await rookService.refreshTodayData(userId);
    } catch (e) {}
  }

  Future<void> _initSocket() async {
    try {
      socket = io.io(
        'https://dev.vitalcarex.backend.gheit.co/rpm_update_space',
        io.OptionBuilder()
            .setTransports(["polling"])
            .disableReconnection()
            .disableAutoConnect()
            .build(),
      );
      socket.connect();

      await Future.delayed(const Duration(seconds: 1));

      socket = io.io(
        'https://dev.vitalcarex.backend.gheit.co/rpm_update_space',
        io.OptionBuilder()
            .setTransports(["websocket"])
            .disableReconnection()
            .disableAutoConnect()
            .build(),
      );
      socket.connect();

      _setupSocketListeners();
    } catch (e) {
      setState(() {
        socketStatus = 'Initialization Error';
      });
    }
  }

  void _setupSocketListeners() {
    socket.onConnectError((data) {});
    socket.onDisconnect((data) => debugPrint("Server Disconnected"));

    socket.onConnect((_) {
      setState(() {
        socketConnected = true;
        socketStatus = 'Connected';
      });
      _authenticateSocketUser();
    });

    socket.onDisconnect((_) {
      setState(() {
        socketConnected = false;
        socketStatus = 'Disconnected';
      });
    });

    socket.onConnectError((error) {
      setState(() {
        socketConnected = false;
        socketStatus = 'Connection Error: $error';
      });
    });

    socket.onError((error) {
      setState(() {
        socketStatus = 'Socket Error: $error';
      });
    });

    socket.onReconnect((_) {
      setState(() {
        socketConnected = true;
        socketStatus = 'Reconnected';
      });
      _authenticateSocketUser();
    });

    socket.on('received_data_response', (data) {
      _handleAuthResponse(data);
    });

    socket.on('rpm_update', (data) {
      _handleRPMUpdate(data);
    });
  }

  void _authenticateSocketUser() async {
    try {
      final storage = SecureStorageService();
      final idToken = await storage.readString("access_token");
      final patientId = '093266f6-6417-4e07-9219-e55bcd8a4e73';

      if (idToken != null && patientId.isNotEmpty) {
        socket.emit('receive_user_data', {
          'patient_id': patientId,
          'id_token': idToken,
        });
      }
    } catch (e) {
      setState(() {
        socketStatus = 'Authentication Error';
      });
    }
  }

  void _handleAuthResponse(dynamic data) {
    final response = data.toString();
    String status;

    switch (response) {
      case 'Passed':
        status = 'Authenticated';
        break;
      case 'Failed':
        status = 'Authentication Failed';
        break;
      case 'Session already exists.':
        status = 'Session Exists';
        break;
      default:
        status = 'Unknown Response';
    }

    setState(() {
      socketStatus = status;
    });
  }

  void _handleRPMUpdate(dynamic data) {
    try {
      if (data != null) {
        final observationData = data is Map
            ? data
            : jsonDecode(data.toString());
        final newObservation = r4.Observation.fromJson(
          observationData["resource"],
        );

        setState(() {
          final deviceId = observationData["resource"]['device']?['reference']
              ?.split('/')
              .last;
          if (deviceId != null) {
            final existingIndex = models.indexWhere(
              (obs) => obs?.device?.id?.split('/').last == deviceId,
            );

            if (existingIndex != -1) {
              Observation newOne = Observation(
                meta: Meta(
                  lastUpdated: newObservation.meta?.lastUpdated?.valueString,
                ),
                component: [
                  Component(
                    value: ValueWrapper(
                      quantity: Quantity(
                        value: newObservation
                            .component?[0]
                            .valueQuantity
                            ?.value
                            ?.valueNumber,
                      ),
                    ),
                  ),
                  Component(
                    value: ValueWrapper(
                      quantity: Quantity(
                        value: newObservation
                            .component?[1]
                            .valueQuantity
                            ?.value
                            ?.valueNumber,
                      ),
                    ),
                  ),
                ],
                value: ValueWrapper(
                  quantity: Quantity(
                    value: newObservation.valueQuantity?.value?.valueNumber,
                  ),
                ),
              );
              models[existingIndex] = newOne;
            }
          }

          if (!loaded && models.isNotEmpty) {
            loading = false;
            loaded = true;
            loadingfailed = false;
          }
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Health data updated'),
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {}
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    _refreshTimer?.cancel();
    _webhookDataReadySub?.cancel();
    _webhookListener?.dispose();

    final rookService = context.read<RookService>();
    rookService.removeListener(_updateFromRealtime);
    rookService.stopRealtimeUpdates();

    socket.disconnect();
    socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Health Dashboard",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade50,
        /*   actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              setState(() {
                loading = true;
                _isLoadingWearable = true;
                _wearableDataLoaded = false;
                _wearableInitComplete = false;
              });

              await Future.wait([
                fetchObservation(deviceIDs),
                _refreshRealTimeData(),
                _loadYesterdayData(),
              ]);

              if (mounted) {
                setState(() {
                  _wearableInitComplete = true;
                  final hasData =
                      _realtimeSteps > 0 ||
                      _realtimeHeartRate > 0 ||
                      _realtimeCalories > 0 ||
                      _historicalSleepMinutes > 0;
                  _wearableDataLoaded = hasData;
                });
              }
            },
          ),
        
        ], */
      ),
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<HealthBloc, HealthState>(
            builder: (context, state) {
              if (loading || _isLoadingWearable || !_wearableInitComplete) {
                return _buildShimmerLayout();
              } else {
                return _buildScaffoldBody();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScaffoldBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 900;
              return Center(
                child: SizedBox(
                  width: isDesktop ? 1000 : double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildQuickActionsRow(isDesktop),
                      const SizedBox(height: 24),
                      models.isEmpty
                          ? Container()
                          : _buildMostRecentReadingsCards(models, isDesktop),
                      const SizedBox(height: 24),
                      _buildWearableSummaryCard(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsRow(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        isDesktop
            ? Row(
                children: [
                  Expanded(child: _buildTrackNutritionCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildSymptomCheckerCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildHealthJournalCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildMedicationTrackerCard()),
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildTrackNutritionCard()),
                      const SizedBox(width: 12),
                      Expanded(child: _buildMedicationTrackerCard()),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildSymptomCheckerCard()),
                      const SizedBox(width: 12),
                      Expanded(child: _buildHealthJournalCard()),
                    ],
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildTrackNutritionCard() {
    return _buildHealthToolCard(
      title: 'Track Nutrition',
      subtitle: 'Log meals & track calories',
      icon: Icons.restaurant_menu,
      iconBackground: Colors.green.shade50,
      iconColor: Colors.green,
      gradientColors: [Colors.green.shade100, Colors.lightGreen.shade50],
      onTap: () => context.pushNamed('nutrition-page'),
    );
  }

  Widget _buildMedicationTrackerCard() {
    return _buildHealthToolCard(
      title: 'Emergency contacts',
      subtitle: 'Manage emergency contacts',
      icon: Icons.medication,
      iconBackground: Colors.blue.shade50,
      iconColor: Colors.blue,
      gradientColors: [Colors.blue.shade100, Colors.lightBlue.shade50],
      onTap: () => context.push('/emergency-contacts'),
    );
  }

  Widget _buildSymptomCheckerCard() {
    return _buildHealthToolCard(
      title: 'AI Assistant',
      subtitle: 'Chat with AI health assistant',
      icon: Icons.chat_bubble,
      iconBackground: Colors.orange.shade50,
      iconColor: Colors.orange,
      gradientColors: [Colors.orange.shade100, Colors.orange.shade50],
      onTap: () => context.push('/ai-assistant'),
    );
  }

  Widget _buildHealthJournalCard() {
    return _buildHealthToolCard(
      title: 'Wearables',
      subtitle: 'Connect wearable devices',
      icon: Icons.watch,
      iconBackground: Colors.purple.shade50,
      iconColor: Colors.purple,
      gradientColors: [Colors.purple.shade100, Colors.purple.shade50],
      onTap: () => context.push('/wearables'),
    );
  }

  Widget _buildHealthToolCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBackground,
    required Color iconColor,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isVerySmall = screenWidth < 360;

    final iconSize = isVerySmall ? 20.0 : (isMobile ? 24.0 : 28.0);
    final iconPadding = isVerySmall ? 8.0 : (isMobile ? 10.0 : 12.0);
    final titleSize = isVerySmall ? 11.0 : (isMobile ? 12.0 : 16.0);
    final subtitleSize = isVerySmall ? 10.0 : (isMobile ? 11.0 : 12.0);
    final cardPadding = isVerySmall ? 12.0 : (isMobile ? 14.0 : 16.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minHeight: isMobile ? 120 : 120),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(cardPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(iconPadding),
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: iconSize),
              ),
              SizedBox(width: isVerySmall ? 8 : 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: isVerySmall ? 2 : 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: subtitleSize,
                        color: Colors.grey.shade600,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: isVerySmall ? 6 : 8),
                    Icon(
                      Icons.arrow_forward,
                      size: isVerySmall ? 12 : (isMobile ? 14 : 18),
                      color: iconColor,
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

  Widget _buildMostRecentReadingsCards(
    List<Observation?> models,
    bool isDesktop,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Recent Readings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        const SizedBox(height: 12),
        isDesktop
            ? Row(
                children: [
                  Expanded(
                    child: _buildHealthCard(
                      title: 'Blood Sugar',
                      value:
                          '${models.isNotEmpty && models.first?.value?.quantity?.value != null ? models.first!.value!.quantity!.value!.round() : '--'} mg/dl',
                      date: HealthDataProcessor.formatDate(
                        models.first?.meta?.lastUpdated,
                      ),
                      time: HealthDataProcessor.formatTime(
                        models.first?.meta?.lastUpdated,
                      ),
                      icon: Icons.water_drop_outlined,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildHealthCard(
                      title: 'Blood Pressure',
                      value:
                          '${models.length > 1 && models[1]?.component?[0].value?.quantity?.value != null ? models[1]!.component![0].value!.quantity!.value!.round() : '--'}/${models.length > 1 && models[1]?.component?[1].value?.quantity?.value != null ? models[1]!.component![1].value!.quantity!.value!.round() : '--'} mmHg',
                      date: HealthDataProcessor.formatDate(
                        models[1]?.meta?.lastUpdated,
                      ),
                      time: HealthDataProcessor.formatTime(
                        models[1]?.meta?.lastUpdated,
                      ),
                      icon: Icons.monitor_heart_outlined,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildHealthCard(
                      title: 'Body Weight',
                      value:
                          '${models.length > 2 && models[2]?.value?.quantity?.value != null ? models[2]!.value!.quantity!.value!.toStringAsFixed(1) : '--'} lbs',
                      date: HealthDataProcessor.formatDate(
                        models[2]?.meta?.lastUpdated,
                      ),
                      time: HealthDataProcessor.formatTime(
                        models[2]?.meta?.lastUpdated,
                      ),
                      icon: Icons.monitor_weight_outlined,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildHealthCard(
                      title: 'Pulse',
                      value:
                          '${models.length > 1 && models[1]?.value?.quantity?.value != null ? models[1]!.value!.quantity!.value!.round() : '--'} BPM',
                      date: 'Aug 25, 2025',
                      time: '7:20 AM',
                      icon: Icons.favorite_outline,
                      color: Colors.pink,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildHealthCard(
                          title: 'Blood Sugar',
                          value:
                              '${models.isNotEmpty && models.first?.value?.quantity?.value != null ? models.first!.value!.quantity!.value!.round() : '--'} mg/dl',
                          date: HealthDataProcessor.formatDate(
                            models.first?.meta?.lastUpdated,
                          ),
                          time: HealthDataProcessor.formatTime(
                            models.first?.meta?.lastUpdated,
                          ),
                          icon: Icons.water_drop_outlined,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildHealthCard(
                          title: 'Blood Pressure',
                          value:
                              '${models.length > 1 && models[1]?.component?[0].value?.quantity?.value != null ? models[1]!.component![0].value!.quantity!.value!.round() : '--'}/${models.length > 1 && models[1]?.component?[1].value?.quantity?.value != null ? models[1]!.component![1].value!.quantity!.value!.round() : '--'} mmHg',
                          date: HealthDataProcessor.formatDate(
                            models[1]?.meta?.lastUpdated,
                          ),
                          time: HealthDataProcessor.formatTime(
                            models[1]?.meta?.lastUpdated,
                          ),
                          icon: Icons.monitor_heart_outlined,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildHealthCard(
                          title: 'Body Weight',
                          value:
                              '${models.length > 2 && models[2]?.value?.quantity?.value != null ? models[2]!.value!.quantity!.value!.toStringAsFixed(1) : '--'} lbs',
                          date: HealthDataProcessor.formatDate(
                            models[2]?.meta?.lastUpdated,
                          ),
                          time: HealthDataProcessor.formatTime(
                            models[2]?.meta?.lastUpdated,
                          ),
                          icon: Icons.monitor_weight_outlined,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildHealthCard(
                          title: 'Pulse',
                          value:
                              '${models.length > 1 && models[1]?.value?.quantity?.value != null ? models[1]!.value!.quantity!.value!.round() : '--'} BPM',
                          date: 'Aug 25, 2025',
                          time: '7:20 AM',
                          icon: Icons.favorite_outline,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildHealthCard({
    required String title,
    required String value,
    required String date,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 14, color: Colors.grey.shade500),
              const SizedBox(width: 4),
              Text(
                date,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey.shade500),
              const SizedBox(width: 4),
              Text(
                time,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWearableSummaryCard() {
    final displaySteps = _realtimeSteps;
    final displayHeartRate = _realtimeHeartRate;
    final displayCalories = _realtimeCalories;
    final displaySleep = _historicalSleepMinutes;

    final hasAnyData =
        displaySteps > 0 ||
        displaySleep > 0 ||
        displayHeartRate > 0 ||
        displayCalories > 0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
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
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.watch_sharp, color: Colors.white, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Wearable\'s Summary',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (_realtimeLastUpdated.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  _realtimeLastUpdated,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: isDesktop
                    ? Row(
                        children: [
                          Expanded(
                            child: _buildLiveWearableMetric(
                              'Steps',
                              displaySteps > 0 ? displaySteps.toString() : '--',
                              Icons.directions_walk,
                              Colors.orange,
                              isLive:
                                  _isRealtimeConnected && _realtimeSteps > 0,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 80,
                            color: Colors.grey.shade300,
                          ),
                          Expanded(
                            child: _buildLiveWearableMetric(
                              'Heart Rate',
                              displayHeartRate > 0
                                  ? '${displayHeartRate.round()} BPM'
                                  : '-- BPM',
                              Icons.favorite,
                              Colors.red,
                              isLive:
                                  _isRealtimeConnected &&
                                  _realtimeHeartRate > 0,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 80,
                            color: Colors.grey.shade300,
                          ),
                          Expanded(
                            child: _buildLiveWearableMetric(
                              'Sleep',
                              displaySleep > 0
                                  ? _formatDuration(
                                      Duration(minutes: displaySleep),
                                    )
                                  : '--',
                              Icons.bedtime,
                              Colors.indigo,
                              isLive: false,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 80,
                            color: Colors.grey.shade300,
                          ),
                          Expanded(
                            child: _buildLiveWearableMetric(
                              'Calories',
                              displayCalories > 0
                                  ? '$displayCalories kcal'
                                  : '--',
                              Icons.local_fire_department,
                              Colors.deepOrange,
                              isLive:
                                  _isRealtimeConnected && _realtimeCalories > 0,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _buildLiveWearableMetric(
                                  'Steps',
                                  displaySteps > 0
                                      ? displaySteps.toString()
                                      : '--',
                                  Icons.directions_walk,
                                  Colors.orange,
                                  isLive:
                                      _isRealtimeConnected &&
                                      _realtimeSteps > 0,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.grey.shade300,
                              ),
                              Expanded(
                                child: _buildLiveWearableMetric(
                                  'Heart Rate',
                                  displayHeartRate > 0
                                      ? '${displayHeartRate.round()} BPM'
                                      : '-- BPM',
                                  Icons.favorite,
                                  Colors.red,
                                  isLive:
                                      _isRealtimeConnected &&
                                      _realtimeHeartRate > 0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildLiveWearableMetric(
                                  'Sleep',
                                  displaySleep > 0
                                      ? _formatDuration(
                                          Duration(minutes: displaySleep),
                                        )
                                      : '--',
                                  Icons.bedtime,
                                  Colors.indigo,
                                  isLive: false,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 60,
                                color: Colors.grey.shade300,
                              ),
                              Expanded(
                                child: _buildLiveWearableMetric(
                                  'Calories',
                                  displayCalories > 0
                                      ? '$displayCalories kcal'
                                      : '--',
                                  Icons.local_fire_department,
                                  Colors.deepOrange,
                                  isLive:
                                      _isRealtimeConnected &&
                                      _realtimeCalories > 0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),

              if (_isRealtimeConnected &&
                  (_realtimeSteps > 0 || _realtimeHeartRate > 0))
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.5),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Live updates from your wearable',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ],
                  ),
                ),

              if (!hasAnyData)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Connect a wearable device to see live data',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLiveWearableMetric(
    String label,
    String value,
    IconData icon,
    Color color, {
    required bool isLive,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            if (isLive && _isRealtimeConnected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes.remainder(60)}m';
    }
    return '${duration.inMinutes}m';
  }

  Widget _buildShimmerLayout() {
    if (!_shimmerController.isAnimating) {
      _shimmerController.repeat();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SizedBox(
              width: isDesktop ? 1000 : double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerQuickActionsRow(isDesktop),
                  const SizedBox(height: 24),
                  _buildShimmerReadingsCards(isDesktop),
                  const SizedBox(height: 24),
                  _buildShimmerWearableCard(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShimmerQuickActionsRow(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildShimmerBox(width: 120, height: 24),
        const SizedBox(height: 12),
        isDesktop
            ? Row(
                children: [
                  Expanded(child: _buildShimmerHealthToolCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildShimmerHealthToolCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildShimmerHealthToolCard()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildShimmerHealthToolCard()),
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildShimmerHealthToolCard()),
                      const SizedBox(width: 12),
                      Expanded(child: _buildShimmerHealthToolCard()),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildShimmerHealthToolCard()),
                      const SizedBox(width: 12),
                      Expanded(child: _buildShimmerHealthToolCard()),
                    ],
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildShimmerHealthToolCard() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isVerySmall = screenWidth < 360;

    final iconSize = isVerySmall ? 36.0 : (isMobile ? 44.0 : 52.0);
    final cardPadding = isVerySmall ? 12.0 : (isMobile ? 14.0 : 16.0);
    final spacingAfterIcon = isVerySmall ? 8.0 : 12.0;

    return Container(
      constraints: BoxConstraints(minHeight: isMobile ? 120 : 120),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShimmerBox(
              width: iconSize,
              height: iconSize,
              borderRadius: BorderRadius.circular(12),
            ),
            SizedBox(width: spacingAfterIcon),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildShimmerBox(
                    width: isVerySmall ? 60 : 80,
                    height: isVerySmall ? 16 : 18,
                  ),
                  SizedBox(height: isVerySmall ? 2 : 4),
                  _buildShimmerBox(
                    width: isVerySmall ? 80 : 100,
                    height: isVerySmall ? 12 : 14,
                  ),
                  SizedBox(height: isVerySmall ? 6 : 8),
                  _buildShimmerBox(
                    width: isVerySmall ? 10 : 12,
                    height: isVerySmall ? 10 : 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerReadingsCards(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildShimmerBox(width: 150, height: 24),
        const SizedBox(height: 12),
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
            color: Colors.black.withOpacity(0.08),
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
          _buildShimmerBox(width: 60, height: 14),
          const SizedBox(height: 4),
          _buildShimmerBox(width: 50, height: 14),
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
            color: Colors.black.withOpacity(0.08),
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
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                _buildShimmerBox(
                  width: 20,
                  height: 20,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(width: 8),
                _buildShimmerBox(width: 150, height: 18),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop = constraints.maxWidth > 600;

                if (isDesktop) {
                  return Row(
                    children: [
                      Expanded(child: _buildShimmerWearableMetric()),
                      Container(
                        width: 1,
                        height: 80,
                        color: Colors.grey.shade300,
                      ),
                      Expanded(child: _buildShimmerWearableMetric()),
                      Container(
                        width: 1,
                        height: 80,
                        color: Colors.grey.shade300,
                      ),
                      Expanded(child: _buildShimmerWearableMetric()),
                      Container(
                        width: 1,
                        height: 80,
                        color: Colors.grey.shade300,
                      ),
                      Expanded(child: _buildShimmerWearableMetric()),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildShimmerWearableMetric()),
                          Container(
                            width: 1,
                            height: 60,
                            color: Colors.grey.shade300,
                          ),
                          Expanded(child: _buildShimmerWearableMetric()),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _buildShimmerWearableMetric()),
                          Container(
                            width: 1,
                            height: 60,
                            color: Colors.grey.shade300,
                          ),
                          Expanded(child: _buildShimmerWearableMetric()),
                        ],
                      ),
                    ],
                  );
                }
              },
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
          child: child!,
        );
      },
    );
  }

  Future<void> fetchObservation(List<String> deviceIDs) async {
    setState(() {
      loading = true;
      loaded = false;
      loadingfailed = false;
      models.clear();
    });

    final dio = Dio();
    const username = 'rpm-demo-client';
    const password = 'MoJpReAK7yvh4';
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final storage = SecureStorageService();
    String patientId =
        await storage.readString("patientId") ??
        "093266f6-6417-4e07-9219-e55bcd8a4e73";
    //final patientId = "093266f6-6417-4e07-9219-e55bcd8a4e73";
    print("Your Patient Id is");
    print(patientId);
    // if (patientId == "093266f6-6417-4e07-9219-e55bcd8a4e73") {
    //   return;
    // }
    if (patientId != "093266f6-6417-4e07-9219-e55bcd8a4e73") {
      final deviceResponse = await dio.get(
        'https://aidboxdev.gheit.co/Device?_patient=${patientId}',
        options: Options(
          headers: {
            'Authorization': basicAuth,
            'Content-Type': 'application/json',
          },
        ),
      );

      deviceIDs.clear();
      if (deviceResponse.data["entry"] != null) {
        for (int k = 0; k < deviceResponse.data["entry"].length; k++) {
          Device device = Device.fromJson(
            deviceResponse.data["entry"][k]["resource"],
          );
          deviceIDs.add(device.id ?? '');
        }
      }
    }

    try {
      DioClient dioclient = DioClient();
      if (deviceIDs.isEmpty) {
        setState(() {
          loading = false;
          loaded = true;
          loadingfailed = false;
        });
      } else if (deviceIDs.isNotEmpty) {
        for (int k = 0; k < deviceIDs.length; k++) {
          final response = await dioclient.dio.get(
            '/device/get_latest_observation/${deviceIDs[k]}',
          );
          models.add(
            Observation.fromJson(response.data["entry"][0]["resource"]),
          );
        }
        setState(() {
          loading = false;
          loaded = true;
          loadingfailed = false;
        });
      }
    } catch (e) {
      setState(() {
        loading = false;
        loaded = true;
        loadingfailed = false;
      });
    }
  }
}

class Device {
  String? id;

  Device({this.id});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(id: json['id']);
  }
}
