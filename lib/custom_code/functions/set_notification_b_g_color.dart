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

Color? setNotificationBGColor(
  String title,
  String isTitle,
) {
  // print("G1--->$isTitle");
  var color;
  if (title.contains("Your Order is Placed")) {
    //  print("G1---1-->$isTitle");
    if (isTitle.contains("border")) {
      color = Color(0xFFE4D8F5);
    } else if (isTitle.contains("title")) {
      color = Color(0xFF7E65AC);
    } else {
      color = Color(0xFFF6F2FC);
    }
  } else if (title.contains("Your Order has been Delivered")) {
    if (isTitle.contains("border")) {
      color = Color(0xFFDCE9D8);
    } else if (isTitle.contains("title")) {
      color = Color(0xFF248c44);
    } else {
      color = Color(0xFFF4F6F4);
    }
  } else if (title.contains("Your order has been cancelled")) {
    if (isTitle.contains("border")) {
      color = Color(0xFFE2B6BC);
    } else if (isTitle.contains("title")) {
      color = Color(0xFFDF3F56);
    } else {
      color = Color(0xFFFEEEF0);
    }
  } else {
    if (isTitle.contains("border")) {
      color = Color(0xFFDADBFF);
    } else if (isTitle.contains("title")) {
      color = Color(0xFF2e317e);
    } else {
      color = Color(0xFFEBEBFF);
    }
  }
  return color;
}
