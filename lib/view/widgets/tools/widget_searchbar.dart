import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/constant.dart';
import 'package:weather_app/view/pages/page_home.dart';
import 'package:weather_app/viewmodel/loc_permission.dart';

import '../../../viewmodel/provider/provider_serchbar.dart';

// ignore: must_be_immutable
class MySearchBar extends StatefulWidget {
  TextEditingController? controller;

  MySearchBar({
    super.key,
    this.controller,
  });
  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    final wt = MediaQuery.of(context).size.width;
    return Consumer<SearchBarProvider>(builder: (context, serchpro, child) {
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
                      .getLatAndLonFromAdress(address, context)
                      .then((value) => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage())));
                  //   // currentLocation = value;
                });
              }
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              hintText: "Search Place",
            )),
      );
    });
  }
}
