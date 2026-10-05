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

String? setDateFormatter(
  String? date,
  String? type,
  String? dateFormate,
) {
  if (date == null || date.trim().isEmpty) return null;

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);

  var inputFormat = DateFormat('$dateFormate');
  var inputDate = inputFormat.parse(date);
  final aDate = DateTime(inputDate.year, inputDate.month, inputDate.day);
  // print("G1------>date---->1");
  if (aDate == today && type == "EEE") {
    //   print("G1------>date---->2");
    return "Today";
  } else if (aDate == tomorrow && type == "EEE") {
//    print("G1------>date---->3");
    return "Tomorrow";
  } else {
    //  print("G1------>date---->4");
    // var inputFormat = DateFormat('$dateFormate');
    // var inputDate = inputFormat.parse(date);
    return DateFormat('$type').format(inputDate);
  }
}
