import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:patient_app/features/medications/data/entity/medication.dart';

class MedicationsPage extends StatefulWidget {
  const MedicationsPage({super.key});

  @override
  State<MedicationsPage> createState() => _MedicationsPageState();
}

class _MedicationsPageState extends State<MedicationsPage> {
  final List<Medication> _medications = [
    Medication(
      id: '1',
      name: 'Lisinopril',
      dosage: '10mg',
      frequency: 'Once daily',
      times: [const TimeOfDay(hour: 8, minute: 0)],
      startDate: DateTime.now().subtract(const Duration(days: 30)),
      prescribedBy: 'Dr. Smith',
      notes: 'Take with food',
    ),
    Medication(
      id: '2',
      name: 'Metformin',
      dosage: '500mg',
      frequency: 'Twice daily',
      times: [
        const TimeOfDay(hour: 8, minute: 0),
        const TimeOfDay(hour: 20, minute: 0),
      ],
      startDate: DateTime.now().subtract(const Duration(days: 60)),
      prescribedBy: 'Dr. Johnson',
      notes: 'Take with meals',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Medications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddMedicationDialog,
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 900;
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isWideScreen ? 800 : double.infinity,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _medications.length,
                itemBuilder: (context, index) {
                  final medication = _medications[index];
                  return _buildMedicationCard(medication, isWideScreen);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMedicationCard(Medication medication, bool isWide) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.05),
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
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.medication, color: Colors.blue),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medication.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${medication.dosage} • ${medication.frequency}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Switch(value: medication.isActive, onChanged: (value) {}),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.schedule, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                'Times: ${medication.times.map((t) => t.formatted).join(', ')}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          if (medication.prescribedBy != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.person, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  'Prescribed by: ${medication.prescribedBy}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
          if (medication.notes != null) ...[
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.note, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    medication.notes!,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Medication taken!')),
                  );
                },
                icon: const Icon(Icons.check, size: 16),
                label: const Text('Mark as Taken'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 16),
                label: const Text('Edit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddMedicationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Medication'),
        content: const Text('Medication form would go here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
