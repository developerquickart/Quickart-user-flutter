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

import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';
import 'dart:async';

Future<bool> checkInternetConnection() async {
  // Add your function code here!
  // var isResult = false;
  // final connectivityResult = await (Connectivity().checkConnectivity());
  // if (connectivityResult == ConnectivityResult.wifi) {
  //   isResult = true;
  // } else if (connectivityResult == ConnectivityResult.mobile) {
  //   isResult = true;
  // } else if (connectivityResult == ConnectivityResult.none) {
  //   isResult = false;
  // }
  // return isResult;
  bool isConnected = false;

  try {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      // ❌ No WiFi or mobile data
      // print("G1----->false");
      return false;
    }

    // 🕒 Try DNS lookup with timeout (3 seconds)
    final result = await InternetAddress.lookup('google.com')
        .timeout(const Duration(seconds: 3));
    // print("G1-----1>true");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      // print("G1-----2>true");
      isConnected = true; // ✅ Internet is working
    }
  } on SocketException catch (_) {
    isConnected = false; // ❌ No actual internet
  } on TimeoutException catch (_) {
    isConnected = false; // ❌ Timed out — treat as no internet
  }

  return isConnected;
}
