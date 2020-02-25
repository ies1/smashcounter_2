import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themes/theme.utils.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  void onThemeColorChange(int theme_color) => add(DecideTheme(theme_color));
  void onThemeDarkModeChange() => add(DecideThemeMode());

  // initial yellow color
  @override
  ChangeThemeState get initialState => ChangeThemeState.yellowDarkTheme();

  @override
  Stream<ChangeThemeState> mapEventToState(ChangeThemeEvent event) async* {
    int optThemeColor = await getThemeColor();
    bool optThemeDarkMode = await getThemeDarkMode();
    
    if (event is DecideTheme) {
      final int changedThemeColor = event.theme_color;

      if (changedThemeColor != optThemeColor) {
        optThemeColor = changedThemeColor;
      }
      try {
        _saveThemeColorValue(optThemeColor);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    } else if (event is DecideThemeMode) {
      final bool changedThemeColorMode = !optThemeDarkMode;
      optThemeDarkMode = changedThemeColorMode;
      try {
        _saveThemeDarkModeValue(optThemeDarkMode);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    }

    if (optThemeDarkMode) {
      if (optThemeColor == 1) {
        yield ChangeThemeState.yellowDarkTheme();
      } else if (optThemeColor == 2) {
        yield ChangeThemeState.orangeDarkTheme();
      } else if (optThemeColor == 3) {
        yield ChangeThemeState.redDarkTheme();
      } else if (optThemeColor == 4) {
        yield ChangeThemeState.greenDarkTheme();
      } else if (optThemeColor == 5) {
        yield ChangeThemeState.blueDarkTheme();
      } else if (optThemeColor == 6) {
        yield ChangeThemeState.lightBlueDarkTheme();
      }
    } else {
      if (optThemeColor == 1) {
        yield ChangeThemeState.yellowLightTheme();
      } else if (optThemeColor == 2) {
        yield ChangeThemeState.orangeLightTheme();
      } else if (optThemeColor == 3) {
        yield ChangeThemeState.redLightTheme();
      } else if (optThemeColor == 4) {
        yield ChangeThemeState.greenLightTheme();
      } else if (optThemeColor == 5) {
        yield ChangeThemeState.blueLightTheme();
      } else if (optThemeColor == 6) {
        yield ChangeThemeState.lightBlueLightTheme();
      }
    }

  }

  Future<Null> _saveThemeColorValue(int optValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('theme_color', optValue);
  }

  Future<Null> _saveThemeDarkModeValue(bool optValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('theme_dark_mode', optValue);
  }

  // 1 to 6
  Future<int> getThemeColor() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int opt = preferences.get('theme_color') ?? 1;
    return opt;
  }

  // 0 -- dark mode
  // 1 -- light mode
  Future<bool> getThemeDarkMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool opt = preferences.get('theme_dark_mode') ?? false;
    return opt;
  }
}

final ChangeThemeBloc changeThemeBloc = ChangeThemeBloc()
  ..onThemeColorChange(1);

class ChangeThemeState {
  final ThemeData themeData;

  ChangeThemeState({@required this.themeData});

  factory ChangeThemeState.yellowDarkTheme() {
    return ChangeThemeState(themeData: yellowDarkTheme);
  }

  factory ChangeThemeState.yellowLightTheme() {
    return ChangeThemeState(themeData: yellowLightTheme);
  }

  factory ChangeThemeState.orangeDarkTheme() {
    return ChangeThemeState(themeData: orangeDarkTheme);
  }

  factory ChangeThemeState.orangeLightTheme() {
    return ChangeThemeState(themeData: orangeLightTheme);
  }

  factory ChangeThemeState.redDarkTheme() {
    return ChangeThemeState(themeData: redDarkTheme);
  }

  factory ChangeThemeState.redLightTheme() {
    return ChangeThemeState(themeData: redLightTheme);
  }

  factory ChangeThemeState.greenDarkTheme() {
    return ChangeThemeState(themeData: greenDarkTheme);
  }

  factory ChangeThemeState.greenLightTheme() {
    return ChangeThemeState(themeData: greenLightTheme);
  }

  factory ChangeThemeState.blueDarkTheme() {
    return ChangeThemeState(themeData: blueDarkTheme);
  }

  factory ChangeThemeState.blueLightTheme() {
    return ChangeThemeState(themeData: blueLightTheme);
  }

  factory ChangeThemeState.lightBlueDarkTheme() {
    return ChangeThemeState(themeData: lightBlueDarkTheme);
  }

  factory ChangeThemeState.lightBlueLightTheme() {
    return ChangeThemeState(themeData: lightBlueLightTheme);
  }
}
