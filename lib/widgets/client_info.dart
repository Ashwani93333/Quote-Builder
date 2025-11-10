import 'package:flutter/material.dart';

class ClientInfoSection extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController addressCtrl;
  final TextEditingController refCtrl;

  const ClientInfoSection({
    super.key,
    required this.nameCtrl,
    required this.addressCtrl,
    required this.refCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Client Name'),
            ),
            TextField(
              controller: addressCtrl,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: refCtrl,
              decoration: const InputDecoration(labelText: 'Reference'),
            ),
          ],
        ),
      ),
    );
  }
}
