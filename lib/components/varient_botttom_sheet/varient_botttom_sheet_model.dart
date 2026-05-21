import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'varient_botttom_sheet_widget.dart' show VarientBotttomSheetWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VarientBotttomSheetModel
    extends FlutterFlowModel<VarientBotttomSheetWidget> {
  ///  Local state fields for this component.

  dynamic productJson;

  String itemTotalAmt = '0.00';

  int isFeaturesSelected = 0;

  List<dynamic> varientIDs = [];
  void addToVarientIDs(dynamic item) => varientIDs.add(item);
  void removeFromVarientIDs(dynamic item) => varientIDs.remove(item);
  void removeAtIndexFromVarientIDs(int index) => varientIDs.removeAt(index);
  void insertAtIndexInVarientIDs(int index, dynamic item) =>
      varientIDs.insert(index, item);
  void updateVarientIDsAtIndex(int index, Function(dynamic) updateFn) =>
      varientIDs[index] = updateFn(varientIDs[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? networkCheck;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtoCart;
  // Stores action output result for [Backend Call - API (updatecart)] action in Button widget.
  ApiCallResponse? apiResult21i;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? isInternet3;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Button widget.
  ApiCallResponse? apiResultco3;
  // Stores action output result for [Backend Call - API (updatessubcart )] action in Button widget.
  ApiCallResponse? apiResultupdateSubCart2;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internet;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtocart;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? isInternet2;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Button widget.
  ApiCallResponse? apiResultco2;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? network;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? cartadd;
  // Stores action output result for [Backend Call - API (updatecart)] action in Button widget.
  ApiCallResponse? apiResultl9n;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? isInternet1;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Button widget.
  ApiCallResponse? apiResultco1;
  // Stores action output result for [Backend Call - API (updatessubcart )] action in Button widget.
  ApiCallResponse? apiResultupdateSubCart4;
  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? connnectivtyC;
  // Stores action output result for [Backend Call - API (addnotifyme)] action in IconButton widget.
  ApiCallResponse? apiResultb11;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? isInternet4;
  // Stores action output result for [Backend Call - API (updatecart)] action in Container widget.
  ApiCallResponse? apiResultupdate;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? isInternet5;
  // Stores action output result for [Backend Call - API (updatessubcart )] action in Container widget.
  ApiCallResponse? apiResultupdateSubCart;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
