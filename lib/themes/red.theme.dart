import 'package:flutter/material.dart';

import './color.theme.dart';

MaterialColor colorCustom = MaterialColor(0xFFF21F2C, color_red);

ThemeData buildRedDarkTheme() {
  final theme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: colorCustom,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: colorCustom,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12
  );
  return theme;
}

ThemeData buildRedLightTheme() {
  final theme = ThemeData(
    primaryColor: colorCustom,
    accentColor: colorCustom,
  );
  return theme;
}