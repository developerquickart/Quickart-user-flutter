// Automatic FlutterFlow imports
import 'dart:async';

import 'package:quic_kart/custom_code/appsflyer_service.dart';

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
Future _showLocalNotification(
  String title,
  String body,
  Map<String, dynamic> data,
) async {
  // final androidDetails = AndroidNotificationDetails(
  //   _channel.id,
  //   _channel.name,
  //   channelDescription: _channel.description,
  //   importance: Importance.max,
  //   priority: Priority.high,
  //   icon: 'ic_notification',
  // );
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'high_importance_channel',
    'High Importance Notifications',
    channelDescription: 'Used for important notifications.',
    importance: Importance.max,
    priority: Priority.high,
    icon: 'ic_notification',
  );

  // final details = NotificationDetails(android: androidDetails);
  const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  const NotificationDetails details = NotificationDetails(
    android: androidDetails,
    iOS: iosDetails,
  );

  await _localNotifications.show(
    0,
    title,
    body,
    details,
    payload: jsonEncode(data),
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
  // ✅ Required for iOS foreground notifications
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

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
      print("🔔 FCM Foreground message 2: ${response}");

      if (response.payload == null) return;

      final data = jsonDecode(response.payload!);

      AppsflyerService().navigateFromNotification(
        data["deep_link_value"],
        Map<String, dynamic>.from(data),
      );
    },
  );

  // 4️⃣ Foreground notifications listener
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("🔥 FCM Foreground message 1: ${message.notification?.title}");

    final notification = message.notification;
    if (notification != null) {
      if (Platform.isAndroid) {
        _showLocalNotification(
          notification.title ?? "",
          notification.body ?? "",
          message.data,
        );
      }
    }
  });

  // 5️⃣ When opened from background
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("📬 FCM Foreground message 3: ${message.data}");
    print(message.data);

    final deepLink = message.data["deep_link_value"];

    AppsflyerService().navigateFromNotification(
      deepLink,
      Map<String, dynamic>.from(message.data),
    );
  });

  // 6️⃣ When app was terminated
  // FirebaseMessaging.instance.getInitialMessage().then((message) {
  //   print("🚀 getInitialMessage called");
  //   print("🚀 message = $message");
  //   if (message != null) {
  //     print("🚀 FCM Foreground message 4: ${message.data}");
  //     // NotificationManager.pendingNotification =
  //     //     Map<String, dynamic>.from(message.data);
  //     print("message = $message");

  //     NotificationService.instance.setInitialNotification(
  //       message == null ? null : Map<String, dynamic>.from(message.data),
  //     );
  //   }
  // });
  final message = await FirebaseMessaging.instance.getInitialMessage();

  print("🚀 Initial Message = ${message?.data}");

  NotificationService.instance.setInitialNotification(
    message == null ? null : Map<String, dynamic>.from(message.data),
  );

  print("✅ Push notification setup completed.");
}

// class NotificationManager {
//   static Map<String, dynamic>? pendingNotification;
// }

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  Map<String, dynamic>? initialNotification;

  void setInitialNotification(Map<String, dynamic>? data) {
    initialNotification = data;
  }

  void clear() {
    initialNotification = null;
  }
}
