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

import 'package:quic_kart/custom_code/appsflyer_service.dart';

import 'package:flutter/foundation.dart';

import 'dart:io';

import 'dart:async';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';

Future<String?> generateReferralLink(String referralCode) async {
  final service = AppsflyerService();

  if (service.sdk == null) {
    await service.initialize();
  }

  await Future.delayed(const Duration(milliseconds: 700)); // critical

  final sdk = service.sdk!;
  final completer = Completer<String?>();

  sdk.setAppInviteOneLinkID("7VXk", (res) {
    print("OneLink ID set: $res");
    sdk.startSDK(); // Now start the SDK
  });

  // Function to generate the invite link
  // Define parameters for the invite link
  AppsFlyerInviteLinkParams inviteLinkParams = AppsFlyerInviteLinkParams(
      channel: "referral",
      campaign: "In-App Referral",
      customParams: {
        "deep_link_value": "SignUpScreen",
        "deep_link_sub1": referralCode,
      });

  sdk.generateInviteLink(
    inviteLinkParams,
    (result) async {
      // Success callback: result is a Map
      print('Generated Link Success: $result');
      final link = result['payload']['userInviteURL'];
      if (link != null) {
        print('Generated Link URL: $link');
        // Use the url_launcher or share_plus package to share the link
        // await Share.share(link);
        completer.complete(link);
        print("Invite link URL: $link");
      }
    },
    (error) {
      // Error callback
      print('Generated Link Error: $error');
    },
  );
  return completer.future;
}
// Future<String?> generateReferralLink(String referralCode) async {
//   // Add your function code here!
//   AppsflyerSdk? appsFlyerSdk;
//   if (Platform.isIOS) {
//     final Completer<String?> completer = Completer<String?>();
//     final options = AppsFlyerOptions(
//       afDevKey: "UcP5dBePhwjBa7aXRTbLD8",
//       appId: "1624846848",
//       showDebug: kDebugMode,
//       timeToWaitForATTUserAuthorization: 15,
//     );
//     appsFlyerSdk = AppsflyerSdk(options);

//     String oneLinkId = "bQhe";
//     // Set OneLink Template ID
//     await appsFlyerSdk.setAppInviteOneLinkID(
//       oneLinkId,
//       (res) {
//         print("setAppInviteOneLinkID success: $res");
//       },
//     );
//     final AppsFlyerInviteLinkParams inviteLinkParams =
//         AppsFlyerInviteLinkParams(
//       channel: "referral",
//       campaign: "refer_friend",
//       referrerName: referralCode,
//       customParams: {
//         "deep_link_value": "SignUpScreen",
//         "af_sub1": referralCode,
//       },
//     );
//     appsFlyerSdk.generateInviteLink(
//       inviteLinkParams,
//       (result) {
//         print("Invite link: $result");
//         print("Invite link raw result: $result");

//         final String? inviteUrl = result['payload']?['userInviteURL'];

//         print("Invite link URL: $inviteUrl");

//         if (!completer.isCompleted) {
//           completer.complete(inviteUrl);
//         }
//       },
//       (error) {
//         print("Invite link error: $error");
//         if (!completer.isCompleted) {
//           completer.complete(null);
//         }
//       },
//     );
//     print("G1----->${completer.future}");
//     return completer.future;
//   } else {
//     late AppsflyerSdk _appsflyerSdk;
//     final String _devKey = "UcP5dBePhwjBa7aXRTbLD8";
//     final String _appId = "1624846848"; // Required for iOS
//     final Completer<String?> completer = Completer<String?>();

//     AppsFlyerOptions options = AppsFlyerOptions(
//       afDevKey: _devKey,
//       appId: _appId,
//       showDebug: kDebugMode,
//     );
//     _appsflyerSdk = AppsflyerSdk(options);

//     // Initialize the SDK
//     await _appsflyerSdk.initSdk(
//       registerConversionDataCallback: true,
//       registerOnAppOpenAttributionCallback: true,
//       registerOnDeepLinkingCallback: true,
//     );
//     print("AppsFlyer SDK initialized.");
//     _appsflyerSdk.setAppInviteOneLinkID("bQhe", (res) {
//       print("OneLink ID set: $res");
//       _appsflyerSdk.startSDK(); // Now start the SDK
//     });

//     // Function to generate the invite link
//     // Define parameters for the invite link
//     AppsFlyerInviteLinkParams inviteLinkParams = AppsFlyerInviteLinkParams(
//       channel: "referral",
//       campaign: "In-App Referral",
//       customParams: {
//         "deep_link_value": "SignUpScreen",
//         "af_sub1": referralCode,
//         "referrer_id": referralCode,
//         "af_og_title": "Check out my app!",
//       },
//     );

//     _appsflyerSdk.generateInviteLink(
//       inviteLinkParams,
//       (result) async {
//         // Success callback: result is a Map
//         print('Generated Link Success: $result');
//         final link = result['payload']['userInviteURL'];
//         if (link != null) {
//           print('Generated Link URL: $link');
//           // Use the url_launcher or share_plus package to share the link
//           // await Share.share(link);
//           completer.complete(link);
//           print("Invite link URL: $link");
//         }
//       },
//       (error) {
//         // Error callback
//         print('Generated Link Error: $error');
//       },
//     );
//     return completer.future;
//   }
// }
