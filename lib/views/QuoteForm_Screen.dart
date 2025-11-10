import 'package:flutter/material.dart';
import '../widgets/client_info.dart';
import '../widgets/lineItem_row.dart';
import '../widgets/preview_section.dart';


class LineItem {
  String name;
  int quantity;
  double rate;
  double discount;
  double tax;

  LineItem({
    this.name = '',
    this.quantity = 1,
    this.rate = 0,
    this.discount = 0,
    this.tax = 0,
  });

  double get total {
    final base = (rate - discount) * quantity;
    final taxAmount = base * (tax / 100);
    return base + taxAmount;
  }
}

class QuoteFormScreen extends StatefulWidget {
  const QuoteFormScreen({super.key});

  @override
  State<QuoteFormScreen> createState() => _QuoteFormScreenState();
}

class _QuoteFormScreenState extends State<QuoteFormScreen> {
  //Making TextFiled Controllers
  final nameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final refCtrl = TextEditingController();
  final Shader textGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFFFFC107), // golden yellow
      Color(0xFFFF7043), // warm orange
      Color(0xFFF06292), // pink
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

  List<LineItem> items = [LineItem()];

  double get subtotal => items.fold(0, (sum, item) => sum + item.total);

  void addItem() {
    setState(() => items.add(LineItem()));
  }

  void removeItem(int index) {
    setState(() => items.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(title: const Text('Quote Form')),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ClientInfoSection(
                nameCtrl: nameCtrl,
                addressCtrl: addressCtrl,
                refCtrl: refCtrl,
              ),
              const SizedBox(height: 16),

              // Line Items Table
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) => LineItemRow(
                  item: items[index],
                  onChanged: (updatedItem) {
                    setState(() => items[index] = updatedItem);
                  },
                  onRemove: () => removeItem(index),
                ),
              ),

              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Add Item"),
                  onPressed: addItem,
                ),
              ),

              const SizedBox(height: 16),
              // Totals
              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Subtotal: ₹${subtotal.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Grand Total: ₹${subtotal.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = textGradient,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Preview Section
              PreviewSection(
                clientName: nameCtrl.text,
                address: addressCtrl.text,
                reference: refCtrl.text,
                items: items,
                total: subtotal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
