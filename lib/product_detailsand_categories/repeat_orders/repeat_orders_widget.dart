import 'dart:io';

import '/backend/api_requests/api_calls.dart';
import '/components/bottomnav_bar/bottomnav_bar_widget.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/components/empty_data_two_line_component/empty_data_two_line_component_widget.dart';
import '/components/varient_botttom_sheet/varient_botttom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'repeat_orders_model.dart';
export 'repeat_orders_model.dart';

class RepeatOrdersWidget extends StatefulWidget {
  const RepeatOrdersWidget({
    super.key,
    required this.repeat,
  });

  final String? repeat;

  static String routeName = 'repeatOrders';
  static String routePath = '/repeatOrders';

  @override
  State<RepeatOrdersWidget> createState() => _RepeatOrdersWidgetState();
}

class _RepeatOrdersWidgetState extends State<RepeatOrdersWidget> {
  late RepeatOrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RepeatOrdersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'repeatOrders'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('REPEAT_ORDERS_repeatOrders_ON_INIT_STATE');
      logFirebaseEvent('repeatOrders_refresh_database_request');
      safeSetState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
      logFirebaseEvent('repeatOrders_backend_call');
      _model.apiResultsWeeksRepeatOrder =
          await QuickartGroup.totaldeliveriesCall.call();

