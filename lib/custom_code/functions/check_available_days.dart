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

bool? checkAvailableDays(
  String day,
  String? dayList,
) {
  if (dayList == null) {
    return null;
  }

  // Split the dayList into a list of days, all converted to lowercase
  List<String> dList = dayList.toLowerCase().split(",");

  // Convert the input day to lowercase for case-insensitive comparison
  String lowerCaseDay = day.toLowerCase();

  // print("G1-------> $lowerCaseDay");
  // print("G1-----dList--> $dList");

  bool check = false;

  // Iterate through the list of days and check for a match
  for (String nday in dList) {
    if (nday.toLowerCase() == lowerCaseDay || nday.toLowerCase() == "all") {
      //  print('$nday is available.');
      check = true;
      break; // Exit the loop if the day is found
    } else {
      //   print('$nday is not available.');
    }
  }

  // Return whether the day was found or not
  return check;
}
