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

bool checkDateforOldOrCurrentDate(dynamic orderDate) {
  DateTime today = DateTime.now();
  DateTime currentDateWithoutTime =
      DateTime(today.year, today.month, today.day);
  bool checkDate = false;
  // print("G1---orderDate---->$orderDate");

  for (var item in orderDate) {
    if (item["sub_delivery_date"] != "null" &&
        item["sub_delivery_date"] != "") {
      DateTime deliveryDate = DateTime.parse(item["sub_delivery_date"]);

      DateTime deliveryDateWithoutTime =
          DateTime(deliveryDate.year, deliveryDate.month, deliveryDate.day);

      // Compare delivery date with current date
      if (deliveryDateWithoutTime.isBefore(currentDateWithoutTime)) {
        // print(
        //     "g1--${item["product_name"]} - Delivery Date: $deliveryDateWithoutTime is in the past.");

        checkDate = true;
        break;

        // } else if (deliveryDateWithoutTime.isAtSameMomentAs(currentDateWithoutTime)) {
        //   print("${item["product_name"]} - Delivery Date: $deliveryDateWithoutTime is today.");
      } else if (deliveryDateWithoutTime
          .isAtSameMomentAs(currentDateWithoutTime)) {
        // print("The selected date $deliveryDateWithoutTime is today.");
        checkDate = true; // Date is today
      } else {
        checkDate = false;
        // print(
        //     "g11---${item["product_name"]} - Delivery Date: $deliveryDateWithoutTime is in the future.");
      }
    } else {
      // print("g111---is in the future.");
      checkDate = true;
    }
  }
  // print("G1---checkDate---->$checkDate");
  return checkDate;
}
