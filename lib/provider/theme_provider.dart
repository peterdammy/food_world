import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    themeMode = _ontoggleTheme(themeMode);
    // print('theme toggled to $themeMode');
    notifyListeners();
  }

  ThemeMode _ontoggleTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return ThemeMode.light;
      case ThemeMode.light:
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }
}

final themeProvider = ChangeNotifierProvider((ref) => ThemeProvider());
