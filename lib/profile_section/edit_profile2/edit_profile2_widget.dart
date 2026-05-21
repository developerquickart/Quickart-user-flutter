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
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile2_model.dart';
export 'edit_profile2_model.dart';

class EditProfile2Widget extends StatefulWidget {
  const EditProfile2Widget({
    super.key,
    required this.dialCode,
  });

  final String? dialCode;

  static String routeName = 'editProfile2';
  static String routePath = '/editProfile2';

  @override
  State<EditProfile2Widget> createState() => _EditProfile2WidgetState();
}

class _EditProfile2WidgetState extends State<EditProfile2Widget> {
  late EditProfile2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfile2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'editProfile2'});
    _model.txtEmailTextController ??=
        TextEditingController(text: FFAppState().userEmail);
    _model.txtEmailFocusNode ??= FocusNode();

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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FFAppConstants.whiteColor,
          appBar: AppBar(
            backgroundColor: FFAppConstants.appBarColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              icon: Icon(
                Icons.chevron_left,
                color: FFAppConstants.appBarIconandTitleColor,
                size: FFAppConstants.appBarIconFont.toDouble(),
              ),
              onPressed: () async {
                logFirebaseEvent('EDIT_PROFILE2_chevron_left_ICN_ON_TAP');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
                logFirebaseEvent('IconButton_update_app_state');
                FFAppState().isOTPResend = false;
                FFAppState().update(() {});
              },
            ),
            title: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('EDIT_PROFILE2_PAGE_Text_5khuj88b_ON_TAP');
                logFirebaseEvent('Text_update_page_state');
                _model.loader = false;
                safeSetState(() {});
              },
              child: Text(
                'Edit Profile',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FFAppConstants.appBarIconandTitleColor,
                      fontSize: FFAppConstants.appBartitleFont.toDouble(),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                if (FFAppState().isPhoneSelected)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      decoration: BoxDecoration(
                        color: FFAppConstants.whiteColor,
                      ),
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Add Your Phone Number ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FFAppConstants.blackColor0A0A0A,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 20.0, 30.0, 0.0),
                              child: Text(
                                'Add Your Phone Number . You will recieve an OTP.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FFAppConstants.blackColor0A0A0A,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Form(
                                key: _model.formKey2,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 5.0, 20.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 60.0,
                                          child:
                                              custom_widgets.CountryCodeWidget(
                                            width: double.infinity,
                                            height: 60.0,
                                            dialCode: FFAppState().dialCode,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 40.0, 20.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'EDIT_PROFILE2_PAGE_GET_O_T_P_BTN_ON_TAP');
                                  logFirebaseEvent('Button_custom_action');
                                  _model.internetconnection =
                                      await actions.checkInternetConnection();
                                  if (_model.internetconnection!) {
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().userCountryCodeEP =
                                        FFAppState().countryCode;
                                    FFAppState().userPhoneEP =
                                        FFAppState().phoneNo;
                                    safeSetState(() {});
                                    logFirebaseEvent('Button_backend_call');
                                    _model.sendOTPoutput =
                                        await QuickartGroup.sendOTPCall.call(
                                      userId: FFAppState().userID,
                                      newInfo: FFAppState().phoneNo,
                                      changeType:
                                          FFAppState().isEmailSelected == true
                                              ? 'email'
                                              : 'phone',
                                      countryCode: FFAppState().countryCode,
                                      dialCode: FFAppState().dialCode,
                                    );

                                    if ((_model.sendOTPoutput?.succeeded ??
                                        true)) {
                                      if (FFAppConstants
                                              .userPhonenoVerification !=
                                          QuickartGroup.sendOTPCall.message(
                                            (_model.sendOTPoutput?.jsonBody ??
                                                ''),
                                          )) {
                                        logFirebaseEvent('Button_timer');
                                        _model.timerController.onStopTimer();
                                        logFirebaseEvent('Button_wait__delay');
                                        await Future.delayed(
                                          Duration(
                                            milliseconds: 100,
                                          ),
                                        );
                                        logFirebaseEvent('Button_timer');
                                        _model.timerController.timer
                                            .setPresetTime(
                                                mSec: 3000, add: false);
                                        _model.timerController.onResetTimer();

                                        logFirebaseEvent('Button_wait__delay');
                                        await Future.delayed(
                                          Duration(
                                            milliseconds: 100,
                                          ),
                                        );
                                        logFirebaseEvent('Button_timer');
                                        _model.timerController.onStartTimer();
                                        logFirebaseEvent('Button_wait__delay');
                                        await Future.delayed(
                                          Duration(
                                            milliseconds: 100,
                                          ),
                                        );
                                        logFirebaseEvent(
                                            'Button_update_page_state');
                                        _model.isPhoneSelected = true;
                                        _model.lastID = getJsonField(
                                          (_model.sendOTPoutput?.jsonBody ??
                                              ''),
                                          r'''$.data.lastid''',
                                        );
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().userPhoneEP =
                                            FFAppState().phoneNo;
                                        FFAppState().userCountryCodeEP =
                                            FFAppState().countryCode;
                                        FFAppState().isOtpSelected = true;
                                        safeSetState(() {});
                                      } else {
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.sendOTPoutput
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                              style: TextStyle(
                                                color:
                                                    FFAppConstants.indigoColor,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 1000),
                                            backgroundColor: FFAppConstants
                                                .primaryPurpleE4D8F5,
                                          ),
                                        );
                                      }
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.sendOTPoutput?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: TextStyle(
                                              color: FFAppConstants.indigoColor,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 1000),
                                          backgroundColor: FFAppConstants
                                              .primaryPurpleE4D8F5,
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
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 1000),
                                        backgroundColor:
                                            FFAppConstants.primaryPurpleE4D8F5,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Get OTP',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FFAppConstants.whiteColor,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().isEmailSelected)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      decoration: BoxDecoration(
                        color: FFAppConstants.whiteColor,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Add Your Email Address',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FFAppConstants.blackColor0A0A0A,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 20.0, 30.0, 0.0),
                              child: Text(
                                'Add Your Email Address . You will recieve an OTP.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FFAppConstants.blackColor0A0A0A,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Form(
                                key: _model.formKey1,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 0.0),
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color:
                                              FFAppConstants.neutralWhiteF5F5F5,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5.0),
                                            bottomRight: Radius.circular(5.0),
                                            topLeft: Radius.circular(5.0),
                                            topRight: Radius.circular(5.0),
                                          ),
                                          border: Border.all(
                                            color: FFAppConstants
                                                .neutralBlackE0E0E0,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller:
                                              _model.txtEmailTextController,
                                          focusNode: _model.txtEmailFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.txtEmailTextController',
                                            Duration(milliseconds: 2000),
                                            () async {
                                              logFirebaseEvent(
                                                  'EDIT_PROFILE2_txtEmail_ON_TEXTFIELD_CHAN');
                                              logFirebaseEvent(
                                                  'txtEmail_update_page_state');
                                              _model.userEmail = _model
                                                  .txtEmailTextController.text;
                                              safeSetState(() {});
                                            },
                                          ),
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FFAppConstants
                                                      .blackColor0A0A0A,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 20.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: FFAppConstants
                                                    .blackColor0A0A0A,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          textAlign: TextAlign.start,
                                          validator: _model
                                              .txtEmailTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 40.0, 20.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'EDIT_PROFILE2_PAGE_GET_O_T_P_BTN_ON_TAP');
                                  logFirebaseEvent('Button_custom_action');
                                  _model.connectivity =
                                      await actions.checkInternetConnection();
                                  if (_model.connectivity!) {
                                    logFirebaseEvent('Button_validate_form');
                                    if (_model.formKey1.currentState == null ||
                                        !_model.formKey1.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    logFirebaseEvent('Button_backend_call');
                                    _model.sendOTPoutputEmail =
                                        await QuickartGroup.sendOTPCall.call(
                                      userId: FFAppState().userID,
                                      newInfo:
                                          _model.txtEmailTextController.text,
                                      changeType:
                                          FFAppState().isEmailSelected == true
                                              ? 'email'
                                              : 'phone',
                                      countryCode: ' n',
                                      dialCode: 'n',
                                    );

                                    if ((_model.sendOTPoutputEmail?.succeeded ??
                                        true)) {
                                      if (FFAppConstants
                                              .userEmailVerification !=
                                          QuickartGroup.sendOTPCall.message(
                                            (_model.sendOTPoutputEmail
                                                    ?.jsonBody ??
                                                ''),
                                          )) {
                                        logFirebaseEvent('Button_timer');
                                        _model.timerController.onStopTimer();
                                        logFirebaseEvent('Button_wait__delay');
                                        await Future.delayed(
                                          Duration(
                                            milliseconds: 100,
                                          ),
                                        );
                                        logFirebaseEvent('Button_timer');
                                        _model.timerController.timer
                                            .setPresetTime(
                                                mSec: 3000, add: false);
                                        _model.timerController.onResetTimer();

                                        logFirebaseEvent('Button_wait__delay');
                                        await Future.delayed(
                                          Duration(
                                            milliseconds: 100,
                                          ),
                                        );
                                        logFirebaseEvent('Button_timer');
                                        _model.timerController.onStartTimer();
                                        logFirebaseEvent('Button_wait__delay');
                                        await Future.delayed(
                                          Duration(
                                            milliseconds: 100,
                                          ),
                                        );
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().isOtpSelected = true;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Button_update_page_state');
                                        _model.userEmail =
                                            _model.txtEmailTextController.text;
                                        _model.isPhoneSelected = false;
                                        _model.lastID = getJsonField(
                                          (_model.sendOTPoutputEmail
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data.lastid''',
                                        );
                                        safeSetState(() {});
                                      }
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            QuickartGroup.sendOTPCall.message(
                                              (_model.sendOTPoutputEmail
                                                      ?.jsonBody ??
                                                  ''),
                                            )!,
                                            style: GoogleFonts.montserrat(
                                              color: FFAppConstants.indigoColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 1000),
                                          backgroundColor: FFAppConstants
                                              .primaryPurpleE4D8F5,
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
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 1000),
                                        backgroundColor:
                                            FFAppConstants.primaryPurpleE4D8F5,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Get OTP',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FFAppConstants.whiteColor,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().isOtpSelected)
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FFAppConstants.whiteColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 40.0, 0.0, 0.0),
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
                                      color: Color(0xFF0A0A0A),
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
                                  0.0, 15.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (FFAppState().isPhoneSelected) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 5.0, 15.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Your OTP has been sent to  ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF8F8F8F),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: FFAppState()
                                                  .userCountryCodeEP,
                                              style: GoogleFonts.montserrat(
                                                color:
                                                    FFAppConstants.indigoColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' ',
                                              style: GoogleFonts.montserrat(
                                                color: Color(0xFF8F8F8F),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFAppState().userPhoneEP,
                                              style: GoogleFonts.montserrat(
                                                color:
                                                    FFAppConstants.indigoColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' through SMS & WhatsApp',
                                              style: GoogleFonts.montserrat(
                                                color: Color(0xFF8F8F8F),
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
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF8F8F8F),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 5.0, 10.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Your OTP has been sent to ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF8F8F8F),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: _model.userEmail!,
                                              style: GoogleFonts.montserrat(
                                                color:
                                                    FFAppConstants.indigoColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' via email',
                                              style: GoogleFonts.montserrat(
                                                color: Color(0xFF8F8F8F),
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
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF8F8F8F),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    );
                                  }
                                },
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
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                enableActiveFill: false,
                                autoFocus: true,
                                focusNode: _model.pinCodeFocusNode,
                                enablePinAutofill: false,
                                errorTextSpace: 16.0,
                                showCursor: true,
                                cursorColor: Color(0xFF2E317E),
                                obscureText: false,
                                hintCharacter: '●',
                                keyboardType: TextInputType.number,
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
                                  activeColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  inactiveColor: Color(0xFFE0E0E0),
                                  selectedColor:
                                      FFAppConstants.primaryPurpleE4D8F5,
                                ),
                                controller: _model.pinCodeController,
                                onChanged: (_) {},
                                onCompleted: (_) async {
                                  logFirebaseEvent(
                                      'EDIT_PROFILE2_PinCode_ll58d26n_ON_PINCOD');
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: _model.pinCodeControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
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
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FFAppConstants
                                                .neutralBlack8F8F8F,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                                                'EDIT_PROFILE2_PAGE_Text_jvtzdbjv_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_custom_action');
                                            _model.connectivityResultResend =
                                                await actions
                                                    .checkInternetConnection();
                                            if (_model
                                                    .connectivityResultResend ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Text_update_page_state');
                                              _model.loader = true;
                                              safeSetState(() {});
                                              if (FFAppState()
                                                      .isPhoneSelected ==
                                                  true) {
                                                logFirebaseEvent(
                                                    'Text_backend_call');
                                                _model.sendOTPoutput1 =
                                                    await QuickartGroup
                                                        .sendOTPCall
                                                        .call(
                                                  userId: FFAppState().userID,
                                                  newInfo: FFAppState().phoneNo,
                                                  changeType: FFAppState()
                                                              .isEmailSelected ==
                                                          true
                                                      ? 'email'
                                                      : 'phone',
                                                  countryCode:
                                                      FFAppState().countryCode,
                                                  dialCode:
                                                      FFAppState().dialCode,
                                                  platform:
                                                      isiOS ? 'ios' : 'android',
                                                );

                                                if ((_model.sendOTPoutput1
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (FFAppConstants
                                                          .userPhonenoVerification !=
                                                      QuickartGroup.sendOTPCall
                                                          .message(
                                                        (_model.sendOTPoutput1
                                                                ?.jsonBody ??
                                                            ''),
                                                      )) {
                                                    logFirebaseEvent(
                                                        'Text_update_page_state');
                                                    _model.loader = false;
                                                    _model.lastID =
                                                        getJsonField(
                                                      (_model.sendOTPoutput1
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.data.lastid''',
                                                    );
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'Text_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          QuickartGroup
                                                              .sendOTPCall
                                                              .message(
                                                            (_model.sendOTPoutput1
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
                                                          style: TextStyle(
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FFAppConstants
                                                                .primaryPurpleE4D8F5,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Text_timer');
                                                    _model.timerController
                                                        .onStopTimer();
                                                    logFirebaseEvent(
                                                        'Text_wait__delay');
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 100,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Text_timer');
                                                    _model.timerController
                                                        .onResetTimer();

                                                    logFirebaseEvent(
                                                        'Text_wait__delay');
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 100,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Text_timer');
                                                    _model.timerController
                                                        .onStartTimer();
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Text_update_page_state');
                                                    _model.loader = false;
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'Text_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          QuickartGroup
                                                              .sendOTPCall
                                                              .message(
                                                            (_model.sendOTPoutput1
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
                                                          style: TextStyle(
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1500),
                                                        backgroundColor:
                                                            FFAppConstants
                                                                .primaryPurpleE4D8F5,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'Text_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.sendOTPoutput1
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.message''',
                                                        ).toString(),
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 1000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .primaryPurpleE4D8F5,
                                                    ),
                                                  );
                                                  logFirebaseEvent(
                                                      'Text_update_page_state');
                                                  _model.loader = false;
                                                  safeSetState(() {});
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'Text_backend_call');
                                                _model.sendOTPoutput2 =
                                                    await QuickartGroup
                                                        .sendOTPCall
                                                        .call(
                                                  userId: FFAppState().userID,
                                                  newInfo: _model.userEmail,
                                                  changeType: FFAppState()
                                                              .isEmailSelected ==
                                                          true
                                                      ? 'email'
                                                      : 'phone',
                                                  countryCode: 'n',
                                                  dialCode: 'n',
                                                  platform:
                                                      isiOS ? 'ios' : 'android',
                                                );

                                                if ((_model.sendOTPoutput2
                                                        ?.succeeded ??
                                                    true)) {
                                                  if (FFAppConstants
                                                          .userEmailVerification !=
                                                      QuickartGroup.sendOTPCall
                                                          .message(
                                                        (_model.sendOTPoutput2
                                                                ?.jsonBody ??
                                                            ''),
                                                      )) {
                                                    logFirebaseEvent(
                                                        'Text_update_page_state');
                                                    _model.loader = false;
                                                    _model.lastID =
                                                        getJsonField(
                                                      (_model.sendOTPoutput2
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.data.lastid''',
                                                    );
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'Text_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          QuickartGroup
                                                              .sendOTPCall
                                                              .message(
                                                            (_model.sendOTPoutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
                                                          style: TextStyle(
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FFAppConstants
                                                                .primaryPurpleE4D8F5,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Text_timer');
                                                    _model.timerController
                                                        .onStopTimer();
                                                    logFirebaseEvent(
                                                        'Text_wait__delay');
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 100,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Text_timer');
                                                    _model.timerController
                                                        .onResetTimer();

                                                    logFirebaseEvent(
                                                        'Text_wait__delay');
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 100,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Text_timer');
                                                    _model.timerController
                                                        .onStartTimer();
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Text_update_page_state');
                                                    _model.loader = false;
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'Text_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          QuickartGroup
                                                              .sendOTPCall
                                                              .message(
                                                            (_model.sendOTPoutput2
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!,
                                                          style: TextStyle(
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1500),
                                                        backgroundColor:
                                                            FFAppConstants
                                                                .primaryPurpleE4D8F5,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'Text_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        QuickartGroup
                                                            .sendOTPCall
                                                            .message(
                                                          (_model.sendOTPoutput2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 1000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .primaryPurpleE4D8F5,
                                                    ),
                                                  );
                                                  logFirebaseEvent(
                                                      'Text_update_page_state');
                                                  _model.loader = false;
                                                  safeSetState(() {});
                                                }
                                              }
                                            } else {
                                              logFirebaseEvent(
                                                  'Text_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFAppConstants
                                                        .internetString,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: FFAppConstants
                                                          .indigoColor,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 1200),
                                                  backgroundColor:
                                                      FFAppConstants
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
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FFAppConstants
                                                      .neutralBlack8F8F8F,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        );
                                      } else {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: FlutterFlowTimer(
                                              initialTime:
                                                  _model.timerInitialTimeMs,
                                              getDisplayTime: (value) =>
                                                  StopWatchTimer.getDisplayTime(
                                                value,
                                                hours: false,
                                                milliSecond: false,
                                              ),
                                              controller:
                                                  _model.timerController,
                                              updateStateInterval:
                                                  Duration(milliseconds: 1000),
                                              onChanged: (value, displayTime,
                                                  shouldUpdate) {
                                                _model.timerMilliseconds =
                                                    value;
                                                _model.timerValue = displayTime;
                                                if (shouldUpdate)
                                                  safeSetState(() {});
                                              },
                                              onEnded: () async {
                                                logFirebaseEvent(
                                                    'EDIT_PROFILE2_Timer_yr3gis1v_ON_TIMER_EN');
                                                logFirebaseEvent(
                                                    'Timer_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'OTP has been expired. Please click resend to get new OTP',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 1500),
                                                    backgroundColor:
                                                        FFAppConstants
                                                            .primaryPurpleE4D8F5,
                                                  ),
                                                );
                                                logFirebaseEvent(
                                                    'Timer_update_app_state');
                                                FFAppState().isOTPResend = true;
                                                safeSetState(() {});
                                              },
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF8F8F8F),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
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
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 150.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'EDIT_PROFILE2_VERIFY__CONTINUE_BTN_ON_TA');
                                logFirebaseEvent('Button_custom_action');
                                _model.internetCopy =
                                    await actions.checkInternetConnection();
                                if (_model.pinCodeController!.text != null &&
                                    _model.pinCodeController!.text != '') {
                                  if (_model.internetCopy == true) {
                                    logFirebaseEvent('Button_backend_call');
                                    _model.apiResultVerifyOTPCopy =
                                        await QuickartGroup.verifyOTPUpdateCall
                                            .call(
                                      otp: _model.isPhoneSelected == true
                                          ? _model.pinCodeController!.text
                                          : _model.pinCodeController!.text,
                                      lastId: _model.lastID?.toString(),
                                      platform: isiOS ? 'ios' : 'android',
                                    );

                                    if ((_model.apiResultVerifyOTPCopy
                                            ?.succeeded ??
                                        true)) {
                                      logFirebaseEvent('Button_timer');
                                      _model.timerController.onResetTimer();

                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().userCountryCode =
                                          FFAppState().countryCode;
                                      FFAppState().userPhoneNo =
                                          FFAppState().phoneNo;
                                      FFAppState().update(() {});
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.apiResultVerifyOTPCopy
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: TextStyle(
                                              color: FFAppConstants.indigoColor,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: FFAppConstants
                                              .primaryPurpleE4D8F5,
                                        ),
                                      );
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                          ProfilePageWidget.routeName);

                                      logFirebaseEvent(
                                          'Button_google_analytics_event');
                                      logFirebaseEvent(
                                        'DashboardFromVerifyOtpAnalytics',
                                        parameters: {
                                          'UserId': FFAppState().userID,
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.apiResultVerifyOTPCopy
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: TextStyle(
                                              color: FFAppConstants.indigoColor,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          duration:
                                              Duration(milliseconds: 1000),
                                          backgroundColor: FFAppConstants
                                              .primaryPurpleE4D8F5,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FFAppConstants.blackColor666666,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FFAppConstants.blackColor666666,
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
                                hoverTextColor: FFAppConstants.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (_model.loader == true)
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
      ),
    );
  }
}
