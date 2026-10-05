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

dynamic updateQtyPlusMinus(
  dynamic list,
  int index,
  String addRemove,
  int productFeatureID,
) {
  if (addRemove == "add1" || addRemove == "remove1") {
    if (addRemove == "add1") {
      list['varients'][index]['cart_qty'] += 1;
      list['varients'][index]['product_feature_id'] = productFeatureID;
      return list;
    } else {
      if (list['varients'][index]['cart_qty'] > 0) {
        list['varients'][index]['cart_qty'] -= 1;
        list['varients'][index]['product_feature_id'] = productFeatureID;
      }
      return list;
    }
  } else if (addRemove == "addSub" || addRemove == "removeSub") {
    // print("G1----addSub----->");
    if (addRemove == "addSub") {
      list['varients'][index]['subcartQty'] += 1;
      list['varients'][index]['product_feature_id'] = productFeatureID;
      return list;
    } else {
      if (list['varients'][index]['subcartQty'] > 0) {
        list['varients'][index]['subcartQty'] -= 1;
        list['varients'][index]['product_feature_id'] = productFeatureID;
      }
      return list;
    }
  } else if (addRemove == "add" || addRemove == "remove") {
    if (addRemove == "add") {
      list[index]['cart_qty'] += 1;
      list[index]['total_cart_qty'] += 1;
      return list;
    } else {
      if (list[index]['cart_qty'] > 0) {
        list[index]['cart_qty'] -= 1;
        list[index]['total_cart_qty'] -= 1;
      }
      return list;
    }
  } else if (addRemove == "addWish" || addRemove == "removeWish") {
    // print("G1----->$addRemove");
    if (addRemove == "addWish") {
      print("G1---FALSE-->$addRemove");
      list[index]['isFavourite'] = "true";
      return list;
    } else {
      // print("G1---TRUE-->$addRemove");
      list[index]['isFavourite'] = "false";

      return list;
    }
  }

  return list;
}
