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
import 'package:play_install_referrer/play_install_referrer.dart';

Future initReferrerDetails() async {
  // Add your function code here!
  try {
    print("G1----installReferrer-->----------------------");
    if (Platform.isAndroid) {
      print("G1----installReferrer-->----------------------1");
      ReferrerDetails referrerDetails =
          await PlayInstallReferrer.installReferrer;
      print("G1------------------>$referrerDetails");
      // return referrerDetails.toString();
    }
  } catch (e) {
    print("G1----installReferrer-->$e");
    // return 'Failed to get referrer details: $e';
  }
}
