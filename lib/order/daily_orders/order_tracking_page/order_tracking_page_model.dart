import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'order_tracking_page_widget.dart' show OrderTrackingPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderTrackingPageModel extends FlutterFlowModel<OrderTrackingPageWidget> {
  ///  Local state fields for this page.

  String checkDiscount = '0.00';

  String dailyorderType = 'daily';

  String trialorderType = 'trail';

  bool deliveryProofImage = false;

  bool invoicePdf = false;

  String cardType = 'card';

  String orderType = 'trail';

  String cardTypeWallet = 'Wallet';

  String checkDiscount1 = '0';

  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (quickplacerepeatedorder)] action in Button widget.
  ApiCallResponse? apiResultPlaceOrder;
  // Stores action output result for [Backend Call - API (updateproductdetails)] action in Button widget.
  ApiCallResponse? apiResultupdatePro;

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
