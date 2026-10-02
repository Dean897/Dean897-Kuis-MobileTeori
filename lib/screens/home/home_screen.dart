import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../tools/day_checker_screen.dart';
import '../tools/pyramid_screen.dart';
import '../tools/time_converter_screen.dart';
import '../tools/triangle_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      _Tool(
        'Piramida',
        'Volume dan keliling alas',
        Icons.change_history,
        AppTheme.coral,
        const PyramidScreen(),
      ),
      _Tool(
        'Segitiga',
        'Luas dan keliling',
        Icons.architecture,
        const Color(0xFF6C9BE8),
        const TriangleScreen(),
      ),
      _Tool(
        'Konversi waktu',
        'WIB, Malaysia, Kanada',
        Icons.schedule,
        const Color(0xFFE0B95D),
        const TimeConverterScreen(),
      ),
      _Tool(
        'Cek hari',
        'Nomor 1 sampai 7',
        Icons.calendar_month,
        const Color(0xFF86AFA2),
        const DayCheckerScreen(),
      ),
    ];
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 18),
            sliver: SliverToBoxAdapter(child: _Header()),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Pilih alat hitung',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 14, 24, 28),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: .92,
              ),
              itemCount: tools.length,
              itemBuilder: (context, index) => _ToolCard(tool: tools[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Ruang Hitung', style: Theme.of(context).textTheme.displaySmall),
      const SizedBox(height: 8),
      Text(
        'Belajar bangun datar dengan cara yang sederhana.',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ],
  );
}

class _Tool {
  const _Tool(this.title, this.subtitle, this.icon, this.color, this.page);
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget page;
}

class _ToolCard extends StatelessWidget {
  const _ToolCard({required this.tool});
  final _Tool tool;

  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => tool.page)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: tool.color.withAlpha(35),
                shape: BoxShape.circle,
              ),
              child: Icon(tool.icon, color: tool.color, size: 27),
            ),
            const Spacer(),
            Text(tool.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            Text(tool.subtitle, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    ),
  );
}
