import 'package:flutter/material.dart';

import './yellow.theme.dart';
import './orange.theme.dart';
import './red.theme.dart';
import './green.theme.dart';
import './blue.theme.dart';
import './light_blue.theme.dart';

// DARK THEMES
final ThemeData yellowDarkTheme = buildYellowDarkTheme();
final ThemeData orangeDarkTheme = buildOrangeDarkTheme();
final ThemeData redDarkTheme = buildRedDarkTheme();
final ThemeData greenDarkTheme = buildGreenDarkTheme();
final ThemeData blueDarkTheme = buildBlueDarkTheme();
final ThemeData lightBlueDarkTheme = buildLightBlueDarkTheme();

// LIGHT THEMES
final ThemeData yellowLightTheme = buildYellowLightTheme();
final ThemeData orangeLightTheme = buildOrangeLightTheme();
final ThemeData redLightTheme = buildRedLightTheme();
final ThemeData greenLightTheme = buildGreenLightTheme();
final ThemeData blueLightTheme = buildBlueLightTheme();
final ThemeData lightBlueLightTheme = buildLightBlueLightTheme();

/*
Change events
*/
abstract class ChangeThemeEvent {}

class DecideTheme extends ChangeThemeEvent {
  final int theme_color;

  DecideTheme(this.theme_color);
}

class DecideThemeMode extends ChangeThemeEvent {}