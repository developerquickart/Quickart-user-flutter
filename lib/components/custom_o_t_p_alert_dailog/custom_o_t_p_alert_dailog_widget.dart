import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_o_t_p_alert_dailog_model.dart';
export 'custom_o_t_p_alert_dailog_model.dart';

class CustomOTPAlertDailogWidget extends StatefulWidget {
  const CustomOTPAlertDailogWidget({
    super.key,
    required this.des,
    required this.height,
    this.title,
    required this.appUserID,
    required this.serverUserID,
    required this.appUUID,
    required this.serverUUID,
    required this.isSubscriptionOrder,
  });

  final String? des;
  final double? height;
  final String? title;
  final String? appUserID;
  final String? serverUserID;
  final String? appUUID;
  final String? serverUUID;
  final String? isSubscriptionOrder;

  @override
  State<CustomOTPAlertDailogWidget> createState() =>
      _CustomOTPAlertDailogWidgetState();
}

class _CustomOTPAlertDailogWidgetState
    extends State<CustomOTPAlertDailogWidget> {
  late CustomOTPAlertDailogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomOTPAlertDailogModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Container(
          width: double.infinity,
          height: widget!.height,
          constraints: BoxConstraints(
            maxWidth: 530.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  1.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Quickart_Icon.png',
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                if (widget!.title != 'j')
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        widget!.title!,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              color: FFAppConstants.blackColor0A0A0A,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 20.0),
                    child: Text(
                      widget!.des!,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (widget!.isSubscriptionOrder != 'true')
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CUSTOM_O_T_P_ALERT_DAILOG_NO_BTN_ON_TAP');
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().deleteUserGUUID();
                            FFAppState().userGUUID = '';

                            safeSetState(() {});
                            logFirebaseEvent('Button_backend_call');
                            _model.apiResultzwxIOS1button1 =
                                await QuickartGroup.appinfoCall.call(
                              userid: FFAppState().userID,
                              stroreid: FFAppState().storeID,
                              platform: 'ios',
                              fcmToken: FFAppState().fcmToken,
                              deviceid: FFAppState().deviceID,
                            );

                            if ((_model.apiResultzwxIOS1button1?.succeeded ??
                                true)) {
                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().appInfo = getJsonField(
                                (_model.apiResultzwxIOS1button1?.jsonBody ??
                                    ''),
                                r'''$.data''',
                              );
                              FFAppState().userWalletstr = getJsonField(
                                (_model.apiResultzwxIOS1button1?.jsonBody ??
                                    ''),
                                r'''$.data.userwallet''',
                              ).toString();
                              FFAppState().dashboardBanner = getJsonField(
                                (_model.apiResultzwxIOS1button1?.jsonBody ??
                                    ''),
                                r'''$.oneapi_bg_first_image''',
                              ).toString();
                              FFAppState().update(() {});
                              logFirebaseEvent('Button_navigate_to');

                              context.goNamed(DashboardScreenWidget.routeName);
                            } else {
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.apiResultzwxIOS1button1
                                              ?.jsonBody ??
                                          ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: GoogleFonts.montserrat(
                                      color: FFAppConstants.indigoColor,
                                      fontWeight: FontWeight.w500,
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
                          text: 'No',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CUSTOM_O_T_P_ALERT_DAILOG_YES_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');
                            _model.apiResultrr8 =
                                await QuickartGroup.verifydetailsCall.call(
                              transferType: 'yes',
                              appUUID: FFAppState().userGUUID,
                              serverUUID: widget!.serverUUID,
                              appUserID: widget!.appUserID,
                              serverUSerID: widget!.serverUserID,
                            );

                            if ((_model.apiResultrr8?.succeeded ?? true)) {
                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().userID = getJsonField(
                                (_model.apiResultrr8?.jsonBody ?? ''),
                                r'''$.data.user_id''',
                              ).toString();
                              _model.updatePage(() {});
                              logFirebaseEvent('Button_backend_call');
                              _model.apiResultzwxIOS1button2 =
                                  await QuickartGroup.appinfoCall.call(
                                userid: FFAppState().userID,
                                stroreid: FFAppState().storeID,
                                platform: 'ios',
                                fcmToken: FFAppState().fcmToken,
                                deviceid: FFAppState().deviceID,
                              );

                              if ((_model.apiResultzwxIOS1button2?.succeeded ??
                                  true)) {
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().appInfo = getJsonField(
                                  (_model.apiResultzwxIOS1button2?.jsonBody ??
                                      ''),
                                  r'''$.data''',
                                );
                                FFAppState().userWalletstr = getJsonField(
                                  (_model.apiResultzwxIOS1button2?.jsonBody ??
                                      ''),
                                  r'''$.data.userwallet''',
                                ).toString();
                                FFAppState().dashboardBanner = getJsonField(
                                  (_model.apiResultzwxIOS1button2?.jsonBody ??
                                      ''),
                                  r'''$.oneapi_bg_first_image''',
                                ).toString();
                                FFAppState().deleteUserGUUID();
                                FFAppState().userGUUID = '';

                                FFAppState().update(() {});
                                logFirebaseEvent('Button_navigate_to');

                                context
                                    .goNamed(DashboardScreenWidget.routeName);
                              } else {
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiResultzwxIOS1button2
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.message''',
                                      ).toString(),
                                      style: GoogleFonts.montserrat(
                                        color: FFAppConstants.indigoColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 1000),
                                    backgroundColor:
                                        FFAppConstants.primaryPurpleE4D8F5,
                                  ),
                                );
                              }
                            } else {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: CustomAlertDailogWidget(
                                      des: getJsonField(
                                        (_model.apiResultrr8?.jsonBody ?? ''),
                                        r'''$.message''',
                                      ).toString(),
                                      height: 150.0,
                                      title: "",
                                    ),
                                  );
                                },
                              );
                            }

                            safeSetState(() {});
                          },
                          text: 'Yes',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
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
