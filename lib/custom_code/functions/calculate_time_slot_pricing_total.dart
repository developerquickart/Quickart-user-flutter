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

double? calculateTimeSlotPricingTotal(
  List<dynamic> data,
  String type,
) {
  double total = 0.0;

  for (final item in data) {
    if (item is Map) {
      final pricingType = item['pricing_type']?.toString().toLowerCase();

      if (pricingType == type.toLowerCase()) {
        final priceEffect = item['price_effect'];

        if (priceEffect != null) {
          total += double.tryParse(priceEffect.toString()) ?? 0.0;
        }
      }
    }
  }

  return double.parse(total.toStringAsFixed(2));
}
