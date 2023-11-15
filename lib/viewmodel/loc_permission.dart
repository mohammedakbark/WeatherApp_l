import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/viewmodel/provider/provide_historydata.dart';

import '../utils/constant.dart';

class LocPermissionProvider {

  Position? latLonposition;
  Placemark decodeData = Placemark();
  Location? locationData;
  SearchHistoryProvider searchHistory = SearchHistoryProvider();

  String time = DateFormat('h:mm a').format(DateTime.now());
  String date = DateFormat('EEEE').format(DateTime.now());

  Future<Position> _getCurrentLatLonPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getCurrentLocation() async {
    latLonposition = await _getCurrentLatLonPosition();
    print("lat and loc = ${latLonposition.toString()}");
    lat = latLonposition!.latitude;
    lon = latLonposition!.longitude;
    _getAddressFromLatLon(latLonposition!);
  }

  // decoding lat and lon  using geodecode package And get full detauls
  Future<void> _getAddressFromLatLon(Position position) async {
    //this future function for getting current location when the app is open
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((placemarks) {
      decodeData = placemarks[0];
      countrycode = decodeData.isoCountryCode.toString();

      print("DECODED List of Datasssss $decodeData");
      if (decodeData.subLocality!.isNotEmpty) {
        localitys = decodeData.subLocality.toString();
      } else if (decodeData.locality!.isNotEmpty) {
        localitys = decodeData.locality.toString();
      } else {
        localitys = decodeData.country.toString();
      }
    });
  }

///////////////////////////////////////////for serching>.>>>>>>>////////////////////////////////////////////////////////////
  Future<void> getLatAndLonFromAdress(
      //this future function for gettimg location when user search through textfield
      String address,
      BuildContext context) async {
    try {
      await locationFromAddress(address)
          .then((value) => locationData = value[0]);
    } catch (e) {
      return showNotification(context);
    }
    lat = locationData!.latitude;
    lon = locationData!.longitude;
    await placemarkFromCoordinates(lat!.toDouble(), lon!.toDouble())
        .then((placemarks) {
      decodeData = placemarks[0];
      print("DECODED List of Data $decodeData");

      if (decodeData.subLocality!.isNotEmpty &&
          decodeData.subLocality == finalAddress) {
        localitys = decodeData.subLocality.toString();
      } else if (decodeData.locality!.isNotEmpty &&
          decodeData.locality == finalAddress) {
        localitys = decodeData.locality.toString();
      } else if (decodeData.administrativeArea!.isNotEmpty &&
          decodeData.administrativeArea == finalAddress) {
        localitys = decodeData.administrativeArea.toString();
      } else {
        localitys = decodeData.country.toString();
      }
    }).then((value) => searchHistory.addToSearchHistory(localitys, time, date));
  }
}

showNotification(context) {
  return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text("Notification"),
            content: const Text(
                "Can't find the place you tried to search \nRetry to find another place"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("retry"))
            ],
          ));
}
