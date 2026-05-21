import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_screen_model.dart';
export 'login_screen_model.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  static String routeName = 'loginScreen';
  static String routePath = '/loginScreen';

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  late LoginScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginScreenModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'loginScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_SCREEN_loginScreen_ON_INIT_STATE');
      logFirebaseEvent('loginScreen_custom_action');
      _model.deviceID = await actions.getDeviceID();
      logFirebaseEvent('loginScreen_update_app_state');
      FFAppState().deviceID = FFAppState().deviceID;
      FFAppState().deletePhoneNo();
      FFAppState().phoneNo = '';

      safeSetState(() {});
    });

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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FFAppConstants.whiteColor,
                          borderRadius: 0.0,
                          buttonSize: 46.0,
                          fillColor: FFAppConstants.whiteColor,
                          icon: Icon(
                            Icons.chevron_left,
                            color: FFAppConstants.blackColor0A0A0A,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'LOGIN_SCREEN_PAGE_btnbackIcon_ON_TAP');
                            logFirebaseEvent('btnbackIcon_navigate_back');
                            context.safePop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/QuicKart_New_Final.png',
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: 180.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Login / SignUp',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25.0, 20.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Mobile Number',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF3D3D3D),
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: FFAppConstants.redDF3F56,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF3D3D3D),
                            fontSize: 13.0,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 3.0, 20.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      child: custom_widgets.CountryCodeWidget(
                        width: double.infinity,
                        height: 60.0,
                        dialCode: 'AE',
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 45.0, 25.0, 10.0),
                  child: MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'LOGIN_SCREEN_PAGE_CONTINUE_BTN_ON_TAP');
                        logFirebaseEvent('Button_custom_action');
                        _model.connectivityResult =
                            await actions.checkInternetConnection();
                        if (_model.connectivityResult == true) {
                          if (FFAppState().phoneNo != null &&
                              FFAppState().phoneNo != '') {
                            logFirebaseEvent('Button_backend_call');
                            _model.apiResultqrg =
                                await QuickartGroup.loginCall.call(
                              userPhone: FFAppState().phoneNo,
                              countryCode: FFAppState().countryCode,
                              dialCode: FFAppState().dialCode,
                            );

                            if ((_model.apiResultqrg?.succeeded ?? true)) {
                              if (FFAppConstants.statusAPI1 ==
                                  getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.status''',
                                  ).toString()) {
                                if (FFAppState().isverified ==
                                    getJsonField(
                                      (_model.apiResultqrg?.jsonBody ?? ''),
                                      r'''$.data.is_verified''',
                                    )) {
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed(
                                    OtpScreenWidget.routeName,
                                    queryParameters: {
                                      'name': serializeParam(
                                        getJsonField(
                                          (_model.apiResultqrg?.jsonBody ?? ''),
                                          r'''$.data.name''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                      'email': serializeParam(
                                        getJsonField(
                                          (_model.apiResultqrg?.jsonBody ?? ''),
                                          r'''$.data.email''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                      'screenName': serializeParam(
                                        'login',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  logFirebaseEvent(
                                      'Button_google_analytics_event');
                                  logFirebaseEvent(
                                    'OtpFromLoginTrueAnalytics',
                                    parameters: {
                                      'Screen Name': 'OTP Screen',
                                      'API Name': 'Login API',
                                    },
                                  );
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().userID = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.id''',
                                  ).toString();
                                  FFAppState().countryCode = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.country_code''',
                                  ).toString();
                                  FFAppState().phoneNo = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.user_phone''',
                                  ).toString();
                                  FFAppState().userPhoneNo = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.user_phone''',
                                  ).toString();
                                  FFAppState().userCountryCode = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.country_code''',
                                  ).toString();
                                  FFAppState().userPhoneEP = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.user_phone''',
                                  ).toString();
                                  FFAppState().userPhoneProfile = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.user_phone''',
                                  ).toString();
                                  FFAppState().userCountryCodeEP = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.country_code''',
                                  ).toString();
                                  FFAppState().deleteUsserType();
                                  FFAppState().usserType = '';

                                  safeSetState(() {});
                                  logFirebaseEvent('Button_custom_action');
                                  await actions.facebookEventClass(
                                    FFAppState().phoneNo,
                                    getJsonField(
                                      (_model.apiResultqrg?.jsonBody ?? ''),
                                      r'''$.data.id''',
                                    ).toString(),
                                    'user',
                                    0.0,
                                    0,
                                    0.0,
                                    'login',
                                    FFAppState().emptyJson,
                                    ' ',
                                    ' ',
                                    ' ',
                                    ' ',
                                    ' ',
                                  );
                                } else {
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed(
                                    OtpScreenWidget.routeName,
                                    queryParameters: {
                                      'name': serializeParam(
                                        getJsonField(
                                          (_model.apiResultqrg?.jsonBody ?? ''),
                                          r'''$.data.name''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                      'email': serializeParam(
                                        getJsonField(
                                          (_model.apiResultqrg?.jsonBody ?? ''),
                                          r'''$.data.email''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                      'screenName': serializeParam(
                                        'login',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  logFirebaseEvent(
                                      'Button_google_analytics_event');
                                  logFirebaseEvent(
                                      'OtpFromLoginFalseAnalytics');
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().userID = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.id''',
                                  ).toString();
                                  FFAppState().countryCode = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.country_code''',
                                  ).toString();
                                  FFAppState().phoneNo = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.user_phone''',
                                  ).toString();
                                  FFAppState().userCountryCode = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.country_code''',
                                  ).toString();
                                  FFAppState().userPhoneNo = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.user_phone''',
                                  ).toString();
                                  FFAppState().userPhoneEP = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.user_phone''',
                                  ).toString();
                                  FFAppState().userPhoneProfile = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.user_phone''',
                                  ).toString();
                                  FFAppState().userCountryCodeEP = getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.data.country_code''',
                                  ).toString();
                                  FFAppState().deleteUsserType();
                                  FFAppState().usserType = '';

                                  safeSetState(() {});
                                }
                              } else {
                                if (FFAppState().loginMsg ==
                                    getJsonField(
                                      (_model.apiResultqrg?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString()) {
                                  logFirebaseEvent('Button_navigate_to');

                                  context
                                      .pushNamed(SignUpScreenWidget.routeName);

                                  logFirebaseEvent(
                                      'Button_google_analytics_event');
                                  logFirebaseEvent(
                                    'SignUpFromLoginAnalytics',
                                    parameters: {
                                      'PhoneNumber': FFAppState().phoneNo,
                                    },
                                  );
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().countryCode =
                                      FFAppState().countryCode;
                                  FFAppState().phoneNo = FFAppState().phoneNo;
                                  FFAppState().deleteUsserType();
                                  FFAppState().usserType = '';

                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        getJsonField(
                                          (_model.apiResultqrg?.jsonBody ?? ''),
                                          r'''$.message''',
                                        ).toString(),
                                        style: GoogleFonts.montserrat(
                                          color: FFAppConstants.indigoColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 1000),
                                      backgroundColor:
                                          FFAppConstants.primaryPurpleE4D8F5,
                                    ),
                                  );
                                }
                              }
                            } else {
                              if (FFAppState().loginMsg ==
                                  getJsonField(
                                    (_model.apiResultqrg?.jsonBody ?? ''),
                                    r'''$.message''',
                                  ).toString()) {
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(SignUpScreenWidget.routeName);

                                logFirebaseEvent(
                                    'Button_google_analytics_event');
                                logFirebaseEvent(
                                  'SignUpFromLoginAnalytics',
                                  parameters: {
                                    'PhoneNumber': FFAppState().phoneNo,
                                  },
                                );
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().countryCode =
                                    FFAppState().countryCode;
                                FFAppState().phoneNo = FFAppState().phoneNo;
                                FFAppState().deleteUsserType();
                                FFAppState().usserType = '';

                                safeSetState(() {});
                              } else {
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiResultqrg?.jsonBody ?? ''),
                                        r'''$.message''',
                                      ).toString(),
                                      style: GoogleFonts.montserrat(
                                        color: FFAppConstants.indigoColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1000),
                                    backgroundColor:
                                        FFAppConstants.primaryPurpleE4D8F5,
                                  ),
                                );
                              }
                            }
                          } else {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please enter mobile number',
                                  style: GoogleFonts.montserrat(
                                    color: FFAppConstants.indigoColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(milliseconds: 12000),
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
                                style: GoogleFonts.montserrat(
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
                      text: 'Continue',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FFAppConstants.indigoColor,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                    onEnter: ((event) async {
                      safeSetState(() => _model.mouseRegionHovered = true);
                    }),
                    onExit: ((event) async {
                      safeSetState(() => _model.mouseRegionHovered = false);
                    }),
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
