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

String setDecimalValueWithCount(
  String value,
  int decimalCount,
  bool? isDiscount,
) {
  if (value == null) {
    return "0.00";
  }
  if (value == "NaN") {
    return "0.00";
  }
  if (value == "0") {
    return "0.00";
  }
  int? intValue = int.tryParse(value);
  if (intValue != null) {
    return isDiscount == true ? value : "$value.00";
  }

  double? doubleValue = double.tryParse(value);
  if (doubleValue != null) {
    double truncatedValue = (doubleValue * 100).truncateToDouble() / 100;
    //return truncatedValue.toStringAsFixed(2);
    if (decimalCount == 1) {
      return doubleValue.toStringAsFixed(1);
    } else if (decimalCount == 0) {
      return doubleValue.toInt().toString();
    } else {
      return doubleValue.toStringAsFixed(2);
    }
  }

  return "0.00";
}
