import '/backend/api_requests/api_calls.dart';
import '/components/rating_bar_item_component/rating_bar_item_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'rating_order_screen_widget.dart' show RatingOrderScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RatingOrderScreenModel extends FlutterFlowModel<RatingOrderScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBarOrder widget.
  double? ratingBarOrderValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (reviewondelivery)] action in Button widget.
  ApiCallResponse? apiResultupw;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
