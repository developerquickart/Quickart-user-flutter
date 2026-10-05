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

bool checkRestrictions(
  String? restrictedCities,
  String? selectedCity,
  String? itemTotal,
  String? aboveAmount,
) {
  double itemTotalValue = double.tryParse(itemTotal?.trim() ?? '') ?? 0;
  double aboveAmountValue =
      double.tryParse(aboveAmount?.trim() ?? '') ?? 30; // Default 30

  bool isRestrict = false;
  // print("✅  restriction for this city.------------->$restrictedCities");
  // print("✅ selectedCity  for this city.------------->$selectedCity");

  if (restrictedCities != null &&
      restrictedCities.isNotEmpty &&
      selectedCity != null) {
    List<String> cities = restrictedCities.split(",");

    for (String city in cities) {
      if (selectedCity.toLowerCase().contains(city.trim().toLowerCase())) {
        isRestrict = true;
        // print("Restricted -----: $isRestrict");
        break; // Exit loop early if a match is found
      }
    }
  }
  bool isPass = false;
  // Check if itemTotalValue is greater than aboveAmountValue
  if (isRestrict) {
    if (itemTotalValue > aboveAmountValue) {
      // print(
      //     "✅ Allowed: Item Total ($itemTotalValue) is greater than Limit ($aboveAmountValue)");
      isPass = false; // Not restricted if item total is greater
    } else {
      // print(
      //     "❌ Restricted: Item Total ($itemTotalValue) is less than or equal to Limit ($aboveAmountValue)");
      isPass = true; // Restricted if item total is less or equal
    }
  }

  // print("✅ No restriction for this city------------------------->$isPass.");
  return isPass;
}
