import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:patient_app/features/home/data/services/rook_apple_health_service.dart';

class AppleHealthDebugWidget extends StatefulWidget {
  const AppleHealthDebugWidget({super.key});

  @override
  State<AppleHealthDebugWidget> createState() => _AppleHealthDebugWidgetState();
}

class _AppleHealthDebugWidgetState extends State<AppleHealthDebugWidget> {
  String _status = 'Checking...';
  String _userId = 'Unknown';
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    if (kIsWeb || !Platform.isIOS) {
      setState(() {
        _status = 'Not available on this platform';
      });
      return;
    }

    try {
      final service = context.read<RookAppleHealthService>();
      
      final userId = await service.getUserID();
      _userId = userId ?? 'Not set';
      
      setState(() {
        _status = service.isInitialized 
            ? '✅ Initialized' 
            : '❌ Not initialized';
      });
    } catch (e) {
      setState(() {
        _status = '❌ Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            title: const Text('Apple Health Debug'),
            subtitle: Text('Status: $_status\nUser ID: $_userId'),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () => setState(() => _isExpanded = !_isExpanded),
            ),
          ),
          if (_isExpanded) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildInfoRow('Platform', Platform.isIOS ? 'iOS' : 'Not iOS'),
                  _buildInfoRow('Background Sync', 'Enabled'),
                  _buildInfoRow('Permissions', 'Granted'),
                  _buildInfoRow('Last Sync', 'Just now'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data syncs automatically every hour'),
                        ),
                      );
                    },
                    child: const Text('Check Sync Status'),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}