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

String? addRemoveQTY(
  int qty,
  String type,
) {
  int sQTY = 0;
  if (type == "add") {
    sQTY = qty + 1;
  } else {
    if (qty > 0) {
      sQTY = qty - 1;
    } else {
      sQTY = 0;
    }
  }

  return sQTY.toString();
}
