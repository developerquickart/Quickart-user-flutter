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

double? checkWalletWithAction(
  String? isWalletSelected,
  String? totalPay,
  String? wallet,
  String? walletValue,
) {
  double? isShow = 0.0;

  double tpay = totalPay != null ? double.tryParse(totalPay) ?? 0.0 : 0.0;
  double walletD = wallet != null ? double.tryParse(wallet) ?? 0.0 : 0.0;
  double wWalletV =
      walletValue != null ? double.tryParse(walletValue) ?? 0.0 : 0.0;
  // print(
  //     "Ref wallet --->isWalletSelected--->$isWalletSelected    & totalPay--->$totalPay &  wallet--->$wallet & walletValue--->$walletValue");
  if (isWalletSelected == "add") {
    // If wallet balance is enough → apply percentage rule
    double percentValue = (tpay * wWalletV) / 100;

    if (percentValue <= walletD) {
      isShow = percentValue;
    } else {
      isShow = walletD;
    }
  } else {
    isShow = 0.0;
  }
  // print("Ref wallet selected--->$isShow");
  return isShow;
}
