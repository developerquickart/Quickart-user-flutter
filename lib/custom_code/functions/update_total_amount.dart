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

double? updateTotalAmount(
  String? partnerTip,
  String? couponDiscount,
  String? itemTotal,
  String? refWallet,
  String? refWalletAddRemove,
  String? selectedpaymentType,
  String? codeAmount,
  String? cashWallet,
  String? cashWalletAddRemove,
) {
  double total = 0.0;
  // print(
  //     "G1-tp--->$refWallet & $refWalletAddRemove & $cashWallet &$cashWalletAddRemove ");
  if (itemTotal != null) {
    total += double.parse(itemTotal);
  }

  if (partnerTip != null) {
    total += double.parse(partnerTip);
  }

  if (couponDiscount != null) {
    total -= double.parse(couponDiscount);
  }
  if (refWallet != null && refWallet != "0" && refWallet != "") {
    if (refWalletAddRemove == "add") {
      //  total += double.parse(wallet);
      // } else if (walletAddRemove == "remove") {
      total -= double.parse(refWallet);
    }
  }
  if (cashWallet != null && cashWallet != "0" && cashWallet != "") {
    if (cashWalletAddRemove == "add") {
      //  total += double.parse(wallet);
      // } else if (walletAddRemove == "remove") {
      total -= double.parse(cashWallet);
    }
  }
  // print("G1---->$selectedpaymentType -----&&&-----$codeAmount ---&-- $total");
  if (codeAmount != null) {
    // print("G1---->$selectedpaymentType -----&&&-----$codeAmount");
    if (selectedpaymentType == "COD") {
      total += double.tryParse(codeAmount) ?? 0.0;
    }
  }
  // print("G1---->$total");
  if (total < 0) {
    total = 0;
  }
  String nPrice = total.toStringAsFixed(2);
  // print("G1---nPrice-->${double.parse(nPrice)}");
  return double.parse(nPrice);
}
