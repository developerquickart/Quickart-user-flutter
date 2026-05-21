import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/components/date_time_slot_bottom_sheet/date_time_slot_bottom_sheet_widget.dart';
import '/components/empty_data_two_line_component/empty_data_two_line_component_widget.dart';
import '/components/products_list_view/products_list_view_widget.dart';
import '/components/varient_botttom_sheet/varient_botttom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'daily_cart_screen_widget.dart' show DailyCartScreenWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DailyCartScreenModel extends FlutterFlowModel<DailyCartScreenWidget> {
  ///  Local state fields for this page.

  String selectedPaymentMethod = 'Pay Now';

  String? isWalletCheckBoxSelected = 'remove';

  bool isScheduleSelected = false;

  String? subscritionPaymentMethod = 'Pay Now';

  String isSubWalletCheckBoxSelected = 'remove';

  bool checkAddressExits = false;

  bool isLoadingIndicator = false;

  bool isFreshCutSelected = false;

  String? freshCutTimeSlot;

  String? selectedCartID;

  List<DailyDateTimeSlotsStruct> selectedArrayJson = [];
  void addToSelectedArrayJson(DailyDateTimeSlotsStruct item) =>
      selectedArrayJson.add(item);
  void removeFromSelectedArrayJson(DailyDateTimeSlotsStruct item) =>
      selectedArrayJson.remove(item);
  void removeAtIndexFromSelectedArrayJson(int index) =>
      selectedArrayJson.removeAt(index);
  void insertAtIndexInSelectedArrayJson(
          int index, DailyDateTimeSlotsStruct item) =>
      selectedArrayJson.insert(index, item);
  void updateSelectedArrayJsonAtIndex(
          int index, Function(DailyDateTimeSlotsStruct) updateFn) =>
      selectedArrayJson[index] = updateFn(selectedArrayJson[index]);

  String? isDateTImeHide = 'false';

  int? index = 0;

  bool isPaymentDone = true;

  bool checkRestriction = false;

  bool doorImage = false;

  bool uploadImgShow = false;

  bool uploadedImgShow = false;

  bool isShowAnimation = false;

  bool isSuccessTP = false;

  String? isRefWalletCheckBoxSelected = 'remove';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (userbankdetails)] action in dailyCartScreen widget.
  ApiCallResponse? apiResultBankDetail;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? internetCheck;
  // Stores action output result for [Backend Call - API (upquickordertimeslot)] action in Container widget.
  ApiCallResponse? apiResultsqz;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Container widget.
  ApiCallResponse? apiResultAddSubc;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetCheckdc;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtoCartAPIDC;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetCheckcp;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtoCartAPIDCP;
  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? internet;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in IconButton widget.
  ApiCallResponse? removedailycartproduct;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? isInternet4;
  // Stores action output result for [Backend Call - API (updatecart)] action in Container widget.
  ApiCallResponse? apiResultupdate;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetCheckcp1;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtoCartAPID;
  // Model for productsListView component.
  late ProductsListViewModel productsListViewModel;
  // State field(s) for CheckboxWallet widget.
  bool? checkboxWalletValue1;
  // State field(s) for CheckboxWallet widget.
  bool? checkboxWalletValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DailyCartPaymentRadioButton widget.
  FormFieldController<String>? dailyCartPaymentRadioButtonValueController;
  // Stores action output result for [Custom Action - checkInternetConnection] action in ApplePayContainer widget.
  bool? connectivityResult666Copy;
  // Stores action output result for [Backend Call - API (upquickordertimeslot)] action in ApplePayContainer widget.
  ApiCallResponse? apiResultkgz;
  // Stores action output result for [Backend Call - API (payment)] action in ApplePayContainer widget.
  ApiCallResponse? apiResultspayment;
  // Stores action output result for [Backend Call - API (payment)] action in ApplePayContainer widget.
  ApiCallResponse? apiResults5yy6Copy;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult6666;
  // Stores action output result for [Backend Call - API (payment)] action in Button widget.
  ApiCallResponse? apiResults5yy66;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? connectivityResult1Copy;
  // Stores action output result for [Backend Call - API (upquickordertimeslot)] action in Container widget.
  ApiCallResponse? apiResultyfq;
  // Stores action output result for [Backend Call - API (payment)] action in Container widget.
  ApiCallResponse? apiResultsyy;
  // Stores action output result for [Backend Call - API (payment)] action in Container widget.
  ApiCallResponse? apiResults5yCopy2;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? connectivityResultPO;
  // Stores action output result for [Backend Call - API (upquickordertimeslot)] action in Container widget.
  ApiCallResponse? apiResult4de;
  // Stores action output result for [Backend Call - API (checkoutquickorder)] action in Container widget.
  ApiCallResponse? apiResult7;
  // Stores action output result for [Backend Call - API (checkoutquickorder)] action in Container widget.
  ApiCallResponse? apiResult2;
  // Stores action output result for [Backend Call - API (checkoutquickorder)] action in Container widget.
  ApiCallResponse? apiResult77;
  // Stores action output result for [Backend Call - API (checkoutquickorder)] action in Container widget.
  ApiCallResponse? apiResult22;
  // Model for EmptyDataTwoLineComponent component.
  late EmptyDataTwoLineComponentModel emptyDataTwoLineComponentModel;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? networkCheck;
  // Stores action output result for [Backend Call - API (Add to Cart)] action in Button widget.
  ApiCallResponse? addtoCartMM;
  // Stores action output result for [Bottom Sheet - VarientBotttomSheet] action in Row widget.
  dynamic? returnJson10;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon1 widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon1 widget.
  ApiCallResponse? addRemoveAPIResponse;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Icon2 widget.
  bool? connectivityResult1;
  // Stores action output result for [Backend Call - API (addremwishlist)] action in Icon2 widget.
  ApiCallResponse? addRemoveAPIResult;
  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? connnectivtyC;
  // Stores action output result for [Backend Call - API (addnotifyme)] action in IconButton widget.
  ApiCallResponse? apiResultb11;

  @override
  void initState(BuildContext context) {
    productsListViewModel = createModel(context, () => ProductsListViewModel());
    emptyDataTwoLineComponentModel =
        createModel(context, () => EmptyDataTwoLineComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    productsListViewModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

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

  String? get dailyCartPaymentRadioButtonValue =>
      dailyCartPaymentRadioButtonValueController?.value;
}
