import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic getSelectedSubscriptionData(
  String selectedCartId,
  dynamic arrayListMain,
) {
  // print("Selected Cart ID: $selectedCartId");
  // print("Selected Cart ID: ${arrayListMain[0]['user_name']}");

  // Ensure arrayListMain is a list and check its count safely
  if (arrayListMain is List && arrayListMain.isNotEmpty) {
    // print("Total Orders: ${arrayListMain.length}");
    // print("First Order User: ${arrayListMain[0]['user_name']}");

    // Loop through orders to find matching cart_id
    for (var item in arrayListMain) {
      if (item["cart_id"] == selectedCartId) {
        // print("Matching Data Found: ${item}");

        return item ?? []; // Return data or empty list if null
      }
    }
  } else {
    print("Error: arrayListMain is not a valid list.");
  }

  return null;
}
