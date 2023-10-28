import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../viewmodel/provider/provider_theme.dart';
import '../../pages/page_history.dart';

Widget myDrawer({context, required themestate}) {
  return Drawer(
    child: ListView(children: [
      const SizedBox(
        height: 40,
      ),
      InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HistoryPage())),
        child: const ListTile(
          leading: Icon(Icons.history),
          title: Row(
            children: [
            
              Text(
                "Hisory",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
      ),
      ListTile(
        leading: Image.asset(
          "assets/mode.png",
          color: humidityWindAndDescriptionColor,
          scale: 18,
        ),
        title: Row(
          children: [
            const Text(
              "Dark Mode",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1),
            ),
            const Spacer(
              flex: 1,
            ),
            FlutterSwitch(
                duration: const Duration(milliseconds: 0),
                activeColor: humidityWindAndDescriptionColor,
                inactiveColor: humidityWindAndDescriptionColor,
                inactiveIcon: Image.asset("assets/day.png"),
                activeIcon: Image.asset("assets/night.png"),
                width: 55,
                height: 30,
                value: themestate.getDarktheme,
                onToggle: (selected) {
                  themestate.setDarktheme = selected;
                }),
          ],
        ),
      ),
    ]),
  );
}
