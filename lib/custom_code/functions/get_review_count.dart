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

String getReviewCount(dynamic arrayList) {
  if (arrayList != null && arrayList.isNotEmpty) {
    int count = 0;
    for (var e in arrayList) {
      if (e['description'] != null && e['description'].isNotEmpty) {
        count += 1;
      }
    }
    return count.toString();
  }
  return "0";
}
