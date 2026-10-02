import 'package:flutter/material.dart';

import 'tool_widgets.dart';

class PyramidScreen extends StatefulWidget {
  const PyramidScreen({super.key});
  @override
  State<PyramidScreen> createState() => _PyramidScreenState();
}

class _PyramidScreenState extends State<PyramidScreen> {
  final side = TextEditingController();
  final height = TextEditingController();
  double? volume;
  double? perimeter;

  void calculate() {
    final s = double.tryParse(side.text.replaceAll(',', '.'));
    final h = double.tryParse(height.text.replaceAll(',', '.'));
    if (s == null || h == null || s <= 0 || h <= 0) return;
    setState(() {
      volume = s * s * h / 3;
      perimeter = s * 4;
    });
  }

  @override
  Widget build(BuildContext context) => ToolScaffold(
    title: 'Piramida',
    subtitle: 'Hitung volume dan keliling alas piramida persegi.',
    child: Column(
      children: [
        NumberField(controller: side, label: 'Sisi alas'),
        const SizedBox(height: 14),
        NumberField(controller: height, label: 'Tinggi'),
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: calculate,
            icon: const Icon(Icons.calculate),
            label: const Text('Hitung'),
          ),
        ),
        if (volume != null) ...[
          const SizedBox(height: 18),
          ResultCard(label: 'Volume', value: '${formatNumber(volume!)} cm³'),
          ResultCard(
            label: 'Keliling alas',
            value: '${formatNumber(perimeter!)} cm',
          ),
        ],
      ],
    ),
  );
}
