import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'save_letterproducts_list_widget.dart' show SaveLetterproductsListWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SaveLetterproductsListModel
    extends FlutterFlowModel<SaveLetterproductsListWidget> {
  ///  Local state fields for this component.

  dynamic productListC;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? networkCheck11;
  // Stores action output result for [Backend Call - API (addtosavecart)] action in Button widget.
  ApiCallResponse? addtoCart2;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtoCart12;
  // Stores action output result for [Backend Call - API (addtosavesubcart)] action in Button widget.
  ApiCallResponse? addtoSubCart;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Button widget.
  ApiCallResponse? addtosubCart12;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? networkCheck1;
  // Stores action output result for [Backend Call - API (addtosavecart)] action in Button widget.
  ApiCallResponse? addtoCart;
  // Stores action output result for [Backend Call - API (addtosavesubcart)] action in Button widget.
  ApiCallResponse? addtosubCart;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
