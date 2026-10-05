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

Color setDaysbgColor(
  bool isDayAvailable,
  bool isDaySelected,
) {
  var color;
  if (isDayAvailable == true) {
    if (isDaySelected == true) {
      color = Color(0xFF2e317e);
      //  print("G1---> indego");
    } else {
      color = Color(0xFFdadbf0);
      // print("G1---> purple");
    }
  } else {
    color = Color(0xFFf5f5f5);
    //   print("G1---> lightgrey");
  }
  return color;
}
