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

import '/custom_code/actions/index.dart'; // Import other custom actions
import '/flutter_flow/custom_functions.dart'; // Import custom functions

import '/custom_code/actions/index.dart'; // Other custom actions
import '/flutter_flow/custom_functions.dart'; // Import custom functions

dynamic getSubscriptionDetailsCopy(
    String selectedCartId, List<dynamic> jsonData) {
  // Loop through the JSON data to find the matching cart_id
  for (var item in jsonData) {
    if (item['cart_id'] == selectedCartId) {
      return item; // Return the matching JSON object
    }
  }
  return null; // Return null if no match is found
}
