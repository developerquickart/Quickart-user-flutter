import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'subscription_order_products_widget.dart'
    show SubscriptionOrderProductsWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscriptionOrderProductsModel
    extends FlutterFlowModel<SubscriptionOrderProductsWidget> {
  ///  Local state fields for this page.

  String orderStatusNewOld = 'new';

  bool orderDates = false;

  bool orderInfo = false;

  bool pauseResume = false;

  bool pauseResumeNew = false;

  bool orderDateOld = false;

  bool autoRenewal = false;

  bool invoicePDF = false;

  dynamic productData;

  String yes = 'yes';

  String? selectedCartId;

  String? orderSubscriptionId;

  String? selectedDeliveryDate;

  String? orderTimeSlot;

  String? subscriptionCartId;

  dynamic dummyJson;

  String? selectedResumeDate;

  bool isLoadingIndicator = false;

  dynamic refreshedJson;

  String? selectedCartID;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (generateinvoice)] action in Button widget.
  ApiCallResponse? apiResultp4y;
  // Stores action output result for [Backend Call - API (AutoRenewal)] action in Text widget.
  ApiCallResponse? apiResultutw;
  Completer<ApiCallResponse>? apiRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
