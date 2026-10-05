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

String? extractFirstName(String? fullName) {
  // Check if fullName is null or empty
  if (fullName == null || fullName.isEmpty) {
    return null; // Return null if input is null or empty
  }

  // Trim leading and trailing spaces from the full name
  fullName = fullName.trim();

  // Find the first space in the trimmed full name
  int spaceIndex = fullName.indexOf(' ');

  // If no space is found, return the full name (this means there's only one word)
  if (spaceIndex == -1) {
    return fullName;
  }

  var name = fullName.substring(0, spaceIndex)[0].toUpperCase() +
      fullName.substring(0, spaceIndex).substring(1);
  // Extract and return the first name
  return name;
}
