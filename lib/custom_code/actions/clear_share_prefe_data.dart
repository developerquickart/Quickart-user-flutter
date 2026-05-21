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

import 'package:shared_preferences/shared_preferences.dart';

Future clearSharePrefeData() async {
  // Add your function code here!
  final prefs = await SharedPreferences.getInstance();

// Clear all local storage
  await prefs.clear();

// Reset App State
  FFAppState().isUserLogin = false;
  FFAppState().userID = '0';
  FFAppState().storeID = '';
  FFAppState().appInfo = null;
  FFAppState().userWalletstr = "";
  FFAppState().dashboardBanner = "";
  FFAppState().trialPackBannerImage = "";
  FFAppState().usserType = "";
}
