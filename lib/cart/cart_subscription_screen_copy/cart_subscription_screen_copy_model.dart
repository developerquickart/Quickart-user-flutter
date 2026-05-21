import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
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
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'cart_subscription_screen_copy_widget.dart'
    show CartSubscriptionScreenCopyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartSubscriptionScreenCopyModel
    extends FlutterFlowModel<CartSubscriptionScreenCopyWidget> {
  ///  Local state fields for this page.

  String selectedPaymentMethod = '';

  String? isWalletCheckBoxSelected = 'remove';

  bool isScheduleSelected = false;

  String? subscritionPaymentMethod = 'Pay Now';

  String isSubWalletCheckBoxSelected = 'remove';

  dynamic timeSlotjson;

  String? selectedDeliveryDateN;

  String? availableDays;

  bool? checkAddressExists = false;

  String? firstDeliveryDate;

  bool? isLoadingIndicator;

  String? itemName;

  String? itemPrice;

  int? totalDeli = 1;

  int? selectedQty = 0;

  bool isPaymentDone = true;

  String yes = 'yes';

  bool isAutoRenewCart = false;

  bool isAutoRenew = false;

  bool doorImage = false;

  String autorenewProduct = 'no';

  bool isCheckedAutoRenew = false;

  String isAutoRenewChecked = 'no';

  String? featureID;

  String isRefWalletCheckBoxSelected = 'remove';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (totaldeliveries)] action in cartSubscriptionScreenCopy widget.
  ApiCallResponse? apiResultaWeeks;
  // Stores action output result for [Backend Call - API (userbankdetails)] action in cartSubscriptionScreenCopy widget.
  ApiCallResponse? apiResultBankDetail;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (timeslot)] action in Row widget.
  ApiCallResponse? apiResultTimeSlot1;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internet;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Button widget.
  ApiCallResponse? addtosubCart;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? checkinternet;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Button widget.
  ApiCallResponse? apiResultAddsubCart12;
  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? internetsubcart;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in IconButton widget.
  ApiCallResponse? addtosubCart1;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? isInternet;
  // Stores action output result for [Backend Call - API (updatessubcart )] action in Container widget.
  ApiCallResponse? apiResultupdatesub;
  // Stores action output result for [Backend Call - API (timeslot)] action in Column widget.
  ApiCallResponse? apiResultTimeSlot11;
  // Stores action output result for [Backend Call - API (timeslot)] action in Column widget.
  ApiCallResponse? apiResultTimeSlot13;
  // Model for productsListView component.
  late ProductsListViewModel productsListViewModel;
  // State field(s) for CheckboxWallet widget.
  bool? checkboxWalletValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for SubPaymentRadioButton widget.
  FormFieldController<String>? subPaymentRadioButtonValueController;
  // Stores action output result for [Backend Call - API (subpayment)] action in AppleContainer widget.
  ApiCallResponse? apiResultapplePaynew;
  // Stores action output result for [Backend Call - API (subpayment)] action in QuickPayContainer widget.
  ApiCallResponse? apiResult44bquickPay;
  // Stores action output result for [Custom Action - checkInternetConnection] action in PaymentContainer widget.
  bool? connectivityResult33334;
  // Stores action output result for [Backend Call - API (checkoutsubcribtionorder)] action in PaymentContainer widget.
  ApiCallResponse? apiResultSUBC1;
  // Model for EmptyDataTwoLineComponent component.
  late EmptyDataTwoLineComponentModel emptyDataTwoLineComponentModel;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Button widget.
  ApiCallResponse? apiResultSubcMissed;
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
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (timeslot)] action in Row widget.
  ApiCallResponse? apiResultTimeSlot;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? myconnectivityResult;
  // Stores action output result for [Backend Call - API (addtosubcart)] action in Button widget.
  ApiCallResponse? apiResultco2;

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

  String? get subPaymentRadioButtonValue =>
      subPaymentRadioButtonValueController?.value;
}
