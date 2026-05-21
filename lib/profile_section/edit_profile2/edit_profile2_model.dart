import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'edit_profile2_widget.dart' show EditProfile2Widget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfile2Model extends FlutterFlowModel<EditProfile2Widget> {
  ///  Local state fields for this page.

  String? userPhonePage;

  String? userEmail;

  String? userCountryCodePage;

  String? userDialCodePage;

  bool? isPhoneSelected;

  bool? loader = false;

  int? lastID = 0;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetconnection;
  // Stores action output result for [Backend Call - API (SendOTP)] action in Button widget.
  ApiCallResponse? sendOTPoutput;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  String? _txtEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '\'Enter a valid email address\'';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return '\'Enter a valid email address\'';
    }
    return null;
  }

  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivity;
  // Stores action output result for [Backend Call - API (SendOTP)] action in Button widget.
  ApiCallResponse? sendOTPoutputEmail;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Text widget.
  bool? connectivityResultResend;
  // Stores action output result for [Backend Call - API (SendOTP)] action in Text widget.
  ApiCallResponse? sendOTPoutput1;
  // Stores action output result for [Backend Call - API (SendOTP)] action in Text widget.
  ApiCallResponse? sendOTPoutput2;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetCopy;
  // Stores action output result for [Backend Call - API (verifyOTPUpdate)] action in Button widget.
  ApiCallResponse? apiResultVerifyOTPCopy;

  @override
  void initState(BuildContext context) {
    txtEmailTextControllerValidator = _txtEmailTextControllerValidator;
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timerController.dispose();
  }
}
