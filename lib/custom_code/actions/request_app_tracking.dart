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

import 'package:app_tracking_transparency/app_tracking_transparency.dart';

Future requestAppTracking() async {
  // Add your function code here!
  try {
    // Required: wait for system to finish loading
    await Future.delayed(const Duration(milliseconds: 1000));

    // Check current status
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    print("Current ATT Status: $status");

    // If not determined → request popup
    if (status == TrackingStatus.notDetermined) {
      final reqStatus =
          await AppTrackingTransparency.requestTrackingAuthorization();
      print("ATT Request Result: $reqStatus");
    } else {
      print("ATT Already handled.");
    }

    try {
      final idfa = await AppTrackingTransparency.getAdvertisingIdentifier();
      print("📌 IDFA: $idfa");
      return idfa;
    } catch (e) {
      print("❌ IDFA Error: $e");
      return null;
    }
  } catch (e) {
    print("ATT Error: $e");
  }
}
