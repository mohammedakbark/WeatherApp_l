import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/view/pages/page_home.dart';

import '../../utils/constant.dart';

class LocPermissionProvider with ChangeNotifier {
  Position? latLonposition;
  Placemark decodeData = Placemark();
  Location? locationData;
  HomePage? obj;

  Future<void> getCurrentLocation() async {
    latLonposition = await _getCurrentLatLonPosition();
    print(
        "${latLonposition.toString()}successfully get lat and lon////////////////////");
    lat = latLonposition!.latitude;
    lon = latLonposition!.longitude;
    _getAddressFromLatLon(latLonposition!);
  }
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
  // decoding lat and lon  using geodecode package And get full detauls
  Future<void> _getAddressFromLatLon(Position position) async {
    //this future function for getting current location when the app is open 
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((placemarks) {
      decodeData = placemarks[0];
      print("//////////////successfully  DECODEd$decodeData");
      if (decodeData.subLocality!.isNotEmpty) {
        localitys = decodeData.subLocality.toString();
      } else if (decodeData.locality!.isNotEmpty) {
        localitys = decodeData.locality.toString();
      } else {
        localitys = decodeData.country.toString();
      }
     
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getLatAndLonFromAdress(
    //this future function for gettimg location when user search through textfield
      String address, BuildContext context) async {
    try {
      await locationFromAddress(address)
          .then((value) => locationData = value[0]);
    } catch (e) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text("Notification"),
                content: const Text(
                    "Can't find this place you tried to search \nRetry to find another place"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("retry"))
                ],
              ));
    }

    lat = locationData!.latitude;
    lon = locationData!.longitude;
    await placemarkFromCoordinates(lat!.toDouble(), lon!.toDouble())
        .then((placemarks) {
      decodeData = placemarks[0];
      print("//////////////successfully  DECODEd$decodeData");
    
        if (decodeData.subLocality!.isNotEmpty &&
            decodeData.subLocality == finalAddress) {
          localitys = decodeData.subLocality.toString();
        } else if (decodeData.locality!.isNotEmpty &&
            decodeData.locality == finalAddress) {
          localitys = decodeData.locality.toString();
        } else if (decodeData.administrativeArea!.isNotEmpty &&
            decodeData.administrativeArea == finalAddress) {
          localitys = decodeData.administrativeArea.toString();
        }
        else {
        localitys = decodeData.country.toString();
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
