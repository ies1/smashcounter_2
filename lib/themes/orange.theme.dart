import 'package:flutter/material.dart';

import './color.theme.dart';

MaterialColor colorCustom = MaterialColor(0xFFE39718, color_orange);

ThemeData buildOrangeDarkTheme() {
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

ThemeData buildOrangeLightTheme() {
  final theme = ThemeData(
    primaryColor: colorCustom,
    accentColor: colorCustom,
  );
  return theme;
}