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

String? setOrderStatus(String? orderStatus) {
  var status;
  if (orderStatus == "Completed") {
    status = "Completed";
  } else if (orderStatus == "Confirmed") {
    status = "Processed";
  } else if (orderStatus == "pending" ||
      orderStatus == "Pending" ||
      orderStatus == "In Progress") {
    status = "Placed";
  } else if (orderStatus == "Inprogress") {
    status = "In Progress";
  } else if (orderStatus == "Cancelled") {
    status = "Cancelled";
  } else if (orderStatus == "Payment_failed" ||
      orderStatus == "Payment Failed") {
    status = "Payment Failed";
  } else if (orderStatus == "Out_For_Delivery") {
    status = "Out For Delivery";
  } else if (orderStatus == "Ready For Pick Up") {
    status = "Ready For Pick Up";
  } else if (orderStatus == "Payment_processing") {
    status = "Payment Processing";
  } else {
    status = orderStatus;
  }
  // print("G1---->$color");
  return status;
}
