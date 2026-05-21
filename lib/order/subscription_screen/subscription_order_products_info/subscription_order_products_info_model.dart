import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'subscription_order_products_info_widget.dart'
    show SubscriptionOrderProductsInfoWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscriptionOrderProductsInfoModel
    extends FlutterFlowModel<SubscriptionOrderProductsInfoWidget> {
  ///  Local state fields for this page.

  bool pauseResume = false;

  String? selectedResumeDate;

  String? orderTimeSlot;

  String? subscriptionId;

  String? subscriptionCartId;

  bool isLoadingIndiocator = false;

  bool isUpdatedJson = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (subscriptionOrderPause)] action in Container widget.
  ApiCallResponse? apiResultOrderPause1;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Stores action output result for [Backend Call - API (subscriptionOrderResume)] action in Button widget.
  ApiCallResponse? subscriptionOrderResumeAPI1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
