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

double? totalValueAmountUpdaeCopy(
  String? partnerTip,
  String? couponDiscount,
  String? itemTotal,
  String? refWallet,
  String? refWalletAddRemove,
  String? selectedpaymentType,
  String? codeAmount,
  String? cashWallet,
  String? cashWalletAddRemove,
  String? deliveryFree,
  String? platfromFree,
  String? timeslotDiscount,
  String? surgeCharge,
  String? minOrder,
) {
  double total = 0.0;
  // print("G1-tp--->$deliveryFree ");

  if (itemTotal != null) {
    // print("G1---itemTotal->$itemTotal ");
    total += double.parse(itemTotal);
  }

  if (partnerTip != null) {
    // print("G1---partnerTip->$partnerTip ");
    total += double.parse(partnerTip);
  }
  //Add delivery free
  if (deliveryFree != null) {
    // print("G1---deliveryFree->$deliveryFree ");
    total += double.parse(deliveryFree);
  }
  //Add platfromFree free
  if (platfromFree != null) {
    // print("G1---platfromFree->$platfromFree ");
    total += double.parse(platfromFree);
  }
  //Add timeslotDiscount free
  if (timeslotDiscount != null) {
    // print("G1---timeslotDiscount->$timeslotDiscount ");
    total -= double.parse(timeslotDiscount);
  }
  //Add surgeCharge free
  if (surgeCharge != null) {
    // print("G1---surgeCharge->$surgeCharge ");
    total += double.parse(surgeCharge);
  }
  //Add minOrder free
  if (minOrder != null) {
    // print("G1---minOrder->$minOrder ");
    total += double.parse(minOrder);
  }

  if (couponDiscount != null) {
    // print("G1---couponDiscount->$couponDiscount ");
    total -= double.parse(couponDiscount);
  }
  if (refWallet != null && refWallet != "0" && refWallet != "") {
    if (refWalletAddRemove == "add") {
      // print("G1---refWallet->$refWallet ");
      total -= double.parse(refWallet);
    }
  }
  if (cashWallet != null && cashWallet != "0" && cashWallet != "") {
    if (cashWalletAddRemove == "add") {
      // print("G1---cashWallet->$cashWallet ");
      total -= double.parse(cashWallet);
    }
  }

  // print("G1---->$total");
  if (total < 0) {
    total = 0;
  }
  // Apply COD charge only if there is still an amount to pay
  if (selectedpaymentType == "COD" &&
      total > 0 &&
      codeAmount != null &&
      codeAmount.isNotEmpty &&
      codeAmount != "0") {
    // print("G1----1>$total");
    total += double.tryParse(codeAmount) ?? 0.0;
  }
  String nPrice = total.toStringAsFixed(2);
  // print("G1---nPrice-->${double.parse(nPrice)}");
  return double.parse(nPrice);
}
