// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<String> getAddressFormLatLng() async {
  // Add your function code here!

  try {
    String address = "";
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    address = (placemarks[0].street ?? '') +
        ", " +
        (placemarks[0].subLocality ?? '') +
        ", " +
        (placemarks[0].locality ?? '') +
        ", " +
        (placemarks[0].administrativeArea ?? '') +
        ", " +
        (placemarks[0].country ?? '');
    //  print("G1----->${address}");
    FFAppState().selectedAddress = address;
    FFAppState().gLatitude = position.latitude;
    FFAppState().gLongitude = position.longitude;
    //   print("G1---ss-->${FFAppState().selectedAddress}");
    return address;
  } catch (e) {
    return 'Error: $e';
  }
}
