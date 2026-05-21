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
import 'order_success_fail_screen_model.dart';
export 'order_success_fail_screen_model.dart';

class OrderSuccessFailScreenWidget extends StatefulWidget {
  const OrderSuccessFailScreenWidget({super.key});

  static String routeName = 'OrderSuccessFailScreen';
  static String routePath = '/orderSuccessFailScreen';

  @override
  State<OrderSuccessFailScreenWidget> createState() =>
      _OrderSuccessFailScreenWidgetState();
}

class _OrderSuccessFailScreenWidgetState
    extends State<OrderSuccessFailScreenWidget> {
  late OrderSuccessFailScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderSuccessFailScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OrderSuccessFailScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ORDER_SUCCESS_FAIL_SCREEN_OrderSuccessFa');
      logFirebaseEvent('OrderSuccessFailScreen_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      logFirebaseEvent('OrderSuccessFailScreen_custom_action');
      await actions.requestAppReview();
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
          backgroundColor: Colors.white,
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 350.0,
                height: 530.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Icon(
                          Icons.check_circle_outlined,
                          color: FFAppConstants.darkGreen,
                          size: 100.0,
                        ),
                      ),
                      Text(
                        'Order Confirmed !',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                       if ((FFAppState().screenName == 'subscription') &&
                          (FFAppState().cartTotalCount > 0))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Text(
                            'You\'re almost done! Your Subscription Cart is checked out. Complete your order by checking out your Daily Cart.',
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
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                     
                      
                      if ((FFAppState().screenName == 'daily') &&
                          (FFAppState().subCartTotalItem > 0))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Text(
                            'You\'re almost done! Your Daily Cart is checked out. Complete your order by checking out your Subscription Cart.',
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
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      
                     
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Text(
                          'You will receive your order on selected date.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppConstants.blackColor666666,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'ORDER_SUCCESS_FAIL_SCREEN_Text_28rvin2v_');
                            if (FFAppState().screenName == 'daily') {
                              logFirebaseEvent('Text_navigate_to');

                              context.goNamed(AllOrdersTABLISTWidget.routeName);

                              logFirebaseEvent('Text_update_app_state');
                              FFAppState().screenName = 'daily';
                              FFAppState().cartTotalCount = 0;
                              FFAppState().cartSavingPrice = 0.0;
                              FFAppState().cartTotalPrice = 0.0;
                              FFAppState().isDeliveryPartnerTipSelected = '0';
                              FFAppState().couponDiscount = 0.0;
                              FFAppState().couponCode = '';
                              FFAppState().cardScreenNavigation = '';
                              safeSetState(() {});
                            } else {
                              logFirebaseEvent('Text_navigate_to');

                              context.goNamed(AllOrdersTABLISTWidget.routeName);

                              logFirebaseEvent('Text_update_app_state');
                              FFAppState().backButtonOrder = true;
                              FFAppState().screenName = 'subscription';
                              FFAppState().subCartTotalItem = 0;
                              FFAppState().subCartTotalPrice = 0.0;
                              FFAppState().subCartSavingAmount = 0.0;
                              FFAppState().cardScreenNavigation =
                                  'subscriptionCart';
                              safeSetState(() {});
                            }
                          },
                          child: Text(
                            'Track order',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FFAppConstants.darkGreen,
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
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'ORDER_SUCCESS_FAIL_SCREEN_CONTINUE_SHOPP');
                              logFirebaseEvent('Button_google_analytics_event');
                              logFirebaseEvent('ContinueShoppingAnalytics');
                              if ((FFAppState().screenName == 'daily') &&
                                  (FFAppState().subCartTotalItem > 0)) {
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().screenName = 'daily';
                                FFAppState().cartTotalCount = 0;
                                FFAppState().cartSavingPrice = 0.0;
                                FFAppState().cartTotalPrice = 0.0;
                                FFAppState().isDeliveryPartnerTipSelected = '0';
                                FFAppState().couponDiscount = 0.0;
                                FFAppState().couponCode = '';
                                safeSetState(() {});
                                logFirebaseEvent('Button_navigate_to');

                                context.goNamed(
                                    CartSubscriptionScreenWidget.routeName);
                              } else {
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().backButtonOrder = true;
                                FFAppState().screenName = 'subscription';
                                FFAppState().subCartTotalItem = 0;
                                FFAppState().subCartTotalPrice = 0.0;
                                FFAppState().subCartSavingAmount = 0.0;
                                safeSetState(() {});
                                if ((FFAppState().screenName ==
                                        'subscription') &&
                                    (FFAppState().cartTotalCount > 0)) {
                                  logFirebaseEvent('Button_navigate_to');

                                  context
                                      .goNamed(DailyCartScreenWidget.routeName);
                                } else {
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed(
                                      DashboardScreenWidget.routeName);
                                }
                              }
                            },
                            text: 'Continue Shopping',
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
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
