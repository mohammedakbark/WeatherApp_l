import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view/pages/page_home.dart';
import 'package:lottie/lottie.dart';
import '../../viewmodel/loc_permission.dart';

class SplashScreen extends StatelessWidget {
    LocPermissionProvider locPermissionProvider =LocPermissionProvider();

   SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
  locPermissionProvider. getCurrentLocation().then(
        // (value) async => await Future.delayed(const Duration(seconds: 3)).then(
        (value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));

    return  Scaffold(
      body: Center(
        child: Lottie.asset("assets/splash.json")
      ),
    );
  }
}
