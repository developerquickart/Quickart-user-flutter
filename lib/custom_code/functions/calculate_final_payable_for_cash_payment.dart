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

double calculateFinalPayableForCashPayment(
  String? totalPay,
  String? refWallet,
  String? cashWallet,
  String? isCashWalletApplied,
) {
  // print(
  //     "G1----cw->$totalPay & $refWallet & $cashWallet & $isCashWalletApplied");
  // Convert values safely
  final double total = double.tryParse(totalPay ?? '0') ?? 0.0;

  final double ref = double.tryParse(refWallet ?? '0') ?? 0.0;

  final double cash = double.tryParse(cashWallet ?? '0') ?? 0.0;
  // print("G1----11->$total & $ref & $cash ");

  // Step 1: Remaining after referral wallet
  double remaining = total - ref;
  if (remaining < 0) remaining = 0.0;

  final String action = (isCashWalletApplied ?? '').toLowerCase();

  double appliedCash = 0.0;

  if (action == 'add' || action == 'true' || action == '1') {
    if (cash <= remaining) {
      appliedCash = cash; // apply full cash wallet
    } else {
      appliedCash = remaining; // apply only remaining amount
    }
  }
  // print("G1----12->$appliedCash ");
  return appliedCash;
}
