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

List<dynamic>? removeCashbackFromCharges(List<dynamic>? data) {
  try {
    if (data == null) {
      return [];
    }

    final List<dynamic> charges = data is List ? data : [];

    if (charges.isEmpty) {
      return [];
    }

    final List<dynamic> filteredCharges = charges.where((item) {
      if (item is! Map) {
        return true;
      }

      final String pricingType =
          (item['pricing_type'] ?? '').toString().trim().toLowerCase();

      // Remove cashback
      return pricingType != 'cashback';
    }).toList();

    // If only cashback entries existed, return empty array
    if (filteredCharges.isEmpty) {
      return [];
    }

    return filteredCharges;
  } catch (e) {
    print("Error in removeCashbackFromCharges: $e");
    return [];
  }
}
