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

String? getRepeatdays(
  bool? isSun,
  bool? isMon,
  bool? isTue,
  bool? isWed,
  bool? isThu,
  bool? isFri,
  bool? isSat,
) {
  List<String> dList = [];
  String? rDays = "";

  if (isSun == true) {
    dList.add("Sun");
  }
  if (isMon == true) {
    dList.add("Mon");
  }
  if (isTue == true) {
    dList.add("Tue");
  }
  if (isWed == true) {
    dList.add("Wed");
  }
  if (isThu == true) {
    dList.add("Thu");
  }
  if (isFri == true) {
    dList.add("Fri");
  }
  if (isSat == true) {
    dList.add("Sat");
  }
  //print("G1---days--->${dList.join(", ")}");
  String nDays = dList.join(", ");
  //print("G1---ndays--->${nDays}");

  return nDays;
}
