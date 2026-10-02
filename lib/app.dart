import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/shell/app_shell.dart';

class BangunDatarApp extends StatelessWidget {
  const BangunDatarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruang Hitung',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const AppShell(),
    );
  }
}
