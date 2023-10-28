import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
        backgroundColor: lightAppbar,
        iconTheme: const IconThemeData(color: defaultAmber)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: lightHintText),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: lightPrimaryColor,
      secondary: secondaryColor,
    ),


  );

///////////////////////////////////////////////////////////////////////
  static ThemeData dartTheme = ThemeData(
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: defaultAmber)),
      inputDecorationTheme:
          InputDecorationTheme(hintStyle: TextStyle(color: darkHintText)),
      colorScheme: const ColorScheme.dark()
          .copyWith(primary: darkPrimaryColor, secondary: secondaryColor));
}
