// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

Future<String?> getFcmToken() async {
  try {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;

    // iOS requires permission
    if (Platform.isIOS) {
      NotificationSettings settings = await fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus != AuthorizationStatus.authorized) {
        print("iOS: Notification permissions not granted");
        return null;
      }
    }

    // Get token
    String? token = await fcm.getToken();
    print("FCM Token: $token");
    return token;
  } catch (e) {
    print("Error retrieving FCM token: $e");
    return null;
  }
}
