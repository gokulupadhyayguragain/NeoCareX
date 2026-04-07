import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import '../bloc/emergency_contact_bloc.dart';
import '../../data/models/emergency_contact_ui/emergency_contact_ui_model.dart';
import '../widgets/add_contact_dialog.dart';
import '../widgets/contact_card.dart';
import '../widgets/empty_state.dart';

class EmergencyContactsPage extends StatefulWidget {
  const EmergencyContactsPage({super.key});

  @override
  State<EmergencyContactsPage> createState() => _EmergencyContactsPageState();
}

class _EmergencyContactsPageState extends State<EmergencyContactsPage> {
  late String _patientId;
  bool _isLoadingPatientId = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPatientIdAndInitialize();
  }

  Future<void> _loadPatientIdAndInitialize() async {
    try {
      final storage = SecureStorageService();
      final patientId = await storage.readString('patientId');

      if (patientId == null || patientId.isEmpty) {
        setState(() {
          _error = 'Patient ID not found. Please log in again.';
          _isLoadingPatientId = false;
        });
        return;
      }

      setState(() {
        _patientId = patientId;
        _isLoadingPatientId = false;
      });

      if (mounted) {
        context.read<EmergencyContactBloc>().add(
          EmergencyContactEvent.loadContacts(_patientId),
        );
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to load patient ID: $e';
        _isLoadingPatientId = false;
      });
    }
  }

  void _showAddContactDialog() {
    showDialog(
      context: context,
      builder: (context) => AddContactDialog(
        onAdd: (contact) {
          context.read<EmergencyContactBloc>().add(
            EmergencyContactEvent.addContact(_patientId, contact),
          );
        },
      ),
    );
  }

  void _deleteContact(int contactIndex) {
    context.read<EmergencyContactBloc>().add(
      EmergencyContactEvent.deleteContact(_patientId, contactIndex),
    );
  }

  void _refreshContacts() {
    context.read<EmergencyContactBloc>().add(
      EmergencyContactEvent.refreshContacts(_patientId),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingPatientId) {
      return Scaffold(
        appBar: AppBar(title: const Text('Emergency Contacts')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Emergency Contacts')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(_error!),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddContactDialog,
            tooltip: 'Add Contact',
          ),
        ],
      ),
      body: BlocListener<EmergencyContactBloc, EmergencyContactState>(
        listener: (context, state) {
          state.maybeMap(
            error: (errorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorState.message),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 4),
                ),
              );
            },
            contactAdded: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contact added successfully'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            contactDeleted: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contact deleted successfully'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            contactUpdated: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contact updated successfully'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<EmergencyContactBloc, EmergencyContactState>(
          builder: (context, state) {
            return state.maybeMap(
              initial: (_) => const SizedBox.shrink(),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              syncing: (_) => const Center(child: CircularProgressIndicator()),
              loaded: (loadedState) {
                if (loadedState.contacts.isEmpty) {
                  return EmptyStateWidget(
                    title: 'No emergency contacts',
                    subtitle: 'Tap the + button to add a contact',
                    onActionPressed: _showAddContactDialog,
                    actionLabel: 'Add Contact',
                  );
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    bool isWideScreen = constraints.maxWidth > 900;
                    return Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isWideScreen ? 800 : double.infinity,
                        ),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            _refreshContacts();
                            await Future.delayed(
                              const Duration(milliseconds: 500),
                            );
                          },
                          child: ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: loadedState.contacts.length,
                            itemBuilder: (context, index) {
                              final contact = loadedState.contacts[index];
                              final uiModel =
                                  EmergencyContactUiModel.fromDomainModel(
                                    contact,
                                  );

                              return ContactCard(
                                contact: uiModel,
                                onDelete: () => _deleteContact(index),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (errorState) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 80, color: Colors.red[300]),
                    const SizedBox(height: 16),
                    Text(
                      'Something went wrong',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      errorState.message,
                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _refreshContacts,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
