import 'package:flutter/material.dart';
import '../views/QuoteForm_Screen.dart';
class PreviewSection extends StatelessWidget {
  final String clientName;
  final String address;
  final String reference;
  final List<LineItem> items;
  final double total;

  const PreviewSection({
    super.key,
    required this.clientName,
    required this.address,
    required this.reference,
    required this.items,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final Shader textGradient = const LinearGradient(
      colors: <Color>[
        Color(0xFFFFC107), // golden yellow
        Color(0xFFFF7043), // warm orange
        Color(0xFFF06292), // pink
      ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quote Preview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, foreground:  Paint()..shader = textGradient,)),
            const SizedBox(height: 8),
            Text("Client: $clientName"),
            Text("Address: $address"),
            Text("Reference: $reference"),
            const SizedBox(height: 12),
            ...items.map((e) => ListTile(
              dense: true,
              title: Text(e.name.isEmpty ? "Unnamed Item" : e.name),
              trailing: Text("₹${e.total.toStringAsFixed(2)}"),
            )),
            const Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: Text("Grand Total: ₹${total.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
