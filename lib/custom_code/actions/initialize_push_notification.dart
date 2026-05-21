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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
// DO NOT REMOVE OR MODIFY ABOVE LINE

import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// LOCAL NOTIFICATION PLUGIN (Global)
final FlutterLocalNotificationsPlugin _localNotifications =
    FlutterLocalNotificationsPlugin();

// ANDROID CHANNEL (Global)
const AndroidNotificationChannel _channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'Used for important notifications.',
  importance: Importance.high,
  playSound: true,
);

// ▶ Helper function MUST be BEFORE usage
Future _showLocalNotification(String title, String body) async {
  final androidDetails = AndroidNotificationDetails(
    _channel.id,
    _channel.name,
    channelDescription: _channel.description,
    importance: Importance.max,
    priority: Priority.high,
    icon: 'ic_notification',
  );

  final details = NotificationDetails(android: androidDetails);

  await _localNotifications.show(
    0,
    title,
    body,
    details,
  );
}

/// ▶ MAIN CUSTOM ACTION — FlutterFlow calls this
Future initializePushNotification() async {
  print("🔔 Initializing Push Notifications...");

  // 1️⃣ Request permission
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  print("📌 Permission status: ${settings.authorizationStatus}");

  // 2️⃣ Create Android channel
  if (Platform.isAndroid) {
    final AndroidFlutterLocalNotificationsPlugin? androidPlugin =
        _localNotifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    await androidPlugin?.createNotificationChannel(_channel);
  }

  // 3️⃣ Init local notifications
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('ic_notification');

  final DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  final InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await _localNotifications.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (response) async {
      print("🔔 Notification clicked: ${response.payload}");
    },
  );

  // 4️⃣ Foreground notifications listener
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("🔥 FCM Foreground message: ${message.notification?.title}");

    final notification = message.notification;
    if (notification != null) {
      _showLocalNotification(
        notification.title ?? "",
        notification.body ?? "",
      );
    }
  });

  // 5️⃣ When opened from background
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("📬 Opened app from notification: ${message.data}");
  });

  // 6️⃣ When app was terminated
  FirebaseMessaging.instance.getInitialMessage().then((message) {
    if (message != null) {
      print("🚀 Notification opened from terminated state: ${message.data}");
    }
  });

  print("✅ Push notification setup completed.");
}
