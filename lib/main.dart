// ignore_for_file: avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/view/pages/page_splash_screen.dart';
import 'package:weather_app/viewmodel/provider/provide_historydata.dart';
import 'package:weather_app/viewmodel/provider/provider_serchbar.dart';
import 'package:weather_app/viewmodel/provider/provider_theme.dart';

import 'package:weather_app/viewmodel/theme/theme_data.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SearchHistoryProvider>(
              create: (_) => SearchHistoryProvider()),
          ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
          ChangeNotifierProvider<SearchBarProvider>(
              create: (_) => SearchBarProvider())
        ],
        child: Consumer<ThemeProvider>(builder: (context, themeState, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeState.getDarktheme
                ? ThemeClass.dartTheme
                : ThemeClass.lightTheme,
            home: SplashScreen(),
          );
        }));
  }
}
