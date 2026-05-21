import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_on_board_screen_model.dart';
export 'login_on_board_screen_model.dart';

class LoginOnBoardScreenWidget extends StatefulWidget {
  const LoginOnBoardScreenWidget({
    super.key,
    this.refCode,
  });

  final String? refCode;

  static String routeName = 'loginOnBoardScreen';
  static String routePath = '/loginOnBoardScreen';

  @override
  State<LoginOnBoardScreenWidget> createState() =>
      _LoginOnBoardScreenWidgetState();
}

class _LoginOnBoardScreenWidgetState extends State<LoginOnBoardScreenWidget> {
  late LoginOnBoardScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginOnBoardScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'loginOnBoardScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_ON_BOARD_SCREEN_loginOnBoardScreen');
      logFirebaseEvent('loginOnBoardScreen_custom_action');
      await actions.getDeviceID();
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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FFAppConstants.f1f0edbg,
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FFAppConstants.f1f0edbg,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/sign_in_page.png',
                ).image,
              ),
            ),
            child: Stack(
              children: [
                // Align(
                //   alignment: AlignmentDirectional(0.0, 1.0),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(8.0),
                //     child: Image.asset(
                //       'assets/images/2vqf7_',
                //       width: MediaQuery.sizeOf(context).width * 0.85,
                //       height: MediaQuery.sizeOf(context).height * 0.35,
                //       fit: BoxFit.cover,
                //       alignment: Alignment(0.0, 1.0),
                //     ),
                //   ),
                // ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 70.0, 0.0, 0.0),
                                child: Text(
                                  'Enjoy Freshness\n Delivered Daily',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FFAppConstants.blackColor0A0A0A,
                                        fontSize: 28.0,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  45.0, 15.0, 45.0, 0.0),
                              child: Text(
                                'Get all your fresh picks at QuicKart! Experience nature\'s freshest offerings, \n everyday.\n',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FFAppConstants.blackColor666666,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LOGIN_ON_BOARD_SCREEN_SIGN_UP_LOGIN_BTN_');
                                  logFirebaseEvent(
                                      'Button_google_analytics_event');
                                  logFirebaseEvent(
                                      'SignUpLoginButtonAnalytics');
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().countryCode = '971';
                                  FFAppState().dialCode = 'AE';
                                  FFAppState().update(() {});
                                  logFirebaseEvent('Button_wait__delay');
                                  await Future.delayed(
                                    Duration(
                                      milliseconds: 200,
                                    ),
                                  );
                                  logFirebaseEvent('Button_navigate_to');

                                  context
                                      .pushNamed(LoginScreenWidget.routeName);
                                },
                                text: 'Sign Up / Login',
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
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 145.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Text(
                                'or',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFCCCCCC),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Container(
                              width: 145.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFCCCCCC),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'LOGIN_ON_BOARD_SCREEN_GUEST_LOGIN_BTN_ON');
                            logFirebaseEvent('Button_custom_action');
                            _model.internetCheck =
                                await actions.checkInternetConnection();
                            logFirebaseEvent('Button_custom_action');
                            await actions.getDeviceID();
                            if (_model.internetCheck == true) {
                              logFirebaseEvent('Button_backend_call');
                              _model.apiResulte9m =
                                  await QuickartGroup.guestloginCall.call(
                                deviceid: FFAppState().deviceID,
                                fcmToken: FFAppState().fcmToken,
                                uuid: FFAppState().userGUUID,
                              );

                              if ((_model.apiResulte9m?.succeeded ?? true)) {
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().deleteUserGUUID();
                                FFAppState().userGUUID = '';

                                safeSetState(() {});
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().userName = 'Guest';
                                FFAppState().countryCode = '971';
                                FFAppState().isUserLogin = true;
                                FFAppState().deleteUserEmail();
                                FFAppState().userEmail = '';

                                FFAppState().userID = getJsonField(
                                  (_model.apiResulte9m?.jsonBody ?? ''),
                                  r'''$.data.id''',
                                ).toString();
                                FFAppState().usserType = 'guest';
                                FFAppState().userGUUID = getJsonField(
                                  (_model.apiResulte9m?.jsonBody ?? ''),
                                  r'''$.data.uuid''',
                                ).toString();
                                safeSetState(() {});
                                logFirebaseEvent('Button_custom_action');
                                await actions.facebookEventClass(
                                  getJsonField(
                                    (_model.apiResulte9m?.jsonBody ?? ''),
                                    r'''$.data.id''',
                                  ).toString(),
                                  'guest',
                                  getJsonField(
                                    (_model.apiResulte9m?.jsonBody ?? ''),
                                    r'''$.data.uuid''',
                                  ).toString(),
                                  0.0,
                                  0,
                                  0.0,
                                  'guest',
                                  FFAppState().emptyJson,
                                  ' ',
                                  ' ',
                                  ' ',
                                  ' ',
                                  ' ',
                                );
                                logFirebaseEvent('Button_backend_call');
                                _model.appinfoGuest =
                                    await QuickartGroup.appinfoCall.call(
                                  userid: FFAppState().userID,
                                  stroreid: FFAppState().storeID,
                                  platform: FFAppState().platform,
                                  fcmToken: FFAppState().fcmToken,
                                  deviceid: FFAppState().deviceID,
                                );

                                if ((_model.appinfoGuest?.succeeded ?? true)) {
                                  logFirebaseEvent('Button_custom_action');
                                  await actions.saveLoginData(
                                    getJsonField(
                                      (_model.apiResulte9m?.jsonBody ?? ''),
                                      r'''$.data.id''',
                                    ).toString(),
                                    true,
                                    'yes',
                                    '7',
                                    getJsonField(
                                      (_model.appinfoGuest?.jsonBody ?? ''),
                                      r'''$.data''',
                                    ),
                                    '0',
                                    '0',
                                    '0',
                                    'Guest',
                                  );
                                  logFirebaseEvent('Button_navigate_to');

                                  context
                                      .goNamed(DashboardScreenWidget.routeName);

                                  logFirebaseEvent(
                                      'Button_google_analytics_event');
                                  logFirebaseEvent(
                                      'LoginAsGuestButtonAnalytics');
                                }
                              } else {
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiResulte9m?.jsonBody ?? ''),
                                        r'''$.message''',
                                      ).toString(),
                                      style: GoogleFonts.montserrat(
                                        color: FFAppConstants.indigoColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 950),
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
                                    _model.internetCheck!.toString(),
                                    style: GoogleFonts.montserrat(
                                      color: FFAppConstants.indigoColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1500),
                                  backgroundColor:
                                      FFAppConstants.primaryPurpleE4D8F5,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                          text: 'Guest Login',
                          options: FFButtonOptions(
                            width: 320.0,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFF1F0ED),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FFAppConstants.indigoColor,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FFAppConstants.indigoColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
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
