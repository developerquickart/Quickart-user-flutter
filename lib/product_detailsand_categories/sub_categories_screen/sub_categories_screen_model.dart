import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
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
import 'sub_categories_screen_widget.dart' show SubCategoriesScreenWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubCategoriesScreenModel
    extends FlutterFlowModel<SubCategoriesScreenWidget> {
  ///  Local state fields for this page.

  dynamic productModelJson;

  String? selectedSubCatID;

  String? onCategorySelected;

  String loadingString = 'Loading...';

  bool? loadingIndicator;

  bool isLoadingIndicator = false;

  String? imagePath;

  String subCatName = ' ';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in subCategoriesScreen widget.
  bool? connectivityResultCatee;
  // Stores action output result for [Backend Call - API (subcatee)] action in subCategoriesScreen widget.
  ApiCallResponse? apiResultSubcatID;
  // Stores action output result for [Backend Call - API (catproduct)] action in subCategoriesScreen widget.
  ApiCallResponse? apiResultCatProduct1;
  // Stores action output result for [Backend Call - API (seosource)] action in subCategoriesScreen widget.
  ApiCallResponse? apiResultSeoSource;
  // Stores action output result for [Backend Call - API (catproduct)] action in Container widget.
  ApiCallResponse? apiResultCartProduct;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Button widget.
  dynamic? returnJson9;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResultAddCartCopy1;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? apiResultsmdcCopy1;
  // Stores action output result for [Backend Call - API (catproduct)] action in Button widget.
  ApiCallResponse? apiResultbf5Copy1;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Button widget.
  dynamic? returnJson11;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetcheck1Copy;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtocartremoveCopy;
  // Stores action output result for [Backend Call - API (catproduct)] action in Button widget.
  ApiCallResponse? catproductlistCopy;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Button widget.
  dynamic? returnJson10;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult123;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? apiResultAddCart123;
  // Stores action output result for [Backend Call - API (catproduct)] action in Button widget.
  ApiCallResponse? apiResult0v0123;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Row widget.
  dynamic? returnJson1;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon1 widget.
  bool? subcategoriesinternet;
  // Stores action output result for [Backend Call - API (addnotifyme)] action in Icon1 widget.
  ApiCallResponse? subcategories;
  // Stores action output result for [Backend Call - API (catproduct)] action in Icon1 widget.
  ApiCallResponse? apiResultCartProduct11;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon1 widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon1 widget.
  ApiCallResponse? addRemoveAPIResponse;
  // Stores action output result for [Backend Call - API (catproduct)] action in Icon1 widget.
  ApiCallResponse? apiResulttest;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon2 widget.
  bool? connectivityResult1;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon2 widget.
  ApiCallResponse? addRemoveAPIResult;
  // Stores action output result for [Backend Call - API (catproduct)] action in Icon2 widget.
  ApiCallResponse? apiResultCartProduct2;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Button widget.
  dynamic? returnJson99;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResultAddCart2;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? apiResultsmdcCopy22;
  // Stores action output result for [Backend Call - API (catproduct)] action in Button widget.
  ApiCallResponse? apiResultbf51;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Button widget.
  dynamic? returnJson111;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetcheck122;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtocartremove222;
  // Stores action output result for [Backend Call - API (catproduct)] action in Button widget.
  ApiCallResponse? catproductlist222;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Button widget.
  dynamic? returnJson101;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult1234;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? apiResultAddCart1234;
  // Stores action output result for [Backend Call - API (catproduct)] action in Button widget.
  ApiCallResponse? apiResult0v01234;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Row widget.
  dynamic? returnJson12;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon1 widget.
  bool? subcategoriesinternet1;
  // Stores action output result for [Backend Call - API (addnotifyme)] action in Icon1 widget.
  ApiCallResponse? subcategories1;
  // Stores action output result for [Backend Call - API (catproduct)] action in Icon1 widget.
  ApiCallResponse? apiResultCartProduct111;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon1 widget.
  bool? connectivityResult12;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon1 widget.
  ApiCallResponse? addRemoveAPIResponse11;
  // Stores action output result for [Backend Call - API (catproduct)] action in Icon1 widget.
  ApiCallResponse? apiResulttest11;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon2 widget.
  bool? connectivityResult11;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon2 widget.
  ApiCallResponse? addRemoveAPIResult111;
  // Stores action output result for [Backend Call - API (catproduct)] action in Icon2 widget.
  ApiCallResponse? apiResultCartProduct22;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future callApi(BuildContext context) async {
    logFirebaseEvent('callApi_update_app_state');

    FFAppState().update(() {});
  }
}
