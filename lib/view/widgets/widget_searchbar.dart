import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/constant.dart';
import 'package:weather_app/view/pages/page_home.dart';
import 'package:weather_app/viewmodel/provider/provider_loc_permission.dart';

import '../../model/model_weather.dart';
import '../../viewmodel/api_response/responce_weather.dart';

// ignore: must_be_immutable
class MySearchBar extends StatefulWidget {
  //  Function(String)? onTap;
  TextEditingController? controller;
  String? initialValue;

  MySearchBar({
    super.key,
    this.controller,
    this.initialValue,
  });
  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  Weather? obj;
  GetWeather wethpro = GetWeather();
  Location? decodeData;

  @override
  Widget build(BuildContext context) {
    final wt = MediaQuery.of(context).size.width;
    // final ht = MediaQuery.of(context).size.height;
    return SizedBox(
      width: wt / 1.4,
      child: TextField(
        textCapitalization: TextCapitalization.words,
          controller: widget.controller,
          onSubmitted: (address) {
            if (address.isNotEmpty) {
              setState(() {
                finalAddress = address;
                LocPermissionProvider()
                    .getLatAndLonFromAdress(address,context)
                    .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  searchAddress: address,
                                ))));
                // currentLocation = value;
              });
            }
          },
          decoration: const InputDecoration(
            prefixIconColor: defaultAmber,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            prefixIcon: Icon(Icons.search),
            hintText: "Location",
          )),
    );
  }
}
