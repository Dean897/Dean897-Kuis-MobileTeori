import 'package:flutter/material.dart';

class AppTheme {
  static const ink = Color(0xFF172B2B);
  static const teal = Color(0xFF187C73);
  static const mint = Color(0xFFDDF1E9);
  static const coral = Color(0xFFEF8A70);
  static const sand = Color(0xFFF8F5ED);

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: sand,
      colorScheme: ColorScheme.fromSeed(
        seedColor: teal,
        brightness: Brightness.light,
        surface: sand,
      ),
      textTheme: const TextTheme(
        displaySmall: TextStyle(fontWeight: FontWeight.w800, color: ink),
        headlineSmall: TextStyle(fontWeight: FontWeight.w800, color: ink),
        titleLarge: TextStyle(fontWeight: FontWeight.w800, color: ink),
        titleMedium: TextStyle(fontWeight: FontWeight.w700, color: ink),
        bodyLarge: TextStyle(color: ink, height: 1.4),
        bodyMedium: TextStyle(color: Color(0xFF58706D), height: 1.4),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE1E7E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: teal, width: 2),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
