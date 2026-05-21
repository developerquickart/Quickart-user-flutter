import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/components/empty_data_two_line_component/empty_data_two_line_component_widget.dart';
import '/components/similar_pproduct/similar_pproduct_widget.dart';
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
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'product_details_screen_widget.dart' show ProductDetailsScreenWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsScreenModel
    extends FlutterFlowModel<ProductDetailsScreenWidget> {
  ///  Local state fields for this page.

  String? subscriptionDate;

  List<dynamic> timeslots = [];
  void addToTimeslots(dynamic item) => timeslots.add(item);
  void removeFromTimeslots(dynamic item) => timeslots.remove(item);
  void removeAtIndexFromTimeslots(int index) => timeslots.removeAt(index);
  void insertAtIndexInTimeslots(int index, dynamic item) =>
      timeslots.insert(index, item);
  void updateTimeslotsAtIndex(int index, Function(dynamic) updateFn) =>
      timeslots[index] = updateFn(timeslots[index]);

  String? nullvalue = '\' \'';

  int? totalDeli = 1;

  double discountper1 = 1.0;

  String isAutoRenew = 'no';

  int? selectedVarient = 0;

  int status = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (seosource)] action in product_details_screen widget.
  ApiCallResponse? apiResultSeoSource;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon widget.
  bool? connectivityCheck;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon widget.
  ApiCallResponse? apiResultcb8;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon widget.
  bool? connectivityResultf;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon widget.
  ApiCallResponse? apiResultj2l;
  // Stores action output result for [Backend Call - API (totaldeliveries)] action in Container widget.
  ApiCallResponse? apiResultWeek;
  // Stores action output result for [Backend Call - API (totaldeliveries)] action in Container widget.
  ApiCallResponse? apiResultWeek1;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? connectivtyResultC1;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Container widget.
  ApiCallResponse? apiResultAddCart;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? connectivtyResultC11;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Container widget.
  ApiCallResponse? apiResultAddCart1;
  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? connnectivtyfavourites;
  // Stores action output result for [Backend Call - API (addnotifyme)] action in IconButton widget.
  ApiCallResponse? favourites;
  // Model for similarPproduct component.
  late SimilarPproductModel similarPproductModel;
  // Model for EmptyDataTwoLineComponent component.
  late EmptyDataTwoLineComponentModel emptyDataTwoLineComponentModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (timeslot)] action in Row widget.
  ApiCallResponse? apiResultTimeSlot;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Button widget.
  ApiCallResponse? apiResultco2;

  @override
  void initState(BuildContext context) {
    similarPproductModel = createModel(context, () => SimilarPproductModel());
    emptyDataTwoLineComponentModel =
        createModel(context, () => EmptyDataTwoLineComponentModel());
  }

  @override
  void dispose() {
    similarPproductModel.dispose();
    emptyDataTwoLineComponentModel.dispose();
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
