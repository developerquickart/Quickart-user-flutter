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

String? setDateFormatterbyISO(
  String date,
  String type,
  String dateFormate,
) {
  if (date.isEmpty) return null;

  try {
    // Parse ISO date safely (2026-01-15T07:21:06.000Z)
    final inputDate = DateTime.parse(date).toLocal();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final aDate = DateTime(inputDate.year, inputDate.month, inputDate.day);

    if (aDate == today && type == "EEE") {
      return "Today";
    } else if (aDate == tomorrow && type == "EEE") {
      return "Tomorrow";
    } else {
      return DateFormat(type).format(inputDate);
    }
  } catch (e) {
    return null;
  }
}
