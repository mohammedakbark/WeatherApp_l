import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchBarProvider with ChangeNotifier {
  bool serchBarEnabled = false;
  isenabled() {
    serchBarEnabled = !serchBarEnabled;
    print(serchBarEnabled);
    notifyListeners();
  }
}
