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

String getVariantDescription(
  dynamic variants,
  String selectedVariabtId,
) {
  if (variants == null || selectedVariabtId.isEmpty) return "";

  try {
    final int id = int.tryParse(selectedVariabtId) ?? -1;

    final variant = (variants as List).firstWhere(
      (v) => v['varient_id'] == id,
      orElse: () => null,
    );

    if (variant != null && variant['description'] != null) {
      // print("G1----->${variant['description'].toString()}");
      return variant['description'].toString();
    }
    return "";
  } catch (e) {
    return "";
  }
}
