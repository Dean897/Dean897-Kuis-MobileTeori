import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'tool_widgets.dart';

class TriangleScreen extends StatefulWidget {
  const TriangleScreen({super.key});
  @override
  State<TriangleScreen> createState() => _TriangleScreenState();
}

class _TriangleScreenState extends State<TriangleScreen> {
  final first = TextEditingController();
  final second = TextEditingController();
  final third = TextEditingController();
  String type = 'Sama kaki';
  double? area;
  double? perimeter;

  void calculate() {
    final a = double.tryParse(first.text.replaceAll(',', '.'));
    if (a == null || a <= 0) {
      return;
    }
    if (type == 'Sama sisi') {
      setState(() {
        area = math.sqrt(3) * a * a / 4;
        perimeter = a * 3;
      });
      return;
    }
    final b = double.tryParse(second.text.replaceAll(',', '.'));
    if (b == null || b <= 0) return;
    if (type == 'Sama kaki') {
      final calculatedArea = b * math.sqrt(math.max(0, a * a - b * b / 4)) / 2;
      setState(() {
        area = calculatedArea;
        perimeter = a * 2 + b;
      });
      return;
    }
    final c = double.tryParse(third.text.replaceAll(',', '.'));
    if (c == null || c <= 0) return;
    final calculatedArea = a * b / 2;
    setState(() {
      area = calculatedArea;
      perimeter = a + b + c;
    });
  }

  @override
  Widget build(BuildContext context) {
    final labels = type == 'Sama sisi'
        ? ['Sisi']
        : type == 'Siku-siku'
        ? ['Alas', 'Tinggi', 'Sisi miring']
        : ['Sisi miring', 'Alas'];
    return ToolScaffold(
      title: 'Segitiga',
      subtitle: 'Pilih jenis segitiga lalu masukkan ukurannya.',
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            initialValue: type,
            decoration: const InputDecoration(labelText: 'Jenis segitiga'),
            items: ['Sama kaki', 'Sama sisi', 'Siku-siku']
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: (value) => setState(() {
              type = value!;
              area = null;
            }),
          ),
          const SizedBox(height: 14),
          NumberField(controller: first, label: labels[0]),
          if (type != 'Sama sisi') ...[
            const SizedBox(height: 14),
            NumberField(controller: second, label: labels[1]),
            if (type == 'Siku-siku') ...[
              const SizedBox(height: 14),
              NumberField(controller: third, label: labels[2]),
            ],
          ],
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: calculate,
              icon: const Icon(Icons.calculate),
              label: const Text('Hitung'),
            ),
          ),
          if (area != null) ...[
            const SizedBox(height: 18),
            ResultCard(label: 'Luas', value: '${formatNumber(area!)} cm²'),
            ResultCard(
              label: 'Keliling',
              value: '${formatNumber(perimeter!)} cm',
            ),
          ],
        ],
      ),
    );
  }
}
