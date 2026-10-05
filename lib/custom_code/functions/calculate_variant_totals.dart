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

String calculateVariantTotals(
  dynamic dataJson,
  String cartType,
) {
  if (dataJson == null || dataJson == null || dataJson['varients'] == null) {
    return "0";
  }

  final variants = dataJson['varients'] as List;

  double total = 0.0;
  int cartQty = 0;
  int subcartQty = 0;
  for (var variant in variants) {
    if (cartType == "daily") {
      cartQty = (variant['cart_qty'] ?? 0).toInt();
    } else {
      subcartQty = (variant['subcartQty'] ?? 0).toInt();
    }
    final double price = (variant['price'] ?? 0).toDouble();

    total += (cartQty + subcartQty) * price;
  }
  // print("G1----->$total");
  return total.toString();
}
