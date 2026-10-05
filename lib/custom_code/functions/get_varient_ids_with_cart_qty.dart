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

List<dynamic> getVarientIdsWithCartQty(
  dynamic variants,
  String isSubCart,
) {
  try {
    // Null check
    if (variants == null) {
      print("G1---variants is null");
      return <int>[];
    }

    // --------------------------------------------------
    // SUB CART
    // --------------------------------------------------
    if (isSubCart == "sub") {
      if (variants is! List) {
        print("G1---sub variants is not a List");
        return <int>[];
      }

      final List<int> variantIds = [];

      for (final v in variants) {
        if (v is! Map) continue;

        final dynamic qtyValue = v["subcartQty"];

        final int qty = int.tryParse((qtyValue ?? "0").toString()) ?? 0;

        final int? variantId = int.tryParse((v["varient_id"] ?? "").toString());

        print(
          "G1---sub variantId=$variantId qty=$qty",
        );

        if (qty > 0 && variantId != null) {
          variantIds.add(variantId);
        }
      }

      print("G1---SUB variantIds--> $variantIds");

      return variantIds;
    }

    // --------------------------------------------------
    // PRODUCT / CATEGORY CART
    // --------------------------------------------------
    else if (isSubCart == "product") {
      if (variants is! List) {
        print("G1---product variants is not a List");
        return <int>[];
      }

      final List<int> variantIds = [];

      for (final category in variants) {
        if (category is! Map) continue;

        final dynamic productsData = category['products'];

        if (productsData is! List) continue;

        for (final product in productsData) {
          if (product is! Map) continue;

          final dynamic variantIdValue = product['varient_id'];

          final int? variantId = int.tryParse(
            (variantIdValue ?? "").toString(),
          );

          if (variantId != null) {
            variantIds.add(variantId);
          }
        }
      }

      print("G1---PRODUCT variantIds--> $variantIds");

      return variantIds;
    }

    // --------------------------------------------------
    // NORMAL CART
    // --------------------------------------------------
    else {
      if (variants is! List) {
        print("G1---normal variants is not a List");
        return <int>[];
      }

      final List<int> variantIds = [];

      for (final v in variants) {
        if (v is! Map) continue;

        final dynamic qtyValue = v["cart_qty"];

        final int qty = int.tryParse((qtyValue ?? "0").toString()) ?? 0;

        final int? variantId = int.tryParse(
          (v["varient_id"] ?? "").toString(),
        );

        print(
          "G1---normal variantId=$variantId qty=$qty",
        );

        if (qty > 0 && variantId != null) {
          variantIds.add(variantId);
        }
      }

      print("G1---NORMAL variantIds--> $variantIds");

      return variantIds;
    }
  } catch (e) {
    print("G1---getVarientIdsWithCartQty ERROR--> $e");
    return <int>[];
  }

  // if (isSubCart == "sub") {
  //   var v1 = variants
  //       .where((v) => v is Map && (v["subcartQty"] ?? 0) > 0)
  //       .map<int>((v) => v["varient_id"] as int)
  //       .toList();

  //   // print("G1-------> $v1");
  //   return v1.isNotEmpty ? v1 : <int>[];
  // } else if (isSubCart == "product") {
  //   final List<dynamic> categories = variants ?? [];
  //   final List<int> varientIds = [];

  //   for (final category in categories) {
  //     final List<dynamic> products = category['products'] ?? [];
  //     for (final product in products) {
  //       final varientId = product['varient_id'];
  //       if (varientId != null) {
  //         varientIds.add(varientId);
  //       }
  //     }
  //   }
  //   print("G1-------> $varientIds");
  //   return varientIds.isNotEmpty ? varientIds : <int>[];
  // } else {
  //   var v1 = variants
  //       .where((v) => v is Map && (v["cart_qty"] ?? 0) > 0)
  //       .map<int>((v) => v["varient_id"] as int)
  //       .toList();

  //   // print("G1-------> $v1");
  //   return v1.isNotEmpty ? v1 : <int>[];
  // }
}
