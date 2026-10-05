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

String getWalletMessage(String? resource) {
  final r = (resource ?? '').toLowerCase().trim();

  // ================= ADMIN =================
  if (r.contains('admin_added')) {
    return 'Amount added by admin';
  }

  if (r.contains('admin_removed')) {
    return 'Amount deducted by admin';
  }

  // ================= ORDER =================
  if (r.contains('order_placed_wallet')) {
    return 'Wallet amount used for order';
  }

  if (r.contains('order_wallet_deduction')) {
    return 'Wallet amount deducted for order';
  }

  if (r.contains('order_refund_cancelled')) {
    return 'Order cancelled, refund added to wallet';
  }

  // ================= CASHBACK =================
  if (r.contains('cash_back')) {
    return 'Cashback credited to wallet';
  }

  // ================= REFERRAL =================
  if (r.contains('referral')) {
    if (r.contains('registration')) {
      return 'Referral bonus after registration';
    }

    if (r.contains('first_order')) {
      return 'Referral bonus after first order completion';
    }

    if (r.contains('return')) {
      return 'Referral bonus returned to wallet';
    }

    return 'Referral bonus credited';
  }

  // ================= GENERIC =================
  if (r.contains('add')) {
    return 'Wallet amount added';
  }

  if (r.contains('deduct') || r.contains('remove')) {
    return 'Wallet amount deducted';
  }

  if (r.contains('expire')) {
    return 'Wallet balance expired';
  }

  // ================= DEFAULT =================
  return 'Wallet transaction';
}
