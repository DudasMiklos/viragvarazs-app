import 'package:viragvarazs/src/resources/preferences/theme_preference.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  bool _theme = false;

  bool get theme => _theme;

  set theme(bool value) {
    _theme = value;
    themePreference.setTheme(value);
    notifyListeners();
  }
}
