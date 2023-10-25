import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view/pages/page_home.dart';

import '../../viewmodel/provider/provider_loc_permission.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // bool scaffolVisibility = false;
  @override
  Widget build(BuildContext context) {

    Provider.of<LocPermissionProvider>(context).getCurrentLocation().then(
        (value) async => await Future.delayed(const Duration(seconds: 3)).then(
            (value) => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()))));

    return const Scaffold(

      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
