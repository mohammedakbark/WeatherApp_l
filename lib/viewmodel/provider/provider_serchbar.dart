import 'package:flutter/material.dart';

class SearchBarProvider with ChangeNotifier {
  bool serchBarEnabled = false;
  isenabled() {
    serchBarEnabled = !serchBarEnabled;
    print(serchBarEnabled);
    notifyListeners();
  }
}
