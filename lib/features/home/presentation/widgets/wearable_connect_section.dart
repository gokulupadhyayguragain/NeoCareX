import 'dart:io';

import 'package:flutter/material.dart';
import 'package:patient_app/constants/environment.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:patient_app/core/widgets/toast_widget.dart';
import 'package:patient_app/features/home/data/services/rook_service_web.dart';
import 'package:patient_app/features/home/data/services/rook_apple_health_service.dart';
import 'package:patient_app/features/home/data/services/wearable_sync_manager.dart';
import 'package:patient_app/features/home/presentation/bloc/health_bloc.dart';
import 'package:patient_app/features/home/presentation/bloc/health_event.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'package:rook_sdk_core/rook_sdk_core.dart';

class WearableConnectSection extends StatefulWidget {
  const WearableConnectSection({super.key});

  @override
  State<WearableConnectSection> createState() => _WearableConnectSectionState();
}

class _WearableConnectSectionState extends State<WearableConnectSection> {
  final List<_WearableItem> items = const [
    _WearableItem(
      providerKey: 'fitbit',
      name: 'Fitbit',
      imageUrl: 'assets/images/fitbit.png',
    ),
    _WearableItem(
      providerKey: 'oura',
      name: 'Oura Ring',
      imageUrl: 'assets/images/oura.png',
    ),
    _WearableItem(
      providerKey: 'garmin',
      name: 'Garmin',
      imageUrl: 'assets/images/garmin.png',
    ),
    _WearableItem(
      providerKey: 'whoop',
      name: 'Whoop',
      imageUrl: 'assets/images/whoop.png',
    ),
    _WearableItem(
      providerKey: 'withings',
      name: 'Withings',
      imageUrl: 'assets/images/withings.png',
    ),
    _WearableItem(
      providerKey: 'polar',
      name: 'Polar',
      imageUrl: 'assets/images/polar.png',
    ),
  ];

  final List<_NativeWearableItem> nativeItems = [
    _NativeWearableItem(
      id: 'apple_health',
      name: 'Apple Health',
      imageUrl: 'assets/images/appleHealth.png',
      platforms: ['ios'],
    ),
  ];

  bool _isLoading = false;
  bool _isNativeSyncing = false;
  bool _isAndroid = false;
  bool _isIOS = false;
  bool _isWeb = true;
  final Map<String, bool> _wearableLoadingStates = {};
  String? _patientId;

  @override
  void initState() {
    super.initState();
    _detectPlatform();
    _loadPatientId();
  }

