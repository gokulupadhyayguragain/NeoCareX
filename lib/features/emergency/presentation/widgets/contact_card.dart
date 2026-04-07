import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/emergency_contact_ui/emergency_contact_ui_model.dart';
import '../utils/contact_type_utils.dart';

class ContactCard extends StatelessWidget {
  final EmergencyContactUiModel contact;
  final VoidCallback onDelete;
  final VoidCallback? onEdit;

  const ContactCard({
    super.key,
    required this.contact,
    required this.onDelete,
    this.onEdit,
  });

  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(scheme: 'tel', path: contact.phone);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final contactType = ContactTypeUtils.getContactTypeByName(contact.type);

    return Dismissible(
      key: Key(contact.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Contact'),
            content: Text('Delete ${contact.name}?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ?? false;
      },
      onDismissed: (direction) {
        onDelete();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${contact.name} deleted'),
            duration: const Duration(seconds: 3),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: contact.color.withAlpha(26),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                contactType?.icon ?? Icons.contact_emergency,
                color: contact.color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contact.type,
                    style: TextStyle(
                      fontSize: 14,
                      color: contact.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contact.phone,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (!contact.isSynced)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Syncing...',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: Colors.orange,
                                ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            IconButton(
              onPressed: _makePhoneCall,
              icon: const Icon(Icons.phone, color: Colors.green),
              style: IconButton.styleFrom(
                backgroundColor: Colors.green.withAlpha(26),
              ),
            ),
            if (onEdit != null)
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit, color: Colors.blue),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue.withAlpha(26),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
