import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeProvider with ChangeNotifier {
  bool darktheme = false;
  static const THEME_STATUS = "THEMESTATUS";
  bool get getDarktheme => darktheme;

  ThemeProvider() {
    getTheme();
  }

  setDarktheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    darktheme = value;
    prefs.setBool(THEME_STATUS, value);
    notifyListeners();
  }

  Future<void> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    darktheme = prefs.getBool(THEME_STATUS) ?? false;
    notifyListeners();
  }
}
