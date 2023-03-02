import 'package:flutter/material.dart';

//https://www.youtube.com/watch?v=G1LGOH424lo&ab_channel=FlutterMapp

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
