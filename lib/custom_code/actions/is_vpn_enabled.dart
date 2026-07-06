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

import 'package:vpn_detector/vpn_detector.dart';

Future<bool> isVpnEnabled() async {
  // Add your function code here!
  try {
    final vpnDetector = VpnDetector();
    return await vpnDetector.isVpnActive();
  } catch (e) {
    print("VPN detection error: $e");
    return false;
  }
}
