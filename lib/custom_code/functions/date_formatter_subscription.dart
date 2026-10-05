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

String? dateFormatterSubscription(String date) {
  // i need a function  that formats a time slot string. The input format is 'HH:mm - HH:mm AM/PM', like '06:00 - 10:00 AM', and I want to display it as '06-10 AM'.
  final List<String> parts = date.split(' - ');
  final List<String> startParts = parts[0].split(':');
  final List<String> endParts = parts[1].split(':');
  final String startTime =
      '${startParts[0]}-${endParts[0]} ${parts[1].substring(6)}';
  return startTime;
}