      if ((_model.apiResultsWeeksRepeatOrder?.succeeded ?? true)) {
        logFirebaseEvent('repeatOrders_update_app_state');
        FFAppState().varientID = 0;
        FFAppState().isSubCartVisible = false;
      }
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
      child: SafeArea(
        top: false,
        bottom: Platform.isAndroid ? true : false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FFAppConstants.whiteColor,
          appBar: AppBar(
            backgroundColor: FFAppConstants.appBarColor,
            automaticallyImplyLeading: false,
            title: Text(
              'Repeat Orders',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: FFAppConstants.appBarIconandTitleColor,
                    fontSize: FFAppConstants.appBartitleFont.toDouble(),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('REPEAT_ORDERS_PAGE_Stack_lqb6o7yh_ON_TAP');
              logFirebaseEvent('Stack_update_app_state');
              FFAppState().isCartShow = false;
              safeSetState(() {});
              logFirebaseEvent('Stack_update_app_state');
              FFAppState().isSubCartVisible = false;
              safeSetState(() {});
            },
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.835,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: (_model.apiRequestCompleter ??=
                              Completer<ApiCallResponse>()
                                ..complete(QuickartGroup.repeatordersCall.call(
                                  userid: FFAppState().userID,
                                  storeid: FFAppState().storeID,
                                  deviceID: FFAppState().deviceID,
                                  platform: isiOS ? 'ios' : 'android',
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: Image.asset(
                              'assets/images/new_loader.gif',
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              height: MediaQuery.sizeOf(context).height * 0.25,
                            ),
                          );
                        }
                        final listViewRepeatordersResponse = snapshot.data!;
        
                        return Builder(
                          builder: (context) {
                            final repeatList = getJsonField(
                              listViewRepeatordersResponse.jsonBody,
                              r'''$.data''',
                            ).toList();
                            if (repeatList.isEmpty) {
                              return Center(
                                child: EmptyDataTwoLineComponentWidget(
                                  title: FFAppState().productMsg,
                                  msg: ' ',
                                  isShop: 1,
                                ),
                              );
                            }
        
                            return RefreshIndicator(
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'REPEAT_ORDERS_ListView_9sawot49_ON_PULL_');
                                logFirebaseEvent(
                                    'ListView_refresh_database_request');
                                safeSetState(
                                    () => _model.apiRequestCompleter = null);
                                await _model.waitForApiRequestCompleted();
                              },
                              child: ListView.separated(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  30.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: repeatList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 5.0),
                                itemBuilder: (context, repeatListIndex) {
                                  final repeatListItem =
                                      repeatList[repeatListIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'REPEAT_ORDERS_Container_w7h5xrgi_ON_TAP');
                                        logFirebaseEvent('Container_navigate_to');
        
                                        context.pushNamed(
                                            ProductDetailsScreenWidget.routeName);
        
                                        logFirebaseEvent(
                                            'Container_update_app_state');
                                        FFAppState().productID = getJsonField(
                                          repeatListItem,
                                          r'''$.product_id''',
                                        ).toString();
                                        FFAppState().productName = getJsonField(
                                          repeatListItem,
                                          r'''$.product_name''',
                                        ).toString();
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Container_custom_action');
                                        await actions.facebookEventClass(
                                          getJsonField(
                                            repeatListItem,
                                            r'''$.product_id''',
                                          ).toString(),
                                          getJsonField(
                                            repeatListItem,
                                            r'''$.product_name''',
                                          ).toString(),
                                          'product detail',
                                          getJsonField(
                                            repeatListItem,
                                            r'''$.price''',
                                          ),
                                          0,
                                          getJsonField(
                                            repeatListItem,
                                            r'''$.mrp''',
                                          ),
                                          'productdetail',
                                          FFAppState().emptyJson,
                                          ' ',
                                          ' ',
                                          ' ',
                                          ' ',
                                          ' ',
                                        );
                                        logFirebaseEvent(
                                            'Container_google_analytics_event');
                                        logFirebaseEvent(
                                            'ProductDetailScreenAnalytics');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 155.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FFAppConstants.lightGreyColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  getJsonField(
                                                    repeatListItem,
                                                    r'''$.varient_image''',
                                                  ).toString(),
                                                  width: 100.0,
                                                  height: 100.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(2.0, 0.0,
                                                                  0.0, 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize.max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery
                                                                            .sizeOf(
                                                                                context)
                                                                        .width -
                                                                    200,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              3.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      repeatListItem,
                                                                      r'''$.product_name''',
                                                                    )
                                                                        .toString()
                                                                        .maybeHandleOverflow(
                                                                          maxChars:
                                                                              60,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    maxLines: 2,
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
                                                                              12.0,
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                getJsonField(
                                                                              repeatListItem,
                                                                              r'''$.qty''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppConstants.blackColor0A0A0A,
                                                                                  fontSize: 11.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                ' ',
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              color:
                                                                                  FFAppConstants.blackColor0A0A0A,
                                                                              fontWeight:
                                                                                  FontWeight.w600,
                                                                              fontSize:
                                                                                  10.0,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                getJsonField(
                                                                              repeatListItem,
                                                                              r'''$.unit''',
                                                                            ).toString(),
                                                                            style:
                                                                                GoogleFonts.montserrat(),
                                                                          ),
                                                                          TextSpan(
                                                                            text: (getJsonField(
                                                                                      repeatListItem,
                                                                                      r'''$.varients''',
                                                                                    ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
                                                                                        .withoutNulls
                                                                                        .length >=
                                                                                    2
                                                                                ? '  ${(getJsonField(
                                                                                    repeatListItem,
                                                                                    r'''$.varients''',
                                                                                  ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>).withoutNulls?.length?.toString()} options'
                                                                                : ' v',
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              color:
                                                                                  FFAppConstants.indigoColor,
                                                                              fontWeight:
                                                                                  FontWeight.w500,
                                                                              fontSize:
                                                                                  12.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(
                                                                                context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font:
                                                                                  GoogleFonts.montserrat(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize:
                                                                                  12.0,
                                                                              letterSpacing:
                                                                                  0.0,
                                                                              fontWeight:
                                                                                  FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle:
                                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context)
                                                                                .textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text:
                                                                                  'AED ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.montserrat(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FFAppConstants.blackColor0A0A0A,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text:
                                                                                  functions.setDecimalValue(getJsonField(
                                                                                repeatListItem,
                                                                                r'''$.price''',
                                                                              ).toString())!,
                                                                              style:
                                                                                  GoogleFonts.montserrat(
                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.montserrat(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (getJsonField(
                                                                          listViewRepeatordersResponse
                                                                              .jsonBody,
                                                                          r'''$.data.total_mrp''',
                                                                        ) !=
                                                                        getJsonField(
                                                                          listViewRepeatordersResponse
                                                                              .jsonBody,
                                                                          r'''$.data.price''',
                                                                        ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: 'AED ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: FFAppConstants.blackColor666666,
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      decoration: TextDecoration.lineThrough,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: getJsonField(
                                                                                  repeatListItem,
                                                                                  r'''$.total_mrp''',
                                                                                ).toString(),
                                                                                style: GoogleFonts.montserrat(
                                                                                  color: FFAppConstants.blackColor666666,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontSize: 10.0,
                                                                                  decoration: TextDecoration.lineThrough,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            'Ordered  ',
                                                                        style: FlutterFlowTheme.of(
                                                                                context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font:
                                                                                  GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color:
                                                                                  FFAppConstants.blackColor0A0A0A,
                                                                              fontSize:
                                                                                  12.0,
                                                                              letterSpacing:
                                                                                  0.0,
                                                                              fontWeight:
                                                                                  FontWeight.w500,
                                                                              fontStyle:
                                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            getJsonField(
                                                                          repeatListItem,
                                                                          r'''$.ordercount''',
                                                                        ).toString(),
                                                                        style: GoogleFonts
                                                                            .montserrat(
                                                                          color: FFAppConstants
                                                                              .green68DF3F,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            ' times',
                                                                        style: GoogleFonts
                                                                            .montserrat(
                                                                          color: FFAppConstants
                                                                              .blackColor0A0A0A,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font: GoogleFonts
                                                                              .montserrat(
                                                                            fontWeight: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .fontWeight,
                                                                            fontStyle: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .fontStyle,
                                                                          ),
                                                                          color: FFAppConstants
                                                                              .green68DF3F,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (functions
                                                                          .checkVariantsWithStock(
                                                                              getJsonField(
                                                                        repeatListItem,
                                                                        r'''$.varients''',
                                                                      )) ==
                                                                      true) {
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                      child: Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize
                                                                                .max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        children:
                                                                            [
                                                                          if ((FFAppConstants.subscriptionAvailability ==
                                                                                  getJsonField(
                                                                                    repeatListItem,
                                                                                    r'''$.availability''',
                                                                                  ).toString()) ||
                                                                              (FFAppConstants.allAvailability ==
                                                                                  getJsonField(
                                                                                    repeatListItem,
                                                                                    r'''$.availability''',
                                                                                  ).toString()))
                                                                            Align(
                                                                              alignment:
                                                                                  AlignmentDirectional(-1.0, 0.0),
                                                                              child:
                                                                                  Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 0.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: MediaQuery.sizeOf(context).width < 370.0 ? 120.0 : 140.0,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: Visibility(
                                                                                    visible: (FFAppConstants.subscriptionAvailability ==
                                                                                            getJsonField(
                                                                                              repeatListItem,
                                                                                              r'''$.availability''',
                                                                                            ).toString()) ||
                                                                                        (FFAppConstants.allAvailability ==
                                                                                            getJsonField(
                                                                                              repeatListItem,
                                                                                              r'''$.availability''',
                                                                                            ).toString()),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        if ((FFAppConstants.isSubcribe !=
                                                                                                getJsonField(
                                                                                                  repeatListItem,
                                                                                                  r'''$.isSubscription''',
                                                                                                ).toString()) &&
                                                                                            ((getJsonField(
                                                                                                  repeatListItem,
                                                                                                  r'''$.varients''',
                                                                                                ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
                                                                                                    .withoutNulls
                                                                                                    ?.length ==
                                                                                                1)) {
                                                                                          return Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('REPEAT_ORDERS_Container_8pmvu7xh_ON_TAP');
                                                                                                logFirebaseEvent('Container_navigate_to');
        
                                                                                                context.pushNamed(CartSubscriptionScreenWidget.routeName);
                                                                                              },
                                                                                              child: Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 2.0,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(8.0),
                                                                                                    bottomRight: Radius.circular(8.0),
                                                                                                    topLeft: Radius.circular(8.0),
                                                                                                    topRight: Radius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 35.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FFAppConstants.darkGreen,
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(8.0),
                                                                                                      topLeft: Radius.circular(8.0),
                                                                                                      topRight: Radius.circular(8.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'SUBSCRIBED',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: FFAppConstants.whiteColor,
                                                                                                            fontSize: MediaQuery.sizeOf(context).width < 375.0 ? 8.0 : 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          return Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('REPEAT_ORDERS_Container_hkqaw8ib_ON_TAP');
                                                                                                if (functions.checkVariantFeatureCondition(repeatListItem) == true) {
                                                                                                  logFirebaseEvent('Container_bottom_sheet');
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    useSafeArea: true,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return GestureDetector(
                                                                                                        onTap: () {
                                                                                                          FocusScope.of(context).unfocus();
                                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                                        },
                                                                                                        child: Padding(
                                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                                          child: VarientBotttomSheetWidget(
                                                                                                            productModel: repeatListItem,
                                                                                                            cartType: 'subsciption',
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
        
                                                                                                  logFirebaseEvent('Container_refresh_database_request');
                                                                                                  safeSetState(() => _model.apiRequestCompleter = null);
                                                                                                  await _model.waitForApiRequestCompleted(maxWait: 5000);
                                                                                                } else {
                                                                                                  logFirebaseEvent('Container_update_page_state');
                                                                                                  _model.availableDays = getJsonField(
                                                                                                    repeatListItem,
                                                                                                    r'''$.available_days''',
                                                                                                  ).toString();
                                                                                                  safeSetState(() {});
                                                                                                  logFirebaseEvent('Container_update_app_state');
                                                                                                  FFAppState().isSunSelected = false;
                                                                                                  FFAppState().isMonSelected = false;
                                                                                                  FFAppState().isTueSelected = false;
                                                                                                  FFAppState().isThuSelected = false;
                                                                                                  FFAppState().isFriSelected = false;
                                                                                                  FFAppState().isSatSelected = false;
                                                                                                  FFAppState().isWedSelected = false;
                                                                                                  FFAppState().isWeekSelected = 0;
                                                                                                  FFAppState().isDeliveryTimeSlotSelected = 'no';
                                                                                                  FFAppState().subCartVisibility = true;
                                                                                                  FFAppState().varientID = getJsonField(
                                                                                                    repeatListItem,
                                                                                                    r'''$.varient_id''',
                                                                                                  );
                                                                                                  FFAppState().refreshTrigger = true;
                                                                                                  safeSetState(() {});
                                                                                                  logFirebaseEvent('Container_haptic_feedback');
                                                                                                  HapticFeedback.mediumImpact();
                                                                                                }
                                                                                              },
                                                                                              child: Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 0.0,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(8.0),
                                                                                                    bottomRight: Radius.circular(8.0),
                                                                                                    topLeft: Radius.circular(8.0),
                                                                                                    topRight: Radius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  height: 30.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FFAppConstants.darkGreen,
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(8.0),
                                                                                                      topLeft: Radius.circular(8.0),
                                                                                                      topRight: Radius.circular(8.0),
                                                                                                    ),
                                                                                                    border: Border.all(
                                                                                                      color: FFAppConstants.darkGreen,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              'SUBSCRIBE ',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.montserrat(
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    color: FFAppConstants.whiteColor,
                                                                                                                    fontSize: MediaQuery.sizeOf(context).width < 375.0 ? 8.0 : 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                            child: Text(
                                                                                                              () {
                                                                                                                if (FFAppState().nullValue ==
                                                                                                                    getJsonField(
                                                                                                                      repeatListItem,
                                                                                                                      r'''$.percentage''',
                                                                                                                    ).toString()) {
                                                                                                                  return ' ';
                                                                                                                } else if (FFAppState().qtyZeroCheck ==
                                                                                                                    getJsonField(
                                                                                                                      repeatListItem,
                                                                                                                      r'''$.percentage''',
                                                                                                                    )) {
                                                                                                                  return ' ';
                                                                                                                } else {
                                                                                                                  return '& SAVE  ${getJsonField(
                                                                                                                    repeatListItem,
                                                                                                                    r'''$.percentage''',
                                                                                                                  ).toString()}%';
                                                                                                                }
                                                                                                              }(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.montserrat(
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    color: FFAppConstants.whiteColor,
                                                                                                                    fontSize: MediaQuery.sizeOf(context).width < 375.0 ? 8.0 : 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment:
                                                                                  AlignmentDirectional(-1.0, 0.0),
                                                                              child:
                                                                                  Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 5.0, 0.0, 5.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      if (FFAppState().qtyZeroCheck ==
                                                                                          getJsonField(
                                                                                            repeatListItem,
                                                                                            r'''$.total_cart_qty''',
                                                                                          )) {
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              logFirebaseEvent('REPEAT_ORDERS_PAGE_ADD_BTN_ON_TAP');
                                                                                              if (functions.checkVariantFeatureCondition(repeatListItem) == true) {
                                                                                                logFirebaseEvent('Button_bottom_sheet');
                                                                                                await showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  useSafeArea: true,
                                                                                                  context: context,
                                                                                                  builder: (context) {
                                                                                                    return GestureDetector(
                                                                                                      onTap: () {
                                                                                                        FocusScope.of(context).unfocus();
                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                      },
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                                        child: VarientBotttomSheetWidget(
                                                                                                          productModel: repeatListItem,
                                                                                                          cartType: 'daily',
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() {}));
        
                                                                                                logFirebaseEvent('Button_refresh_database_request');
                                                                                                safeSetState(() => _model.apiRequestCompleter = null);
                                                                                                await _model.waitForApiRequestCompleted(maxWait: 500);
                                                                                              } else {
                                                                                                logFirebaseEvent('Button_custom_action');
                                                                                                _model.connectivityResultAddCart = await actions.checkInternetConnection();
                                                                                                if (_model.connectivityResultAddCart == true) {
                                                                                                  logFirebaseEvent('Button_haptic_feedback');
                                                                                                  HapticFeedback.mediumImpact();
                                                                                                  logFirebaseEvent('Button_backend_call');
                                                                                                  _model.apiResultAddToCart = await QuickartGroup.addToCartCall.call(
                                                                                                    userid: FFAppState().userID,
                                                                                                    storeid: FFAppState().storeID,
                                                                                                    varientid: getJsonField(
                                                                                                      repeatListItem,
                                                                                                      r'''$.varient_id''',
                                                                                                    ).toString(),
                                                                                                    deviceid: FFAppState().deviceID,
                                                                                                    qty: '1',
                                                                                                    itemPrice: getJsonField(
                                                                                                      repeatListItem,
                                                                                                      r'''$.price''',
                                                                                                    ).toString(),
                                                                                                    itemName: getJsonField(
                                                                                                      repeatListItem,
                                                                                                      r'''$.product_name''',
                                                                                                    ).toString(),
                                                                                                    platform: isiOS ? 'ios' : 'android',
                                                                                                  );
        
                                                                                                  if ((_model.apiResultAddToCart?.succeeded ?? true)) {
                                                                                                    if (FFAppConstants.checkStatus ==
                                                                                                        getJsonField(
                                                                                                          (_model.apiResultAddToCart?.jsonBody ?? ''),
                                                                                                          r'''$.status''',
                                                                                                        ).toString()) {
                                                                                                      logFirebaseEvent('Button_refresh_database_request');
                                                                                                      safeSetState(() => _model.apiRequestCompleter = null);
                                                                                                      await _model.waitForApiRequestCompleted(maxWait: 2000);
                                                                                                      logFirebaseEvent('Button_update_app_state');
                                                                                                      FFAppState().isCartShow = false;
                                                                                                      FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                        (_model.apiResultAddToCart?.jsonBody ?? ''),
                                                                                                      )!;
                                                                                                      FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                          .savingPrice(
                                                                                                            (_model.apiResultAddToCart?.jsonBody ?? ''),
                                                                                                          )!
                                                                                                          .toString());
                                                                                                      FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                          .totalPrice(
                                                                                                            (_model.apiResultAddToCart?.jsonBody ?? ''),
                                                                                                          )!
                                                                                                          .toString());
                                                                                                      FFAppState().update(() {});
                                                                                                      logFirebaseEvent('Button_custom_action');
                                                                                                      await actions.facebookEventClass(
                                                                                                        getJsonField(
                                                                                                          repeatListItem,
                                                                                                          r'''$.varient_id''',
                                                                                                        ).toString(),
                                                                                                        getJsonField(
                                                                                                          repeatListItem,
                                                                                                          r'''$.product_name''',
                                                                                                        ).toString(),
                                                                                                        'product',
                                                                                                        functions.stringToDouble(getJsonField(
                                                                                                          repeatListItem,
                                                                                                          r'''$.price''',
                                                                                                        ).toString()),
                                                                                                        getJsonField(
                                                                                                              repeatListItem,
                                                                                                              r'''$.cart_qty''',
                                                                                                            ) +
                                                                                                            1,
                                                                                                        functions.stringToDouble(getJsonField(
                                                                                                          repeatListItem,
                                                                                                          r'''$.mrp''',
                                                                                                        ).toString()),
                                                                                                        'add',
                                                                                                        FFAppState().emptyJson,
                                                                                                        ' ',
                                                                                                        ' ',
                                                                                                        ' ',
                                                                                                        ' ',
                                                                                                        ' ',
                                                                                                      );
                                                                                                      logFirebaseEvent('Button_google_analytics_event');
                                                                                                      logFirebaseEvent('AddToCartButtonAnalytics');
                                                                                                      logFirebaseEvent('Button_wait__delay');
                                                                                                      await Future.delayed(
                                                                                                        Duration(
                                                                                                          milliseconds: 500,
                                                                                                        ),
                                                                                                      );
                                                                                                    } else {
                                                                                                      logFirebaseEvent('Button_show_snack_bar');
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            getJsonField(
                                                                                                              (_model.apiResultAddToCart?.jsonBody ?? ''),
                                                                                                              r'''$.message''',
                                                                                                            ).toString(),
                                                                                                            style: GoogleFonts.montserrat(
                                                                                                              color: FFAppConstants.indigoColor,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontSize: 12.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          duration: Duration(milliseconds: 4000),
                                                                                                          backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                  } else {
                                                                                                    logFirebaseEvent('Button_show_snack_bar');
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          getJsonField(
                                                                                                            (_model.apiResultAddToCart?.jsonBody ?? ''),
                                                                                                            r'''$.message''',
                                                                                                          ).toString(),
                                                                                                          style: GoogleFonts.montserrat(
                                                                                                            color: FFAppConstants.indigoColor,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontSize: 12.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        duration: Duration(milliseconds: 4000),
                                                                                                        backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
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
                                                                                                          fontSize: 12.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      duration: Duration(milliseconds: 4000),
                                                                                                      backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                              }
        
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            text: 'ADD',
                                                                                            options: FFButtonOptions(
                                                                                              width: 80.0,
                                                                                              height: 30.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FFAppConstants.calculatorColor,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    font: GoogleFonts.montserrat(
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: FFAppConstants.whiteColor,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                  ),
                                                                                              borderSide: BorderSide(
                                                                                                color: Colors.transparent,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return Material(
                                                                                          color: Colors.transparent,
                                                                                          elevation: 0.0,
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              border: Border.all(
                                                                                                color: FFAppConstants.calculatorColor,
                                                                                                width: 0.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.2, 0.2, 0.2, 0.2),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: () async {
                                                                                                        logFirebaseEvent('REPEAT_ORDERS_PAGE__BTN_ON_TAP');
                                                                                                        if (functions.checkVariantFeatureCondition(repeatListItem) == true) {
                                                                                                          logFirebaseEvent('Button_bottom_sheet');
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            useSafeArea: true,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () {
                                                                                                                  FocusScope.of(context).unfocus();
                                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                },
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: VarientBotttomSheetWidget(
                                                                                                                    productModel: repeatListItem,
                                                                                                                    cartType: 'daily',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
        
                                                                                                          logFirebaseEvent('Button_refresh_database_request');
                                                                                                          safeSetState(() => _model.apiRequestCompleter = null);
                                                                                                          await _model.waitForApiRequestCompleted(maxWait: 500);
                                                                                                        } else {
                                                                                                          logFirebaseEvent('Button_custom_action');
                                                                                                          _model.internetCheck = await actions.checkInternetConnection();
                                                                                                          if (_model.internetCheck == true) {
                                                                                                            logFirebaseEvent('Button_haptic_feedback');
                                                                                                            HapticFeedback.heavyImpact();
                                                                                                            logFirebaseEvent('Button_backend_call');
                                                                                                            _model.addtoCartAPI1 = await QuickartGroup.addToCartCall.call(
                                                                                                              userid: FFAppState().userID,
                                                                                                              storeid: FFAppState().storeID,
                                                                                                              deviceid: FFAppState().deviceID,
                                                                                                              qty: functions.addRemoveQTY(
                                                                                                                  getJsonField(
                                                                                                                    repeatListItem,
                                                                                                                    r'''$.cart_qty''',
                                                                                                                  ),
                                                                                                                  'remove'),
                                                                                                              varientid: getJsonField(
                                                                                                                repeatListItem,
                                                                                                                r'''$.varient_id''',
                                                                                                              ).toString(),
                                                                                                              platform: isiOS ? 'ios' : 'android',
                                                                                                            );
        
                                                                                                            if ((_model.addtoCartAPI1?.succeeded ?? true)) {
                                                                                                              logFirebaseEvent('Button_refresh_database_request');
                                                                                                              safeSetState(() => _model.apiRequestCompleter = null);
                                                                                                              await _model.waitForApiRequestCompleted(maxWait: 2000);
                                                                                                              logFirebaseEvent('Button_update_app_state');
                                                                                                              FFAppState().isCartShow = false;
                                                                                                              FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                                (_model.addtoCartAPI1?.jsonBody ?? ''),
                                                                                                              )!;
                                                                                                              FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                  .savingPrice(
                                                                                                                    (_model.addtoCartAPI1?.jsonBody ?? ''),
                                                                                                                  )!
                                                                                                                  .toString());
                                                                                                              FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                  .totalPrice(
                                                                                                                    (_model.addtoCartAPI1?.jsonBody ?? ''),
                                                                                                                  )!
                                                                                                                  .toString());
                                                                                                              FFAppState().refreshTrigger = true;
                                                                                                              FFAppState().update(() {});
                                                                                                              logFirebaseEvent('Button_google_analytics_event');
                                                                                                              logFirebaseEvent(
                                                                                                                'Remove From Cart',
                                                                                                                parameters: {
                                                                                                                  'API Name': 'Add To Cart',
                                                                                                                  'Screen Name': 'Repeat Order Screen',
                                                                                                                },
                                                                                                              );
                                                                                                              logFirebaseEvent('Button_custom_action');
                                                                                                              await actions.facebookEventClass(
                                                                                                                getJsonField(
                                                                                                                  repeatListItem,
                                                                                                                  r'''$.varient_id''',
                                                                                                                ).toString(),
                                                                                                                getJsonField(
                                                                                                                  repeatListItem,
                                                                                                                  r'''$.product_name''',
                                                                                                                ).toString(),
                                                                                                                'product',
                                                                                                                functions.stringToDouble(getJsonField(
                                                                                                                  repeatListItem,
                                                                                                                  r'''$.price''',
                                                                                                                ).toString()),
                                                                                                                getJsonField(
                                                                                                                      repeatListItem,
                                                                                                                      r'''$.cart_qty''',
                                                                                                                    ) -
                                                                                                                    1,
                                                                                                                functions.stringToDouble(getJsonField(
                                                                                                                  repeatListItem,
                                                                                                                  r'''$.mrp''',
                                                                                                                ).toString()),
                                                                                                                'remove',
                                                                                                                FFAppState().emptyJson,
                                                                                                                ' ',
                                                                                                                ' ',
                                                                                                                ' ',
                                                                                                                ' ',
                                                                                                                ' ',
                                                                                                              );
                                                                                                              logFirebaseEvent('Button_wait__delay');
                                                                                                              await Future.delayed(
                                                                                                                Duration(
                                                                                                                  milliseconds: 500,
                                                                                                                ),
                                                                                                              );
                                                                                                            } else {
                                                                                                              logFirebaseEvent('Button_show_snack_bar');
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    QuickartGroup.addToCartCall.message(
                                                                                                                      (_model.addtoCartAPI1?.jsonBody ?? ''),
                                                                                                                    )!,
                                                                                                                    style: TextStyle(
                                                                                                                      color: FFAppConstants.indigoColor,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                      fontSize: 12.0,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
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
                                                                                                                    fontSize: 15.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                duration: Duration(milliseconds: 1500),
                                                                                                                backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                        }
        
                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                      text: '-',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: 28.0,
                                                                                                        height: 35.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FFAppConstants.calculatorColor,
                                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FFAppConstants.whiteColor,
                                                                                                              fontSize: 20.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                        elevation: 0.0,
                                                                                                        borderRadius: BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(5.0),
                                                                                                          bottomRight: Radius.circular(0.0),
                                                                                                          topLeft: Radius.circular(5.0),
                                                                                                          topRight: Radius.circular(0.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: 34.0,
                                                                                                      height: 35.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FFAppConstants.whiteColor,
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          getJsonField(
                                                                                                            repeatListItem,
                                                                                                            r'''$.total_cart_qty''',
                                                                                                          ).toString(),
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.montserrat(
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Builder(
                                                                                                    builder: (context) => FFButtonWidget(
                                                                                                      onPressed: () async {
                                                                                                        logFirebaseEvent('REPEAT_ORDERS_PAGE__BTN_ON_TAP');
                                                                                                        if (functions.checkVariantFeatureCondition(repeatListItem) == true) {
                                                                                                          logFirebaseEvent('Button_bottom_sheet');
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return GestureDetector(
                                                                                                                onTap: () {
                                                                                                                  FocusScope.of(context).unfocus();
                                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                },
                                                                                                                child: Padding(
                                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                                  child: VarientBotttomSheetWidget(
                                                                                                                    productModel: repeatListItem,
                                                                                                                    cartType: 'daily',
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
        
                                                                                                          logFirebaseEvent('Button_refresh_database_request');
                                                                                                          safeSetState(() => _model.apiRequestCompleter = null);
                                                                                                          await _model.waitForApiRequestCompleted(maxWait: 5000);
                                                                                                        } else {
                                                                                                          logFirebaseEvent('Button_custom_action');
                                                                                                          _model.connectivityResult123 = await actions.checkInternetConnection();
                                                                                                          if (_model.connectivityResult123 == true) {
                                                                                                            logFirebaseEvent('Button_haptic_feedback');
                                                                                                            HapticFeedback.heavyImpact();
                                                                                                            if (getJsonField(
                                                                                                                  repeatListItem,
                                                                                                                  r'''$.cart_qty''',
                                                                                                                ) ==
                                                                                                                getJsonField(
                                                                                                                  repeatListItem,
                                                                                                                  r'''$.stock''',
                                                                                                                )) {
                                                                                                              logFirebaseEvent('Button_alert_dialog');
                                                                                                              await showDialog(
                                                                                                                context: context,
                                                                                                                builder: (dialogContext) {
                                                                                                                  return Dialog(
                                                                                                                    elevation: 0,
                                                                                                                    insetPadding: EdgeInsets.zero,
                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                    child: GestureDetector(
                                                                                                                      onTap: () {
                                                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                      },
                                                                                                                      child: CustomAlertDailogWidget(
                                                                                                                        des: FFAppConstants.noStock,
                                                                                                                        height: 150.0,
                                                                                                                        title: " ",
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            } else {
                                                                                                              logFirebaseEvent('Button_backend_call');
                                                                                                              _model.apiResultAddCart123 = await QuickartGroup.addToCartCall.call(
                                                                                                                userid: FFAppState().userID,
                                                                                                                qty: functions.addRemoveQTY(
                                                                                                                    getJsonField(
                                                                                                                      repeatListItem,
                                                                                                                      r'''$.cart_qty''',
                                                                                                                    ),
                                                                                                                    'add'),
                                                                                                                storeid: FFAppState().storeID,
                                                                                                                varientid: getJsonField(
                                                                                                                  repeatListItem,
                                                                                                                  r'''$.varient_id''',
                                                                                                                ).toString(),
                                                                                                                deviceid: FFAppState().deviceID,
                                                                                                                platform: isiOS ? 'ios' : 'android',
                                                                                                              );
        
                                                                                                              if ((_model.apiResultAddCart123?.succeeded ?? true)) {
                                                                                                                if (FFAppConstants.checkStatus ==
                                                                                                                    getJsonField(
                                                                                                                      (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                                      r'''$.status''',
                                                                                                                    ).toString()) {
                                                                                                                  logFirebaseEvent('Button_update_app_state');
                                                                                                                  FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                                    (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                                  )!;
                                                                                                                  FFAppState().cartSavingPrice = functions.stringToDouble(functions.setDecimalValue(QuickartGroup.addToCartCall
                                                                                                                      .savingPrice(
                                                                                                                        (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                                      )
                                                                                                                      ?.toString())!);
                                                                                                                  FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                      .totalPrice(
                                                                                                                        (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                                      )!
                                                                                                                      .toString());
                                                                                                                  FFAppState().refreshTrigger = true;
                                                                                                                  FFAppState().update(() {});
                                                                                                                  logFirebaseEvent('Button_refresh_database_request');
                                                                                                                  safeSetState(() => _model.apiRequestCompleter = null);
                                                                                                                  await _model.waitForApiRequestCompleted(maxWait: 2000);
                                                                                                                  logFirebaseEvent('Button_custom_action');
                                                                                                                  await actions.facebookEventClass(
                                                                                                                    getJsonField(
                                                                                                                      repeatListItem,
                                                                                                                      r'''$.varient_id''',
                                                                                                                    ).toString(),
                                                                                                                    getJsonField(
                                                                                                                      repeatListItem,
                                                                                                                      r'''$.product_name''',
                                                                                                                    ).toString(),
                                                                                                                    'product',
                                                                                                                    functions.stringToDouble(getJsonField(
                                                                                                                      repeatListItem,
                                                                                                                      r'''$.price''',
                                                                                                                    ).toString()),
                                                                                                                    getJsonField(
                                                                                                                          repeatListItem,
                                                                                                                          r'''$.cart_qty''',
                                                                                                                        ) +
                                                                                                                        1,
                                                                                                                    functions.stringToDouble(getJsonField(
                                                                                                                      repeatListItem,
                                                                                                                      r'''$.mrp''',
                                                                                                                    ).toString()),
                                                                                                                    'add',
                                                                                                                    FFAppState().emptyJson,
                                                                                                                    ' ',
                                                                                                                    ' ',
                                                                                                                    '  ',
                                                                                                                    ' ',
                                                                                                                    ' ',
                                                                                                                  );
                                                                                                                  logFirebaseEvent('Button_google_analytics_event');
                                                                                                                  logFirebaseEvent(
                                                                                                                    'Add To Cart',
                                                                                                                    parameters: {
                                                                                                                      'API Name': 'Add To Cart',
                                                                                                                      'Screen Name': 'Fresh Food Screen',
                                                                                                                    },
                                                                                                                  );
                                                                                                                  logFirebaseEvent('Button_wait__delay');
                                                                                                                  await Future.delayed(
                                                                                                                    Duration(
                                                                                                                      milliseconds: 500,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                } else {
                                                                                                                  logFirebaseEvent('Button_show_snack_bar');
                                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                    SnackBar(
                                                                                                                      content: Text(
                                                                                                                        getJsonField(
                                                                                                                          (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                                          r'''$.message''',
                                                                                                                        ).toString(),
                                                                                                                        style: TextStyle(
                                                                                                                          color: FFAppConstants.indigoColor,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                          fontSize: 12.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      duration: Duration(milliseconds: 4000),
                                                                                                                      backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                              } else {
                                                                                                                logFirebaseEvent('Button_show_snack_bar');
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      getJsonField(
                                                                                                                        (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                                        r'''$.message''',
                                                                                                                      ).toString(),
                                                                                                                      style: TextStyle(
                                                                                                                        color: FFAppConstants.indigoColor,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        fontSize: 12.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                                    backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                                  ),
                                                                                                                );
                                                                                                              }
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
                                                                                                                    fontSize: 15.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                duration: Duration(milliseconds: 1400),
                                                                                                                backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                              ),
                                                                                                            );
                                                                                                          }
                                                                                                        }
        
                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                      text: '+',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: 28.0,
                                                                                                        height: 35.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FFAppConstants.calculatorColor,
                                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.montserrat(
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FFAppConstants.whiteColor,
                                                                                                              fontSize: 20.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                        elevation: 0.0,
                                                                                                        borderSide: BorderSide(
                                                                                                          color: Colors.transparent,
                                                                                                          width: 0.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                                          bottomRight: Radius.circular(5.0),
                                                                                                          topLeft: Radius.circular(0.0),
                                                                                                          topRight: Radius.circular(5.0),
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
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 5.0)).around(
                                                                                SizedBox(width: 5.0)),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: FFAppConstants
                                                                              .greyBgd6d2d3,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  5.0,
                                                                                  5.0,
                                                                                  0.0,
                                                                                  5.0),
                                                                              child:
                                                                                  Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    FFAppConstants.unavailable,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FFAppConstants.blackColor0A0A0A,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      if (FFAppConstants.notifyMe ==
                                                                                          getJsonField(
                                                                                            repeatListItem,
                                                                                            r'''$.notify_me''',
                                                                                          ).toString()) {
                                                                                        return Text(
                                                                                          'Click on the bell to get notified',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FFAppConstants.indigoColor,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        );
                                                                                      } else {
                                                                                        return Text(
                                                                                          FFAppConstants.notifyMe ==
                                                                                                  getJsonField(
                                                                                                    repeatListItem,
                                                                                                    r'''$.notify_me''',
                                                                                                  ).toString()
                                                                                              ? FFAppConstants.notified
                                                                                              : 'You will be notified.',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FFAppConstants.indigoColor,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment:
                                                                                  AlignmentDirectional(1.0, -1.0),
                                                                              child:
                                                                                  Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    if (FFAppConstants.notifyMe ==
                                                                                        getJsonField(
                                                                                          repeatListItem,
                                                                                          r'''$.notify_me''',
                                                                                        ).toString()) {
                                                                                      return FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 30.0,
                                                                                        buttonSize: 46.0,
                                                                                        icon: Icon(
                                                                                          Icons.notifications_none_sharp,
                                                                                          color: FFAppConstants.blackColor0A0A0A,
                                                                                          size: 25.0,
                                                                                        ),
                                                                                        showLoadingIndicator: true,
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('REPEAT_ORDERS_notifications_none_sharp_I');
                                                                                          logFirebaseEvent('IconButton_custom_action');
                                                                                          _model.connnectivtyfavourites = await actions.checkInternetConnection();
                                                                                          if (_model.connnectivtyfavourites == true) {
                                                                                            logFirebaseEvent('IconButton_haptic_feedback');
                                                                                            HapticFeedback.mediumImpact();
                                                                                            logFirebaseEvent('IconButton_backend_call');
                                                                                            _model.favouritesrepeatOrder = await QuickartGroup.addnotifymeCall.call(
                                                                                              productID: getJsonField(
                                                                                                repeatListItem,
                                                                                                r'''$.product_id''',
                                                                                              ).toString(),
                                                                                              varientID: getJsonField(
                                                                                                repeatListItem,
                                                                                                r'''$.varient_id''',
                                                                                              ).toString(),
                                                                                              userID: FFAppState().userID,
                                                                                              platform: FFAppState().platform,
                                                                                              fcmToken: FFAppState().fcmToken,
                                                                                            );
        
                                                                                            if ((_model.favouritesrepeatOrder?.succeeded ?? true)) {
                                                                                              logFirebaseEvent('IconButton_refresh_database_request');
                                                                                              safeSetState(() => _model.apiRequestCompleter = null);
                                                                                              await _model.waitForApiRequestCompleted(maxWait: 5000);
                                                                                            } else {
                                                                                              logFirebaseEvent('IconButton_show_snack_bar');
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    getJsonField(
                                                                                                      (_model.favouritesrepeatOrder?.jsonBody ?? ''),
                                                                                                      r'''$.message''',
                                                                                                    ).toString(),
                                                                                                    style: GoogleFonts.montserrat(
                                                                                                      color: FFAppConstants.indigoColor,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontSize: 12.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  duration: Duration(milliseconds: 1000),
                                                                                                  backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                          } else {
                                                                                            logFirebaseEvent('IconButton_show_snack_bar');
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  FFAppConstants.internetString,
                                                                                                  style: GoogleFonts.montserrat(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontSize: 12.0,
                                                                                                  ),
                                                                                                ),
                                                                                                duration: Duration(milliseconds: 1000),
                                                                                                backgroundColor: FFAppConstants.blackColor666666,
                                                                                              ),
                                                                                            );
                                                                                          }
        
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('REPEAT_ORDERS_CircleImage_gll7wsbt_ON_TA');
                                                                                            logFirebaseEvent('CircleImage_navigate_to');
        
                                                                                            context.pushNamed(NotifyProductsListScreenWidget.routeName);
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 30.0,
                                                                                            height: 30.0,
                                                                                            clipBehavior: Clip.antiAlias,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Image.asset(
                                                                                              'assets/images/notifyme.png',
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    10.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            if ((getJsonField(
                                                                      repeatListItem,
                                                                      r'''$.feature_tags''',
                                                                    ) !=
                                                                    null) &&
                                                                ((getJsonField(
                                                                      repeatListItem,
                                                                      r'''$.feature_tags''',
                                                                    ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList()
                                                                            as Iterable<
                                                                                ProductCountStruct?>)
                                                                        .withoutNulls
                                                                        .length >
                                                                    FFAppConstants
                                                                        .zeroValue)) {
                                                              return Container(
                                                                width: 30.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final featureTag =
                                                                        getJsonField(
                                                                      repeatListItem,
                                                                      r'''$.feature_tags''',
                                                                    ).toList();
        
                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          featureTag
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              featureTagIndex) {
                                                                        final featureTagItem =
                                                                            featureTag[
                                                                                featureTagIndex];
                                                                        return Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                2.0),
                                                                            child:
                                                                                Container(
                                                                              width:
                                                                                  28.0,
                                                                              height:
                                                                                  28.0,
                                                                              clipBehavior:
                                                                                  Clip.antiAlias,
                                                                              decoration:
                                                                                  BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child:
                                                                                  Image.network(
                                                                                getJsonField(
                                                                                  featureTagItem,
                                                                                  r'''$.image''',
                                                                                ).toString(),
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            } else {
                                                              return Text(
                                                                ' ',
                                                                style: FlutterFlowTheme
                                                                        .of(context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .readexPro(
                                                                        fontWeight: FlutterFlowTheme.of(
                                                                                context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(
                                                                                context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              );
                                                            }
                                                          },
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
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.bottomnavBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BottomnavBarWidget(
                        pageName: 'repeat',
                      ),
                    ),
                  ),
                ),
                if ((FFAppState().cartTotalCount > 0) ||
                    (FFAppState().subCartTotalItem > 0))
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 110.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'REPEAT_ORDERS_cartbtnContainer_ON_TAP');
                          logFirebaseEvent('cartbtnContainer_update_app_state');
                          FFAppState().isCartShow =
                              !(FFAppState().isCartShow ?? true);
                          safeSetState(() {});
                        },
                        child: Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            color: FFAppConstants.indigoColor,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.shopping_cart_sharp,
                                    color: Color(0xFFFEDF31),
                                    size: 24.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 20.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FFAppConstants.NeutralBlack50Color,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        functions
                                            .additionFunctionInt(
                                                FFAppState().cartTotalCount,
                                                FFAppState().subCartTotalItem)
                                            .toString(),
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
                                              color:
                                                  FFAppConstants.blackColor0A0A0A,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
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
                if (FFAppState().isCartShow == true)
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FFAppConstants.indigoColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'REPEAT_ORDERS_PAGE_Row_6lidxk01_ON_TAP');
                              if (FFAppState().cartTotalCount < 1) {
                                logFirebaseEvent('Row_navigate_to');
        
                                context.pushNamed(
                                    CartSubscriptionScreenWidget.routeName);
        
                                logFirebaseEvent('Row_update_app_state');
                                FFAppState().isCartShow = false;
                                FFAppState().screenName = 'subscriptionCart';
                                safeSetState(() {});
                                logFirebaseEvent('Row_custom_action');
                                await actions.facebookEventClass(
                                  FFAppState().userID,
                                  ' ',
                                  ' ',
                                  FFAppState().cartTotalPrice,
                                  FFAppState().cartTotalCount,
                                  0.0,
                                  'cart',
                                  FFAppState().emptyJson,
                                  'subscription cart',
                                  ' ',
                                  ' ',
                                  ' ',
                                  ' ',
                                );
                                logFirebaseEvent('Row_google_analytics_event');
                                logFirebaseEvent(
                                  'Navigation',
                                  parameters: {
                                    'Navigate To': 'Subscription Cart Screen',
                                    'Screen Name': 'Repeat Order Screen',
                                  },
                                );
                              } else {
                                logFirebaseEvent('Row_navigate_to');
        
                                context
                                    .pushNamed(DailyCartScreenWidget.routeName);
        
                                logFirebaseEvent('Row_update_app_state');
                                FFAppState().isCartShow = false;
                                FFAppState().screenName = 'dailyCart';
                                safeSetState(() {});
                                logFirebaseEvent('Row_custom_action');
                                await actions.facebookEventClass(
                                  FFAppState().userID,
                                  ' ',
                                  ' ',
                                  FFAppState().cartTotalPrice,
                                  FFAppState().cartTotalCount,
                                  0.0,
                                  'cart',
                                  FFAppState().emptyJson,
                                  'daily cart',
                                  ' ',
                                  ' ',
                                  ' ',
                                  ' ',
                                );
                                logFirebaseEvent('Row_google_analytics_event');
                                logFirebaseEvent(
                                  'Navigation',
                                  parameters: {
                                    'Navigate To': 'Daily Cart Screen',
                                    'Screen Name': 'Repeat Order Screen',
                                  },
                                );
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Congratulations !  You\'ve got ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.montserrat(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: FFAppConstants
                                                          .neutralWhiteF5F5F5,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              TextSpan(
                                                text: 'FREE DELIVERY.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.montserrat(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: FFAppConstants
                                                          .neutralWhiteF5F5F5,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FFAppConstants
                                                      .neutralWhiteF5F5F5,
                                                  fontSize: 8.0,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 3.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          RichText(
                                            textScaler:
                                                MediaQuery.of(context).textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: functions
                                                      .additionFunctionInt(
                                                          FFAppState()
                                                              .cartTotalCount,
                                                          FFAppState()
                                                              .subCartTotalItem)
                                                      .toString(),
                                                  style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppConstants
                                                                .yellowColor,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                ),
                                                TextSpan(
                                                  text: ' item',
                                                  style: GoogleFonts.montserrat(
                                                    color: FFAppConstants
                                                        .yellowColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.montserrat(
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
                                          SizedBox(
                                            height: 25.0,
                                            child: VerticalDivider(
                                              thickness: 1.0,
                                              color: FFAppConstants.yellowColor,
                                            ),
                                          ),
                                          RichText(
                                            textScaler:
                                                MediaQuery.of(context).textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'AED ',
                                                  style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppConstants
                                                                .yellowColor,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                ),
                                                TextSpan(
                                                  text: functions.setDecimalValue(
                                                      functions
                                                          .additionFunction(
                                                              FFAppState()
                                                                  .cartTotalPrice,
                                                              FFAppState()
                                                                  .subCartTotalPrice)
                                                          .toString())!,
                                                  style: GoogleFonts.montserrat(
                                                    color: FFAppConstants
                                                        .yellowColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
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
                                        ],
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if ((FFAppState().cartSavingPrice >
                                                0.00) ||
                                            (FFAppState().subCartSavingAmount >
                                                0.00)) {
                                          return RichText(
                                            textScaler:
                                                MediaQuery.of(context).textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'You have saved ',
                                                  style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppConstants
                                                                .neutralWhiteF5F5F5,
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                ),
                                                TextSpan(
                                                  text: 'AED ',
                                                  style: GoogleFonts.montserrat(
                                                    color:
                                                        FFAppConstants.whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: functions.setDecimalValue(
                                                      functions
                                                          .additionFunction(
                                                              FFAppState()
                                                                  .cartSavingPrice,
                                                              FFAppState()
                                                                  .subCartSavingAmount)
                                                          ?.toString())!,
                                                  style: GoogleFonts.montserrat(
                                                    color:
                                                        FFAppConstants.whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' on your order',
                                                  style: GoogleFonts.montserrat(
                                                    color: FFAppConstants
                                                        .neutralWhiteF5F5F5,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.0,
                                                  ),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
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
                                          );
                                        } else {
                                          return Text(
                                            FFAppConstants.saveMsg,
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
                                                      FFAppConstants.whiteColor,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().subCartVisibility == true)
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: Color(0x5114181B),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Repeat Days',
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
                                                        FFAppConstants.textBlack,
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4.0),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            child: Checkbox(
                                              value: _model.checkboxValue ??=
                                                  false,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                    .checkboxValue = newValue!);
                                                if (newValue!) {
                                                  logFirebaseEvent(
                                                      'REPEAT_ORDERS_Checkbox_fhr0i8f6_ON_TOGGL');
                                                  logFirebaseEvent(
                                                      'Checkbox_update_app_state');
                                                  FFAppState()
                                                      .isSunSelected = functions
                                                              .checkAvailableDays(
                                                                  'sun',
                                                                  _model
                                                                      .availableDays) ==
                                                          true
                                                      ? true
                                                      : false;
                                                  FFAppState()
                                                      .isMonSelected = functions
                                                              .checkAvailableDays(
                                                                  'mon',
                                                                  _model
                                                                      .availableDays) ==
                                                          true
                                                      ? true
                                                      : false;
                                                  FFAppState()
                                                      .isTueSelected = functions
                                                              .checkAvailableDays(
                                                                  'tue',
                                                                  _model
                                                                      .availableDays) ==
                                                          true
                                                      ? true
                                                      : false;
                                                  FFAppState()
                                                      .isWedSelected = functions
                                                              .checkAvailableDays(
                                                                  'wed',
                                                                  _model
                                                                      .availableDays) ==
                                                          true
                                                      ? true
                                                      : false;
                                                  FFAppState()
                                                      .isThuSelected = functions
                                                              .checkAvailableDays(
                                                                  'thu',
                                                                  _model
                                                                      .availableDays) ==
                                                          true
                                                      ? true
                                                      : false;
                                                  FFAppState()
                                                      .isFriSelected = functions
                                                              .checkAvailableDays(
                                                                  'fri',
                                                                  _model
                                                                      .availableDays) ==
                                                          true
                                                      ? true
                                                      : false;
                                                  FFAppState()
                                                      .isSatSelected = functions
                                                              .checkAvailableDays(
                                                                  'sat',
                                                                  _model
                                                                      .availableDays) ==
                                                          true
                                                      ? true
                                                      : false;
                                                  safeSetState(() {});
                                                } else {
                                                  logFirebaseEvent(
                                                      'REPEAT_ORDERS_Checkbox_fhr0i8f6_ON_TOGGL');
                                                  logFirebaseEvent(
                                                      'Checkbox_update_app_state');
                                                  FFAppState().isSunSelected =
                                                      false;
                                                  FFAppState().isMonSelected =
                                                      false;
                                                  FFAppState().isTueSelected =
                                                      false;
                                                  FFAppState().isWedSelected =
                                                      false;
                                                  FFAppState().isThuSelected =
                                                      false;
                                                  FFAppState().isFriSelected =
                                                      false;
                                                  FFAppState().isSatSelected =
                                                      false;
                                                  safeSetState(() {});
                                                }
                                              },
                                              side: (FlutterFlowTheme.of(context)
                                                          .secondaryText !=
                                                      null)
                                                  ? BorderSide(
                                                      width: 2,
                                                      color: FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText!,
                                                    )
                                                  : null,
                                              activeColor: FFAppConstants
                                                  .primaryPurple7E65AC,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                          ),
                                          Text(
                                            'All days',
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
                                                  color: FFAppConstants.textBlack,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 10.0, 5.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'REPEAT_ORDERS_Container_mn9ykr50_ON_TAP');
                                          if (functions.checkAvailableDays(
                                                  'sun', _model.availableDays) ==
                                              true) {
                                            if (FFAppState().isSunSelected ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isSunSelected = false;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              FFAppState().isWeekSelected = 0;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Container_google_analytics_event');
                                              logFirebaseEvent(
                                                  'SundaySelectedAnalytics');
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isSunSelected = true;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: functions.setDaysbgColor(
                                                functions.checkAvailableDays(
                                                    'sun', _model.availableDays)!,
                                                FFAppState().isSunSelected),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'S',
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
                                                    color: FFAppState()
                                                                .isSunSelected ==
                                                            true
                                                        ? FFAppConstants
                                                            .whiteColor
                                                        : FFAppConstants
                                                            .textBlack,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'REPEAT_ORDERS_Container_4ohx2l3s_ON_TAP');
                                          if (functions.checkAvailableDays(
                                                  'mon', _model.availableDays) ==
                                              true) {
                                            if (FFAppState().isMonSelected ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isMonSelected = false;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              FFAppState().isWeekSelected = 0;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Container_google_analytics_event');
                                              logFirebaseEvent(
                                                  'MondaySelectedAnalytics');
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isMonSelected = true;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: functions.setDaysbgColor(
                                                functions.checkAvailableDays(
                                                    'mon', _model.availableDays)!,
                                                FFAppState().isMonSelected),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'M',
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
                                                    color: FFAppState()
                                                                .isMonSelected ==
                                                            true
                                                        ? FFAppConstants
                                                            .whiteColor
                                                        : FFAppConstants
                                                            .textBlack,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'REPEAT_ORDERS_Container_r0k9yigq_ON_TAP');
                                          if (functions.checkAvailableDays(
                                                  'tue', _model.availableDays) ==
                                              true) {
                                            if (FFAppState().isTueSelected ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isTueSelected = false;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              FFAppState().isWeekSelected = 0;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Container_google_analytics_event');
                                              logFirebaseEvent(
                                                  'TuesdaySelectedAnalytics');
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isTueSelected = true;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: functions.setDaysbgColor(
                                                functions.checkAvailableDays(
                                                    'tue', _model.availableDays)!,
                                                FFAppState().isTueSelected),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'T',
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
                                                    color: FFAppState()
                                                                .isTueSelected ==
                                                            true
                                                        ? FFAppConstants
                                                            .whiteColor
                                                        : FFAppConstants
                                                            .textBlack,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'REPEAT_ORDERS_Container_kcm9v9nk_ON_TAP');
                                          if (functions.checkAvailableDays(
                                                  'wed', _model.availableDays) ==
                                              true) {
                                            if (FFAppState().isWedSelected ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isWedSelected = false;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              FFAppState().isWeekSelected = 0;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Container_google_analytics_event');
                                              logFirebaseEvent(
                                                  'WednesdaySelectedAnalytics');
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isWedSelected = true;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: functions.setDaysbgColor(
                                                functions.checkAvailableDays(
                                                    'wed', _model.availableDays)!,
                                                FFAppState().isWedSelected),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'W',
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
                                                    color: FFAppState()
                                                                .isWedSelected ==
                                                            true
                                                        ? FFAppConstants
                                                            .whiteColor
                                                        : FFAppConstants
                                                            .textBlack,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'REPEAT_ORDERS_Container_82fmec1w_ON_TAP');
                                          if (functions.checkAvailableDays(
                                                  'thu', _model.availableDays) ==
                                              true) {
                                            if (FFAppState().isThuSelected ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isThuSelected = false;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              FFAppState().isWeekSelected = 0;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Container_google_analytics_event');
                                              logFirebaseEvent(
                                                  'ThursdaySelectedAnalytics');
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isThuSelected = true;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: functions.setDaysbgColor(
                                                functions.checkAvailableDays(
                                                    'thu', _model.availableDays)!,
                                                FFAppState().isThuSelected),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'T',
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
                                                    color: FFAppState()
                                                                .isThuSelected ==
                                                            true
                                                        ? FFAppConstants
                                                            .whiteColor
                                                        : FFAppConstants
                                                            .textBlack,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'REPEAT_ORDERS_Container_0vy86vd4_ON_TAP');
                                          if (functions.checkAvailableDays(
                                                  'fir', _model.availableDays) ==
                                              true) {
                                            if (FFAppState().isFriSelected ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isFriSelected = false;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              FFAppState().isWeekSelected = 0;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Container_google_analytics_event');
                                              logFirebaseEvent(
                                                  'FridaySelectedAnalytics');
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isFriSelected = true;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: functions.setDaysbgColor(
                                                functions.checkAvailableDays(
                                                    'fri', _model.availableDays)!,
                                                FFAppState().isFriSelected),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'F',
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
                                                    color: FFAppState()
                                                                .isFriSelected ==
                                                            true
                                                        ? FFAppConstants
                                                            .whiteColor
                                                        : FFAppConstants
                                                            .textBlack,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'REPEAT_ORDERS_Container_vzz7r1hu_ON_TAP');
                                          if (functions.checkAvailableDays(
                                                  'sat', _model.availableDays) ==
                                              true) {
                                            if (FFAppState().isSatSelected ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isSatSelected = false;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              FFAppState().isWeekSelected = 0;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Container_google_analytics_event');
                                              logFirebaseEvent(
                                                  'SaturdaySelectedAnalytics');
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.firstDeliveryDate = null;
                                              _model.timeSlotjson = null;
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isSatSelected = true;
                                              FFAppState().selectedDeliveryDate =
                                                  '';
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: functions.setDaysbgColor(
                                                functions.checkAvailableDays(
                                                    'sat', _model.availableDays)!,
                                                FFAppState().isSatSelected),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'S',
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
                                                    color: FFAppState()
                                                                .isSatSelected ==
                                                            true
                                                        ? FFAppConstants
                                                            .whiteColor
                                                        : FFAppConstants
                                                            .textBlack,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 18.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 15.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Certificate.png',
                                              width: 30.0,
                                              height: 30.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Subscription Duration',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.montserrat(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: FFAppConstants
                                                          .textBlack,
                                                      fontSize: 13.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Text(
                                                'Select week duration for subscription',
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
                                                      color: FFAppConstants
                                                          .textBlack,
                                                      fontSize: 10.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Container(
                                                width: MediaQuery.sizeOf(context)
                                                        .width *
                                                    1.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final weekModel =
                                                          getJsonField(
                                                        (_model.apiResultsWeeksRepeatOrder
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data''',
                                                      ).toList();
        
                                                      return ListView.builder(
                                                        padding: EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            weekModel.length,
                                                        itemBuilder: (context,
                                                            weekModelIndex) {
                                                          final weekModelItem =
                                                              weekModel[
                                                                  weekModelIndex];
                                                          return Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) =>
                                                                      Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor: Colors
                                                                      .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'REPEAT_ORDERS_Container_mval1r0l_ON_TAP');
                                                                    if ((_model
                                                                                .totalDeli ==
                                                                            getJsonField(
                                                                              weekModelItem,
                                                                              r'''$.total_deliveries''',
                                                                            )) &&
                                                                        (functions
                                                                                .checkSelectionDaysCount(functions.getRepeatdays(FFAppState().isSunSelected, FFAppState().isMonSelected, FFAppState().isTueSelected, FFAppState().isWedSelected, FFAppState().isThuSelected, FFAppState().isFriSelected, FFAppState().isSatSelected)!)
                                                                                .toString() ==
                                                                            '1')) {
                                                                      logFirebaseEvent(
                                                                          'Container_alert_dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap:
                                                                                  () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child:
                                                                                  CustomAlertDailogWidget(
                                                                                des: FFAppConstants.weekRepeatMsg,
                                                                                height: 130.0,
                                                                                title: ' ',
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Container_update_app_state');
                                                                      FFAppState()
                                                                              .isWeekSelected =
                                                                          getJsonField(
                                                                        weekModelItem,
                                                                        r'''$.total_deliveries''',
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 70.0,
                                                                    height: 30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: functions.setbackgroundColor(
                                                                          FFAppState().isWeekSelected.toString(),
                                                                          getJsonField(
                                                                            weekModelItem,
                                                                            r'''$.total_deliveries''',
                                                                          ).toString(),
                                                                          0,
                                                                          0),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              14.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFE0E0E0),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              2.0,
                                                                              2.0,
                                                                              2.0),
                                                                          child:
                                                                              Text(
                                                                            '${getJsonField(
                                                                              weekModelItem,
                                                                              r'''$.total_deliveries''',
                                                                            ).toString()} ${getJsonField(
                                                                              weekModelItem,
                                                                              r'''$.types''',
                                                                            ).toString()}',
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
                                                                                  font: GoogleFonts.readexPro(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppConstants.blackColor0A0A0A,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 5.0, 20.0, 7.0),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).alternate,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'REPEAT_ORDERS_PAGE_Row_0yq7zkm3_ON_TAP');
                                      if ((FFAppState().isSunSelected == true) ||
                                          (FFAppState().isMonSelected == true) ||
                                          (FFAppState().isTueSelected == true) ||
                                          (FFAppState().isWedSelected == true) ||
                                          (FFAppState().isThuSelected == true) ||
                                          (FFAppState().isFriSelected == true) ||
                                          (FFAppState().isSatSelected == true)) {
                                        logFirebaseEvent('Row_date_time_picker');
                                        final _datePickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: functions
                                              .tCalenderDate(getJsonField(
                                            FFAppState().appInfo,
                                            r'''$.calendar_t_value''',
                                          )),
                                          firstDate: functions
                                              .tCalenderDate(getJsonField(
                                            FFAppState().appInfo,
                                            r'''$.calendar_t_value''',
                                          )),
                                          lastDate: DateTime(2050),
                                          builder: (context, child) {
                                            return wrapInMaterialDatePickerTheme(
                                              context,
                                              child!,
                                              headerBackgroundColor:
                                                  Color(0xFFC1C4DA),
                                              headerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              headerTextStyle: FlutterFlowTheme
                                                      .of(context)
                                                  .headlineLarge
                                                  .override(
                                                    font: GoogleFonts.montserrat(
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 32.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .fontStyle,
                                                  ),
                                              pickerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              pickerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              selectedDateTimeBackgroundColor:
                                                  Color(0xFFC1C4DA),
                                              selectedDateTimeForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              actionButtonForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 24.0,
                                            );
                                          },
                                        );
        
                                        if (_datePickedDate != null) {
                                          safeSetState(() {
                                            _model.datePicked = DateTime(
                                              _datePickedDate.year,
                                              _datePickedDate.month,
                                              _datePickedDate.day,
                                            );
                                          });
                                        } else if (_model.datePicked != null) {
                                          safeSetState(() {
                                            _model.datePicked = functions
                                                .tCalenderDate(getJsonField(
                                              FFAppState().appInfo,
                                              r'''$.calendar_t_value''',
                                            ));
                                          });
                                        }
                                        logFirebaseEvent('Row_backend_call');
                                        _model.apiResultTimeSlotrepeatorder =
                                            await QuickartGroup.timeslotCall.call(
                                          storeID: FFAppState().storeID,
                                          selectedDate: dateTimeFormat(
                                              "yyyy-MM-dd", _model.datePicked),
                                          repeatedDays: functions.getRepeatdays(
                                              FFAppState().isSunSelected,
                                              FFAppState().isMonSelected,
                                              FFAppState().isTueSelected,
                                              FFAppState().isWedSelected,
                                              FFAppState().isThuSelected,
                                              FFAppState().isFriSelected,
                                              FFAppState().isSatSelected),
                                          platform: isiOS ? 'ios' : 'android',
                                        );
        
                                        if ((_model.apiResultTimeSlotrepeatorder
                                                ?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'Row_update_app_state');
                                          FFAppState().selectedDeliveryDate =
                                              dateTimeFormat("yyyy-MM-dd",
                                                  _model.datePicked);
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Row_update_page_state');
                                          _model.firstDeliveryDate = QuickartGroup
                                              .timeslotCall
                                              .firstDeliveryDate(
                                            (_model.apiResultTimeSlotrepeatorder
                                                    ?.jsonBody ??
                                                ''),
                                          );
                                          _model.timeSlotjson = getJsonField(
                                            (_model.apiResultTimeSlotrepeatorder
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data''',
                                          );
                                          _model.selectedDeliveryDateN =
                                              dateTimeFormat("yyyy-MM-dd",
                                                  _model.datePicked);
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Row_google_analytics_event');
                                          logFirebaseEvent(
                                              'StartDateDeliveryAnalytics');
                                        } else {
                                          logFirebaseEvent('Row_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.apiResultTimeSlotrepeatorder
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color:
                                                      FFAppConstants.indigoColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2000),
                                              backgroundColor: FFAppConstants
                                                  .primaryPurpleE4D8F5,
                                            ),
                                          );
                                        }
                                      } else {
                                        logFirebaseEvent('Row_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'Please select repeat days first.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.pop(
                                                      alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
        
                                      safeSetState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8.0),
                                                  child: Image.asset(
                                                    'assets/images/calender.png',
                                                    width: 30.0,
                                                    height: 30.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      5.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Start Date of Delivery',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FFAppConstants
                                                              .textBlack,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Select date for subscription',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FFAppConstants
                                                              .textBlack,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 5.0, 0.0, 0.0),
                                                    child: Text(
                                                      functions.setCustomDateFormate(
                                                          FFAppState()
                                                              .selectedDeliveryDate,
                                                          'yyyy-MM-dd',
                                                          'dd-MM-yyyy')!,
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                  if ((_model.firstDeliveryDate !=
                                                              null &&
                                                          _model.firstDeliveryDate !=
                                                              '') &&
                                                      (_model.firstDeliveryDate !=
                                                          'null'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0.0, 5.0,
                                                                  0.0, 0.0),
                                                      child: Text(
                                                        'Please note your first delivery will start ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              color:
                                                                  FFAppConstants
                                                                      .redDF3F56,
                                                              fontSize: 12.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  if ((_model.firstDeliveryDate !=
                                                              null &&
                                                          _model.firstDeliveryDate !=
                                                              '') &&
                                                      (_model.firstDeliveryDate !=
                                                          'null'))
                                                    Text(
                                                      'on - ${functions.setCustomDateFormate(_model.firstDeliveryDate, 'yyyy-MM-dd', 'dd-MM-yyyy')}',
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppConstants
                                                                .redDF3F56,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 7.0, 20.0, 7.0),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                    height: 1.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).alternate,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Clock.png',
                                              width: 30.0,
                                              height: 30.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Select Time of Delivery',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.montserrat(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: FFAppConstants
                                                          .textBlack,
                                                      fontSize: 13.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              if (_model.timeSlotjson != null)
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 5.0, 0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final timeSlotModel =
                                                            _model.timeSlotjson
                                                                    ?.toList() ??
                                                                [];
        
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: timeSlotModel
                                                              .length,
                                                          itemBuilder: (context,
                                                              timeSlotModelIndex) {
                                                            final timeSlotModelItem =
                                                                timeSlotModel[
                                                                    timeSlotModelIndex];
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor: Colors
                                                                      .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'REPEAT_ORDERS_Container_rw0upkol_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Container_update_app_state');
                                                                    FFAppState()
                                                                            .isDeliveryTimeSlotSelected =
                                                                        getJsonField(
                                                                      timeSlotModelItem,
                                                                      r'''$.timeslot''',
                                                                    ).toString();
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Container_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                        'DeliveryDateSelectedAnalytics');
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 150.0,
                                                                    height: 30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: functions.setbackgroundColor(
                                                                          FFAppState().isDeliveryTimeSlotSelected,
                                                                          getJsonField(
                                                                            timeSlotModelItem,
                                                                            r'''$.timeslot''',
                                                                          ).toString(),
                                                                          0,
                                                                          0),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              14.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFE0E0E0),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              2.0,
                                                                              2.0,
                                                                              2.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              timeSlotModelItem,
                                                                              r'''$.timeslot''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
                                                                                  font: GoogleFonts.readexPro(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppConstants.blackColor0A0A0A,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 5.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (_model.isAutoRenew == 'no') {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'REPEAT_ORDERS_Container_4kfqfnjb_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.isAutoRenew = 'yes';
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 25.0,
                                                height: 25.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      FlutterFlowTheme.of(context)
                                                          .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(6.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'REPEAT_ORDERS_PAGE_Icon_kbkfmyt7_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_update_page_state');
                                                _model.isAutoRenew = 'no';
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.check_box_rounded,
                                                color: FFAppConstants.indigoColor,
                                                size: 30.0,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Auto Renew Order',
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
                                                color: FFAppConstants.textBlack,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'REPEAT_ORDERS_PAGE_CANCEL_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().isSubCartVisible = false;
                                          FFAppState().subCartVisibility = false;
                                          FFAppState().selectedDeliveryDate = '';
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.firstDeliveryDate = 'null';
                                          _model.timeSlotjson = null;
                                          _model.selectedDeliveryDateN = null;
                                          _model.isAutoRenew = 'no';
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_google_analytics_event');
                                          logFirebaseEvent(
                                              'CancelButtonAnalytics');
                                        },
                                        text: 'Cancel',
                                        options: FFButtonOptions(
                                          width: 120.0,
                                          height: 30.0,
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 12.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppConstants.redDF3F56,
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
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'REPEAT_ORDERS_PAGE_CONFIRM_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_custom_action');
                                          _model.connectivityResult =
                                              await actions
                                                  .checkInternetConnection();
                                          if (_model.connectivityResult == true) {
                                            if (functions.getRepeatdays(
                                                    FFAppState().isSunSelected,
                                                    FFAppState().isMonSelected,
                                                    FFAppState().isTueSelected,
                                                    FFAppState().isWedSelected,
                                                    FFAppState().isThuSelected,
                                                    FFAppState().isFriSelected,
                                                    FFAppState().isSatSelected) !=
                                                '') {
                                              if (FFAppState().isWeekSelected !=
                                                  0) {
                                                if (FFAppState()
                                                            .selectedDeliveryDate !=
                                                        null &&
                                                    FFAppState()
                                                            .selectedDeliveryDate !=
                                                        '') {
                                                  if ((FFAppState()
                                                              .isDeliveryTimeSlotSelected !=
                                                          'no') &&
                                                      (FFAppState()
                                                                  .isDeliveryTimeSlotSelected !=
                                                              null &&
                                                          FFAppState()
                                                                  .isDeliveryTimeSlotSelected !=
                                                              '') &&
                                                      (FFAppState()
                                                              .isDeliveryTimeSlotSelected !=
                                                          ' ') &&
                                                      (FFAppState()
                                                              .isDeliveryTimeSlotSelected !=
                                                          'null') &&
                                                      (FFAppState()
                                                              .isDeliveryTimeSlotSelected !=
                                                          '0')) {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');
                                                    _model.apiResultco2 =
                                                        await QuickartGroup
                                                            .addtosubcartCall
                                                            .call(
                                                      userid: FFAppState().userID,
                                                      qty: '1',
                                                      storeid:
                                                          FFAppState().storeID,
                                                      varientid: FFAppState()
                                                          .varientID
                                                          .toString(),
                                                      deviceid:
                                                          FFAppState().deviceID,
                                                      repeatOrder:
                                                          functions.getRepeatdays(
                                                              FFAppState()
                                                                  .isSunSelected,
                                                              FFAppState()
                                                                  .isMonSelected,
                                                              FFAppState()
                                                                  .isTueSelected,
                                                              FFAppState()
                                                                  .isWedSelected,
                                                              FFAppState()
                                                                  .isThuSelected,
                                                              FFAppState()
                                                                  .isFriSelected,
                                                              FFAppState()
                                                                  .isSatSelected),
                                                      timeSlot: FFAppState()
                                                          .isDeliveryTimeSlotSelected,
                                                      subTotalDelivery:
                                                          FFAppState()
                                                              .isWeekSelected
                                                              .toString(),
                                                      subTotalDate: FFAppState()
                                                          .selectedDeliveryDate,
                                                      itemName: _model.itemName,
                                                      itemPrice: _model.itemPrice,
                                                      autoRenew:
                                                          _model.isAutoRenew ==
                                                                  'no'
                                                              ? 'no'
                                                              : 'yes',
                                                      platform: isiOS
                                                          ? 'ios'
                                                          : 'android',
                                                    );
        
                                                    if ((_model.apiResultco2
                                                            ?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'Button_refresh_database_request');
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted(
                                                              maxWait: 2000);
                                                      logFirebaseEvent(
                                                          'Button_update_app_state');
                                                      FFAppState().isWedSelected =
                                                          false;
                                                      FFAppState().isSunSelected =
                                                          false;
                                                      FFAppState().isMonSelected =
                                                          false;
                                                      FFAppState().isTueSelected =
                                                          false;
                                                      FFAppState().isThuSelected =
                                                          false;
                                                      FFAppState().isFriSelected =
                                                          false;
                                                      FFAppState().isSatSelected =
                                                          false;
                                                      FFAppState().categoryName =
                                                          'sub';
                                                      FFAppState()
                                                          .isWeekSelected = 0;
                                                      FFAppState()
                                                              .isSubcribeCartVisible =
                                                          false;
                                                      FFAppState()
                                                              .isDeliveryTimeSlotSelected =
                                                          'no';
                                                      FFAppState()
                                                              .subCartTotalItem =
                                                          QuickartGroup
                                                              .addtosubcartCall
                                                              .totalItems(
                                                        (_model.apiResultco2
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      FFAppState()
                                                              .subCartTotalPrice =
                                                          QuickartGroup
                                                              .addtosubcartCall
                                                              .totalPrice(
                                                        (_model.apiResultco2
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      FFAppState()
                                                              .subCartSavingAmount =
                                                          QuickartGroup
                                                              .addtosubcartCall
                                                              .savingPrice(
                                                        (_model.apiResultco2
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      FFAppState()
                                                              .isSubCartVisible =
                                                          false;
                                                      FFAppState()
                                                          .selectedDeliveryDate = '';
                                                      FFAppState()
                                                              .subCartVisibility =
                                                          false;
                                                      FFAppState()
                                                          .refreshTrigger = true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.firstDeliveryDate =
                                                          'null';
                                                      _model.timeSlotjson = null;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_custom_action');
                                                      await actions
                                                          .facebookEventClass(
                                                        FFAppState()
                                                            .varientID
                                                            .toString(),
                                                        _model.itemName!,
                                                        'Subscription product',
                                                        double.parse(
                                                            (_model.itemPrice!)),
                                                        1 + 1,
                                                        0.0,
                                                        'add',
                                                        FFAppState().emptyJson,
                                                        ' ',
                                                        ' ',
                                                        ' ',
                                                        ' ',
                                                        ' ',
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_google_analytics_event');
                                                      logFirebaseEvent(
                                                        'CheckAllDaysAnalytics',
                                                        parameters: {
                                                          FFAppState()
                                                              .isSunSelected
                                                              .toString(): false,
                                                          FFAppState()
                                                              .isMonSelected
                                                              .toString(): false,
                                                          FFAppState()
                                                              .isTueSelected
                                                              .toString(): false,
                                                          FFAppState()
                                                              .isWedSelected
                                                              .toString(): false,
                                                          FFAppState()
                                                              .isThuSelected
                                                              .toString(): false,
                                                          FFAppState()
                                                              .isFriSelected
                                                              .toString(): false,
                                                          FFAppState()
                                                              .isSatSelected
                                                              .toString(): false,
                                                          FFAppState()
                                                                  .categoryName:
                                                              'sub',
                                                          FFAppState()
                                                              .isWeekSelected
                                                              .toString(): '0',
                                                          FFAppState()
                                                              .isSubcribeCartVisible
                                                              .toString(): false,
                                                          FFAppState()
                                                                  .isDeliveryTimeSlotSelected:
                                                              'no',
                                                        },
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            getJsonField(
                                                              (_model.apiResultco2
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.message''',
                                                            ).toString(),
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color: FFAppConstants
                                                                  .blackColor0A0A0A,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize: 12.0,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds: 4000),
                                                          backgroundColor:
                                                              FFAppConstants
                                                                  .NeutralBlack50Color,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_show_snack_bar');
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          FFAppConstants
                                                              .timeSlotString,
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FFAppConstants
                                                                .NeutralBlack50Color,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        FFAppConstants
                                                            .StartDateofDelivery,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: FFAppConstants
                                                              .blackColor0A0A0A,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .NeutralBlack50Color,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      FFAppConstants
                                                          .subscriptionDurationString,
                                                      style:
                                                          GoogleFonts.montserrat(
                                                        color: FFAppConstants
                                                            .blackColor0A0A0A,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FFAppConstants
                                                            .NeutralBlack50Color,
                                                  ),
                                                );
                                              }
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFAppConstants.repeatDays,
                                                    style: GoogleFonts.montserrat(
                                                      color: FFAppConstants
                                                          .blackColor0A0A0A,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor: FFAppConstants
                                                      .NeutralBlack50Color,
                                                ),
                                              );
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  FFAppConstants.internetString,
                                                  style: GoogleFonts.montserrat(
                                                    color: FFAppConstants
                                                        .blackColor0A0A0A,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                duration:
                                                    Duration(milliseconds: 4000),
                                                backgroundColor: FFAppConstants
                                                    .NeutralBlack50Color,
                                              ),
                                            );
                                          }
        
                                          safeSetState(() {});
                                        },
                                        text: 'Confirm',
                                        options: FFButtonOptions(
                                          width: 120.0,
                                          height: 30.0,
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              12.0, 0.0, 12.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppConstants.green86DF67,
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
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
