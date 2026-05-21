import '/backend/api_requests/api_calls.dart';
import '/components/bottomnav_bar/bottomnav_bar_widget.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/components/empty_data_two_line_component/empty_data_two_line_component_widget.dart';
import '/components/varient_botttom_sheet/varient_botttom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'repeat_orders_widget.dart' show RepeatOrdersWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RepeatOrdersModel extends FlutterFlowModel<RepeatOrdersWidget> {
  ///  Local state fields for this page.

  String? subscriptionDate;

  dynamic timeslots;

  String? availableDays;

  String? firstDeliveryDate;

  dynamic timeSlotjson;

  String? isWalletCheckBoxSelected;

  bool isScheduleSelected = true;

  String? selectedDeliveryDateN;

  String? itemName;

  String? itemPrice;

  int? totalDeli = 1;

  bool subcartvisibility = false;

  String isAutoRenew = 'no';

  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (totaldeliveries)] action in repeatOrders widget.
  ApiCallResponse? apiResultsWeeksRepeatOrder;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResultAddCart;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? apiResultAddToCart;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetCheck;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtoCartAPI1;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult123;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? apiResultAddCart123;
  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? connnectivtyfavourites;
  // Stores action output result for [Backend Call - API (addnotifyme)] action in IconButton widget.
  ApiCallResponse? favouritesrepeatOrder;
  // Model for bottomnavBar component.
  late BottomnavBarModel bottomnavBarModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (timeslot)] action in Row widget.
  ApiCallResponse? apiResultTimeSlotrepeatorder;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Button widget.
  ApiCallResponse? apiResultco2;

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
