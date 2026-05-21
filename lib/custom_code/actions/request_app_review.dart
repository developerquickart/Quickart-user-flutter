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

import 'package:in_app_review/in_app_review.dart';

Future requestAppReview() async {
  // Add your function code here!
  final InAppReview inAppReview = InAppReview.instance;
  try {
    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    } else {
      // Optional fallback (open store directly)
      await inAppReview.openStoreListing(
        appStoreId: '1624846848', // <-- replace with your real iOS app id
      );
    }
  } catch (e) {
    print('In-app review failed: $e');
  }
}
