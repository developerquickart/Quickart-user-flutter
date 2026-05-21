import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 60.0,
            height: 60.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFF2E317E),
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'QuickartsplashScreen': ParameterData.none(),
  'introScreen': ParameterData.none(),
  'loginOnBoardScreen': (data) async => ParameterData(
        allParams: {
          'refCode': getParameter<String>(data, 'refCode'),
        },
      ),
  'SignUpScreen': (data) async => ParameterData(
        allParams: {
          'refCode': getParameter<String>(data, 'refCode'),
        },
      ),
  'loginScreen': ParameterData.none(),
  'otpScreen': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'email': getParameter<String>(data, 'email'),
          'refCode': getParameter<String>(data, 'refCode'),
          'screenName': getParameter<String>(data, 'screenName'),
        },
      ),
  'DashboardScreen': (data) async => ParameterData(
        allParams: {
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
        },
      ),
  'topDealsScreen': (data) async => ParameterData(
        allParams: {
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
        },
      ),
  'termsandCondition': ParameterData.none(),
  'AddressListScreen': ParameterData.none(),
  'AddAddressScreen': ParameterData.none(),
  'FAQ': ParameterData.none(),
  'FAQ2': (data) async => ParameterData(
        allParams: {
          'que': getParameter<String>(data, 'que'),
          'ans': getParameter<String>(data, 'ans'),
        },
      ),
  'profilePage': ParameterData.none(),
  'repeatOrders': (data) async => ParameterData(
        allParams: {
          'repeat': getParameter<String>(data, 'repeat'),
        },
      ),
  'editProfile': ParameterData.none(),
  'favouritesScreen': ParameterData.none(),
  'notifyProductsListScreen': ParameterData.none(),
  'dailyCartScreen': ParameterData.none(),
  'categoriesScreen': (data) async => ParameterData(
        allParams: {
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
        },
      ),
  'SearchScreen': ParameterData.none(),
  'TrendingProductsScreen': (data) async => ParameterData(
        allParams: {
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
        },
      ),
  'AdditionalCatScreen': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
        },
      ),
  'BrandListScreen': ParameterData.none(),
  'SearchResultScreen': (data) async => ParameterData(
        allParams: {
          'brandText': getParameter<String>(data, 'brandText'),
          'keyword': getParameter<String>(data, 'keyword'),
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'placement': getParameter<String>(data, 'placement'),
        },
      ),
  'SearchProductScreen': (data) async => ParameterData(
        allParams: {
          'keywordPage': getParameter<String>(data, 'keywordPage'),
        },
      ),
  'GoogleMapsRedirect': ParameterData.none(),
  'walletScreen': ParameterData.none(),
  'ContactUsScreen': ParameterData.none(),
  'FreshFoodScreen': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'cardScreen': ParameterData.none(),
  'editProfile2': (data) async => ParameterData(
        allParams: {
          'dialCode': getParameter<String>(data, 'dialCode'),
        },
      ),
  'searchbyBanner': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
          'type': getParameter<String>(data, 'type'),
          'banner': getParameter<String>(data, 'banner'),
        },
      ),
  'cancelOrderScreen': ParameterData.none(),
  'SneakyProductListScreen': (data) async => ParameterData(
        allParams: {
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
        },
      ),
  'CouponsandOffers': ParameterData.none(),
  'OrderTrackingPage': ParameterData.none(),
  'OrderSuccessFailScreen': ParameterData.none(),
  'orderCancelScreen': ParameterData.none(),
  'cartSubscriptionScreen': ParameterData.none(),
  'PaymentScreen': (data) async => ParameterData(
        allParams: {
          'redirectURl': getParameter<String>(data, 'redirectURl'),
          'screenPName': getParameter<String>(data, 'screenPName'),
          'mrp': getParameter<double>(data, 'mrp'),
          'orderType': getParameter<String>(data, 'orderType'),
        },
      ),
  'product_details_screen': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
        },
      ),
  'note_iOSNotes': ParameterData.none(),
  'note_AndroidNotes': ParameterData.none(),
  'BrandProductListScreen': (data) async => ParameterData(
        allParams: {
          'id': getParameter<String>(data, 'id'),
          'keywordPage': getParameter<String>(data, 'keywordPage'),
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
          'name': getParameter<String>(data, 'name'),
        },
      ),
  'RatingOrderScreen': (data) async => ParameterData(
        allParams: {
          'cartId': getParameter<String>(data, 'cartId'),
          'subscriptionID': getParameter<String>(data, 'subscriptionID'),
          'screenName': getParameter<String>(data, 'screenName'),
          'rating': getParameter<int>(data, 'rating'),
          'reviewStr': getParameter<String>(data, 'reviewStr'),
        },
      ),
  'TrialProductCartScreen': ParameterData.none(),
  'TrialProductListing': ParameterData.none(),
  'ProductRatingReveiwScreen': (data) async => ParameterData(
        allParams: {
          'varientID': getParameter<String>(data, 'varientID'),
          'productName': getParameter<String>(data, 'productName'),
          'varientid': getParameter<int>(data, 'varientid'),
        },
      ),
  'OccasionalCategory': (data) async => ParameterData(
        allParams: {
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
          'name': getParameter<String>(data, 'name'),
        },
      ),
  'TrialPackcategories': (data) async => ParameterData(
        allParams: {
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
        },
      ),
  'AllOrdersTABLIST': ParameterData.none(),
  'SubscriptionOrderProducts': (data) async => ParameterData(
        allParams: {
          'orderDate': getParameter<String>(data, 'orderDate'),
          'orderPrice': getParameter<String>(data, 'orderPrice'),
        },
      ),
  'pdfView': (data) async => ParameterData(
        allParams: {
          'pdfURL': getParameter<String>(data, 'pdfURL'),
        },
      ),
  'SubscriptionOrderProductsInfo': (data) async => ParameterData(
        allParams: {
          'orderPrice': getParameter<String>(data, 'orderPrice'),
          'orderDate': getParameter<String>(data, 'orderDate'),
        },
      ),
  'subCategoriesScreen': (data) async => ParameterData(
        allParams: {
          'catid': getParameter<String>(data, 'catid'),
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
          'category': getParameter<String>(data, 'category'),
          'subcatid': getParameter<String>(data, 'subcatid'),
          'name': getParameter<String>(data, 'name'),
        },
      ),
  'FeaturedCategory': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'id': getParameter<String>(data, 'id'),
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
        },
      ),
  'note_deeplinkflutterchanges': ParameterData.none(),
  'searchbyPopupBanner': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'id': getParameter<String>(data, 'id'),
          'utmSource': getParameter<String>(data, 'utmSource'),
          'utmCampaign': getParameter<String>(data, 'utmCampaign'),
          'utmNetwork': getParameter<String>(data, 'utmNetwork'),
          'utmMedium': getParameter<String>(data, 'utmMedium'),
          'utmKeyword': getParameter<String>(data, 'utmKeyword'),
          'utmPlacement': getParameter<String>(data, 'utmPlacement'),
        },
      ),
  'webViewApp': (data) async => ParameterData(
        allParams: {
          'webURL': getParameter<String>(data, 'webURL'),
          'title': getParameter<String>(data, 'title'),
        },
      ),
  'GoogleMapsRedirectCopy': ParameterData.none(),
  'TotalPaySDKPaymentScreen': (data) async => ParameterData(
        allParams: {
          'checkoutUrl': getParameter<String>(data, 'checkoutUrl'),
          'cookies': getParameter<String>(data, 'cookies'),
          'successUrl': getParameter<String>(data, 'successUrl'),
          'cancelUrl': getParameter<String>(data, 'cancelUrl'),
          'mrp': getParameter<String>(data, 'mrp'),
        },
      ),
  'dailyCartScreenCopy': ParameterData.none(),
  'cartSubscriptionScreenCopy': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
