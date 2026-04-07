import 'package:flutter/material.dart';
import '../utils/contact_type_utils.dart';
import '../../data/models/emergency_contact/emergency_contact_model.dart';

class AddContactDialog extends StatefulWidget {
  final Function(EmergencyContactModel) onAdd;

  const AddContactDialog({super.key, required this.onAdd});

  @override
  State<AddContactDialog> createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late ContactTypeData _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = ContactTypeUtils.contactTypes.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }

    if (RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return 'Phone number cannot contain letters';
    }

    if (RegExp(r'[^\d+\s\-]').hasMatch(value)) {
      return 'Phone number contains invalid characters';
    }

    String digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return 'Please enter a valid phone number';
    }

    if ((value.split('+').length - 1) > 1) {
      return 'Only one + sign allowed at the start';
    }

    if (value.contains('+') && !value.startsWith('+')) {
      return '+ sign can only be at the beginning';
    }

    if (digitsOnly.length == 10) {
      if (digitsOnly.startsWith('98') || digitsOnly.startsWith('97')) {
        return null;
      } else {
        return 'Nepali mobile numbers must start with 98 or 97';
      }
    } else if (digitsOnly.length >= 7 && digitsOnly.length <= 9) {
      return null;
    } else if (digitsOnly.length >= 11 &&
        digitsOnly.length <= 15 &&
        value.startsWith('+')) {
      return null;
    } else {
      return 'Please enter a valid phone number';
    }
  }

  void _onPhoneChanged(String value) {
    if (RegExp(r'[a-zA-Z]').hasMatch(value)) {
      _phoneController.text = value.replaceAll(RegExp(r'[a-zA-Z]'), '');
      _phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: _phoneController.text.length),
      );
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final contact = EmergencyContactModel(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        type: _selectedType.name,
        colorValue: _selectedType.color.value,
        isSynced: false,
      );

      widget.onAdd(contact);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Emergency Contact'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name *',
                  hintText: 'Enter contact name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  if (value.length < 2) {
                    return 'Name must be at least 2 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number *',
                  hintText: 'Enter phone number',
                  border: OutlineInputBorder(),
                  errorMaxLines: 3,
                ),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                validator: _validatePhone,
                onChanged: _onPhoneChanged,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<ContactTypeData>(
                value: _selectedType,
                decoration: const InputDecoration(
                  labelText: 'Contact Type *',
                  border: OutlineInputBorder(),
                ),
                items: ContactTypeUtils.contactTypes.map((
                  ContactTypeData type,
                ) {
                  return DropdownMenuItem<ContactTypeData>(
                    value: type,
                    child: Row(
                      children: [
                        Icon(type.icon, size: 20, color: type.color),
                        const SizedBox(width: 8),
                        Text(type.name),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedType = value;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a contact type';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: _submitForm,
          child: const Text('Add', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
