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

bool? getSelectedDay(
  String? dayString,
  String? day,
) {
  // Check if dayString is null
  if (dayString == null) {
    return null;
  }

  // Split the string by ", "
  List<String> dList = dayString.split(", ");

  //print("G1----> ${dList}");

  bool? rDays = false;
  for (String nday in dList) {
    if (nday == "Sun" && day == "Sun" ||
        nday == "Mon" && day == "Mon" ||
        nday == "Tue" && day == "Tue" ||
        nday == "Wed" && day == "Wed" ||
        nday == "Thu" && day == "Thu" ||
        nday == "Fri" && day == "Fri" ||
        nday == "Sat" && day == "Sat") {
      rDays = true;
      break;
    }
  }

  return rDays;
}
