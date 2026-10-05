import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'login_on_board_screen_widget.dart' show LoginOnBoardScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginOnBoardScreenModel
    extends FlutterFlowModel<LoginOnBoardScreenWidget> {
  ///  Local state fields for this page.

  String? nullValue;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetCheck;
  // Stores action output result for [Backend Call - API (guestlogin)] action in Button widget.
  ApiCallResponse? apiResulte9m;
  // Stores action output result for [Backend Call - API (getZoneID)] action in Button widget.
  ApiCallResponse? getZoneIDResultGuest;
  // Stores action output result for [Backend Call - API (appinfo)] action in Button widget.
  ApiCallResponse? appinfoGuest;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
