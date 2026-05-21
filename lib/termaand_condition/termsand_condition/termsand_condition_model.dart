import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'termsand_condition_widget.dart' show TermsandConditionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TermsandConditionModel extends FlutterFlowModel<TermsandConditionWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in termsandCondition widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (Terms  Condition)] action in termsandCondition widget.
  ApiCallResponse? termsofUseResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