  Future<void> _loadPatientId() async {
    final storage = SecureStorageService();
    final patientId = await storage.readString("patientId");
    if (mounted) setState(() => _patientId = patientId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshConnectedWearables();
      _reloadCachedWearableData();
      for (final item in items) {
        _wearableLoadingStates[item.providerKey] = false;
      }
    });
  }

  Future<void> _reloadCachedWearableData() async {
    try {
      await context.read<WearablesSyncManager>().reloadCachedData();
    } catch (e) {}
  }

  void _detectPlatform() {
    if (kIsWeb) {
      _isWeb = true;
      _isAndroid = false;
      _isIOS = false;
    } else {
      _isWeb = false;
      _isAndroid = Platform.isAndroid;
      _isIOS = Platform.isIOS;
    }
  }

  Future<void> _refreshConnectedWearables() async {
    final rookService = context.read<RookService>();
    if (!rookService.isInitialized) return;

    setState(() => _isLoading = true);
    try {
      await rookService.getAuthorizedDataSources(_patientId ?? '');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
    final rookService = context.watch<RookService>();
    final syncManager = context.watch<WearablesSyncManager>();
    final isMobile = MediaQuery.of(context).size.width < 600;

    final availableNativeItems = _isWeb
        ? <_NativeWearableItem>[]
        : nativeItems.where((item) {
            if (_isAndroid) return item.platforms.contains('android');
            if (_isIOS) return item.platforms.contains('ios');
            return false;
          }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Connect your wearable device', style: titleStyle),
            ),
            const SizedBox(width: 8),
            if (_isLoading)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
          ],
        ),
        const SizedBox(height: 12),

        ...items.map(
          (it) => _WearableRow(
            item: it,
            isConnected: rookService.connectedWearables.contains(
              it.providerKey,
            ),
            isLoading: _wearableLoadingStates[it.providerKey] ?? false,
            onDisconnect: () => _handleDisconnect(it.providerKey),
            onConnect: () => _handleConnect(it.providerKey),
            isMobile: isMobile,
          ),
        ),
        const SizedBox(height: 24),

        if (!_isWeb && availableNativeItems.isNotEmpty) ...[
          Row(
            children: [
              Text('Built-in wearable data', style: titleStyle),
              const SizedBox(width: 8),
              if (_isNativeSyncing)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Access health data directly from your device',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          ...availableNativeItems.map(
            (item) => _NativeWearableRow(
              item: item,
              isSyncing: _isNativeSyncing,
              onSync: () => _handleNativeSync(item),
              isMobile: isMobile,
            ),
          ),
          const SizedBox(height: 12),
          if (syncManager.lastSyncTime != null)
            Row(
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Last synced: ${_formatSyncTime(syncManager.lastSyncTime!)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          if (syncManager.lastErrorMessage != null)
            Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Theme.of(context).colorScheme.error,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Sync error: ${syncManager.lastErrorMessage}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 16),
        ],

        if (rookService.connectedWearables.isNotEmpty)
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Data from connected devices syncs automatically',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Future<void> _handleConnect(String providerKey) async {
    if (mounted) setState(() => _wearableLoadingStates[providerKey] = true);

    final rookService = context.read<RookService>();

    if (!rookService.isReady) {
      showToast(
        context,
        'Rook SDK not configured. Please contact admin.',
        backgroundColor: Colors.red,
      );
      if (mounted) setState(() => _wearableLoadingStates[providerKey] = false);
      return;
    }

    if (providerKey == 'apple_health') {
      if (!_isIOS) {
        showToast(
          context,
          'Apple Health is only available on iOS devices',
          backgroundColor: Colors.red,
        );
        if (mounted) {
          setState(() => _wearableLoadingStates[providerKey] = false);
        }
        return;
      }
      try {
        await rookService.connectDataSource(_patientId ?? '', providerKey);
      } finally {
        if (mounted) {
          setState(() => _wearableLoadingStates[providerKey] = false);
        }
      }
      return;
    }

    try {
      showToast(
        context,
        'Opening ${_getNameFromKey(providerKey)} login…',
        backgroundColor: Colors.blue,
      );

      await rookService.connectDataSource(_patientId ?? '', providerKey);

      if (mounted) {
        await _refreshConnectedWearables();

        final nowConnected = rookService.connectedWearables.contains(
          providerKey,
        );
        showToast(
          context,
          nowConnected
              ? '✓ Connected to ${_getNameFromKey(providerKey)}!'
              : 'Authorization sent — status will update shortly.',
          backgroundColor: nowConnected ? Colors.green : Colors.orange,
        );
      }
    } catch (e) {
      if (mounted) {
        final msg = e.toString();
        final display =
            (msg.contains('already authorized') ||
                msg.contains('Already authorized'))
            ? '${_getNameFromKey(providerKey)} is already connected'
            : 'Failed to connect: $msg';
        showToast(
          context,
          display,
          backgroundColor: Theme.of(context).colorScheme.error,
        );
      }
    } finally {
      if (mounted) setState(() => _wearableLoadingStates[providerKey] = false);
    }
  }

  Future<void> _handleDisconnect(String providerKey) async {
    if (mounted) setState(() => _wearableLoadingStates[providerKey] = true);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Disconnect Wearable'),
        content: Text(
          'Are you sure you want to disconnect ${_getNameFromKey(providerKey)}?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
              if (mounted) {
                setState(() => _wearableLoadingStates[providerKey] = false);
              }
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Disconnect'),
          ),
        ],
      ),
    );

    if (confirmed != true) {
      if (mounted) setState(() => _wearableLoadingStates[providerKey] = false);
      return;
    }

    try {
      await context.read<RookService>().disconnectDataSource(
        _patientId ?? '',
        providerKey,
      );
      if (mounted) {
        await _refreshConnectedWearables();
        showToast(
          context,
          '${_getNameFromKey(providerKey)} disconnected successfully',
          backgroundColor: Colors.green,
        );
      }
    } catch (e) {
      if (mounted) {
        showToast(
          context,
          'Failed to disconnect: ${e.toString()}',
          backgroundColor: Theme.of(context).colorScheme.error,
        );
      }
    } finally {
      if (mounted) setState(() => _wearableLoadingStates[providerKey] = false);
    }
  }

  Future<void> _handleNativeSync(_NativeWearableItem item) async {
    try {
      if (mounted) {
        setState(() => _isNativeSyncing = true);
        showToast(
          context,
          'Checking permissions for ${item.name}…',
          backgroundColor: Colors.blue,
          time: 60,
        );
      }
      if (item.id == 'apple_health' && _isIOS) {
        await _handleAppleHealthSync(item, _patientId ?? '');
      }
    } catch (e) {
      if (mounted) {
        showToast(
          context,
          'Error syncing ${item.name}: $e',
          backgroundColor: Theme.of(context).colorScheme.error,
        );
      }
    } finally {
      if (mounted) setState(() => _isNativeSyncing = false);
    }
  }

  Future<void> _handleAppleHealthSync(
    _NativeWearableItem item,
    String user,
  ) async {
    try {
      final appleHealthService = RookAppleHealthService();
      if (mounted) {
        setState(() => _isNativeSyncing = true);
        showToast(
          context,
          'Setting up Apple Health…',
          backgroundColor: Colors.blue,
          time: 120,
        );
      }

      final shouldProceed = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Apple Health Permission'),
          content: const Text(
            'Apple Health needs permission to access your:\n\n'
            '• Heart rate data\n• Step count\n• Sleep analysis\n'
            '• Activity energy\n• Workout data\n\n'
            'You will be shown the Apple Health permission screen.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Continue'),
            ),
          ],
        ),
      );

      if (shouldProceed != true) {
        if (mounted) {
          showToast(
            context,
            'Apple Health setup cancelled',
            backgroundColor: Colors.red,
          );
        }
        return;
      }

      const environment = RookEnvironment.production;
      const clientUUID = Environment.rookClientUuid;
      const secretKey = Environment.rookSecretKey;

      final initialized = await appleHealthService.initialize(
        clientUUID: clientUUID,
        secretKey: secretKey,
        environment: environment,
        enableBackgroundSync: true,
        enableLogs: kDebugMode,
      );
      if (!initialized) {
        throw Exception('Failed to initialize Apple Health SDK');
      }

      await appleHealthService.updateUserID(user);
      final permissionsGranted = await appleHealthService.requestPermissions();

      if (!permissionsGranted && mounted) {
        showToast(
          context,
          'Permissions not granted. Check Settings.',
          backgroundColor: Colors.orange,
        );
      }

      final syncSuccess = await appleHealthService.performFullSync();
      final syncManager = context.read<WearablesSyncManager>();
      await syncManager.storeAppleHealthSyncData({
        'timestamp': DateTime.now().toIso8601String(),
        'user_id': user,
        'permissions_granted': permissionsGranted,
        'sync_completed': syncSuccess,
      });

      if (mounted) {
        showToast(
          context,
          syncSuccess
              ? 'Sync successful'
              : 'Setup complete. No health data found yet.',
          backgroundColor: syncSuccess ? Colors.green : Colors.orange,
          time: 5,
        );
        showToast(
          context,
          'Processing data… this may take 2–3 minutes',
          backgroundColor: Colors.blue,
          time: 180,
        );
      }

      await Future.delayed(const Duration(seconds: 180));

      bool dataLoaded = false;
      for (var attempt = 0; attempt < 3 && !dataLoaded && mounted; attempt++) {
        try {
          await syncManager.reloadAllFromRook(user);
          final summary = syncManager.getAppleHealth24HourSummary();
          if (summary['hasData'] == true) {
            dataLoaded = true;
            final dateStr = _todayDateStr();
            if (mounted) {
              context.read<HealthBloc>().add(
                LoadWearableData(userId: user, date: dateStr),
              );
              showToast(
                context,
                '✓ Health data loaded!',
                backgroundColor: Colors.green,
                time: 3,
              );
            }
          } else if (attempt < 2 && mounted) {
            await Future.delayed(const Duration(seconds: 30));
          }
        } catch (e) {
          if (attempt < 2 && mounted) {
            await Future.delayed(const Duration(seconds: 30));
          }
        }
      }

      if (!dataLoaded && mounted) {
        showToast(
          context,
          'Data still processing. Check back in 5–10 minutes.',
          backgroundColor: Colors.orange,
          time: 5,
        );
      }
    } catch (e) {
      if (mounted) {
        showToast(
          context,
          'Apple Health setup failed: $e',
          backgroundColor: Theme.of(context).colorScheme.error,
        );
      }
    } finally {
      if (mounted) setState(() => _isNativeSyncing = false);
    }
  }

  String _getNameFromKey(String key) => items
      .firstWhere(
        (e) => e.providerKey == key,
        orElse: () => const _WearableItem(
          providerKey: 'unknown',
          name: 'Unknown Device',
          imageUrl: '',
        ),
      )
      .name;

  String _formatSyncTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  String _todayDateStr() {
    final now = DateTime.now();
    final dateStr =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    return dateStr;
  }
}

