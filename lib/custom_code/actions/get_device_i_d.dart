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

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceID() async {
  // Add your function code here!
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId;

  // Check for Android or iOS platform
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId =
        androidInfo.id ?? 'Unknown Android Device'; // Fallback in case of null
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceId = iosInfo.identifierForVendor ??
        'Unknown iOS Device'; // Fallback in case of null
  } else {
    deviceId = 'Unknown Device'; // Fallback for other platforms
  }
  FFAppState().deviceID = deviceId;
  print("Device id ---- > $deviceId");
  return deviceId;
}
