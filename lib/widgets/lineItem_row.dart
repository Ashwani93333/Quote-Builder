import 'package:flutter/material.dart';
import '../views/QuoteForm_Screen.dart';

class LineItemRow extends StatelessWidget {
  final LineItem item;
  final Function(LineItem) onChanged;
  final VoidCallback onRemove;

  const LineItemRow({
    super.key,
    required this.item,
    required this.onChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: TextField(
                decoration:
                const InputDecoration(labelText: 'Product/Service'),
                onChanged: (v) => onChanged(
                    LineItem(name: v, quantity: item.quantity, rate: item.rate, discount: item.discount, tax: item.tax)),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Qty'),
                onChanged: (v) =>
                    onChanged(LineItem(
                      name: item.name,
                      quantity: int.tryParse(v) ?? 1,
                      rate: item.rate,
                      discount: item.discount,
                      tax: item.tax,
                    )),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Rate'),
                onChanged: (v) =>
                    onChanged(LineItem(
                      name: item.name,
                      quantity: item.quantity,
                      rate: double.tryParse(v) ?? 0,
                      discount: item.discount,
                      tax: item.tax,
                    )),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Disc'),
                onChanged: (v) =>
                    onChanged(LineItem(
                      name: item.name,
                      quantity: item.quantity,
                      rate: item.rate,
                      discount: double.tryParse(v) ?? 0,
                      tax: item.tax,
                    )),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Tax %'),
                onChanged: (v) =>
                    onChanged(LineItem(
                      name: item.name,
                      quantity: item.quantity,
                      rate: item.rate,
                      discount: item.discount,
                      tax: double.tryParse(v) ?? 0,
                    )),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}
