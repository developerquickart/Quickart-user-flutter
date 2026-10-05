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

int getProductFeatureId(dynamic variants) {
  try {
    if (variants == null || variants is! List || variants.isEmpty) {
      return 0;
    }

    // Find the first variant with a valid product_feature_id > 0
    for (final v in variants) {
      final int featureId =
          int.tryParse(v['product_feature_id'].toString()) ?? 0;
      if (featureId > 0) {
        // print("G1-----featureId--->$featureId");
        return featureId;
      }
    }

    // No valid feature_id found
    // print("G1-----index--->${variants[0]['product_feature_id']}");
    return 0;
  } catch (e) {
    print("Error in getProductFeatureId: $e");
    return 0;
  }
}
