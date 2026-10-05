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

Color setOrderInfoBgColor(String orderStatus) {
  var color;
  if (orderStatus == "Completed") {
    color = Color(0xFF248c44);
  } else if (orderStatus == "Pause") {
    color = Color(0xFFBDA6E1);
  } else if (orderStatus == "Pending" || orderStatus == "pending") {
    color = Color(0xFFc0c0c0);
    // color = Color(0xFFe69138);
  } else if (orderStatus == "Cancelled" ||
      orderStatus == "Payment_failed" ||
      orderStatus == "Payment Failed") {
    color = Color(0xFFDF3F56);
  } else if (orderStatus == "Out_For_Delivery") {
    color = Color(0xFFFF7E38);
  } else if (orderStatus == "Ready For Pick Up") {
    color = Color(0xFFFF7E38);
  } else if (orderStatus == "Confirmed") {
    color = Color(0xFFFF7E38);
  } else if (orderStatus == "Payment_processing") {
    color = Color(0xFFFF7E38);
  } else {
    color = Color(0xFFee8b60);
  }
  // print("G1---->$color");
  return color;
}
