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

String checkTomorrowTimeslotAvailability(dynamic timeslotsData) {
  try {
    if (timeslotsData == null || timeslotsData is! List) {
      return "";
    }

    // Get tomorrow's date (formatted as yyyy-MM-dd)
    final tomorrowDate = DateTime.now().add(Duration(days: 1));
    final formattedDate =
        "${tomorrowDate.year.toString().padLeft(4, '0')}-${tomorrowDate.month.toString().padLeft(2, '0')}-${tomorrowDate.day.toString().padLeft(2, '0')}";

    // Find the timeslot entry for tomorrow
    final tomorrowEntry = timeslotsData.firstWhere(
      (item) => item['date'] == formattedDate,
      orElse: () => null,
    );

    if (tomorrowEntry == null) {
      return "This time slot is unavailable for tomorrow. Please select a different date or remove items from this category.";
    }

    // Extract timeslots for tomorrow
    final times = tomorrowEntry['timeslots'] ?? [];

    // Check if "06:00 am - 10:00 am" exists
    final hasMorningSlot = times.any(
      (slot) => slot['time_slots'] == "06:00 am - 10:00 am",
    );

    if (!hasMorningSlot) {
      return "This time slot is unavailable for tomorrow. Please select a different date or remove items from this category.";
    }

    // Slot available — return empty message
    return "";
  } catch (e) {
    print("Error in checkTomorrowTimeslotAvailability: $e");
    return "";
  }
}
