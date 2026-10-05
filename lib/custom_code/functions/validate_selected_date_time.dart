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

String? validateSelectedDateTime(dynamic data) {
  if (data == null || data.isEmpty) {
    return 'No category data available';
  }

  for (final item in data) {
    final selectedDate = item['selectedDate'];
    final selectedTime = item['selectedTime'];

    if (selectedDate == null || selectedTime == null) {
      return 'Please select delivery date and time for all categories';
    }
  }

  return ""; // validation passed
}
