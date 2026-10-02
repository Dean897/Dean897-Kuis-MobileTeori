import 'package:flutter/material.dart';
import 'tool_widgets.dart';

class TimeConverterScreen extends StatefulWidget {
  const TimeConverterScreen({super.key});
  @override
  State<TimeConverterScreen> createState() => _TimeConverterScreenState();
}

class _TimeConverterScreenState extends State<TimeConverterScreen> {
  TimeOfDay time = const TimeOfDay(hour: 12, minute: 0);
  String? result;

  Future<void> pickTime() async {
    final picked = await showTimePicker(context: context, initialTime: time);
    if (picked != null) {
      setState(() {
        time = picked;
        result = null;
      });
    }
  }

  void convert() {
    final wibMinutes = time.hour * 60 + time.minute;
    String format(int offset) {
      final total = (wibMinutes + offset * 60 + 1440) % 1440;
      return '${(total ~/ 60).toString().padLeft(2, '0')}:${(total % 60).toString().padLeft(2, '0')}';
    }

    setState(
      () => result =
          'WIB: ${format(0)}\nMalaysia: ${format(1)}\nKanada (Toronto): ${format(-11)}',
    );
  }

  @override
  Widget build(BuildContext context) => ToolScaffold(
    title: 'Konversi waktu',
    subtitle: 'Masukkan waktu Indonesia Barat (WIB) untuk melihat zona lain.',
    child: Column(
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.access_time),
            title: Text(time.format(context)),
            subtitle: const Text('Waktu awal dalam WIB'),
            trailing: TextButton(
              onPressed: pickTime,
              child: const Text('Ubah'),
            ),
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: convert,
            icon: const Icon(Icons.sync),
            label: const Text('Konversi'),
          ),
        ),
        if (result != null) ...[
          const SizedBox(height: 18),
          Card(
            color: const Color(0xFFDDF1E9),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  result!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ],
    ),
  );
}
