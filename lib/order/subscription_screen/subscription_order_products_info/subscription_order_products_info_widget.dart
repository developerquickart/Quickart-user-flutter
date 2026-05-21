import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subscription_order_products_info_model.dart';
export 'subscription_order_products_info_model.dart';

class SubscriptionOrderProductsInfoWidget extends StatefulWidget {
  const SubscriptionOrderProductsInfoWidget({
    super.key,
    required this.orderPrice,
    required this.orderDate,
  });

  final String? orderPrice;
  final String? orderDate;

  static String routeName = 'SubscriptionOrderProductsInfo';
  static String routePath = '/SubscriptionOrderProductsInfo';

  @override
  State<SubscriptionOrderProductsInfoWidget> createState() =>
      _SubscriptionOrderProductsInfoWidgetState();
}

class _SubscriptionOrderProductsInfoWidgetState
    extends State<SubscriptionOrderProductsInfoWidget> {
  late SubscriptionOrderProductsInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionOrderProductsInfoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SubscriptionOrderProductsInfo'});
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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter2 ??= Completer<ApiCallResponse>()
            ..complete(QuickartGroup.subscriptionMergedCall.call(
              groupId: FFAppState().cartID,
              platform: isiOS ? 'ios' : 'android',
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: Image.asset(
                'assets/images/new_loader.gif',
                width: MediaQuery.sizeOf(context).width * 0.25,
                height: MediaQuery.sizeOf(context).height * 0.25,
              ),
            ),
          );
        }
        final subscriptionOrderProductsInfoSubscriptionMergedResponse =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('SUBSCRIPTION_ORDER_PRODUCTS_INFO_arrow_b');
                  logFirebaseEvent('IconButton_navigate_to');

                  // context.goNamed(
                  //   SubscriptionOrderProductsWidget.routeName,
                  //   queryParameters: {
                  //     'orderDate': serializeParam(
                  //       widget!.orderDate,
                  //       ParamType.String,
                  //     ),
                  //     'orderPrice': serializeParam(
                  //       widget!.orderPrice,
                  //       ParamType.String,
                  //     ),
                  //   }.withoutNulls,
                  // );
                                     context.pop(true);
                },
              ),
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Text(
                              'Order ID:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppConstants.indigoColor,
                                    fontSize: 14.0,
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
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFAppState().cartID,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppConstants.indigoColor,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Order Date: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppConstants.indigoColor,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            TextSpan(
                              text: functions.setCustomDateFormate(
                                  widget!.orderDate,
                                  'yyyy-MM-dd',
                                  'dd-MM-yyyy')!,
                              style: GoogleFonts.montserrat(
                                color: FFAppConstants.indigoColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: ' | ',
                              style: GoogleFonts.montserrat(
                                color: FFAppConstants.indigoColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: 'AED ',
                              style: GoogleFonts.montserrat(
                                color: FFAppConstants.indigoColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                              ),
                            ),
                            TextSpan(
                              text: functions
                                  .setDecimalValue(widget!.orderPrice)!,
                              style: GoogleFonts.montserrat(
                                color: FFAppConstants.indigoColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
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
                    ],
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'SUBSCRIPTION_ORDER_PRODUCTS_INFO_Subscri');
                      logFirebaseEvent('SubscriptionOrderDates_navigate_back');
                      context.safePop();
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0x5114181B),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: MediaQuery.sizeOf(context).height * 0.7,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 5.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SUBSCRIPTION_ORDER_PRODUCTS_INFO_Icon_yp');
                                      logFirebaseEvent('Icon_navigate_to');

                                      // context.goNamed(
                                      //   SubscriptionOrderProductsWidget
                                      //       .routeName,
                                      //   queryParameters: {
                                      //     'orderDate': serializeParam(
                                      //       widget!.orderDate,
                                      //       ParamType.String,
                                      //     ),
                                      //     'orderPrice': serializeParam(
                                      //       widget!.orderPrice,
                                      //       ParamType.String,
                                      //     ),
                                      //   }.withoutNulls,
                                      // );
                                       context.pop(true);
                                    },
                                    child: Icon(
                                      Icons.cancel_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 28.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FFIcons.kpause1,
                                      color: FFAppConstants.indigoColor,
                                      size: 20.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3.0, 3.0, 5.0, 3.0),
                                      child: Text(
                                        'Tap on the Order date to Pause/Resume the order',
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
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
                                              color: FFAppConstants.indigoColor,
                                              fontSize: 11.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 5.0, 10.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final subscriptionDetails = getJsonField(
                                        functions.getSelectedSubscriptionData(
                                            FFAppState().selectedCartId,
                                            getJsonField(
                                              subscriptionOrderProductsInfoSubscriptionMergedResponse
                                                  .jsonBody,
                                              r'''$.data''',
                                            )),
                                        r'''$.subscription_details''',
                                      ).toList();

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          childAspectRatio: 0.9,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: subscriptionDetails.length,
                                        itemBuilder: (context,
                                            subscriptionDetailsIndex) {
                                          final subscriptionDetailsItem =
                                              subscriptionDetails[
                                                  subscriptionDetailsIndex];
                                          return Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'SUBSCRIPTION_ORDER_PRODUCTS_INFO_Contain');
                                                    logFirebaseEvent(
                                                        'Container_update_page_state');
                                                    _model.isLoadingIndiocator =
                                                        true;
                                                    safeSetState(() {});
                                                    if (FFAppConstants
                                                            .orderOutForDelivery !=
                                                        getJsonField(
                                                          subscriptionDetailsItem,
                                                          r'''$.order_status''',
                                                        ).toString()) {
                                                      if (FFAppConstants
                                                              .orderStatusCompleted !=
                                                          getJsonField(
                                                            subscriptionDetailsItem,
                                                            r'''$.order_status''',
                                                          ).toString()) {
                                                        if (FFAppConstants
                                                                .orderStatusCancelled !=
                                                            getJsonField(
                                                              subscriptionDetailsItem,
                                                              r'''$.order_status''',
                                                            ).toString()) {
                                                          if (FFAppConstants
                                                                  .orderStatusPending ==
                                                              getJsonField(
                                                                subscriptionDetailsItem,
                                                                r'''$.order_status''',
                                                              ).toString()) {
                                                            if (functions
                                                                    .checkSubscriptionDate(
                                                                        getJsonField(
                                                                  subscriptionDetailsItem,
                                                                  r'''$.delivery_date''',
                                                                ).toString()) ==
                                                                true) {
                                                              if (FFAppConstants
                                                                      .orderStatusPause !=
                                                                  getJsonField(
                                                                    subscriptionDetailsItem,
                                                                    r'''$.order_status''',
                                                                  ).toString()) {
                                                                logFirebaseEvent(
                                                                    'Container_backend_call');
                                                                _model.apiResultOrderPause1 =
                                                                    await QuickartGroup
                                                                        .subscriptionOrderPauseCall
                                                                        .call(
                                                                  susbscriptionId:
                                                                      getJsonField(
                                                                    subscriptionDetailsItem,
                                                                    r'''$.subscription_id''',
                                                                  ).toString(),
                                                                  pauseReason:
                                                                      'pause by customer',
                                                                  cartId:
                                                                      getJsonField(
                                                                    subscriptionDetailsItem,
                                                                    r'''$.cart_id''',
                                                                  ).toString(),
                                                                  storeOrderId:
                                                                      getJsonField(
                                                                    subscriptionDetailsItem,
                                                                    r'''$.store_order_id''',
                                                                  ).toString(),
                                                                  platform: isiOS
                                                                      ? 'ios'
                                                                      : 'android',
                                                                );

                                                                if ((_model
                                                                        .apiResultOrderPause1
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  logFirebaseEvent(
                                                                      'Container_refresh_database_request');
                                                                  safeSetState(() =>
                                                                      _model.apiRequestCompleter2 =
                                                                          null);
                                                                  await _model
                                                                      .waitForApiRequestCompleted2();
                                                                  logFirebaseEvent(
                                                                      'Container_wait__delay');
                                                                  await Future
                                                                      .delayed(
                                                                    Duration(
                                                                      milliseconds:
                                                                          200,
                                                                    ),
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.isLoadingIndiocator =
                                                                      false;
                                                                  _model.isUpdatedJson =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Container_show_snack_bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        getJsonField(
                                                                          (_model.apiResultOrderPause1?.jsonBody ??
                                                                              ''),
                                                                          r'''$.message''',
                                                                        ).toString(),
                                                                        style: GoogleFonts
                                                                            .montserrat(
                                                                          color:
                                                                              FFAppConstants.indigoColor,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1250),
                                                                      backgroundColor:
                                                                          FFAppConstants
                                                                              .primaryPurpleE4D8F5,
                                                                    ),
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.isLoadingIndiocator =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Container_update_app_state');

                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.isLoadingIndiocator =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Container_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    FFAppConstants
                                                                        .subscriptionDateMsg,
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      color: FFAppConstants
                                                                          .indigoColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          1500),
                                                                  backgroundColor:
                                                                      FFAppConstants
                                                                          .primaryPurpleE4D8F5,
                                                                ),
                                                              );
                                                              logFirebaseEvent(
                                                                  'Container_update_page_state');
                                                              _model.isLoadingIndiocator =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          } else {
                                                            if (FFAppConstants
                                                                    .orderStatusConfirm ==
                                                                getJsonField(
                                                                  subscriptionDetailsItem,
                                                                  r'''$.order_status''',
                                                                ).toString()) {
                                                              logFirebaseEvent(
                                                                  'Container_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'This order is under process.',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FFAppConstants
                                                                          .indigoColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          1000),
                                                                  backgroundColor:
                                                                      FFAppConstants
                                                                          .primaryPurpleE4D8F5,
                                                                ),
                                                              );
                                                              logFirebaseEvent(
                                                                  'Container_update_page_state');
                                                              _model.isLoadingIndiocator =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              if (FFAppConstants
                                                                      .orderStatusPause ==
                                                                  getJsonField(
                                                                    subscriptionDetailsItem,
                                                                    r'''$.order_status''',
                                                                  ).toString()) {
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.isLoadingIndiocator =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.pauseResume =
                                                                    true;
                                                                _model.orderTimeSlot =
                                                                    getJsonField(
                                                                  subscriptionDetailsItem,
                                                                  r'''$.time_slot''',
                                                                ).toString();
                                                                _model.subscriptionId =
                                                                    getJsonField(
                                                                  subscriptionDetailsItem,
                                                                  r'''$.subscription_id''',
                                                                ).toString();
                                                                _model.subscriptionCartId =
                                                                    getJsonField(
                                                                  subscriptionDetailsItem,
                                                                  r'''$.cart_id''',
                                                                ).toString();
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Container_show_snack_bar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'You can\'t pause or resume this order.',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1200),
                                                                    backgroundColor:
                                                                        FFAppConstants
                                                                            .primaryPurpleE4D8F5,
                                                                  ),
                                                                );
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.isLoadingIndiocator =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            }
                                                          }
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Container_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'This order has been cancelled',
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  color: FFAppConstants
                                                                      .indigoColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      1500),
                                                              backgroundColor:
                                                                  FFAppConstants
                                                                      .primaryPurpleE4D8F5,
                                                            ),
                                                          );
                                                          logFirebaseEvent(
                                                              'Container_update_page_state');
                                                          _model.isLoadingIndiocator =
                                                              false;
                                                          safeSetState(() {});
                                                        }
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Container_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'This order has been delivered succesfully',
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                color: FFAppConstants
                                                                    .indigoColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1500),
                                                            backgroundColor:
                                                                FFAppConstants
                                                                    .primaryPurpleE4D8F5,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Container_update_page_state');
                                                        _model.isLoadingIndiocator =
                                                            false;
                                                        safeSetState(() {});
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Container_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Your order is on its way for delivery',
                                                            style: TextStyle(
                                                              color: FFAppConstants
                                                                  .indigoColor,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  1000),
                                                          backgroundColor:
                                                              FFAppConstants
                                                                  .primaryPurpleE4D8F5,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Container_update_page_state');
                                                      _model.isLoadingIndiocator =
                                                          false;
                                                      safeSetState(() {});
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                14.0),
                                                        topRight:
                                                            Radius.circular(
                                                                14.0),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                16.0),
                                                      ),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: functions
                                                                  .setOrderInfoBgColor(
                                                                      getJsonField(
                                                                subscriptionDetailsItem,
                                                                r'''$.order_status''',
                                                              ).toString()),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        14.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        14.0),
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFAppConstants
                                                                              .orderStatusOutForDelivery ==
                                                                          getJsonField(
                                                                            subscriptionDetailsItem,
                                                                            r'''$.order_status''',
                                                                          ).toString()
                                                                      ? 'Out For Delivery'
                                                                      : getJsonField(
                                                                          subscriptionDetailsItem,
                                                                          r'''$.order_status''',
                                                                        ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: functions
                                                                            .setOrderInfoBgColorCopy(getJsonField(
                                                                          subscriptionDetailsItem,
                                                                          r'''$.order_status''',
                                                                        ).toString()),
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 58.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: functions
                                                                  .setOrderInfoBgColor(
                                                                      getJsonField(
                                                                subscriptionDetailsItem,
                                                                r'''$.order_status''',
                                                              ).toString()),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        14.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        14.0),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    functions.customDateFormatter(
                                                                        getJsonField(
                                                                          subscriptionDetailsItem,
                                                                          r'''$.delivery_date''',
                                                                        ).toString(),
                                                                        '6')!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              functions.setOrderInfoBgColorCopy(getJsonField(
                                                                            subscriptionDetailsItem,
                                                                            r'''$.order_status''',
                                                                          ).toString()),
                                                                          fontSize:
                                                                              8.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    width: 90.0,
                                                                    height: 0.5,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: functions
                                                                          .setOrderInfoBgColorCopy(
                                                                              getJsonField(
                                                                        subscriptionDetailsItem,
                                                                        r'''$.order_status''',
                                                                      ).toString()),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    functions
                                                                        .dateFormatterSubscription(
                                                                            getJsonField(
                                                                      subscriptionDetailsItem,
                                                                      r'''$.time_slot''',
                                                                    ).toString())!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              functions.setOrderInfoBgColorCopy(getJsonField(
                                                                            subscriptionDetailsItem,
                                                                            r'''$.order_status''',
                                                                          ).toString()),
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 4.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 7.0,
                                                    height: 15.0,
                                                    decoration: BoxDecoration(
                                                      color: functions
                                                          .setOrderInfoBgColor(
                                                              getJsonField(
                                                        subscriptionDetailsItem,
                                                        r'''$.order_status''',
                                                      ).toString()),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFDFE3E8),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 15.0, 0.0),
                                                  child: Container(
                                                    width: 7.0,
                                                    height: 15.0,
                                                    decoration: BoxDecoration(
                                                      color: functions
                                                          .setOrderInfoBgColor(
                                                              getJsonField(
                                                        subscriptionDetailsItem,
                                                        r'''$.order_status''',
                                                      ).toString()),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD3D8DF),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_model.pauseResume == true)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'SUBSCRIPTION_ORDER_PRODUCTS_INFO_PauseRe');
                        logFirebaseEvent(
                            'PauseResumeContainer_update_page_state');
                        _model.pauseResume = false;
                        safeSetState(() {});
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: Color(0x5114181B),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Schedule Delivery',
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
                                                color:
                                                    FFAppConstants.indigoColor,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.cancel_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 28.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: QuickartGroup
                                        .subscriptionresumetimeslotCall
                                        .call(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 60.0,
                                            height: 60.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0xFF2E317E),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final columnSubscriptionresumetimeslotResponse =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 10.0, 0.0, 5.0),
                                              child: Text(
                                                'Choose a date',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FFAppConstants
                                                              .blackColor0A0A0A,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 5.0, 15.0, 10.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.48,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 2.0, 2.0, 2.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final resumeTimeSlot =
                                                        getJsonField(
                                                      columnSubscriptionresumetimeslotResponse
                                                          .jsonBody,
                                                      r'''$.data''',
                                                    ).toList();
                                                    if (resumeTimeSlot
                                                        .isEmpty) {
                                                      return Image.asset(
                                                        'assets/images/Clock.png',
                                                      );
                                                    }

                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 6,
                                                        crossAxisSpacing: 8.0,
                                                        mainAxisSpacing: 10.0,
                                                        childAspectRatio: 0.75,
                                                      ),
                                                      itemCount:
                                                          resumeTimeSlot.length,
                                                      itemBuilder: (context,
                                                          resumeTimeSlotIndex) {
                                                        final resumeTimeSlotItem =
                                                            resumeTimeSlot[
                                                                resumeTimeSlotIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'SUBSCRIPTION_ORDER_PRODUCTS_INFO_Column_');
                                                            logFirebaseEvent(
                                                                'Column_update_page_state');
                                                            _model.selectedResumeDate =
                                                                getJsonField(
                                                              resumeTimeSlotItem,
                                                              r'''$.date''',
                                                            ).toString();
                                                            safeSetState(() {});
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    color: functions.setbackgroundColororderResume(
                                                                        getJsonField(
                                                                          resumeTimeSlotItem,
                                                                          r'''$.date''',
                                                                        ).toString(),
                                                                        _model.selectedResumeDate,
                                                                        0,
                                                                        0),
                                                                    size: 46.0,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        functions.setDateFormatter(
                                                                            getJsonField(
                                                                              resumeTimeSlotItem,
                                                                              r'''$.date''',
                                                                            ).toString(),
                                                                            'dd',
                                                                            'yyyy-MM-dd')!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          3.0,
                                                                          6.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        functions.setDateFormatter(
                                                                            getJsonField(
                                                                              resumeTimeSlotItem,
                                                                              r'''$.date''',
                                                                            ).toString(),
                                                                            'MMM',
                                                                            'yyyy-MM-dd')!,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: functions.setbackgroundColororderResumeCopy(
                                                                                  getJsonField(
                                                                                    resumeTimeSlotItem,
                                                                                    r'''$.date''',
                                                                                  ).toString(),
                                                                                  _model.selectedResumeDate,
                                                                                  0,
                                                                                  0),
                                                                              fontSize: 7.5,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                functions.setDateFormatter(
                                                                    getJsonField(
                                                                      resumeTimeSlotItem,
                                                                      r'''$.date''',
                                                                    ).toString(),
                                                                    'EEE',
                                                                    'yyyy-MM-dd')!,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .montserrat(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FFAppConstants
                                                                          .blackColor0A0A0A,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'SUBSCRIPTION_ORDER_PRODUCTS_INFO_CONFIRM');
                                        if (functions.isNullOrEmpty(
                                                _model.selectedResumeDate) ==
                                            false) {
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.subscriptionOrderResumeAPI1 =
                                              await QuickartGroup
                                                  .subscriptionOrderResumeCall
                                                  .call(
                                            subscriptionId:
                                                _model.subscriptionId,
                                            cartId: _model.subscriptionCartId,
                                            timeSlot: _model.orderTimeSlot,
                                            delieveryDate:
                                                _model.selectedResumeDate,
                                            platform: isiOS ? 'ios' : 'android',
                                          );

                                          if ((_model
                                                  .subscriptionOrderResumeAPI1
                                                  ?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'Button_refresh_database_request');
                                            safeSetState(() => _model
                                                .apiRequestCompleter2 = null);
                                            await _model
                                                .waitForApiRequestCompleted2();
                                            logFirebaseEvent(
                                                'Button_wait__delay');
                                            await Future.delayed(
                                              Duration(
                                                milliseconds: 200,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'Button_update_page_state');
                                            _model.pauseResume = false;
                                            _model.isUpdatedJson = true;
                                            safeSetState(() {});
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'API failed',
                                                  style: TextStyle(
                                                    color: FFAppConstants
                                                        .indigoColor,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1200),
                                                backgroundColor: FFAppConstants
                                                    .primaryPurpleE4D8F5,
                                              ),
                                            );
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
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
                                                      CustomAlertDailogWidget(
                                                    des:
                                                        'Please selected delivery date',
                                                    height: 120.0,
                                                    title: ' ',
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Confirm',
                                      options: FFButtonOptions(
                                        width: 180.0,
                                        height: 45.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
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
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        borderSide: BorderSide(
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                  if (_model.isLoadingIndiocator == true)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x5114181B),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/new_loader.gif',
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
