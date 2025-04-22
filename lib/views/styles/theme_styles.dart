import 'package:flutter/material.dart';
import 'package:food_world/views/styles/font_styles.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade200,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.grey.shade600),
    titleTextStyle: FontStyles.largeText(Colors.grey.shade600),
  ),
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade200,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade800,
    error: Colors.red,
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade900,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.grey.shade300),
    titleTextStyle: FontStyles.largeText(Colors.grey.shade300),
  ),
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade600,
    error: Colors.red,
  ),
);
