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

Future<String> getAddressformMap(
  LatLng latlang,
  bool isCountryCheck,
  String? countryList,
) async {
  // Add your function code here!
  try {
    // Fetch the placemarks from the coordinates
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latlang.latitude, latlang.longitude);

    // Construct the address string from the placemark information
    String address = (placemarks[0].street ?? '') +
        ", " +
        (placemarks[0].subLocality ?? '') +
        ", " +
        (placemarks[0].locality ?? '') +
        ", " +
        (placemarks[0].administrativeArea ?? '') +
        ", " +
        (placemarks[0].country ?? '');

    // Debugging prints
    print("G1----->${placemarks[0]}");
    print("G1----last--->${address}.contains(${countryList!})");
    print("G1----->${placemarks[0].administrativeArea ?? ''}");
    //  print("G1----->${placemarks[0].name ?? ''}");

    // Initialize isEmiratesSelected as false
    FFAppState().isEmiratesSelected = false;

    // Check if the address contains the specified country and if isCountryCheck is true
    if (isCountryCheck && countryList != null && countryList.isNotEmpty) {
      List<String> countries = countryList.split(",");
      for (String country in countries) {
        if (address.toLowerCase().contains(country.trim().toLowerCase())) {
          FFAppState().isEmiratesSelected = true;
          break;
        }
      }
    }

    // Update FFAppState with address details
    // FFAppState().selectedMapName = address;
    FFAppState().selectedMapAddress = address;

    FFAppState().adminArea = placemarks[0].administrativeArea ?? '';
    FFAppState().selectedMapCountry = placemarks[0].country ?? '';
    FFAppState().gLatitude = latlang.latitude;
    FFAppState().gLongitude = latlang.longitude;
    FFAppState().addressLatitude = latlang.latitude;
    FFAppState().addressLongitude = latlang.longitude;
    // Debugging print for the result
    print("G1----isEmiratesSelected->${FFAppState().isEmiratesSelected}");
    //  print("G1----isEmiratesSelected->${FFAppState().selectedMapAddress}");
    // Return the constructed address
    return address;
  } catch (e) {
    return 'Error: $e';
  }
}
