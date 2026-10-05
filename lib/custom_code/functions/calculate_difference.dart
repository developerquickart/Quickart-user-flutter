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

String? calculateDifference(
  String? totalValue,
  String? reachamount,
) {
  if (totalValue == null || reachamount == null) return null;
  if (totalValue.isEmpty || reachamount.isEmpty) return null;

  double amount1 = double.tryParse(totalValue) ?? 0;
  double amount2 = double.tryParse(reachamount) ?? 0;

  double difference = (amount1 - amount2).abs();

  return difference.toStringAsFixed(2);
}
