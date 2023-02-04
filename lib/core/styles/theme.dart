import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light = ThemeData.light().copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: _appBarTheme,
    bottomNavigationBarTheme: _barThemeData,
    colorScheme: _colorScheme,
    inputDecorationTheme: _decorationTheme,
  );

  static ColorScheme get _colorScheme => const ColorScheme.light(
        primary: AppColors.primary,
      );

  static AppBarTheme get _appBarTheme => const AppBarTheme(
        elevation: 0,
        centerTitle: true,
      );

  static BottomNavigationBarThemeData get _barThemeData =>
      const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      );
  static InputDecorationTheme get _decorationTheme =>
      const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
          ),
        ),
      );
}
