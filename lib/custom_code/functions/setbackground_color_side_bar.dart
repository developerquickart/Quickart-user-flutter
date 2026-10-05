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

Color? setbackgroundColorSideBar(
  String? catid,
  String? selectedCatID,
  int? varientID,
  int? selectedVarientID,
) {
  var color;
  // print("G1----->$catid &&.   $selectedCatID");
  if (catid == selectedCatID && varientID == selectedVarientID) {
    color = Color(0xff248c44);
  } else {
    color = Color(0xFFFFFFFF);
  }
  // print("G1----->$color");
  return color;
}
