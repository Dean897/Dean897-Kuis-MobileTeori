import 'package:flutter/material.dart';
import 'tool_widgets.dart';

class DayCheckerScreen extends StatefulWidget {
  const DayCheckerScreen({super.key});
  @override
  State<DayCheckerScreen> createState() => _DayCheckerScreenState();
}

class _DayCheckerScreenState extends State<DayCheckerScreen> {
  final number = TextEditingController();
  String? day;
  String? errorMessage;
  void check() {
    final value = int.tryParse(number.text);
    const days = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];
    setState(() {
      if (value != null && value >= 1 && value <= 7) {
        day = days[value - 1];
        errorMessage = null;
      } else {
        day = null;
        errorMessage = 'Nomor hari harus berada di antara 1 sampai 7.';
      }
    });
  }

  @override
  Widget build(BuildContext context) => ToolScaffold(
    title: 'Cek hari',
    subtitle: 'Cari nama hari dari nomor 1 sampai 7.',
    child: Column(
      children: [
        TextField(
          controller: number,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Nomor hari',
            hintText: 'Contoh: 1',
          ),
          onChanged: (_) {
            if (errorMessage != null) setState(() => errorMessage = null);
          },
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              errorMessage!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: check,
            icon: const Icon(Icons.search),
            label: const Text('Cek hari'),
          ),
        ),
        if (day != null) ...[
          const SizedBox(height: 18),
          ResultCard(label: 'Hasil', value: day!),
        ],
      ],
    ),
  );
}
