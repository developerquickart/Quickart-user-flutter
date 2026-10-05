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

bool? isOrderStatusChange(
  String? orderStatus,
  String? cStatus,
) {
  //if (orderStatus == "Pending") {
  // return true;
  //}

  if (orderStatus == "Confirmed" && cStatus == "Procesed" ||
      orderStatus == "Completed" && cStatus == "Procesed" ||
      orderStatus == "Out_For_Delivery" && cStatus == "Procesed" ||
      orderStatus == "Ready For Pick Up" && cStatus == "Procesed") {
    return true;
  }

  if (orderStatus == "Ready For Pick Up" && cStatus == "Ready" ||
      orderStatus == "Completed" && cStatus == "Ready" ||
      orderStatus == "Out_For_Delivery" && cStatus == "Ready") {
    return true;
  }

  if (orderStatus == "Out_For_Delivery" && cStatus == "out" ||
      orderStatus == "Completed" && cStatus == "out") {
    return true;
  }

  if (orderStatus == "Cancelled" && cStatus == "Cancelled") {
    return true;
  }

  if (orderStatus == "Completed" && cStatus == "completed") {
    return true;
  }
}
