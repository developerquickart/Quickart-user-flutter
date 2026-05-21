import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/components/empty_data_component/empty_data_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'wallet_screen_widget.dart' show WalletScreenWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WalletScreenModel extends FlutterFlowModel<WalletScreenWidget> {
  ///  Local state fields for this page.

  bool paymentText = true;

  String typeExpired = 'wallet_expired';

  String typeDeducted = 'deduction';

  String typeAdded = 'add';

  String startDate = 'Start Date';

  String endDate = 'End Date';

  bool isDateSeleced = false;

  String selectedType = 'all';

  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameTextController;
  String? Function(BuildContext, String?)? txtNameTextControllerValidator;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityresult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNameFocusNode?.dispose();
    txtNameTextController?.dispose();
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
