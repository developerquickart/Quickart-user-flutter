import '/backend/api_requests/api_calls.dart';
import '/components/custom_o_t_p_alert_dailog/custom_o_t_p_alert_dailog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'otp_screen_widget.dart' show OtpScreenWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtpScreenModel extends FlutterFlowModel<OtpScreenWidget> {
  ///  Local state fields for this page.

  bool? resendOTPType = false;

  bool? loader = false;

  String checkAlertVisible = 'false';

  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Text widget.
  bool? connectivityResultResendOTPWA;
  // Stores action output result for [Backend Call - API (resendOTP)] action in Text widget.
  ApiCallResponse? resendOTPResponse1;
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
  bool? connectivityOtpResultbutton;
  // Stores action output result for [Backend Call - API (Verify OTP)] action in Button widget.
  ApiCallResponse? apiResultVerifyOTPbutton;
  // Stores action output result for [Backend Call - API (appinfo)] action in Button widget.
  ApiCallResponse? apiResultzwxIOS1button;
  // Stores action output result for [Backend Call - API (appinfo)] action in Button widget.
  ApiCallResponse? apiResultandroidbutton;
  // Stores action output result for [Backend Call - API (appinfo)] action in Button widget.
  ApiCallResponse? apiResultzwx1;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timerController.dispose();
  }
}
