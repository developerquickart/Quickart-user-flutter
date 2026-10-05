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

bool checkDateOldCurrentDate(String selectedDate) {
  DateTime today = DateTime.now();
  DateTime currentDateWithoutTime =
      DateTime(today.year, today.month, today.day);

  bool isOldDate = false;
  if (selectedDate != "null" && selectedDate != "") {
    // Parse the selected date
    DateTime deliveryDate = DateTime.parse(selectedDate);

    // Remove the time from deliveryDate
    DateTime deliveryDateWithoutTime =
        DateTime(deliveryDate.year, deliveryDate.month, deliveryDate.day);

    /*// Compare delivery date with the current date
    if (deliveryDateWithoutTime.isBefore(currentDateWithoutTime)) {
      print("The selected date $deliveryDateWithoutTime is in the past.");
      isOldDate = true; // Date is in the past
    } else {
      print("The selected date $deliveryDateWithoutTime is not in the past.");
      isOldDate = false; // Date is not in the past
    }
    */
    if (deliveryDateWithoutTime.isBefore(currentDateWithoutTime)) {
      // print("The selected date $deliveryDateWithoutTime is in the past.");
      isOldDate = true; // Date is in the past
    } else if (deliveryDateWithoutTime
        .isAtSameMomentAs(currentDateWithoutTime)) {
      // print("The selected date $deliveryDateWithoutTime is today.");
      isOldDate = true; // Date is today
    } else {
      // print("The selected date $deliveryDateWithoutTime is in the future.");
      isOldDate = false; // Date is in the future
    }
  } else {
    isOldDate = true;
  }
  return isOldDate;
}
