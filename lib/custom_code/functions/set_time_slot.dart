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

String setTimeSlot() {
  DateTime now = DateTime.now();
  int currentHour = now.hour; // Get the current hour in 24-hour format

  if (currentHour >= 0 && currentHour < 11) {
    // print("It's morning!");
    return '4 PM - 7 PM';
  } else if (currentHour >= 11 && currentHour < 17) {
    // print("It's afternoon/evening!");
    return '6 AM - 10 AM';
  } else {
    return '2 PM - 4 PM';
  }
}
