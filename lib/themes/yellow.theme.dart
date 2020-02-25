import 'package:flutter/material.dart';

import './color.theme.dart';

MaterialColor colorCustom = MaterialColor(0xFFDBDA01, color_yellow);

ThemeData buildYellowDarkTheme() {
  final theme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: colorCustom,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: colorCustom,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );
  return theme;
}

ThemeData buildYellowLightTheme() {
  final theme = ThemeData(
    primaryColor: colorCustom,
    accentColor: colorCustom,
  );
  return theme;
}