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

bool? checkVariantsWithStock(dynamic variants) {
  try {
    if (variants == null || variants is! List) return false;

    // True if at least one variant has stock > 0
    final bool hasStock = variants.any((v) {
      final stock = (v is Map && v['stock'] != null)
          ? int.tryParse(v['stock'].toString()) ?? 0
          : 0;
      if (stock > 0) {
        // print("G1---3---> true");
        return true;
      } else {
        // print("G1---2--->false");
        return false;
      }
      // return stock > 0;
    });
    // print("G1---1--->$hasStock");

    return hasStock;
  } catch (e) {
    print("Error in checkVariantsWithStock: $e");
    return false;
  }
}
