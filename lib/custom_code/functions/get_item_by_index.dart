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

dynamic getItemByIndex(
  dynamic listData,
  int? selectedIndex,
) {
  // print("G1----->listData---->${listData.length}.   &.  $selectedIndex  ");
  // print("G1----->listData---->${listData}");
  if (listData == null ||
      selectedIndex == null ||
      selectedIndex >= listData.length) {
    return 0;
  }

  final item = listData[selectedIndex] as Map<String, dynamic>;
  print("G1----->item---->${item}");
  return item;
}
