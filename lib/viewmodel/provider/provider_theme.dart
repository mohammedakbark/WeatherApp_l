import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _darktheme = false;

  bool get getDarktheme => _darktheme;

  set setDarktheme(bool value) {
    _darktheme = value;
    notifyListeners();
  }



 
   
}
