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

String checkSelectedTimeslotCashback(dynamic data) {
  try {
    if (data == null || data is! Map) {
      return "";
    }

    final List timeslotsData = (data['timeslotsdata'] as List?) ?? [];

    if (timeslotsData.isEmpty) {
      return "";
    }

    final String selectedDate = (data['selectedDate'] ?? "").toString().trim();

    final String selectedTime = (data['selectedTime'] ?? "").toString().trim();

    if (selectedDate.isEmpty || selectedTime.isEmpty) {
      return "";
    }

    // Find selected date
    final dateEntry = timeslotsData.firstWhere(
      (d) => (d['date'] ?? "").toString().trim() == selectedDate,
      orElse: () => null,
    );

    if (dateEntry == null) {
      return "";
    }

    // Find selected time slot
    final List slots = (dateEntry['timeslots'] as List?) ?? [];

    final slot = slots.firstWhere(
      (s) => (s['time_slots'] ?? "").toString().trim() == selectedTime,
      orElse: () => null,
    );

    if (slot == null) {
      return "";
    }

    final String pricingType =
        (slot['pricing_type'] ?? "").toString().trim().toLowerCase();

    if (pricingType != "cashback" && pricingType != "discount") {
      return "";
    }

    // Price effect
    double priceEffect = double.tryParse(
          (slot['price_effect'] ?? "0").toString(),
        ) ??
        0.0;

    // Maximum allowed cashback/discount
    double maxCap = double.tryParse(
          (slot['max_cap'] ?? "0").toString(),
        ) ??
        0.0;

    // Apply max cap only when max_cap is available (> 0)
    if (maxCap > 0 && priceEffect > maxCap) {
      priceEffect = maxCap;
    }

    // Nothing to show
    if (priceEffect <= 0) {
      return "";
    }

    if (pricingType == "cashback") {
      return "Awesome! You've earned AED ${priceEffect.toStringAsFixed(2)} cashback.";
    }

    if (pricingType == "discount") {
      return "Awesome! You've unlocked an AED ${priceEffect.toStringAsFixed(2)} discount.";
    }

    return "";
  } catch (e) {
    print("checkSelectedTimeslotCashback error: $e");
    return "";
  }
}
