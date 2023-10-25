import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'colors.dart';

final currentDate = DateFormat('EEEE, MMM d h:mm a').format(DateTime.now());
double? lat;
double? lon;
String localitys = "";
String finalAddress = "";
String apiId = "3d085be1194c6b7cbd8f7b162c1e273e";
// String subLocalitys = "";

const radius = Radius.circular(400);
///////////////////////////////////////////////////////////////////////////////////////////////
const weatherTextStyle =
    TextStyle(color: defaultAmber, fontWeight: FontWeight.bold, fontSize: 18);
////////////////////////////////////////////////
const darkbgGradientBXDec = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
      Color.fromARGB(255, 41, 40, 40),
      Color.fromARGB(255, 43, 50, 52),
      Color.fromARGB(255, 26, 25, 25)
    ]));

const lightbgGradientBXDec = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
      Color.fromARGB(255, 214, 231, 247),
      Color.fromARGB(255, 165, 199, 233),
      Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 165, 199, 233),
    ]));
////////////////////////////////////////////////////////////////
const darkCircleBXDec = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black,
          Colors.black,
          Color.fromARGB(255, 50, 48, 48),
        ]),
    // color: Colors.white,
    borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius));

const lightCircleBXDec = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255)
        ]),
    // color: Colors.white,
    borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius));
////////////////////////////////////////////////////
