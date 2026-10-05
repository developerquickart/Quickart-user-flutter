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

String checkSelectedTimeslotCashbackDiscount(
  List<dynamic> data,
  String? titleAmountType,
  String type,
) {
  try {
    if (data.isEmpty) {
      return "";
    }

    double totalAmount = 0.0;

    for (final category in data) {
      if (category is! Map) {
        continue;
      }

      final String selectedDate =
          (category['selectedDate'] ?? '').toString().trim();

      final String selectedTime =
          (category['selectedTime'] ?? '').toString().trim();

      if (selectedDate.isEmpty || selectedTime.isEmpty) {
        continue;
      }

      final List<dynamic> timeslotsData = category['timeslotsdata'] is List
          ? List<dynamic>.from(category['timeslotsdata'])
          : <dynamic>[];

      // Find selected date
      for (final dateData in timeslotsData) {
        if (dateData is! Map) {
          continue;
        }

        final String date = (dateData['date'] ?? '').toString().trim();

        if (date != selectedDate) {
          continue;
        }

        final List<dynamic> slots = dateData['timeslots'] is List
            ? List<dynamic>.from(dateData['timeslots'])
            : <dynamic>[];

        // Find selected time
        for (final slot in slots) {
          if (slot is! Map) {
            continue;
          }

          final String slotTime = (slot['time_slots'] ?? '').toString().trim();

          if (slotTime != selectedTime) {
            continue;
          }

          final String pricingType =
              (slot['pricing_type'] ?? '').toString().toLowerCase().trim();

          final double priceEffect = double.tryParse(
                (slot['price_effect'] ?? '0').toString(),
              ) ??
              0.0;

          // -----------------------------------------
          // DISCOUNT
          // -----------------------------------------
          if (type.toLowerCase().trim() == 'discount' &&
              pricingType == 'discount') {
            // print("G1---->discount---->$priceEffect");
            totalAmount += priceEffect;
          }

          // -----------------------------------------
          // SURGE CHARGE
          // -----------------------------------------
          if (type.toLowerCase().trim() == 'surge_charge' &&
              pricingType == 'surge_charge') {
            totalAmount += priceEffect;
          }
        }
      }
    }

    // Name only
    if (titleAmountType == 'name') {
      // print("G1---->type time slot---->$type");
      if (type.toLowerCase().trim() == 'discount') {
        return 'Time Slot Discount';
      }

      if (type.toLowerCase().trim() == 'surge_charge') {
        return 'Surge Charge';
      }

      return '';
    }

    return totalAmount.toStringAsFixed(2);
  } catch (e) {
    print('G1---ERROR--> $e');
    return '';
  }
}
