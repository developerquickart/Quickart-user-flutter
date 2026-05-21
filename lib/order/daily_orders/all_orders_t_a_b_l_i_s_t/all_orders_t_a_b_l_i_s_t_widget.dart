import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'all_orders_t_a_b_l_i_s_t_model.dart';
export 'all_orders_t_a_b_l_i_s_t_model.dart';

class AllOrdersTABLISTWidget extends StatefulWidget {
  const AllOrdersTABLISTWidget({super.key});

  static String routeName = 'AllOrdersTABLIST';
  static String routePath = '/my-orders';

  @override
  State<AllOrdersTABLISTWidget> createState() => _AllOrdersTABLISTWidgetState();
}

class _AllOrdersTABLISTWidgetState extends State<AllOrdersTABLISTWidget>
    with TickerProviderStateMixin {
  late AllOrdersTABLISTModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllOrdersTABLISTModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AllOrdersTABLIST'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: min(
          valueOrDefault<int>(
            (FFAppState().cardScreenNavigation == 'subscriptionCart') ||
                    (FFAppState().RatingScreenName ==
                        'SubscriptionOrderRating') ||
                    (FFAppState().cardScreenNavigation == 'subscription')
                ? 1
                : 0,
            0,
          ),
          1),
    )..addListener(() => safeSetState(() {}));

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
                logFirebaseEvent('ALL_ORDERS_T_A_B_L_I_S_T_chevron_left_IC');
                if (FFAppState().screenName == 'daily') {
                  logFirebaseEvent('IconButton_navigate_to');

                  context.goNamed(DashboardScreenWidget.routeName);

                  logFirebaseEvent('IconButton_update_app_state');
                  FFAppState().backButtonOrder = false;
                  FFAppState().update(() {});
                } else {
                  if (FFAppState().screenName == 'subscription') {
                    logFirebaseEvent('IconButton_navigate_to');

                    context.goNamed(DashboardScreenWidget.routeName);

                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().backButtonOrder = false;
                    FFAppState().update(() {});
                  } else {
                    logFirebaseEvent('IconButton_navigate_to');

                    context.goNamed(ProfilePageWidget.routeName);
                  }
                }
              },
            ),
            title: Text(
              'My Orders',
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
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FFAppConstants.whiteColor,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FFAppConstants.green86DF67,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                        unselectedLabelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                        indicatorColor: FFAppConstants.green86DF67,
                        padding: EdgeInsets.all(4.0),
                        tabs: [
                          Tab(
                            text: 'Daily Orders',
                          ),
                          Tab(
                            text: 'Subscription Orders  ',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [
                            () async {
                              logFirebaseEvent(
                                  'ALL_ORDERS_T_A_B_L_I_S_T_Tab_ud6mk61q_ON');
                              logFirebaseEvent('Tab_refresh_database_request');
                              safeSetState(() =>
                                  _model.listViewPagingController1?.refresh());
                              await _model.waitForOnePageForListView1();
                            },
                            () async {
                              logFirebaseEvent(
                                  'ALL_ORDERS_T_A_B_L_I_S_T_Tab_jl6l3mqq_ON');
                              logFirebaseEvent('Tab_refresh_database_request');
                              safeSetState(
                                  () => _model.apiRequestCompleter1 = null);
                              await _model.waitForApiRequestCompleted1();
                            }
                          ][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 20.0),
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        logFirebaseEvent(
                                            'ALL_ORDERS_T_A_B_L_I_S_T_ListView_s91il6');
                                        logFirebaseEvent(
                                            'ListView_refresh_database_request');
                                        safeSetState(() => _model
                                            .listViewPagingController1
                                            ?.refresh());
                                        await _model
                                            .waitForOnePageForListView1();
                                      },
                                      child: PagedListView<ApiPagingParams,
                                          dynamic>(
                                        pagingController:
                                            _model.setListViewController1(
                                          (nextPageMarker) => QuickartGroup
                                              .mydailyordersCall
                                              .call(
                                            userid: FFAppState().userID,
                                            pageno:
                                                nextPageMarker.nextPageNumber +
                                                    1,
                                            pageCount: 30,
                                            platform: isiOS ? 'ios' : 'android',
                                          ),
                                        ),
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate:
                                            PagedChildBuilderDelegate<dynamic>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: Image.asset(
                                              'assets/images/new_loader.gif',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.25,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.25,
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: Image.asset(
                                              'assets/images/new_loader.gif',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.25,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.25,
                                            ),
                                          ),
                                          noItemsFoundIndicatorBuilder: (_) =>
                                              Center(
                                            child: Image.asset(
                                              'assets/images/No_order_history.png',
                                            ),
                                          ),
                                          itemBuilder:
                                              (context, _, dataModelIndex) {
                                            final dataModelItem = _model
                                                .listViewPagingController1!
                                                .itemList![dataModelIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ALL_ORDERS_T_A_B_L_I_S_T_Container_u546w');
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                      OrderTrackingPageWidget
                                                          .routeName);

                                                  logFirebaseEvent(
                                                      'Container_update_app_state');
                                                  FFAppState().groupID =
                                                      getJsonField(
                                                    dataModelItem,
                                                    r'''$.group_id''',
                                                  ).toString();
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'Container_google_analytics_event');
                                                  logFirebaseEvent(
                                                    'Navigation',
                                                    parameters: {
                                                      'Screen Name':
                                                          'Daily Order Screen',
                                                      'Navigate To':
                                                          'Order Tracking Screen',
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FFAppConstants
                                                        .whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    border: Border.all(
                                                      color: FFAppConstants
                                                          .whiteColor,
                                                      width: 0.0,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                3.0,
                                                                                0.0,
                                                                                2.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Order ID:',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FFAppConstants.blackColor0A0A0A,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        getJsonField(
                                                                                          dataModelItem,
                                                                                          r'''$.group_id''',
                                                                                        ).toString(),
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
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FFAppConstants.green44AC20,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    child: Visibility(
                                                                                      visible: _model.orderTypeTrial ==
                                                                                          getJsonField(
                                                                                            dataModelItem,
                                                                                            r'''$.orderType''',
                                                                                          ).toString(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 3.0, 5.0, 3.0),
                                                                                        child: Text(
                                                                                          'TRIAL PACK ',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FFAppConstants.whiteColor,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (_model.orderTypeTrial !=
                                                                                    getJsonField(
                                                                                      dataModelItem,
                                                                                      r'''$.orderType''',
                                                                                    ).toString())
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Visibility(
                                                                                        visible: _model.orderTypeTrial !=
                                                                                            getJsonField(
                                                                                              dataModelItem,
                                                                                              r'''$.orderType''',
                                                                                            ).toString(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 3.0, 5.0, 3.0),
                                                                                          child: Text(
                                                                                            functions.setOrderStatus(getJsonField(
                                                                                              dataModelItem,
                                                                                              r'''$.order_status''',
                                                                                            ).toString())!,
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: functions.setBgColorinIOrder(getJsonField(
                                                                                                    dataModelItem,
                                                                                                    r'''$.order_status''',
                                                                                                  ).toString()),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                3.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Order Date: ',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FFAppConstants.blackColor0A0A0A,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      functions.setCustomDateFormate(
                                                                                          getJsonField(
                                                                                            dataModelItem,
                                                                                            r'''$.order_date''',
                                                                                          ).toString(),
                                                                                          'yyyy-MM-dd',
                                                                                          'dd-MM-yyyy')!,
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
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        '',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'AED',
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
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          functions.setDecimalValue(getJsonField(
                                                                                            dataModelItem,
                                                                                            r'''$.price_without_delivery''',
                                                                                          ).toString())!,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FFAppConstants.indigoColor,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                              child: Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                height: 0.1,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFC2C8CE),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.0)),
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
                                                                          8.0,
                                                                          5.0,
                                                                          8.0,
                                                                          5.0),
                                                              child: Text(
                                                                (String var1) {
                                                                  return var1
                                                                      .replaceAll(
                                                                          RegExp(
                                                                              ','),
                                                                          ', ');
                                                                }(getJsonField(
                                                                  dataModelItem,
                                                                  r'''$.productname''',
                                                                ).toString()),
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
                                                                          .blackColor0A0A0A,
                                                                      fontSize:
                                                                          12.0,
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
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 0.5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFC2C8CE),
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
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                1.0, 5.0, 0.0, 10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter1 ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(QuickartGroup
                                              .myorderssubscriptionlistCall
                                              .call(
                                            storeid: FFAppState().storeID,
                                            userid: FFAppState().userID,
                                            page: FFAppState().page,
                                            pageper: 30,
                                            platform: isiOS ? 'ios' : 'android',
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 50.0, 0.0, 0.0),
                                        child: Image.asset(
                                          'assets/images/new_loader.gif',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.25,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.25,
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewMyorderssubscriptionlistResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final subscriptionModel = getJsonField(
                                        listViewMyorderssubscriptionlistResponse
                                            .jsonBody,
                                        r'''$.data''',
                                      ).toList();
                                      if (subscriptionModel.isEmpty) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/No_order_history.png',
                                          ),
                                        );
                                      }

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          logFirebaseEvent(
                                              'ALL_ORDERS_T_A_B_L_I_S_T_ListView_2130ma');
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            0,
                                            140.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: subscriptionModel.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 10.0),
                                          itemBuilder: (context,
                                              subscriptionModelIndex) {
                                            final subscriptionModelItem =
                                                subscriptionModel[
                                                    subscriptionModelIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ALL_ORDERS_T_A_B_L_I_S_T_Container_u5xrf');
                                                  logFirebaseEvent(
                                                      'Container_update_app_state');
                                                  FFAppState().cartID =
                                                      getJsonField(
                                                    subscriptionModelItem,
                                                    r'''$.group_id''',
                                                  ).toString();
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                    SubscriptionOrderProductsWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'orderDate':
                                                          serializeParam(
                                                        getJsonField(
                                                          subscriptionModelItem,
                                                          r'''$.order_date''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'orderPrice':
                                                          serializeParam(
                                                        getJsonField(
                                                          subscriptionModelItem,
                                                          r'''$.total_mrp''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  logFirebaseEvent(
                                                      'Container_google_analytics_event');
                                                  logFirebaseEvent(
                                                      'SubscriptionCardClickAnalytics');
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(8.0),
                                                      bottomRight:
                                                          Radius.circular(8.0),
                                                      topLeft:
                                                          Radius.circular(8.0),
                                                      topRight:
                                                          Radius.circular(8.0),
                                                    ),
                                                    border: Border.all(
                                                      color: FFAppConstants
                                                          .whiteColor,
                                                      width: 0.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
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
                                                                              'Order  ID #',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.montserrat(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            subscriptionModelItem,
                                                                            r'''$.group_id''',
                                                                          ).toString(),
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
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF3D3D3D),
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Order Date: ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        functions.setCustomDateFormate(
                                                                            getJsonField(
                                                                              subscriptionModelItem,
                                                                              r'''$.order_date''',
                                                                            ).toString(),
                                                                            'yyyy-MM-dd',
                                                                            'dd-MM-yyyy')!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'AED',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.w600,
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
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    subscriptionModelItem,
                                                                    r'''$.total_mrp''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FFAppConstants
                                                                            .indigoColor,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.95,
                                                          height: 0.1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF929AA1),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    10.0,
                                                                    8.0,
                                                                    10.0),
                                                        child: Text(
                                                          (String var1) {
                                                            return var1
                                                                .replaceAll(
                                                                    RegExp(','),
                                                                    ', ');
                                                          }(getJsonField(
                                                            subscriptionModelItem,
                                                            r'''$.productname''',
                                                          ).toString()),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppConstants
                                                                    .blackColor0A0A0A,
                                                                fontSize: 12.0,
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
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3.0,
                                                                    0.0,
                                                                    5.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            if (FFAppConstants
                                                                    .orderStatusCompleted ==
                                                                getJsonField(
                                                                  subscriptionModelItem,
                                                                  r'''$.order_status''',
                                                                ).toString())
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ALL_ORDERS_T_A_B_L_I_S_T_BUY_AGAIN_BTN_O');
                                                                  logFirebaseEvent(
                                                                      'Button_custom_action');
                                                                  _model.connectivityResult =
                                                                      await actions
                                                                          .checkInternetConnection();
                                                                  if (_model
                                                                          .connectivityResult ==
                                                                      true) {
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');
                                                                    _model.apiResulth0d =
                                                                        await QuickartGroup
                                                                            .placerepeatedorderCall
                                                                            .call(
                                                                      cartid:
                                                                          getJsonField(
                                                                        subscriptionModelItem,
                                                                        r'''$.group_id''',
                                                                      ).toString(),
                                                                      userid: FFAppState()
                                                                          .userID,
                                                                      replaceStatus:
                                                                          '1',
                                                                      deviceid:
                                                                          FFAppState()
                                                                              .deviceID,
                                                                      orderType:
                                                                          'subscription',
                                                                      platform: isiOS
                                                                          ? 'ios'
                                                                          : 'android',
                                                                    );

                                                                    if ((_model
                                                                            .apiResulth0d
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context.pushNamed(
                                                                          CartSubscriptionScreenWidget
                                                                              .routeName);

                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                              .isWedSelected =
                                                                          false;
                                                                      FFAppState()
                                                                              .isSunSelected =
                                                                          false;
                                                                      FFAppState()
                                                                              .isMonSelected =
                                                                          false;
                                                                      FFAppState()
                                                                              .isTueSelected =
                                                                          false;
                                                                      FFAppState()
                                                                              .isThuSelected =
                                                                          false;
                                                                      FFAppState()
                                                                              .isFriSelected =
                                                                          false;
                                                                      FFAppState()
                                                                              .isSatSelected =
                                                                          false;
                                                                      FFAppState()
                                                                          .isWeekSelected = 0;
                                                                      FFAppState()
                                                                              .isSubcribeCartVisible =
                                                                          false;
                                                                      FFAppState()
                                                                              .isDeliveryTimeSlotSelected =
                                                                          'no';
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      _model.apiResultupdateProfile = await QuickartGroup
                                                                          .updateproductdetailsCall
                                                                          .call(
                                                                        userid:
                                                                            FFAppState().userID,
                                                                        platform: isiOS
                                                                            ? 'ios'
                                                                            : 'android',
                                                                      );

                                                                      if ((_model
                                                                              .apiResultupdateProfile
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState().subCartTotalItem =
                                                                            getJsonField(
                                                                          (_model.apiResultupdateProfile?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.subscriptioncartCount''',
                                                                        );
                                                                        FFAppState().subCartTotalPrice =
                                                                            functions.checkDoubleValue(getJsonField(
                                                                          (_model.apiResultupdateProfile?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.subscriptiontotalPrice''',
                                                                        ).toString())!;
                                                                        FFAppState().subCartSavingAmount =
                                                                            functions.checkDoubleValue(getJsonField(
                                                                          (_model.apiResultupdateProfile?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.subscriptiondiscountOnMrp''',
                                                                        ).toString())!;
                                                                        FFAppState().userWalletstr =
                                                                            getJsonField(
                                                                          (_model.apiResultupdateProfile?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.userwallet''',
                                                                        ).toString();
                                                                        FFAppState().isCartShow =
                                                                            false;
                                                                        FFAppState().nullValue =
                                                                            'null';
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        logFirebaseEvent(
                                                                            'Button_custom_action');
                                                                        await actions
                                                                            .facebookEventClass(
                                                                          FFAppState()
                                                                              .userID,
                                                                          ' ',
                                                                          getJsonField(
                                                                            subscriptionModelItem,
                                                                            r'''$.group_id''',
                                                                          ).toString(),
                                                                          0.0,
                                                                          0,
                                                                          double.parse(
                                                                              getJsonField(
                                                                            subscriptionModelItem,
                                                                            r'''$.total_mrp''',
                                                                          ).toString()),
                                                                          'buyNow',
                                                                          FFAppState()
                                                                              .emptyJson,
                                                                          'subscription order',
                                                                          ' ',
                                                                          ' ',
                                                                          ' ',
                                                                          ' ',
                                                                        );
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button_show_snack_bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              '',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      }

                                                                      logFirebaseEvent(
                                                                          'Button_google_analytics_event');
                                                                      logFirebaseEvent(
                                                                        'Buy Again',
                                                                        parameters: {
                                                                          'Screen Name':
                                                                              'My Subscription Screen',
                                                                          'API Name':
                                                                              'Place Repeat Order',
                                                                          'Navigate To':
                                                                              'Daily Cart Screen',
                                                                        },
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_show_snack_bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            getJsonField(
                                                                              (_model.apiResulth0d?.jsonBody ?? ''),
                                                                              r'''$.message''',
                                                                            ).toString(),
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FFAppConstants.NeutralBlack50Color,
                                                                        ),
                                                                      );
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          FFAppConstants
                                                                              .internetString,
                                                                          style:
                                                                              GoogleFonts.montserrat(
                                                                            color:
                                                                                FFAppConstants.blackColor0A0A0A,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FFAppConstants.NeutralBlack50Color,
                                                                      ),
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text:
                                                                    'Buy Again',
                                                                icon: Icon(
                                                                  Icons
                                                                      .restart_alt,
                                                                  size: MediaQuery.sizeOf(context)
                                                                              .width <=
                                                                          375.0
                                                                      ? 14.0
                                                                      : 20.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          valueOrDefault<
                                                                              double>(
                                                                            MediaQuery.sizeOf(context).width <= 375.0
                                                                                ? 4.0
                                                                                : 8.0,
                                                                            0.0,
                                                                          ),
                                                                          0.0,
                                                                          valueOrDefault<
                                                                              double>(
                                                                            MediaQuery.sizeOf(context).width <= 375.0
                                                                                ? 4.0
                                                                                : 8.0,
                                                                            0.0,
                                                                          ),
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconColor:
                                                                      FFAppConstants
                                                                          .darkGreen,
                                                                  color: FFAppConstants
                                                                      .whiteColor,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FFAppConstants
                                                                            .darkGreen,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FFAppConstants
                                                                        .darkGreen,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              14.0),
                                                                ),
                                                              ),
                                                            if ((FFAppConstants
                                                                        .checkTrueCondition ==
                                                                    getJsonField(
                                                                      subscriptionModelItem,
                                                                      r'''$.si_order''',
                                                                    )
                                                                        .toString()) &&
                                                                (FFAppConstants
                                                                        .orderStatusCancelled !=
                                                                    getJsonField(
                                                                      subscriptionModelItem,
                                                                      r'''$.order_status''',
                                                                    )
                                                                        .toString()) &&
                                                                (FFAppConstants
                                                                        .orderStatusCompleted !=
                                                                    getJsonField(
                                                                      subscriptionModelItem,
                                                                      r'''$.order_status''',
                                                                    ).toString()))
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ALL_ORDERS_T_A_B_L_I_S_T_CHANGE_CARD_BTN');
                                                                  logFirebaseEvent(
                                                                      'Button_update_app_state');
                                                                  FFAppState()
                                                                          .isCardChange =
                                                                      true;
                                                                  FFAppState()
                                                                          .categoryName =
                                                                      'cart';
                                                                  FFAppState()
                                                                          .isSiNoSelected =
                                                                      true;
                                                                  FFAppState()
                                                                          .cartID =
                                                                      getJsonField(
                                                                    subscriptionModelItem,
                                                                    r'''$.cart_id''',
                                                                  ).toString();
                                                                  FFAppState()
                                                                          .selectedCardID =
                                                                      getJsonField(
                                                                    subscriptionModelItem,
                                                                    r'''$.si_sub_ref_no''',
                                                                  ).toString();
                                                                  FFAppState()
                                                                          .cardScreenNavigation =
                                                                      'subscription';
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_navigate_to');
                                                                  if (Navigator.of(
                                                                          context)
                                                                      .canPop()) {
                                                                    context
                                                                        .pop();
                                                                  }
                                                                  context.pushNamed(
                                                                      CardScreenWidget
                                                                          .routeName);

                                                                  logFirebaseEvent(
                                                                      'Button_google_analytics_event');
                                                                  logFirebaseEvent(
                                                                    'Navigation',
                                                                    parameters: {
                                                                      'Screen Name':
                                                                          'My Subscription Screen',
                                                                      'Navigate To':
                                                                          'Card Screen',
                                                                    },
                                                                  );
                                                                },
                                                                text:
                                                                    'Change Card',
                                                                icon: Icon(
                                                                  Icons
                                                                      .credit_card,
                                                                  size: 14.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              375.0
                                                                          ? 4.0
                                                                          : 8.0,
                                                                      0.0,
                                                                      MediaQuery.sizeOf(context).width <=
                                                                              375.0
                                                                          ? 4.0
                                                                          : 8.0,
                                                                      0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconColor:
                                                                      FFAppConstants
                                                                          .blackColor0A0A0A,
                                                                  color: FFAppConstants
                                                                      .whiteColor,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FFAppConstants
                                                                            .blackColor0A0A0A,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FFAppConstants
                                                                        .blackColor0A0A0A,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              14.0),
                                                                ),
                                                              ),
                                                            if (FFAppConstants
                                                                    .orderStatusCompleted ==
                                                                getJsonField(
                                                                  subscriptionModelItem,
                                                                  r'''$.order_status''',
                                                                ).toString())
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ALL_ORDERS_T_A_B_L_I_S_T_RATE_ORDER_BTN_');
                                                                  logFirebaseEvent(
                                                                      'Button_custom_action');
                                                                  _model.connectivityResult1 =
                                                                      await actions
                                                                          .checkInternetConnection();
                                                                  if (_model
                                                                          .connectivityResult1 ==
                                                                      true) {
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');
                                                                    _model.apiResulthi9 =
                                                                        await QuickartGroup
                                                                            .orderssubscriptionproductCall
                                                                            .call(
                                                                      userid: FFAppState()
                                                                          .userID,
                                                                      storeid:
                                                                          FFAppState()
                                                                              .storeID,
                                                                      groupid:
                                                                          getJsonField(
                                                                        subscriptionModelItem,
                                                                        r'''$.group_id''',
                                                                      ).toString(),
                                                                    );

                                                                    if ((_model
                                                                            .apiResulthi9
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                              .RatingScreenName =
                                                                          'SubscriptionOrderRating';
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        RatingOrderScreenWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'productList':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              (_model.apiResulthi9?.jsonBody ?? ''),
                                                                              r'''$.data''',
                                                                            ),
                                                                            ParamType.JSON,
                                                                          ),
                                                                          'cartId':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              subscriptionModelItem,
                                                                              r'''$.cart_id''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'subscriptionID':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              subscriptionModelItem,
                                                                              r'''$.subscription_id''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'screenName':
                                                                              serializeParam(
                                                                            'subscription',
                                                                            ParamType.String,
                                                                          ),
                                                                          'rating':
                                                                              serializeParam(
                                                                            FFAppState().nullValue ==
                                                                                    getJsonField(
                                                                                      subscriptionModelItem,
                                                                                      r'''$.drating''',
                                                                                    ).toString()
                                                                                ? 00
                                                                                : getJsonField(
                                                                                    subscriptionModelItem,
                                                                                    r'''$.drating''',
                                                                                  ),
                                                                            ParamType.int,
                                                                          ),
                                                                          'reviewStr':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              subscriptionModelItem,
                                                                              r'''$.dreview''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_show_snack_bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            getJsonField(
                                                                              (_model.apiResulthi9?.jsonBody ?? ''),
                                                                              r'''$.message''',
                                                                            ).toString(),
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 850),
                                                                          backgroundColor:
                                                                              FFAppConstants.NeutralBlack50Color,
                                                                        ),
                                                                      );
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          FFAppConstants
                                                                              .internetString,
                                                                          style:
                                                                              GoogleFonts.montserrat(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 850),
                                                                        backgroundColor:
                                                                            FFAppConstants.NeutralBlack50Color,
                                                                      ),
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                text:
                                                                    'Rate Order',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          valueOrDefault<
                                                                              double>(
                                                                            MediaQuery.sizeOf(context).width <= 375.0
                                                                                ? 5.0
                                                                                : 7.0,
                                                                            0.0,
                                                                          ),
                                                                          0.0,
                                                                          valueOrDefault<
                                                                              double>(
                                                                            MediaQuery.sizeOf(context).width <= 375.0
                                                                                ? 5.0
                                                                                : 7.0,
                                                                            0.0,
                                                                          ),
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FFAppConstants
                                                                      .whiteColor,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              14.0),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 0.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
