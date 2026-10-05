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

Color setOrderInfoBgColorCopy(String orderStatus) {
  var color;
  if (orderStatus == "Completed") {
    color = Color(0xFFFFFFFF);
  } else if (orderStatus == "Cancelled" ||
      orderStatus == "Payment_failed" ||
      orderStatus == "Payment Failed") {
    color = Color(0xFFFFFFFF);
  } else {
    color = Color(0xFF0A0A0A);
  }
  // print("G1---->$color");
  return color;
}
