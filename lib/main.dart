import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/view/pages/page_splash_screen.dart';
import 'package:weather_app/viewmodel/provider/provider_theme.dart';

import 'package:weather_app/viewmodel/provider/provider_loc_permission.dart';
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
        ChangeNotifierProvider<LocPermissionProvider>(create: (_) => LocPermissionProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider())
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeState, child) {
        return MaterialApp(
          themeMode: ThemeMode.system,
          theme: themeState.getDarktheme
              ? ThemeClass.dartTheme
              : ThemeClass.lightTheme,
          home: const SplashScreen(),
        );
      }),
    );
  }
} 

