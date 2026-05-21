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

import 'package:flutter/foundation.dart';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';

Future onAppResumeAction() async {
  // Add your function code here!
  try {
    // Create AppsFlyer instance
    final AppsFlyerOptions options = AppsFlyerOptions(
      afDevKey: "UcP5dBePhwjBa7aXRTbLD8",
      appId: "1624846848",
      showDebug: false,
    );

    final AppsflyerSdk appsflyerSdk = AppsflyerSdk(options);

    // Start SDK (same as applicationDidBecomeActive)
    appsflyerSdk.startSDK();

    print("📱 App became active → AppsFlyer started again");
  } catch (e) {
    print("AppsFlyer Resume Error: $e");
  }
}
