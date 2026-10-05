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

double getCurrentLatitudeLogitude(
  LatLng latLng,
  String type,
) {
  print("G1------->$latLng");
  if (type == 'lat') {
    return latLng.latitude;
    // return 25.2048;
    // return 18.61317983019201;
  } else {
    return latLng.longitude;
    // return 55.2708;
    // return 73.76635832231217;
  }
}
