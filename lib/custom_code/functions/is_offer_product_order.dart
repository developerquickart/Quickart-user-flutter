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

bool isOfferProductOrder(dynamic productJson) {
  bool hasOffer = false;

  if (productJson is List) {
    // print("Offer Found1: $hasOffer");

    for (var product in productJson) {
      final offerValue = product['is_offer_product'];
      if (offerValue == 1 || offerValue == '1') {
        // print("Offer Found2: $hasOffer");
        hasOffer = true;
        break;
      }
    }
  } else {
    // print("Offer Found3: $hasOffer");

    hasOffer = false;
  }

  // print("Offer Found: $hasOffer");
  return hasOffer;
}
