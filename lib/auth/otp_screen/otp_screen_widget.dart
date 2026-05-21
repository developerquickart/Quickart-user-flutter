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
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'otp_screen_model.dart';
export 'otp_screen_model.dart';

class OtpScreenWidget extends StatefulWidget {
  const OtpScreenWidget({
    super.key,
    required this.name,
    required this.email,
    this.refCode,
    required this.screenName,
  });

  final String? name;
  final String? email;
  final String? refCode;
  final String? screenName;

  static String routeName = 'otpScreen';
  static String routePath = '/otpScreen';

  @override
  State<OtpScreenWidget> createState() => _OtpScreenWidgetState();
}

class _OtpScreenWidgetState extends State<OtpScreenWidget> {
  late OtpScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpScreenModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'otpScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('OTP_SCREEN_PAGE_otpScreen_ON_INIT_STATE');
      logFirebaseEvent('otpScreen_update_app_state');
      FFAppState().isOTPResend = false;
      safeSetState(() {});
      logFirebaseEvent('otpScreen_timer');
      _model.timerController.onStartTimer();
    });

    _model.pinCodeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: FFAppConstants.whiteColor,
                                borderRadius: 0.0,
                                borderWidth: 0.0,
                                fillColor: FFAppConstants.whiteColor,
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: FFAppConstants.blackColor0A0A0A,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'OTP_SCREEN_PAGE_backIconButton_ON_TAP');
                                  logFirebaseEvent(
                                      'backIconButton_navigate_back');
                                  context.safePop();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 40.0, 0.0, 0.0),
                          child: Text(
                            'Verify your details',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FFAppConstants.blackColor0A0A0A,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 15.0, 5.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Your OTP has been sent to  ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color:
                                            FFAppConstants.neutralBlack8F8F8F,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                TextSpan(
                                  text: FFAppState().countryCode,
                                  style: GoogleFonts.montserrat(
                                    color: FFAppConstants.indigoColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: GoogleFonts.montserrat(
                                    color: FFAppConstants.indigoColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                  ),
                                ),
                                TextSpan(
                                  text: FFAppState().phoneNo,
                                  style: GoogleFonts.montserrat(
                                    color: FFAppConstants.indigoColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' through SMS & WhatsApp.',
                                  style: GoogleFonts.montserrat(
                                    color: FFAppConstants.neutralBlack8F8F8F,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF8F8F8F),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 30.0, 30.0, 0.0),
                          child: PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 4,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FFAppConstants.indigoColor,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            enableActiveFill: false,
                            autoFocus: false,
                            focusNode: _model.pinCodeFocusNode,
                            enablePinAutofill: false,
                            errorTextSpace: 16.0,
                            showCursor: true,
                            cursorColor: Color(0xFF2E317E),
                            obscureText: false,
                            hintCharacter: '●',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            pinTheme: PinTheme(
                              fieldHeight: 44.0,
                              fieldWidth: 44.0,
                              borderWidth: 1.0,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6.0),
                                bottomRight: Radius.circular(6.0),
                                topLeft: Radius.circular(6.0),
                                topRight: Radius.circular(6.0),
                              ),
                              shape: PinCodeFieldShape.box,
                              activeColor: Color(0xFF3D3D3D),
                              inactiveColor: Color(0xFFE0E0E0),
                              selectedColor: FFAppConstants.primaryPurpleE4D8F5,
                            ),
                            controller: _model.pinCodeController,
                            onChanged: (_) {},
                            onCompleted: (_) async {
                              logFirebaseEvent(
                                  'OTP_SCREEN_PinCode_vdogrubf_ON_PINCODE_C');
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: _model.pinCodeControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Didn’t receive OTP?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FFAppConstants.neutralBlack8F8F8F,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (FFAppState().isOTPResend) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'OTP_SCREEN_PAGE_Text_c6zlb67s_ON_TAP');
                                      logFirebaseEvent('Text_custom_action');
                                      _model.connectivityResultResendOTPWA =
                                          await actions
                                              .checkInternetConnection();
                                      if (_model
                                              .connectivityResultResendOTPWA ==
                                          true) {
                                        logFirebaseEvent(
                                            'Text_update_page_state');
                                        _model.loader = true;
                                        safeSetState(() {});
                                        logFirebaseEvent('Text_backend_call');
                                        _model.resendOTPResponse1 =
                                            await QuickartGroup.resendOTPCall
                                                .call(
                                          countryCode: FFAppState().countryCode,
                                          phonoNo: FFAppState().phoneNo,
                                        );

                                        logFirebaseEvent('Text_wait__delay');
                                        await Future.delayed(
                                          Duration(
                                            milliseconds: 500,
                                          ),
                                        );
                                        if ((_model.resendOTPResponse1
                                                ?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'Text_update_app_state');
                                          FFAppState().isOTPResend = true;
                                          FFAppState().otpContainer = false;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Text_update_page_state');
                                          _model.loader = false;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Text_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.resendOTPResponse1
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor: FFAppConstants
                                                  .primaryPurpleE4D8F5,
                                            ),
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'Text_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.resendOTPResponse1
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2050),
                                              backgroundColor: FFAppConstants
                                                  .primaryPurpleE4D8F5,
                                            ),
                                          );
                                          logFirebaseEvent(
                                              'Text_update_page_state');
                                          _model.loader = false;
                                          safeSetState(() {});
                                        }
                                      } else {
                                        logFirebaseEvent('Text_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              FFAppConstants.internetString,
                                              style: GoogleFonts.montserrat(
                                                color:
                                                    FFAppConstants.indigoColor,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 1200),
                                            backgroundColor: FFAppConstants
                                                .primaryPurpleE4D8F5,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Text(
                                      'Resend',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FFAppConstants
                                                .neutralBlack8F8F8F,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  );
                                } else {
                                  return Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 0.0),
                                      child: FlutterFlowTimer(
                                        initialTime: _model.timerInitialTimeMs,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(
                                          value,
                                          hours: false,
                                          milliSecond: false,
                                        ),
                                        controller: _model.timerController,
                                        updateStateInterval:
                                            Duration(milliseconds: 1000),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.timerMilliseconds = value;
                                          _model.timerValue = displayTime;
                                          if (shouldUpdate) safeSetState(() {});
                                        },
                                        onEnded: () async {
                                          logFirebaseEvent(
                                              'OTP_SCREEN_Timer_qi0ow01d_ON_TIMER_END');
                                          logFirebaseEvent(
                                              'Timer_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'OTP has been expired. Please click resend to get new OTP',
                                                style: GoogleFonts.montserrat(
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 1500),
                                              backgroundColor: FFAppConstants
                                                  .primaryPurpleE4D8F5,
                                            ),
                                          );
                                          logFirebaseEvent(
                                              'Timer_update_app_state');
                                          FFAppState().isOTPResend = true;
                                          safeSetState(() {});
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF8F8F8F),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ].divide(SizedBox(width: 20.0)),
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 110.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'OTP_SCREEN_VERIFY__CONTINUE_BTN_ON_TAP');
                              logFirebaseEvent('Button_custom_action');
                              _model.connectivityOtpResultbutton =
                                  await actions.checkInternetConnection();
                              if (_model.pinCodeController!.text != null &&
                                  _model.pinCodeController!.text != '') {
                                if (_model.connectivityOtpResultbutton ==
                                    true) {
                                  logFirebaseEvent('Button_backend_call');
                                  _model.apiResultVerifyOTPbutton =
                                      await QuickartGroup.verifyOTPCall.call(
                                    phoneNo: FFAppState().phoneNo,
                                    otp: _model.pinCodeController!.text,
                                    deviceID: FFAppState().deviceID,
                                    countryCode: FFAppState().countryCode,
                                    email: widget!.email,
                                    name: widget!.name,
                                    referralCode: widget!.refCode,
                                    uuid: FFAppState().userGUUID,
                                  );

                                  if ((_model.apiResultVerifyOTPbutton
                                          ?.succeeded ??
                                      true)) {
                                    logFirebaseEvent(
                                        'Button_google_analytics_event');
                                    logFirebaseEvent(
                                        'DashboardFromVerifyOtpAnalytics');
                                    logFirebaseEvent('Button_custom_action');
                                    await actions.facebookEventClass(
                                      widget!.email!,
                                      widget!.name!,
                                      widget!.refCode != null &&
                                              widget!.refCode != ''
                                          ? widget!.refCode!
                                          : ' ',
                                      0.0,
                                      0,
                                      0.0,
                                      widget!.screenName == 'register'
                                          ? 'register'
                                          : 'registerrr',
                                      FFAppState().emptyJson,
                                      ' ',
                                      ' ',
                                      ' ',
                                      ' ',
                                      ' ',
                                    );
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().deleteUserName();
                                    FFAppState().userName = '';

                                    FFAppState().countryCode = '971';
                                    FFAppState().isUserLogin = true;
                                    FFAppState().deleteUserEmail();
                                    FFAppState().userEmail = '';

                                    FFAppState().deleteUserID();
                                    FFAppState().userID = '';

                                    FFAppState().deleteUsserType();
                                    FFAppState().usserType = '';

                                    safeSetState(() {});
                                    if (functions.checkUUIDCondition(
                                            getJsonField(
                                              (_model.apiResultVerifyOTPbutton
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.otherdata.addressdetail''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.apiResultVerifyOTPbutton
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.otherdata.userbankdetail''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.apiResultVerifyOTPbutton
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.otherdata.ordersdetail''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.apiResultVerifyOTPbutton
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.otherdata.subscriptionOrderDetail''',
                                            ).toString()) ==
                                        true) {
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().userName = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.name''',
                                      ).toString();
                                      FFAppState().userEmail = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.email''',
                                      ).toString();
                                      FFAppState().userID = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.id''',
                                      ).toString();
                                      FFAppState().isUserLogin = true;
                                      FFAppState().isOTPResend = false;
                                      FFAppState().dialCode = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.dial_code''',
                                      ).toString();
                                      FFAppState().userPhoneNo = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.user_phone''',
                                      ).toString();
                                      FFAppState().userCountryCode =
                                          getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.country_code''',
                                      ).toString();
                                      FFAppState().profileImage = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.user_image''',
                                      ).toString();
                                      FFAppState().countryCode = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.country_code''',
                                      ).toString();
                                      FFAppState().phoneNo = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.user_phone''',
                                      ).toString();
                                      FFAppState().userPhoneEP = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.user_phone''',
                                      ).toString();
                                      FFAppState().userCountryCodeEP =
                                          getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.country_code''',
                                      ).toString();
                                      FFAppState().deleteUsserType();
                                      FFAppState().usserType = '';

                                      FFAppState().userDialCode = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.dial_code''',
                                      ).toString();
                                      FFAppState().userPhoneProfile =
                                          getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.user_phone''',
                                      ).toString();
                                      safeSetState(() {});
                                      if (isiOS) {
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().platform = 'ios';
                                        FFAppState().fcmToken =
                                            FFAppState().fcmToken;
                                        safeSetState(() {});
                                        if (FFAppState().isUserLogin == true) {
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.apiResultzwxIOS1button =
                                              await QuickartGroup.appinfoCall
                                                  .call(
                                            userid: FFAppState().userID,
                                            stroreid: FFAppState().storeID,
                                            platform: 'ios',
                                            fcmToken: FFAppState().fcmToken,
                                            deviceid: FFAppState().deviceID,
                                          );

                                          if ((_model.apiResultzwxIOS1button
                                                  ?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'Button_update_app_state');
                                            FFAppState().appInfo = getJsonField(
                                              (_model.apiResultzwxIOS1button
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                            );
                                            FFAppState().userWalletstr =
                                                getJsonField(
                                              (_model.apiResultzwxIOS1button
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.userwallet''',
                                            ).toString();
                                            FFAppState().dashboardBanner =
                                                getJsonField(
                                              (_model.apiResultzwxIOS1button
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.oneapi_bg_first_image''',
                                            ).toString();
                                            FFAppState().update(() {});
                                            logFirebaseEvent(
                                                'Button_custom_action');
                                            await actions.saveLoginData(
                                              getJsonField(
                                                (_model.apiResultVerifyOTPbutton
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.data.id''',
                                              ).toString(),
                                              true,
                                              'yes',
                                              '7',
                                              getJsonField(
                                                (_model.apiResultzwxIOS1button
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.data''',
                                              ),
                                              getJsonField(
                                                (_model.apiResultzwxIOS1button
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.data.userwallet''',
                                              ).toString(),
                                              getJsonField(
                                                (_model.apiResultzwxIOS1button
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.oneapi_bg_first_image''',
                                              ).toString(),
                                              '0',
                                              ' ',
                                            );
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.goNamed(
                                                DashboardScreenWidget
                                                    .routeName);

                                            logFirebaseEvent('Button_timer');
                                            _model.timerController
                                                .onStopTimer();
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  getJsonField(
                                                    (_model.apiResultzwxIOS1button
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.message''',
                                                  ).toString(),
                                                  style: GoogleFonts.montserrat(
                                                    color: FFAppConstants
                                                        .indigoColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1000),
                                                backgroundColor: FFAppConstants
                                                    .primaryPurpleE4D8F5,
                                              ),
                                            );
                                          }
                                        }
                                      } else {
                                        if (isAndroid) {
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().platform = 'android';
                                          FFAppState().fcmToken =
                                              FFAppState().fcmToken;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.apiResultandroidbutton =
                                              await QuickartGroup.appinfoCall
                                                  .call(
                                            userid: FFAppState().userID,
                                            stroreid: FFAppState().storeID,
                                            platform: FFAppState().platform,
                                            deviceid: FFAppState().deviceID,
                                            fcmToken: FFAppState().fcmToken,
                                          );

                                          if ((_model.apiResultandroidbutton
                                                  ?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'Button_update_app_state');
                                            FFAppState().appInfo = getJsonField(
                                              (_model.apiResultandroidbutton
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                            );
                                            FFAppState().userWalletstr =
                                                getJsonField(
                                              (_model.apiResultandroidbutton
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.userwallet''',
                                            ).toString();
                                            FFAppState().dashboardBanner =
                                                getJsonField(
                                              (_model.apiResultandroidbutton
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.oneapi_bg_first_image''',
                                            ).toString();
                                            FFAppState().update(() {});
                                            logFirebaseEvent(
                                                'Button_custom_action');
                                            await actions.saveLoginData(
                                              getJsonField(
                                                (_model.apiResultVerifyOTPbutton
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.data.id''',
                                              ).toString(),
                                              true,
                                              'yes',
                                              '7',
                                              getJsonField(
                                                (_model.apiResultandroidbutton
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.data''',
                                              ),
                                              getJsonField(
                                                (_model.apiResultandroidbutton
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.data.userwallet''',
                                              ).toString(),
                                              getJsonField(
                                                (_model.apiResultandroidbutton
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.oneapi_bg_first_image''',
                                              ).toString(),
                                              '0',
                                              ' ',
                                            );
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.goNamed(
                                                DashboardScreenWidget
                                                    .routeName);

                                            logFirebaseEvent('Button_timer');
                                            _model.timerController
                                                .onStopTimer();
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Splash screen failed',
                                                  style: TextStyle(
                                                    color: FFAppConstants
                                                        .indigoColor,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1500),
                                                backgroundColor: FFAppConstants
                                                    .primaryPurpleE4D8F5,
                                              ),
                                            );
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().platform = 'web';
                                          FFAppState().fcmToken =
                                              FFAppState().fcmToken;
                                          safeSetState(() {});
                                        }
                                      }
                                    } else {
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().userName = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.name''',
                                      ).toString();
                                      FFAppState().userEmail = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.email''',
                                      ).toString();
                                      FFAppState().userID = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.id''',
                                      ).toString();
                                      FFAppState().isUserLogin = true;
                                      FFAppState().isOTPResend = false;
                                      FFAppState().dialCode = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.dial_code''',
                                      ).toString();
                                      FFAppState().userPhoneNo = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.user_phone''',
                                      ).toString();
                                      FFAppState().userCountryCode =
                                          getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.country_code''',
                                      ).toString();
                                      FFAppState().profileImage = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.user_image''',
                                      ).toString();
                                      FFAppState().countryCode = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.country_code''',
                                      ).toString();
                                      FFAppState().phoneNo = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.user_phone''',
                                      ).toString();
                                      FFAppState().userPhoneEP = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.user_phone''',
                                      ).toString();
                                      FFAppState().userCountryCodeEP =
                                          getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.country_code''',
                                      ).toString();
                                      FFAppState().deleteUsserType();
                                      FFAppState().usserType = '';

                                      FFAppState().userDialCode = getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.dial_code''',
                                      ).toString();
                                      FFAppState().userPhoneProfile =
                                          getJsonField(
                                        (_model.apiResultVerifyOTPbutton
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.data.user_phone''',
                                      ).toString();
                                      safeSetState(() {});
                                      if (getJsonField(
                                            (_model.apiResultVerifyOTPbutton
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.otherdata''',
                                          ) !=
                                          null) {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child:
                                                    CustomOTPAlertDailogWidget(
                                                  des: getJsonField(
                                                    (_model.apiResultVerifyOTPbutton
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.otherdata.message''',
                                                  ).toString(),
                                                  height: 260.0,
                                                  appUserID: getJsonField(
                                                    (_model.apiResultVerifyOTPbutton
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.otherdata.appuserid''',
                                                  ).toString(),
                                                  serverUserID: getJsonField(
                                                    (_model.apiResultVerifyOTPbutton
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.otherdata.serveruserid''',
                                                  ).toString(),
                                                  appUUID:
                                                      FFAppState().userGUUID,
                                                  serverUUID: getJsonField(
                                                    (_model.apiResultVerifyOTPbutton
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.otherdata.serveruuid''',
                                                  ).toString(),
                                                  isSubscriptionOrder:
                                                      getJsonField(
                                                    (_model.apiResultVerifyOTPbutton
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.otherdata.subscriptionOrderDetail''',
                                                  ).toString(),
                                                  title: 'j',
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        logFirebaseEvent('Button_backend_call');
                                        _model.apiResultzwx1 =
                                            await QuickartGroup.appinfoCall
                                                .call(
                                          userid: FFAppState().userID,
                                          stroreid: FFAppState().storeID,
                                          platform: 'ios',
                                          fcmToken: FFAppState().fcmToken,
                                          deviceid: FFAppState().deviceID,
                                        );

                                        if ((_model.apiResultzwx1?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().appInfo = getJsonField(
                                            (_model.apiResultzwx1?.jsonBody ??
                                                ''),
                                            r'''$.data''',
                                          );
                                          FFAppState().userWalletstr =
                                              getJsonField(
                                            (_model.apiResultzwx1?.jsonBody ??
                                                ''),
                                            r'''$.data.userwallet''',
                                          ).toString();
                                          FFAppState().dashboardBanner =
                                              getJsonField(
                                            (_model.apiResultzwx1?.jsonBody ??
                                                ''),
                                            r'''$.oneapi_bg_first_image''',
                                          ).toString();
                                          FFAppState().update(() {});
                                          logFirebaseEvent(
                                              'Button_custom_action');
                                          await actions.saveLoginData(
                                            getJsonField(
                                              (_model.apiResultVerifyOTPbutton
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.id''',
                                            ).toString(),
                                            true,
                                            'yes',
                                            '7',
                                            getJsonField(
                                              (_model.apiResultzwx1?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                            ),
                                            getJsonField(
                                              (_model.apiResultzwx1?.jsonBody ??
                                                  ''),
                                              r'''$.data.userwallet''',
                                            ).toString(),
                                            getJsonField(
                                              (_model.apiResultzwx1?.jsonBody ??
                                                  ''),
                                              r'''$.oneapi_bg_first_image''',
                                            ).toString(),
                                            '0',
                                            ' ',
                                          );
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.goNamed(
                                              DashboardScreenWidget.routeName);

                                          logFirebaseEvent('Button_timer');
                                          _model.timerController.onStopTimer();
                                        } else {
                                          logFirebaseEvent(
                                              'Button_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.apiResultzwx1
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                                style: GoogleFonts.montserrat(
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              backgroundColor: FFAppConstants
                                                  .primaryPurpleE4D8F5,
                                            ),
                                          );
                                        }
                                      }
                                    }
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          getJsonField(
                                            (_model.apiResultVerifyOTPbutton
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.message''',
                                          ).toString(),
                                          style: TextStyle(
                                            color: FFAppConstants.indigoColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FFAppConstants.primaryPurpleE4D8F5,
                                      ),
                                    );
                                  }
                                } else {
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFAppConstants.internetString,
                                        style: TextStyle(
                                          color: FFAppConstants.indigoColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FFAppConstants.primaryPurpleE4D8F5,
                                    ),
                                  );
                                }
                              } else {
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Plese enter OTP',
                                      style: TextStyle(
                                        color: FFAppConstants.indigoColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1200),
                                    backgroundColor:
                                        FFAppConstants.primaryPurpleE4D8F5,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                            text: 'Verify & Continue',
                            options: FFButtonOptions(
                              width: 320.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FFAppConstants.indigoColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FFAppConstants.whiteColor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6.0),
                                bottomRight: Radius.circular(6.0),
                                topLeft: Radius.circular(6.0),
                                topRight: Radius.circular(6.0),
                              ),
                              hoverColor: FFAppConstants.indigoColor,
                              hoverTextColor: FFAppConstants.yellowColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_model.loader ?? true)
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0x5114181B),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/new_loader.gif',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
