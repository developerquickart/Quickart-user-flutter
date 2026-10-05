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

bool checkVarientStockAvailable(
  int selectedIndex,
  dynamic varients,
) {
  try {
    if (varients == null || varients is! List || varients.isEmpty) {
      return false;
    }

    // Case 1: If no variant selected, use first one
    if (selectedIndex == 0) {
      final stock = int.tryParse(varients[0]['stock'].toString()) ?? 0;
      // print("G1------index 0 ---->$stock");
      return stock > 0;
    }

    // Case 2: Find matching variant by ID
    for (final v in varients) {
      final varientId = int.tryParse(v['varient_id'].toString()) ?? 0;
      final stock = int.tryParse(v['stock'].toString()) ?? 0;

      if (varientId == selectedIndex) {
        // print("G1------stock 0 ---->$stock");

        return stock > 0;
      }
    }

    return false;
  } catch (e) {
    print("Error in checkVarientStockAvailable: $e");
    return false;
  }
}
