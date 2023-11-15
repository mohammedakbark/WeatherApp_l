import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/pages/page_home.dart';
import 'package:lottie/lottie.dart';
import '../../viewmodel/loc_permission.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocPermissionProvider().getCurrentLocation().then((value) =>
    Get.to(HomePage())
    );

    return Scaffold(
      body: Center(child: Lottie.asset("assets/splash.json")),
    );
  }
}
