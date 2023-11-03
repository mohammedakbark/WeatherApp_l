import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryProvider with ChangeNotifier {
  List<String> searchListData = [];
  List<String> time = [];
  List<String> date = [];

  void addToSearchHistory(String place, String now, String dateNow) async {
    final prefs = await SharedPreferences.getInstance();
    
    searchListData = prefs.getStringList('searchHistory') ?? [];
    time = prefs.getStringList('time') ?? [];
    date = prefs.getStringList('date') ?? [];

    searchListData.add(place);
    time.add(now);
    date.add(dateNow);
    await prefs.setStringList('searchHistory', searchListData);
    await prefs.setStringList('time', time);
    await prefs.setStringList('date', date);
  }

  Future getSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    searchListData = prefs.getStringList('searchHistory') ?? [];
    time = prefs.getStringList('time') ?? [];
    date = prefs.getStringList('date') ?? [];
  }

  void clearSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('searchHistory');
    await prefs.remove('time');
    await prefs.remove('date');
    notifyListeners();
  }
}
