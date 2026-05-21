import 'dart:async';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:quic_kart/flutter_flow/flutter_flow_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppsflyerService {
  static final AppsflyerService _instance = AppsflyerService._internal();
  factory AppsflyerService() => _instance;
  AppsflyerService._internal();

  AppsflyerSdk? _sdk;

  bool _deepLinkHandled = false;
  bool _installDataReceived = false;
  Timer? _deferredFallbackTimer;
  bool _isFirstInstallSession = true;

  // ================= INITIALIZE =================

  Future<void> initialize() async {
    if (_sdk != null) return;

    if (Platform.isIOS) {
      final status =
          await AppTrackingTransparency.requestTrackingAuthorization();
      debugPrint("📣 ATT Status → $status");
    }

    final options = AppsFlyerOptions(
      afDevKey: "UcP5dBePhwjBa7aXRTbLD8",
      appId: "1624846848",
      showDebug: true,
      timeToWaitForATTUserAuthorization: 15,
    );

    _sdk = AppsflyerSdk(options);

    // 🔵 MUST register callbacks BEFORE initSdk
    _sdk!.onInstallConversionData(_onInstallConversionData);
    _sdk!.onDeepLinking(_onDeepLinking);
     // ✅ ADD THIS HERE 👇
    _sdk!.onAppOpenAttribution((res) {
      debugPrint("🔁 App Open Attribution: $res");

      final deepLinkValue = res["deep_link_value"];
      if (deepLinkValue != null && !_deepLinkHandled) {
        _deepLinkHandled = true;
        _navigate(
          deepLinkValue,
          Map<String, dynamic>.from(res),
        );
      }
    });
    await _sdk!.initSdk(
      registerConversionDataCallback: true, // 🔥 REQUIRED
      registerOnDeepLinkingCallback: true,
      registerOnAppOpenAttributionCallback: true,
    );

    _sdk!.startSDK();

    final afId = await _sdk!.getAppsFlyerUID() ?? "";
    debugPrint("✅ AppsFlyer initialized → ID: $afId");

    await _setCustomerUserIdFromStorage();
  }

  // ================= CALLBACKS =================

  /// 🔵 Deferred Deep Link (FIRST INSTALL ONLY)
  void _onInstallConversionData(dynamic res) {
    debugPrint("🔵 Install Conversion Data: $res");

    _installDataReceived = true;
    _deferredFallbackTimer?.cancel();
    _isFirstInstallSession = false;
    final payload = res["payload"];
    if (payload == null) return;

    final bool isFirstLaunch = payload["is_first_launch"] == true;
    final String? deepLinkValue = payload["deep_link_value"];

    if (!isFirstLaunch || deepLinkValue == null) return;
    print("G1-----deferred DL------>$deepLinkValue");
    print("G1-----deferred payload------>$payload");

    _navigate(deepLinkValue, payload);
  }

  /// 🔗 Normal / Deferred Deep Link
  void _onDeepLinking(DeepLinkResult dp) {
    if (dp.status != Status.FOUND) return;

    final linkData = dp.deepLink;
    if (linkData == null) return;

    final deepLinkValue = linkData.deepLinkValue;
    final params = linkData.clickEvent ?? {};

    if (deepLinkValue == null || deepLinkValue.isEmpty) return;

    if (linkData.isDeferred == true) {
      debugPrint("⏳ Deferred DL detected");

      // if (_installDataReceived) return;

      // Start fallback timer (only once)
      _deferredFallbackTimer ??= Timer(const Duration(seconds: 6), () {
        if (_deepLinkHandled) return;

        debugPrint("⚠️ Attribution timeout → fallback deep link");
        _deepLinkHandled = true;
        _navigate(deepLinkValue, params);
      });

      return;
    }

    // ✅ Normal deep link
    if (_deepLinkHandled) return;
    _deepLinkHandled = true;

    _navigate(deepLinkValue, params);
  }

  // ================= NAVIGATION =================
  String _safe(dynamic v) => v?.toString() ?? "";
  void _navigate(String deepLinkValue, Map<String, dynamic> params) {
    final context = appNavigatorKey.currentContext;

    int _navigationRetryCount = 0;

    if (context == null) {
      if (_navigationRetryCount > 5) return;
      _navigationRetryCount++;

      Future.delayed(const Duration(milliseconds: 400), () {
        _navigate(deepLinkValue, params);
      });
      return;
    }

    String targetRoute = "/";
    // String utm =
    //     "utmSource=${params['utmSource']}&utmCampaign=${params['utmCampaign']}&utmNetwork=${params['utmCampaign']}&utmMedium=${params['utmMedium']}&utmKeyword=${params['utmKeyword']}&utmPlacement=${params['utmPlacement']}";
    String utm = "utmSource=${_safe(params['utmSource'])}"
        "&utmCampaign=${_safe(params['utmCampaign'])}"
        "&utmNetwork=${_safe(params['utmNetwork'])}"
        "&utmMedium=${_safe(params['utmMedium'])}"
        "&utmKeyword=${_safe(params['utmKeyword'])}"
        "&utmPlacement=${_safe(params['utmPlacement'])}";
    print("🏷️ G1-----url-------->$deepLinkValue--------------$utm");
    //Convert link → FlutterFlow route names .. G1
    if (deepLinkValue == "additional-categories") {
      final String? productName = params["name"]?.toString();
      targetRoute = "/additional-categories?name=$productName&$utm";
    } else if (deepLinkValue == "all-categories") {
      targetRoute = "/all-categories?$utm";
    } else if (deepLinkValue == "SignUpScreen") {
      final String? refCode = params["deep_link_sub1"]?.toString();
      targetRoute = "/SignUpScreen?refCode=$refCode";
    } else if (deepLinkValue == "top-selling-product-list") {
      targetRoute = "/top-selling-product-list?$utm";
    } else if (deepLinkValue == "recent-selling-product-list") {
      targetRoute = "/recent-selling-product-list?$utm";
    } else if (deepLinkValue == "sneaky-product") {
      targetRoute = "/sneaky-product?$utm";
    } else if (deepLinkValue == "subcategories-product-list") {
      final String? category = params["category"]?.toString();
      final String? catid = params["catid"]?.toString();
      final String? productName = params["name"]?.toString();
      final String? subcatid = params["subcatid"]?.toString();
      targetRoute =
          "/subcategories-product-list?category=$category&catid=$catid&name=$productName&subcatid=$subcatid&$utm";
    } else if (deepLinkValue == "brand-product-list") {
      final String? productName = params["name"]?.toString();
      final String? productId = params["id"]?.toString();
      targetRoute = "/brand-product-list?id=$productId&name=$productName&$utm";
    } else if (deepLinkValue == "banner-product-list") {
      final String? productName = params["name"]?.toString();
      final String? banner = params["banner"]?.toString();
      final String? type = params["type"]?.toString();
      targetRoute = "/banner-product-list?name=$productName&banner=$banner&type=$type&$utm";
    } else if (deepLinkValue == "occasional-product-list") {
      final String? productName = params["name"]?.toString();
      targetRoute = "/occasional-product-list?name=$productName&$utm";
    } else if (deepLinkValue == "search") {
      final String? productName = params["keyword"]?.toString();
      targetRoute = "/search?keyword=$productName&$utm";
    } else if (deepLinkValue == "product-details") {
      final String? productName = params["name"]?.toString();
      final String? productId = params["id"]?.toString();

      targetRoute = "/product-details?id=$productId&name=$productName&$utm";
    } else if (deepLinkValue == "search-popup-banner") {
      final String? productName = params["title"]?.toString();
      final String? productId = params["id"]?.toString();

      targetRoute =
          "/search-popup-banner?id=$productId&title=$productName&$utm";
    } else if (deepLinkValue == "featured-categories-product-list") {
      final String? productName = params["title"]?.toString();
      final String? productId = params["id"]?.toString();

      targetRoute =
          "/featured-categories-product-list?id=$productId&title=$productName&$utm";
    } else if (deepLinkValue == "dashboardScreen") {
      targetRoute = "/dashboardScreen?$utm";
    } else {
      // if (FFAppState().isUserLogin == true) {

      //   targetRoute =
      //       "/dashboardScreen?$utm";
      // } else {
      print("🏷️ G1---------");
      targetRoute = "/quickartsplashScreen";
      // }
    }

    debugPrint("📍 Navigating → $targetRoute");
    GoRouter.of(context).go(targetRoute);
  }

  // ================= CUID =================

  Future<void> setCustomerUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("customUserId", userId);

    _sdk?.setCustomerUserId(userId);
    debugPrint("🔐 CUID set: $userId");
  }

  Future<void> logEvent(String eventName, Map<String, dynamic> params) async {
    if (_sdk == null) await initialize();

    try {
      await _sdk!.logEvent(eventName, params);
      print("📊 Event Logged: $eventName → $params");
    } catch (e) {
      print("❌ Event Error: $e");
    }
  }

  Future<void> _setCustomerUserIdFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("customUserId");

    if (userId != null && userId.isNotEmpty) {
      _sdk?.setCustomerUserId(userId);
      debugPrint("🔐 Stored CUID restored");
    }
  }

  // ================= UTIL =================

  void resetDeepLinkSession() {
    _deepLinkHandled = false;
    _installDataReceived = false;
    _deferredFallbackTimer?.cancel();
  }

  AppsflyerSdk? get sdk => _sdk;
}
