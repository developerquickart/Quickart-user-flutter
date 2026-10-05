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

String getPaymentMethod(
  String? paymentMethod,
  double? totalAmount,
  String? orderType,
) {
  final String method = paymentMethod?.toLowerCase().trim() ?? '';
  final double rawTotal = totalAmount ?? 0.0;

  // 🔹 Step 1: Round to 2 decimal places
  final double total = double.parse(rawTotal.toStringAsFixed(2));

  // 🔹 Step 2: Prevent negative values
  if (total < 0) {
    return '';
  }

  // 🔹 Step 3: Handle zero values
  if (total == 0.00) {
    return 'Wallet';
  }

  // 🔹 Step 4: Handle all positive values
  if (total > 0.00) {
    if (method == 'cod') {
      return 'COD';
    } else if (method == 'card') {
      return 'Card';
    } else {
      return 'Card'; // safe default
    }
  }

  return 'Card';
}