class _WearableItem {
  final String providerKey;
  final String name;
  final String imageUrl;
  const _WearableItem({
    required this.providerKey,
    required this.name,
    required this.imageUrl,
  });
}

class _NativeWearableItem {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> platforms;
  _NativeWearableItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.platforms,
  });
}

class _NativeWearableRow extends StatelessWidget {
  final _NativeWearableItem item;
  final bool isSyncing;
  final VoidCallback onSync;
  final bool isMobile;

  const _NativeWearableRow({
    required this.item,
    required this.isSyncing,
    required this.onSync,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer.withOpacity(0.15),
          border: Border.all(color: colorScheme.primary.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: isMobile ? 32 : 40,
              height: isMobile ? 32 : 40,
              child: Image.asset(item.imageUrl, fit: BoxFit.contain),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Sync from device storage',
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: isSyncing ? null : onSync,
              icon: isSyncing
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      Icons.cloud_download_outlined,
                      size: isMobile ? 14 : 18,
                    ),
              label: Text(
                isMobile ? 'Sync' : 'Sync Now',
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 8 : 14,
                  vertical: isMobile ? 6 : 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WearableRow extends StatelessWidget {
  final _WearableItem item;
  final bool isConnected;
  final bool isLoading;
  final VoidCallback onDisconnect;
  final VoidCallback onConnect;
  final bool isMobile;

  const _WearableRow({
    required this.item,
    required this.isConnected,
    required this.isLoading,
    required this.onDisconnect,
    required this.onConnect,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isConnected
              ? colorScheme.primaryContainer.withOpacity(0.3)
              : colorScheme.surface,
          border: Border.all(
            color: isConnected
                ? colorScheme.primary
                : colorScheme.outlineVariant,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: isConnected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            SizedBox(
              width: isMobile ? 32 : 40,
              height: isMobile ? 32 : 40,
              child: Image.asset(item.imageUrl, fit: BoxFit.contain),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          item.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (isConnected && !isMobile) ...[
                        const SizedBox(width: 6),
                        _ConnectedBadge(small: false),
                      ],
                    ],
                  ),
                  Text(
                    isConnected ? 'Auto-sync enabled' : 'Connect your device',
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (isConnected && isMobile) ...[
              const SizedBox(width: 6),
              _ConnectedBadge(small: true),
            ],
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: isLoading
                  ? null
                  : (isConnected ? onDisconnect : onConnect),
              icon: isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Icon(
                      isConnected ? Icons.link_off : Icons.link,
                      size: isMobile ? 14 : 18,
                    ),
              label: Text(
                isConnected ? 'Disconnect' : 'Connect',
                style: TextStyle(
                  fontSize: isMobile ? 12 : 16,
                  fontWeight: FontWeight.w600,
                  color: isConnected ? Colors.black : Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isConnected
                    ? colorScheme.errorContainer
                    : colorScheme.primary,
                foregroundColor: isConnected
                    ? colorScheme.onErrorContainer
                    : colorScheme.onPrimary,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 8 : 16,
                  vertical: isMobile ? 6 : 10,
                ),
                minimumSize: Size(isMobile ? 70 : 100, 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConnectedBadge extends StatelessWidget {
  final bool small;
  const _ConnectedBadge({required this.small});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: small ? 6 : 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'Connected',
        style: TextStyle(
          fontSize: small ? 10 : 12,
          color: Colors.green.shade800,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}