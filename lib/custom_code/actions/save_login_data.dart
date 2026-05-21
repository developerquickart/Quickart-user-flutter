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


Future saveLoginData(
  String userid,
  bool isuserLogin,
  String saveData,
  String storeid,
  dynamic jsonData,
  String userWalletstr,
  String dashboardBanner,
  String trialPackBannerImage,
  String usserType,
) async {
  // Add your function code here!
  final prefs = await SharedPreferences.getInstance();
  if (saveData == 'yes') {
    // prefs.setBool('isUserLogin', isuserLogin);
    // prefs.setString('userID', userid);
    // prefs.setString('storeID', storeid);
    // String jsonString = jsonEncode(jsonData);
    // await prefs.setString('appInfo', jsonString);
    // prefs.setString('userWalletstr', userWalletstr);
    // prefs.setString('dashboardBanner', dashboardBanner);
    // prefs.setString('trialPackBannerImage', trialPackBannerImage);
    // prefs.setString('usserType', usserType);
    prefs.setBool('isUserLogin', isuserLogin);

    if (userid != "0") {
      await prefs.setString('userID', userid);
    }

    // if (storeid != "0") {
    //   await prefs.setString('storeID', storeid);
    // }
     await prefs.setString('storeID', "7");

    if (jsonData != null) {
      String jsonString = jsonEncode(jsonData);
      await prefs.setString('appInfo', jsonString);
    }

    if (userWalletstr != "0") {
      await prefs.setString('userWalletstr', userWalletstr);
    }

    if (dashboardBanner != "0") {
      await prefs.setString('dashboardBanner', dashboardBanner);
    }

    if (trialPackBannerImage != "0") {
      await prefs.setString('trialPackBannerImage', trialPackBannerImage);
    }

    // ✅ YOUR MAIN CONDITION
    if (usserType != "0") {
      await prefs.setString('usserType', usserType.toLowerCase());
    }
  } else {
    FFAppState().isUserLogin = prefs.getBool('isUserLogin') ?? false;
    FFAppState().userID = prefs.getString('userID') ?? '0';
    FFAppState().storeID = "7"; //prefs.getString('storeID') ?? '';
    String? jsonString = prefs.getString('appInfo');
    if (jsonString != null) {
      FFAppState().appInfo = jsonDecode(jsonString);
    }
    FFAppState().userWalletstr = prefs.getString('userWalletstr') ?? "";
    FFAppState().dashboardBanner = prefs.getString('dashboardBanner') ?? "";
    FFAppState().trialPackBannerImage =
        prefs.getString('trialPackBannerImage') ?? "";
    FFAppState().usserType =
    (prefs.getString('usserType') ?? "").toLowerCase();

    print(
        "Store id ----->${FFAppState().storeID} && Login---->${FFAppState().isUserLogin} && userID---->${FFAppState().userID}");
  }
}