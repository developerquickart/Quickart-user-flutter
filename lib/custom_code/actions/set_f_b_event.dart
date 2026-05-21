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

import 'package:facebook_app_events/facebook_app_events.dart';

Future setFBEvent() async {
  // Add your function code here!
  final facebookAppEvents = FacebookAppEvents();

  if (Platform.isIOS) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    String sysVersion = iosInfo.systemVersion.replaceAll('.', '');
    if (1400 <= int.parse(sysVersion)) {
      facebookAppEvents.setAdvertiserTracking(enabled: true);
    } else {
      facebookAppEvents.setAdvertiserTracking(enabled: true);
    }
  } else {
    facebookAppEvents.setAdvertiserTracking(enabled: true);
  }
}
