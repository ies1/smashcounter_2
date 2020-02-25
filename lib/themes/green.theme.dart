import 'package:flutter/material.dart';

import './color.theme.dart';

MaterialColor colorCustom = MaterialColor(0xFF21D45A, color_green);

ThemeData buildGreenDarkTheme() {
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

ThemeData buildGreenLightTheme() {
  final theme = ThemeData(
    primaryColor: colorCustom,
    accentColor: colorCustom,
  );
  return theme;
}