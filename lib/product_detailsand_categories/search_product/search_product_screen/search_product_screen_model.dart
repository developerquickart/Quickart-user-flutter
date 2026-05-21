import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/components/empty_data_two_line_component/empty_data_two_line_component_widget.dart';
import '/components/varient_botttom_sheet/varient_botttom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'search_product_screen_widget.dart' show SearchProductScreenWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchProductScreenModel
    extends FlutterFlowModel<SearchProductScreenWidget> {
  ///  Local state fields for this page.

  dynamic productModel1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (searchbystoreproduct)] action in TextField widget.
  ApiCallResponse? searchProductAPIResponse;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Button widget.
  dynamic? returnJson7;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? checkInternet1;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? apiResultsmdc1;
  // Stores action output result for [Backend Call - API (searchbystoreproduct)] action in Button widget.
  ApiCallResponse? apiResultbf5;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Button widget.
  dynamic? returnJson8;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetcheck1Copy;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtocartResult;
  // Stores action output result for [Backend Call - API (searchbystoreproduct)] action in Button widget.
  ApiCallResponse? apiResultbf55;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Button widget.
  dynamic? returnJson9;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult123;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? apiResultAddCart123;
  // Stores action output result for [Backend Call - API (searchbystoreproduct)] action in Button widget.
  ApiCallResponse? apiResultbf555;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Row widget.
  dynamic? returnJson10;
  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? connnectivty1;
  // Stores action output result for [Backend Call - API (addnotifyme)] action in IconButton widget.
  ApiCallResponse? aPInotify;
  // Stores action output result for [Backend Call - API (searchbystoreproduct)] action in IconButton widget.
  ApiCallResponse? apiResultnotify;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon1 widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon1 widget.
  ApiCallResponse? addRemoveAPIResponse;
  // Stores action output result for [Backend Call - API (searchbystoreproduct)] action in Icon1 widget.
  ApiCallResponse? apiResultbf1;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon2 widget.
  bool? connectivityResult1;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon2 widget.
  ApiCallResponse? addRemoveAPIResult;
  // Stores action output result for [Backend Call - API (searchbystoreproduct)] action in Icon2 widget.
  ApiCallResponse? apiResultbf11;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
