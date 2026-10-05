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

double? totalValueAmountUpdae(
  String? partnerTip,
  String? couponDiscount,
  String? itemTotal,
  String? refWallet,
  String? refWalletAddRemove,
  String? selectedpaymentType,
  String? codeAmount,
  String? cashWallet,
  String? cashWalletAddRemove,
  String? timeslotDiscount,
  String? surgeCharge,
  String? minOrder,
  List<dynamic>? addons,
  bool? isPrint,
) {
  double total = 0.0;

  // Print only when isPrint == true
  void printLog(String message) {
    if (isPrint == true) {
      // print(message);
    }
  }

  // Item total
  if (itemTotal != null && itemTotal.isNotEmpty) {
    total += double.tryParse(itemTotal) ?? 0.0;

    printLog("G1----itemTotal ---->$total");
  }

  // Partner tip
  if (partnerTip != null && partnerTip.isNotEmpty) {
    total += double.tryParse(partnerTip) ?? 0.0;

    printLog(
      "G1----partnerTip ---->$total -------->$partnerTip",
    );
  }

  // Timeslot discount
  if (timeslotDiscount != null && timeslotDiscount.isNotEmpty) {
    total -= double.tryParse(timeslotDiscount) ?? 0.0;

    printLog(
      "G1----timeslotDiscount ---->$total -------->$timeslotDiscount",
    );
  }

  // Surge charge
  if (surgeCharge != null && surgeCharge.isNotEmpty) {
    total += double.tryParse(surgeCharge) ?? 0.0;

    printLog(
      "G1----surgeCharge ---->$total -------->$surgeCharge",
    );
  }

  // Minimum order charge
  if (minOrder != null && minOrder.isNotEmpty) {
    total += double.tryParse(minOrder) ?? 0.0;

    printLog(
      "G1----minOrder ---->$total -------->$minOrder",
    );
  }

  // Coupon discount
  if (couponDiscount != null && couponDiscount.isNotEmpty) {
    total -= double.tryParse(couponDiscount) ?? 0.0;

    printLog(
      "G1----couponDiscount ---->$total -------->$couponDiscount",
    );
  }
  // Zone delivery addons
  if (addons != null && addons.isNotEmpty) {
    int i = 1;

    for (final addon in addons) {
      if (addon is Map<String, dynamic>) {
        final zonePriceEffect = addon['zone_price_effect'];

        printLog(
          "G1----addon $i zone_price_effect ---->$zonePriceEffect",
        );

        if (zonePriceEffect != null) {
          final charge = double.tryParse(zonePriceEffect.toString()) ?? 0.0;

          total += charge;

          printLog(
            "G1----addon $i total ---->$total -------->$zonePriceEffect",
          );
        }
      }

      i++;
    }
  }

  // Referral wallet
  if (refWallet != null &&
      refWallet.isNotEmpty &&
      refWallet != "0" &&
      refWalletAddRemove == "add") {
    total -= double.tryParse(refWallet) ?? 0.0;

    printLog(
      "G1----refWallet ---->$total -------->$refWallet",
    );
  }

  // Cash wallet
  if (cashWallet != null &&
      cashWallet.isNotEmpty &&
      cashWallet != "0" &&
      cashWalletAddRemove == "add") {
    total -= double.tryParse(cashWallet) ?? 0.0;

    printLog(
      "G1----cashWallet ---->$total -------->$cashWallet",
    );
  }

  // Don't allow negative amount
  if (total < 0) {
    total = 0.0;

    printLog("G1----total reset to 0 ---->$total");
  }
  if (total <= 0.005) {
    total = 0.0;

    printLog("G1----total after wallet is 0 ---->$total");
  }

  // COD charge
  if (selectedpaymentType == "COD" &&
      total > 0 &&
      codeAmount != null &&
      codeAmount.isNotEmpty &&
      codeAmount != "0") {
    final codCharge = double.tryParse(codeAmount) ?? 0.0;

    total += codCharge;

    printLog(
      "G1----COD charge ---->$total -------->$codCharge",
    );
  }

  printLog("G1----FINAL TOTAL ---->$total");

  return double.parse(total.toStringAsFixed(2));
}
