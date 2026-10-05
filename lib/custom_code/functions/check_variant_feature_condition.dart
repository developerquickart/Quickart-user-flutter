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

bool checkVariantFeatureCondition(dynamic productList) {
  try {
    if (productList == null) return false;

    final variants = productList['varients'] ?? [];
    final features = productList['features'] ?? [];

    final int variantCount = (variants is List) ? variants.length : 0;
    final int featureCount = (features is List) ? features.length : 0;

    if (variantCount >= 2) {
      return true;
    }

    if (variantCount == 1 && featureCount >= 1) {
      return true;
    }

    return false;
  } catch (e) {
    print("Error in checkVariantFeatureCondition: $e");
    return false;
  }

  return false;
}
