import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_cancel_screen_model.dart';
export 'order_cancel_screen_model.dart';

class OrderCancelScreenWidget extends StatefulWidget {
  const OrderCancelScreenWidget({super.key});

  static String routeName = 'orderCancelScreen';
  static String routePath = '/orderCancelScreen';

  @override
  State<OrderCancelScreenWidget> createState() =>
      _OrderCancelScreenWidgetState();
}

class _OrderCancelScreenWidgetState extends State<OrderCancelScreenWidget> {
  late OrderCancelScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderCancelScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'orderCancelScreen'});
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
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 350.0,
                    height: 450.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Icon(
                              Icons.cancel_outlined,
                              color: FFAppConstants.redDF3F56,
                              size: 100.0,
                            ),
                          ),
                          Text(
                            'Order Cancelled !',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FFAppConstants.blackColor0A0A0A,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'Your order has been cancelled successfully. ',
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
                                    color: FFAppConstants.neutralBlack8F8F8F,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 30.0, 20.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ORDER_CANCEL_SCREEN_CONTINUE_BTN_ON_TAP');
                                  if (FFAppState().screenName ==
                                      'subscription') {
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().cartID = FFAppState().groupID;
                                    FFAppState().screenName = 'cancel';
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      SubscriptionOrderProductsWidget.routeName,
                                      queryParameters: {
                                        'orderDate': serializeParam(
                                          FFAppState().orderDate,
                                          ParamType.String,
                                        ),
                                        'orderPrice': serializeParam(
                                          FFAppState().orderValue,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );

                                    logFirebaseEvent(
                                        'Button_google_analytics_event');
                                    logFirebaseEvent(
                                        'SubscriptionCardClickAnalytics');
                                  } else {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                        OrderTrackingPageWidget.routeName);

                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().groupID = FFAppState().groupID;
                                    FFAppState().screenName = 'cancel';
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'Button_google_analytics_event');
                                    logFirebaseEvent(
                                      'Navigation',
                                      parameters: {
                                        'Screen Name': 'Daily Order Screen',
                                        'Navigate To': 'Order Tracking Screen',
                                      },
                                    );
                                  }
                                },
                                text: 'Continue ',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FFAppConstants.indigoColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FFAppConstants.whiteColor,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
