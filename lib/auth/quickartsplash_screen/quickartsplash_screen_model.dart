import '/backend/api_requests/api_calls.dart';
import '/components/custom_retry_alert/custom_retry_alert_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'quickartsplash_screen_widget.dart' show QuickartsplashScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuickartsplashScreenModel
    extends FlutterFlowModel<QuickartsplashScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in QuickartsplashScreen widget.
  bool? connectivityResultCopy;
  // Stores action output result for [Custom Action - getFcmToken] action in QuickartsplashScreen widget.
  String? fcmTokenNew;
  // Stores action output result for [Backend Call - API (appinfo)] action in QuickartsplashScreen widget.
  ApiCallResponse? apiResultzwxIOS;
  // Stores action output result for [Backend Call - API (appinfo)] action in QuickartsplashScreen widget.
  ApiCallResponse? apiResultso1IOS;
  // Stores action output result for [Backend Call - API (appinfo)] action in QuickartsplashScreen widget.
  ApiCallResponse? apiResultAppInfo3;
  // Stores action output result for [Backend Call - API (appinfo)] action in QuickartsplashScreen widget.
  ApiCallResponse? apiResultAppInfo4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
