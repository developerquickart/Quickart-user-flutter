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

String calculateTotalCashback(dynamic rootJson) {
  try {
    final List categories = rootJson ?? [];
    if (categories.isEmpty) return "";

    double totalCashback = 0.0;

    for (final cat in categories) {
      final List timeslotsData = cat['timeslotsdata'] ?? [];
      final List products = cat['products'] ?? [];

      if (timeslotsData.isEmpty || products.isEmpty) continue;

      String selectedDate = (cat['selectedDate'] ?? "").toString().trim();
      String selectedTime = (cat['selectedTime'] ?? "").toString().trim();

      // If selected date/time is not available,
      // use the first available date/time.
      if (selectedDate.isEmpty || selectedTime.isEmpty) {
        final firstDateEntry = timeslotsData.first;

        selectedDate = (firstDateEntry['date'] ?? "").toString().trim();

        final List firstSlots = (firstDateEntry['timeslots'] as List?) ?? [];

        if (firstSlots.isEmpty) continue;

        selectedTime = (firstSlots.first['time_slots'] ?? "").toString().trim();
      }

      // Find selected DATE
      final dateEntry = timeslotsData.firstWhere(
        (d) => (d['date'] ?? "").toString().trim() == selectedDate,
        orElse: () => null,
      );

      if (dateEntry == null) continue;

      // Find selected TIME
      final List slots = (dateEntry['timeslots'] as List?) ?? [];

      final slot = slots.firstWhere(
        (s) => (s['time_slots'] ?? "").toString().trim() == selectedTime,
        orElse: () => null,
      );

      if (slot == null) continue;

      final String pricingType =
          (slot['pricing_type'] ?? "").toString().toLowerCase().trim();

      // Only cashback
      if (pricingType != "cashback") continue;

      final int valueType =
          int.tryParse((slot['value_type'] ?? "1").toString()) ?? 1;

      final double value =
          double.tryParse((slot['value'] ?? "0").toString()) ?? 0.0;

      final double minAmount =
          double.tryParse((slot['min_amount'] ?? "0").toString()) ?? 0.0;

      final double maxCap =
          double.tryParse((slot['max_cap'] ?? "0").toString()) ?? 0.0;

      // Calculate category total
      double categoryTotal = 0.0;

      for (final p in products) {
        final int qty = int.tryParse((p['cart_qty'] ?? "0").toString()) ?? 0;

        final double price =
            double.tryParse((p['price'] ?? "0").toString()) ?? 0.0;

        categoryTotal += qty * price;
      }

      // Minimum order validation
      if (categoryTotal < minAmount || value <= 0) {
        continue;
      }

      double cashback = 0.0;

      // value_type = 0 => Flat Cashback
      if (valueType == 0) {
        cashback = value;
      }
      // value_type = 1 => Percentage Cashback
      else {
        cashback = categoryTotal * value / 100;
      }

      // Apply max cap
      if (maxCap > 0 && cashback > maxCap) {
        cashback = maxCap;
      }

      totalCashback += cashback;
    }

    if (totalCashback <= 0) return "";

    return "AED ${totalCashback.toStringAsFixed(2)} cashback on this order";
  } catch (e) {
    print("Error in calculateTotalCashback: $e");
    return "";
  }
}
