import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_width_action_call_back/custom_alert_width_action_call_back_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'payment_screen_widget.dart' show PaymentScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentScreenModel extends FlutterFlowModel<PaymentScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (paymentabandon)] action in IconButton widget.
  ApiCallResponse? apiResultco2Copy;
  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? myconnectivityResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
