// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
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
// import 'package:amplitude_flutter/amplitude.dart';
// import 'package:amplitude_flutter/configuration.dart';
// import 'package:amplitude_flutter/events/base_event.dart';

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

  // const apiKey = '5bab9ae8180662bd0a11b398f95af646';
  // final amplitude = Amplitude(Configuration(apiKey: apiKey));
  // await amplitude.isBuilt;

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
    // if (qty == 1) {
    //   final event = BaseEvent(
    //     'Product Added to Cart',
    //     eventProperties: {
    //       'platform': Platform.isIOS ? 'iOS' : 'Android',
    //       'product_id': varientID,
    //       'product_name': itemName,
    //       'category': category,
    //       'price': price,
    //       'mrp': mrp,
    //       'quantity': qty,
    //       'currency': currency,
    //     },
    //   );

    //   await amplitude.track(event);
    // } else {
    //   final event = BaseEvent(
    //     'Product Quantity Updated',
    //     eventProperties: {
    //       'platform': Platform.isIOS ? 'iOS' : 'Android',
    //       'product_id': varientID,
    //       'product_name': itemName,
    //       'category': category,
    //       'price': price,
    //       'mrp': mrp,
    //       'quantity': qty,
    //       'currency': currency,
    //     },
    //   );

    //   await amplitude.track(event);
    // }
    print('📊 Amplitude Event: Product Added to Cart');
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
    // if (qty == 0) {
    //   final event = BaseEvent(
    //     'Product Removed to Cart',
    //     eventProperties: {
    //       'platform': Platform.isIOS ? 'iOS' : 'Android',
    //       'product_id': varientID,
    //       'product_name': itemName,
    //       'category': category,
    //       'price': price,
    //       'mrp': mrp,
    //       'quantity': qty,
    //       'currency': currency,
    //     },
    //   );

    //   await amplitude.track(event);
    // }

    print("📊 Tracked event: remove_from_cart → $itemName");
  } else if (eventType == 'purchase') {
    await appsflyer.logEvent("purchase", {
      "af_currency": currency,
      "af_revenue": mrp,
      "user_id": itemName,
      "item_variant_id": varientID,
      "af_quantity": qty,
      "af_price": price,
      "af_content_type": category,
      "order_type": orderType,
      "order_id": utmSource,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    });
    // final event = BaseEvent(
    //   'Payment Completed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': itemName,
    //     'payment_method': orderType,
    //     "item_variant_id": varientID,
    //     'amount': mrp,
    //     'currency': currency,
    //     'order_id': utmSource,
    //     "order_type": orderType,
    //   },
    // );

    // await amplitude.track(event);

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
    // final event = BaseEvent(
    //   'Checkout Started',
    //   eventProperties: {
    //     'user_id': itemName,
    //     'cart_id': varientID,
    //     'cart_value': mrp,
    //     'item_count': afItems.length,
    //     'currency': currency,
    //     'order_type': orderType,
    //     "order_id": utmSource,
    //   },
    // );

    // amplitude.track(event);

    // // Amplitude - Checkout Started
    // final checkoutEvent = BaseEvent(
    //   'Payment Started',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': itemName,
    //     'cart_id': varientID,
    //     'cart_value': mrp,
    //     'item_count': afItems.length,
    //     'currency': currency,
    //     'order_type': orderType,
    //     "order_id": utmSource,
    //   },
    // );

    // await amplitude.track(checkoutEvent);

    print("📊 Tracked event: af_initiated_checkout → $itemName");
  } else if (eventType == 'search') {
    final Map<String, dynamic> eventValues = {
      "af_search_string": category,
      if (category != null) "af_content_type": itemName,
      if (qty != null) "af_results_count": qty,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    };

    await appsflyer.logEvent("af_search", eventValues);

    // final event = BaseEvent(
    //   'Search Results Viewed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'search_query': itemName,
    //     'results_count': qty,
    //   },
    // );

    // await amplitude.track(event);

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

    // final event = BaseEvent(
    //   'Product Viewed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'product_id': varientID,
    //     'product_name': itemName,
    //     'category': category,
    //     'price': price,
    //     'mrp': mrp,
    //     'currency': currency,
    //   },
    // );

    // await amplitude.track(event);

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

      // final event = BaseEvent(
      //   'Product Added to Wishlist',
      //   eventProperties: {
      //     'platform': Platform.isIOS ? 'iOS' : 'Android',
      //     'product_id': varientID,
      //     'product_name': itemName,
      //     'category': category,
      //     'price': price,
      //     'mrp': mrp,
      //     'currency': currency,
      //   },
      // );

      // await amplitude.track(event);

      print("💖 AppsFlyer Event: af_add_to_wishlist → $eventValues");
    } else {
      await appsflyer.logEvent("af_remove_to_wishlist", eventValues);

      // final event = BaseEvent(
      //   'Product Remove to Wishlist',
      //   eventProperties: {
      //     'platform': Platform.isIOS ? 'iOS' : 'Android',
      //     'product_id': varientID,
      //     'product_name': itemName,
      //     'category': category,
      //     'price': price,
      //     'mrp': mrp,
      //     'currency': currency,
      //   },
      // );

      // await amplitude.track(event);
      print("💖 AppsFlyer Event: af_remove_to_wishlist → $eventValues");
    }
  } else if (eventType == 'category') {
    final eventValues = {
      "category_id": varientID,
      "category_name": itemName,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    };

    await appsflyer.logEvent("af_category_view", eventValues);
    // final event = BaseEvent(
    //   'Category Viewed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'category_id': varientID,
    //     'category_name': itemName,
    //   },
    // );

    // await amplitude.track(event);

    print("📂 Event Sent: af_category_view → $eventValues");
  } else if (eventType == 'subcategory') {
    final eventValues = {
      "category_id": varientID,
      "subcategory_id": category,
      "subcategory_name": itemName,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    };

    await appsflyer.logEvent("af_subcategory_view", eventValues);
    // final event = BaseEvent(
    //   'Sub Category Viewed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'subcategory_id': varientID,
    //     'subcategory_name': itemName,
    //     'category_name': category,
    //   },
    // );

    // await amplitude.track(event);

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

    // final event = BaseEvent(
    //   'Login Guest Started',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'login_method': 'guest',
    //     'user_id': varientID,
    //     'uuid': category
    //   },
    // );

    // await amplitude.track(event);

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
    // final event = BaseEvent(
    //   'Sign Up Completed ',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'name_provided': itemName.trim().isNotEmpty == true,
    //     'phone_number_provided': utmSource?.trim().isNotEmpty == true,
    //     'email_provided': varientID.trim().isNotEmpty == true,
    //     'referral_code':
    //         category.trim().isNotEmpty == true ? category.trim() : null,
    //   },
    // );
    // await amplitude.track(event);
    print('📊 Amplitude Event: Sign Up Completed ');
  } else if (eventType == 'login') {
    await appsflyer.logEvent("login", {
      "af_login_method": "phone",
      "name": itemName,
      "af_source": Platform.isIOS ? "iOS" : "Android",
    });

    // final event = BaseEvent(
    //   'Login Started',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'login_method': 'mobile',
    //   },
    // );

    // await amplitude.track(event);

    print("📊 Tracked event: login");
  } else if (eventType == 'home') {
    await appsflyer.logEvent("view_home", {
      "af_source": Platform.isIOS ? "iOS" : "Android",
      "screen": "home",
      "timestamp": DateTime.now().toString(),
      "user_id": varientID
    });
    // final event = BaseEvent(
    //   'Home Viewed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID,
    //     "screen": "home",
    //   },
    // );

    // await amplitude.track(event);

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

    // final event = BaseEvent(
    //   'Coupon Applied',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'coupon_code': itemName,
    //     'coupon_name': category,
    //     'discount_amount': price,
    //     "user_id": varientID,
    //     'currency': currency,
    //   },
    // );

    // await amplitude.track(event);

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

    // final event = BaseEvent(
    //   'Order Cancelled',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID,
    //     'order_id': category,
    //     "cancel_reason": itemName,
    //     'amount': mrp,
    //     'currency': currency,
    //   },
    // );

    // await amplitude.track(event);

    print("🛑 AppsFlyer order_cancelled event logged");
  } else if (eventType == 'cancelProduct') {
    final Map<String, dynamic> eventValues = {
      "af_order_id": utmCampaign,
      "af_content_id": utmSource,
      "af_content_type": "product",
      "af_content": category,
      "af_quantity": qty,
      "af_price": price,
      "af_currency": currency,
      "order_type": orderType,
      "cancel_reason": itemName,
      "user_id": varientID,
      "event_time": DateTime.now().toIso8601String(),
    };

    await appsflyer.logEvent("product_cancelled", eventValues);
    // final event = BaseEvent(
    //   'Order Product Cancelled',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID,
    //     'order_id': utmCampaign,
    //     "cancel_reason": itemName,
    //     'price': price,
    //     'currency': currency,
    //     "af_quantity": qty,
    //   },
    // );

    // await amplitude.track(event);

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
      "af_currency": currency,
      "user_id": varientID,
      "order_type": orderType,
      "order_id": category,
      "af_items": afItems,
    };

    await appsflyer.logEvent("af_buy_now", eventValues);
    print("📦 Buy Now Event Sent");

    /// Amplitude event pass for appOpen...G1
  } else if (eventType == 'appOpen') {
    // final event = BaseEvent(
    //   'App Opened',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'version': varientID,
    //     'user_id': itemName,
    //     'fcm_token': category
    //   },
    // );
    // await amplitude.track(event);
    // print('📊 Amplitude Event: App Opened');
  } else if (eventType == 'registerrr') {
    // final event = BaseEvent(
    //   'Login Completed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'login_method': varientID,
    //     'user_id': orderType,
    //   },
    // );
    // await amplitude.track(event);
    print('📊 Amplitude Event: Login Completed');
  } else if (eventType == 'logout') {
    // final event = BaseEvent(
    //   'Logout',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': itemName,
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Logout');
  } else if (eventType == 'loginFailed') {
    // final event = BaseEvent(
    //   'Login Failed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'login_method': varientID,
    //     'user_id': itemName,
    //     'failure_reason': category,
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Login Failed');
  } else if (eventType == 'registerStart') {
    // final event = BaseEvent(
    //   'Sign Up Started ',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'name_provided': itemName.trim().isNotEmpty == true,
    //     'phone_number_provided': utmSource?.trim().isNotEmpty == true,
    //     'email_provided': varientID.trim().isNotEmpty == true,
    //     'referral_code':
    //         category.trim().isNotEmpty == true ? category.trim() : null,
    //   },
    // );
    // await amplitude.track(event);
    print('📊 Amplitude Event: Sign Up Started');
  } else if (eventType == 'accountDeleted') {
    // final event = BaseEvent(
    //   'Account Deleted',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'deletion_reason': "Deleted By customer",
    //     'account_age_days': varientID,
    //     'referral_code':
    //         category.trim().isNotEmpty == true ? category.trim() : null,
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Account Deleted');
  } else if (eventType == 'guestToRegister') {
    // final event = BaseEvent(
    //   'Guest to Register',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: guestToRegister');
  } else if (eventType == 'searchStart') {
    // final event = BaseEvent(
    //   'Search Started',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'search_query': itemName,
    //     'user_id': varientID
    //   },
    // );

    // await amplitude.track(event);

    print("🔍 AppsFlyer Event: af_search → ");
  } else if (eventType == 'wishlistViewed') {
    // final event = BaseEvent(
    //   'Wishlist Viewed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Wishlist Viewed');
  } else if (eventType == 'couponViewed') {
    // final event = BaseEvent(
    //   'Coupon Viewed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Coupon Viewed');
  } else if (eventType == 'couponRemoved') {
    // final event = BaseEvent(
    //   'Coupon Removed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'coupon_code': itemName,
    //     'coupon_name': category,
    //     'discount_amount': price,
    //     "user_id": varientID,
    //     'currency': currency,
    //   },
    // );

    // await amplitude.track(event);

    print("📊 Tracked event: apply_coupon");
  } else if (eventType == 'cartViewed') {
    // final event = BaseEvent(
    //   'Cart Viewed Daily',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     "user_id": varientID,
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Cart Viewed Daily');
  } else if (eventType == 'cartViewedS') {
    // final event = BaseEvent(
    //   'Cart Viewed Subscription',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     "user_id": varientID,
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Cart Viewed Daily');
  } else if (eventType == 'addAddress') {
    // final event = BaseEvent(
    //   'Delivery Address Added',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID,
    //     'address_id': itemName,
    //     'address_type': category,
    //     'address': utmSource,
    //   },
    // );

    // await amplitude.track(event);
  } else if (eventType == 'editAddress') {
    // final event = BaseEvent(
    //   'Delivery Address Updated',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID,
    //     'address_id': itemName,
    //     'address_type': category,
    //     'address': utmSource,
    //   },
    // );

    // await amplitude.track(event);
  } else if (eventType == 'addressSelected') {
    // final event = BaseEvent(
    //   'Delivery Address Selected',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID,
    //     'address_id': itemName,
    //     'address_type': category,
    //     'address': utmSource,
    //   },
    // );

    // await amplitude.track(event);
  } else if (eventType == 'timeSlotView') {
    // final event = BaseEvent(
    //   'Delivery Slot Viewed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID,
    //     'type': utmSource,
    //   },
    // );
    // await amplitude.track(event);
  } else if (eventType == 'timeSlotSelected') {
    // final event = BaseEvent(
    //   'Delivery Slot Selected',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID,
    //     'delivery_date': itemName,
    //     'delivery_slot': category,
    //     'type': utmSource,
    //   },
    // );

    // await amplitude.track(event);
  } else if (eventType == 'timeSlotChanges') {
    // final event = BaseEvent(
    //   'Delivery Slot Changed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': varientID,
    //     'type': utmSource,
    //     'delivery_date': itemName,
    //     'delivery_slot': category,
    //   },
    // );

    // await amplitude.track(event);
  } else if (eventType == 'paymentStarted') {
    // final event = BaseEvent(
    //   'Payment Method Selected',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': itemName,
    //     'order_type': category,
    //     'amount': mrp,
    //     'payment_method': orderType,
    //     'currency': currency,
    //   },
    // );

    // await amplitude.track(event);

    // final eventN = BaseEvent(
    //   'Payment Method Started',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': itemName,
    //     'amount': mrp,
    //     'variant_id': varientID,
    //     'currency': currency,
    //     'payment_method': orderType,
    //   },
    // );
    // await amplitude.track(eventN);
  } else if (eventType == 'paymentFailed') {
    // final event = BaseEvent(
    //   'Payment Failed',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': itemName,
    //     'payment_method': orderType,
    //     'amount': mrp,
    //     'currency': currency,
    //     'order_id': varientID,
    //     'failed error': utmCampaign
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Payment Failed');
  } else if (eventType == 'walletSelected') {
    // final event = BaseEvent(
    //   'Wallet Selected',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': itemName,
    //     'payment_method': varientID,
    //     'amount': mrp,
    //     'currency': currency,
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Wallet Selected');
  } else if (eventType == 'pushNotificationOpened') {
    // final event = BaseEvent(
    //   'Push Notification Opened',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'screen_name': varientID,
    //     'param': products,
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Push Notification Opened');
  } else if (eventType == 'appShare') {
    // final event = BaseEvent(
    //   'Referral Shared',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': itemName,
    //     'referral_code': varientID,
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Referral Shared');
  } else if (eventType == 'appShare') {
    // final event = BaseEvent(
    //   'Review Submitted',
    //   eventProperties: {
    //     'platform': Platform.isIOS ? 'iOS' : 'Android',
    //     'user_id': itemName,
    //     'product_id': varientID,
    //     'rating': price,
    //     'review_type': category,
    //   },
    // );

    // await amplitude.track(event);

    print('📊 Amplitude Event: Review Submitted');
  }

  /// Facebook event pass...G1
  if (eventType == 'add') {
    facebookAppEvents.logAddToCart(
      id: varientID,
      type: 'product',
      price: price,
      currency: currency,
      content: {"product_name": itemName},
    );
    // print("G1----> favecebook add to cart");
  } else if (eventType == 'purchase') {
    facebookAppEvents.logPurchase(amount: mrp, currency: currency);
    // print("G1----> favecebook purchase");
  } else if (eventType == 'register') {
    facebookAppEvents.setUserData(
      email: varientID,
      firstName: itemName,
      dateOfBirth: '',
      city: "referalCode :-- $category",
      country: '',
    );
    // print("G1----> favecebook register");
  }
}
