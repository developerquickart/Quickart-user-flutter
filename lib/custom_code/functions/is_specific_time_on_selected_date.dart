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

bool isSpecificTimeOnSelectedDate(
  String selectedDate,
  String selectedTime,
  String dateFormat,
  String specificTimeMorning,
  String specificTimeEvening,
) {
  // if (selectedDate == null || selectedDate.isEmpty || specificTime.isEmpty) {
  //   return false;
  // }

  // try {
  //   // Parse the selected date
  //   DateTime parsedDate = DateFormat(dateFormat).parse(selectedDate);

  //   // Trim and parse the specific time
  //   specificTime = specificTime.trim(); // Remove extra spaces
  //   DateTime parsedTime =
  //       DateFormat.jm().parse(specificTime); // e.g., "11:59 AM"

  //   // Combine the selected date with the specific time
  //   DateTime specificDateTime = DateTime(
  //     parsedDate.year,
  //     parsedDate.month,
  //     parsedDate.day,
  //     parsedTime.hour,
  //     parsedTime.minute,
  //   );

  //   // Get the current time
  //   DateTime now = DateTime.now();
  //   // print("Jivan ----->$now");
  //   // Compare the specific datetime with the current datetime
  //   if (now.isBefore(specificDateTime)) {
  //     // print("The current time is before $specificTime on $selectedDate.");
  //     return false;
  //   } else if (now.isAfter(specificDateTime)) {
  //     // print("The current time is after $specificTime on $selectedDate.");
  //     return true;
  //   } else {
  //     // print("The current time is exactly $specificTime on $selectedDate.");
  //     return true;
  //   }
  // } catch (e) {
  //   // Handle parsing errors
  //   print("Error: $e");
  //   return false;
  // }
  //  String selectedTime = "06:00 am - 10:00 am";
  try {
    final DateTime now = DateTime.now();

    // Today (date-only)
    final DateTime today = DateTime(now.year, now.month, now.day);

    // Parse selected date
    final DateTime parsedDate = DateFormat(dateFormat).parse(selectedDate);

    final DateTime selectedDay =
        DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

    final int dayDiff = selectedDay.difference(today).inDays;

    // ================= TODAY =================
    if (dayDiff == 0) {
      DateTime morningCutoff = DateFormat.jm().parse(specificTimeMorning);

      DateTime morningDateTime = DateTime(
        today.year,
        today.month,
        today.day,
        morningCutoff.hour,
        morningCutoff.minute,
      );

      return now.isAfter(morningDateTime); // true = disable
    }

    // ================= TOMORROW =================
    if (dayDiff == 1 && selectedTime.trim() == "06:00 am - 10:00 am") {
      DateTime eveningCutoff = DateFormat.jm().parse(specificTimeEvening);

      DateTime eveningDateTime = DateTime(
        today.year,
        today.month,
        today.day,
        eveningCutoff.hour,
        eveningCutoff.minute,
      );

      return now.isAfter(eveningDateTime); // true = disable
    }

    return false;
  } catch (e) {
    print("Time validation error: $e");
    return false;
  }
}
