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

dynamic updateSelectedIndexData(
  dynamic list,
  dynamic updatedData,
  int selectedIndex,
) {
  if (list == null) return list;

  try {
    final variants = List<Map<String, dynamic>>.from(updatedData['varients']);
    final totalCartQty = variants.fold<int>(
      0,
      (sum, v) => sum + ((v['cart_qty'] ?? 0) as int),
    );
    list[selectedIndex]['total_cart_qty'] = totalCartQty;
    list[selectedIndex]['notify_me'] = updatedData['notify_me'];
    list[selectedIndex]['varients'] = updatedData['varients'];
    // print("total_cart_qty:------- $totalCartQty");

    return list;
  } catch (e) {
    print("Error updating cart qty: $e");
    return list;
  }
}
