import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'rating_bar_item_component_widget.dart'
    show RatingBarItemComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RatingBarItemComponentModel
    extends FlutterFlowModel<RatingBarItemComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBarProduct widget.
  double? ratingBarProductValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - checkInternetConnection] action in submitBtn widget.
  bool? connectivityResult1;
  // Stores action output result for [Backend Call - API (addproductrating)] action in submitBtn widget.
  ApiCallResponse? apiResultmul1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
