import '/backend/api_requests/api_calls.dart';
import '/components/bottomnav_bar/bottomnav_bar_widget.dart';
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
import 'fresh_food_screen_widget.dart' show FreshFoodScreenWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FreshFoodScreenModel extends FlutterFlowModel<FreshFoodScreenWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetcheck;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? cartAdd;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetCheck;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtoCartAPI1;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult123;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? apiResultAddCart123;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Row widget.
  dynamic? returnJson10;
  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? connnectivtyfreshpick;
  // Stores action output result for [Backend Call - API (addnotifyme)] action in IconButton widget.
  ApiCallResponse? freshpick;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon1 widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon1 widget.
  ApiCallResponse? addRemoveAPIResponse;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon2 widget.
  bool? connectivityResult1;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon2 widget.
  ApiCallResponse? addRemoveAPIResult;
  // Model for bottomnavBar component.
  late BottomnavBarModel bottomnavBarModel;

  @override
  void initState(BuildContext context) {
    bottomnavBarModel = createModel(context, () => BottomnavBarModel());
  }

  @override
  void dispose() {
    bottomnavBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
