import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

String formatNumber(double value) {
  final text = value.toStringAsFixed(10);
  return text.replaceFirst(RegExp(r'\.?0+$'), '');
}

class ToolScaffold extends StatelessWidget {
  const ToolScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });
  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 14, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 22),
          child,
        ],
      ),
    ),
  );
}

class ResultCard extends StatelessWidget {
  const ResultCard({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Card(
    color: AppTheme.mint,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleMedium),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppTheme.teal),
          ),
        ],
      ),
    ),
  );
}

class NumberField extends StatelessWidget {
  const NumberField({super.key, required this.controller, required this.label});
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    decoration: InputDecoration(labelText: label, suffixText: 'cm'),
  );
}
