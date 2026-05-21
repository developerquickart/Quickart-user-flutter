// Automatic FlutterFlow imports
import 'package:firebase_analytics/firebase_analytics.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:appsflyer_sdk/appsflyer_sdk.dart';

import 'dart:io';
import 'package:quic_kart/custom_code/appsflyer_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:facebook_app_events/facebook_app_events.dart';

Future facebookEventClass(
  String varientID,
  String itemName,
  String category,
  double price,
  int qty,
  double mrp,
  String eventType,
  dynamic products,
  String? orderType,
  String? utmSource,
  String? utmCampaign,
  String? utmNetwork,
  String? utmMedium,
) async {
  // Add your function code here!
  String currency = 'AED';

  final appsflyer = AppsflyerService();
  print("📊 Tracked eventType:---- $eventType");
  final facebookAppEvents = FacebookAppEvents();

  if (eventType == 'add') {
    // Example event for add-to-cart
    await appsflyer.logEvent("add_to_cart", {
      "af_content_id": varientID,
      "af_content_type": category,
      "af_price": price,
      "af_currency": currency,
      "af_quantity": qty,
      "item_name": itemName,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    });
  } else if (eventType == 'remove') {
    // 🔹 Remove from cart event
    await appsflyer.logEvent("remove_from_cart", {
      "af_content_id": varientID,
      "af_content_type": category,
      "af_price": price,
      "af_currency": currency,
      "af_quantity": qty,
      "item_name": itemName,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    });

    print("📊 Tracked event: remove_from_cart → $itemName");
  } else if (eventType == 'purchase') {
    // Example event for purchase
    // await appsflyer.logEvent("purchase", {
    //   "af_currency": currency,
    //   "af_revenue": mrp,
    //   "item_name": itemName,
    //   "af_content_id": varientID,
    //   "af_content_type": category,
    // });
    await appsflyer.logEvent("purchase", {
      "af_currency": currency,
      "af_revenue": mrp,
      "item_name": itemName,
      "af_quantity": qty,
      "af_price": price,
      "af_content_type": category,
      "order_type": orderType,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    });
    // FirebaseAnalytics.instance.logEvent(name: 'purchase_test');
    print("📊 Tracked event: purchase → $itemName");
  } else if (eventType == 'checkout') {
    final List<Map<String, dynamic>> afItems = [];
    if (products != null && products.isNotEmpty) {
      if (orderType!.toLowerCase().contains("daily")) {
        for (final category in products) {
          final List<dynamic> products1 = category['products'] ?? [];

          for (final product in products1) {
            final double price =
                double.tryParse(product['price'].toString()) ?? 0.0;
            final int qty = int.tryParse(product['cart_qty'].toString()) ?? 1;

            afItems.add({
              "item_name": product['product_name'],
              "af_content_id": product['varient_id'].toString(),
              "af_content_type": product['availability'] ?? "product",
              "af_price": price,
              "af_quantity": qty,
            });
          }
        }
      } else {
        for (final product in products) {
          final double price =
              double.tryParse(product['price'].toString()) ?? 0.0;
          final int qty = int.tryParse(product['cart_qty'].toString()) ?? 1;

          afItems.add({
            "item_name": product['product_name'],
            "af_content_id": product['varient_id'].toString(),
            "af_content_type": product['availability'] ?? "product",
            "af_price": price,
            "af_quantity": qty,
          });
        }
      }
    }

    await appsflyer.logEvent("af_initiated_checkout", {
      "af_currency": currency,
      "af_total": mrp,
      "af_items": afItems,
      "order_type": orderType,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    });
    print("📊 Tracked event: af_initiated_checkout → $itemName");
  } else if (eventType == 'search') {
    final Map<String, dynamic> eventValues = {
      "af_search_string": category,
      if (category != null) "af_content_type": itemName,
      if (qty != null) "af_results_count": qty,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    };

    await appsflyer.logEvent("af_search", eventValues);

    print("🔍 AppsFlyer Event: af_search → $eventValues");
  } else if (eventType == 'productdetail') {
    final eventValues = {
      "af_content_id": varientID,
      "af_content_type": category,
      "af_content": itemName,
      "af_price": price,
      "af_currency": currency,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    };

    await appsflyer.logEvent("af_content_view", eventValues);

    print("👁️ AppsFlyer Event: af_content_view → $eventValues");
  } else if (eventType == 'wishList') {
    final eventValues = {
      "af_content_id": varientID,
      "af_content_type": category,
      "af_content": itemName,
      "af_price": price,
      "af_currency": currency,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    };
    if (category == "add") {
      await appsflyer.logEvent("af_add_to_wishlist", eventValues);
      print("💖 AppsFlyer Event: af_add_to_wishlist → $eventValues");
    } else {
      await appsflyer.logEvent("af_remove_to_wishlist", eventValues);
      print("💖 AppsFlyer Event: af_remove_to_wishlist → $eventValues");
    }
  } else if (eventType == 'category') {
    final eventValues = {
      "category_id": varientID,
      "category_name": itemName,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    };

    await appsflyer.logEvent("af_category_view", eventValues);

    print("📂 Event Sent: af_category_view → $eventValues");
  } else if (eventType == 'subcategory') {
    final eventValues = {
      "category_id": varientID,
      "subcategory_id": category,
      "subcategory_name": itemName,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    };

    await appsflyer.logEvent("af_subcategory_view", eventValues);

    print("🗂️ Event Sent: af_subcategory_view → $eventValues");
  } else if (eventType == 'brand') {
    final eventValues = {
      "brand_id": varientID,
      "brand_name": itemName,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    };

    await appsflyer.logEvent("af_brand_view", eventValues);
    print("🏷️ AppsFlyer Event: af_brand_view → $eventValues");
  } else if (eventType == 'guest') {
    await appsflyer.logEvent("guest_login", {
      "af_login_method": "guest",
      "guest_id": varientID,
      "uuid": category,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    });
    print("📊 Tracked event: guest_login → guest_id: $varientID");
  } else if (eventType == 'register') {
    await appsflyer.logEvent("complete_registration", {
      "af_registration_method": "phone",
      "email": varientID,
      "name": itemName,
      "referal_code": category,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    });
    print("📊 Tracked event: register");
    if (category.isNotEmpty) {
      await appsflyer.logEvent("referral_code", {
        "referral_code": category,
        "name": itemName,
        "af_source": Platform.isIOS ? "iOS" : "Android",
      });

      print("📊 Tracked event: referral_code");
    }
  } else if (eventType == 'login') {
    await appsflyer.logEvent("login", {
      "af_login_method": "phone",
      "name": itemName,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    });
    print("📊 Tracked event: login");
  } else if (eventType == 'home') {
    await appsflyer.logEvent("view_home", {
      "af_source": Platform.isIOS ? "iOS" : "Android",
      "screen": "home",
      "timestamp": DateTime.now().toString(),
      "user_id": varientID
    });

    print("📊 Tracked event: view_home");
  } else if (eventType == 'utmSource') {
    await appsflyer.logEvent("Af_User_Platform", {
      "utm_source": utmSource,
      "utm_campaign": utmCampaign,
      "utm_network": utmNetwork,
      "utm_medium": utmMedium,
      "utm_keyword": varientID,
      "placement": itemName,
      "user_id": category,
      "platform": Platform.isIOS ? "iOS" : "Android",
      "utm_url": orderType
    });

    print("📊 Tracked event: Af_User_Platform");
  } else if (eventType == 'cart') {
    await appsflyer.logEvent("view_cart", {
      "platform": Platform.isIOS ? "iOS" : "Android",
      "screen": "cart",
      "cart_value": price.toString(),
      "total_items": qty.toString(),
      "user_id": varientID,
      "cart_type": orderType
    });
    print("📊 Tracked event: view_cart");
  } else if (eventType == 'coupon') {
    await appsflyer.logEvent("apply_coupon", {
      "af_coupon_method": "manual",
      "coupon_code": itemName,
      "platform": Platform.isIOS ? "iOS" : "Android",
      "user_id": varientID,
      "coupon_type": category
    });
    print("📊 Tracked event: apply_coupon");
  } else if (eventType == 'orderCancel') {
    final Map<String, dynamic> eventValues = {
      "af_order_id": category,
      "af_revenue": mrp,
      "af_currency": currency,
      "cancel_reason": itemName,
      "user_id": varientID,
      "event_time": DateTime.now().toIso8601String(),
    };

    await appsflyer.logEvent("order_cancelled", eventValues);

    print("🛑 AppsFlyer order_cancelled event logged");
  } else if (eventType == 'cancelProduct') {
    final Map<String, dynamic> eventValues = {
      "af_order_id": utmCampaign,
      "af_content_id": utmSource,
      "af_content_type": "product",
      "af_content": category,
      "af_quantity": qty,
      "af_price": price,
      "af_currency": "AED",
      "order_type": orderType,
      "cancel_reason": itemName,
      "user_id": varientID,
      "event_time": DateTime.now().toIso8601String(),
    };

    await appsflyer.logEvent("product_cancelled", eventValues);

    print("🛑 AppsFlyer product_cancelled event sent");
  } else if (eventType == 'location') {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("gps_off");
    }

    // 2. Check permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      await appsflyer.logEvent("location_permission", {
        "status": "denied",
        "platform": Platform.isAndroid ? "android" : "ios",
        "event_time": DateTime.now().toIso8601String(),
        "user_id": varientID,
      });
      print("📍 Location permission permission_denied");
    }

    if (permission == LocationPermission.deniedForever) {
      await appsflyer.logEvent("location_permission", {
        "status": "permission_permanently_denied",
        "platform": Platform.isAndroid ? "android" : "ios",
        "event_time": DateTime.now().toIso8601String(),
        "user_id": varientID,
      });
      print("📍 Location permission permission_permanently_denied");
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      await appsflyer.logEvent("location_permission", {
        "status": "location_enabled",
        "platform": Platform.isAndroid ? "android" : "ios",
        "event_time": DateTime.now().toIso8601String(),
        "user_id": varientID,
      });
      print("📍 Location permission location_enabled");
    }

    NotificationSettings settings =
        await FirebaseMessaging.instance.getNotificationSettings();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await appsflyer.logEvent("notification_status", {
        "status": "enabled",
        "platform": Platform.isAndroid ? "android" : "ios",
        "event_time": DateTime.now().toIso8601String(),
        "user_id": varientID,
      });

      print("📡 AppsFlyer event sent → notification_status: enabled");
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      await appsflyer.logEvent("notification_status", {
        "status": "disabled",
        "platform": Platform.isAndroid ? "android" : "ios",
        "event_time": DateTime.now().toIso8601String(),
        "user_id": varientID,
      });

      print("📡 AppsFlyer event sent → notification_status: disabled");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.notDetermined) {
      await appsflyer.logEvent("notification_status", {
        "status": "not_requested",
        "platform": Platform.isAndroid ? "android" : "ios",
        "event_time": DateTime.now().toIso8601String(),
        "user_id": varientID,
      });

      print("📡 AppsFlyer event sent → notification_status: not_requested");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      await appsflyer.logEvent("notification_status", {
        "status": "provisional",
        "platform": Platform.isAndroid ? "android" : "ios",
        "event_time": DateTime.now().toIso8601String(),
        "user_id": varientID,
      });

      print("📡 AppsFlyer event sent → notification_status: provisional");
    }
  } else if (eventType == 'buyNow') {
    final List<Map<String, dynamic>> afItems = [];
    if (products != null && products.isNotEmpty) {
      for (var product in products) {
        afItems.add({
          "item_name": product["product_name"],
          "af_content_id": product["varient_id"].toString(),
          "af_price": product["price"].toString(),
          "af_quantity": product["qty"].toString(),
        });
      }
    }

    final eventValues = {
      "af_revenue": mrp.toString(),
      "af_currency": "AED",
      "user_id": varientID,
      "order_type": orderType,
      "order_id": category,
      "af_items": afItems,
    };

    await appsflyer.logEvent("af_buy_now", eventValues);
    print("📦 Buy Now Event Sent");
  }

  print("G1----> favecebook event");

  /*
    if (eventType == 'add') {
    FacebookAppEventsClass().callFacebookEventsAddToCart(
        varientID, itemName, 'product', price, qty, mrp);
          } else if (eventType == 'user') {
    FacebookAppEventsClass()
        .callFacebookEventsUser(itemName, varientID, category);
  } else if (eventType == 'purchase') {
      FacebookAppEventsClass().callFacebookEventsCheckOut(mrp);
  }
  */

  if (eventType == 'add') {
    facebookAppEvents.logAddToCart(
      id: varientID,
      type: 'product',
      price: price,
      currency: currency,
      content: {"product_name": itemName},
    );
    print("G1----> favecebook add to cart");
  } else if (eventType == 'purchase') {
    facebookAppEvents.logPurchase(amount: mrp, currency: currency);
    print("G1----> favecebook purchase");
  } else if (eventType == 'register') {
    facebookAppEvents.setUserData(
      email: varientID,
      firstName: itemName,
      dateOfBirth: '',
      city: "referalCode :-- $category",
      country: '',
    );
    print("G1----> favecebook register");
  }
}
