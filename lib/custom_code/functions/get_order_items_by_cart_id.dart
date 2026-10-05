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

dynamic getOrderItemsByCartId(
  String selectedCartID,
  dynamic responseJson,
) {
  try {
    final parsed =
        responseJson is String ? jsonDecode(responseJson) : responseJson;

    if (parsed == null) {
      return [];
    }

    for (final order in parsed) {
      if (order['cart_id'] == selectedCartID) {
        // Return the entire "data" for that cart
        return order;
      }
    }

    // If no cart_id matches, return empty object instead of null
    return {};
  } catch (e) {
    print('getOrderItemsByCartId error: $e');
    return {};
  }
}
