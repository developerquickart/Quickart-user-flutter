import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'couponsand_offers_model.dart';
export 'couponsand_offers_model.dart';

class CouponsandOffersWidget extends StatefulWidget {
  const CouponsandOffersWidget({super.key});

  static String routeName = 'CouponsandOffers';
  static String routePath = '/couponsandOffers';

  @override
  State<CouponsandOffersWidget> createState() => _CouponsandOffersWidgetState();
}

class _CouponsandOffersWidgetState extends State<CouponsandOffersWidget> {
  late CouponsandOffersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CouponsandOffersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CouponsandOffers'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('COUPONSAND_OFFERS_CouponsandOffers_ON_IN');
      logFirebaseEvent('CouponsandOffers_custom_action');
      _model.internetConnection = await actions.checkInternetConnection();
      if (_model.internetConnection == true) {
        logFirebaseEvent('CouponsandOffers_update_app_state');

        safeSetState(() {});
        logFirebaseEvent('CouponsandOffers_google_analytics_event');
        logFirebaseEvent('CouponsAndOffersAnalytics');
      } else {
        logFirebaseEvent('CouponsandOffers_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.internetString,
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          backgroundColor: Color(0xFFDADBF0),
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
                logFirebaseEvent('COUPONSAND_OFFERS_chevron_left_ICN_ON_TA');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
            title: Text(
              'My Offers',
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
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (FFAppState().couponsScreen != 'profile')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FFAppConstants.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  border: Border.all(
                                    color: FFAppConstants.neutralBlackE0E0E0,
                                    width: 1.0,
                                  ),
                                ),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'Enter coupon code',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FFAppConstants.indigoColor,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 5.0, 10.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'COUPONSAND_OFFERS_Text_w2ehdrl6_ON_TAP');
                                    logFirebaseEvent('Text_update_page_state');
                                    _model.isLoadingIndicator = true;
                                    safeSetState(() {});
                                    logFirebaseEvent('Text_backend_call');
                                    _model.apiResultrm2 = await QuickartGroup
                                        .applyCouponCall
                                        .call(
                                      couponCode: _model.textController.text,
                                      userId: FFAppState().userID,
                                      storeId: FFAppState().storeID,
                                      orderType: FFAppState().couponType,
                                      platform: isiOS ? 'ios' : 'android',
                                    );

                                    if ((_model.apiResultrm2?.succeeded ??
                                        true)) {
                                      if (FFAppConstants.statusAPI1 ==
                                          getJsonField(
                                            (_model.apiResultrm2?.jsonBody ??
                                                ''),
                                            r'''$.status''',
                                          ).toString()) {
                                        logFirebaseEvent('Text_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.apiResultrm2
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                              style: GoogleFonts.montserrat(
                                                color:
                                                    FFAppConstants.indigoColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0xFFC1BEBE),
                                          ),
                                        );
                                        logFirebaseEvent(
                                            'Text_update_app_state');
                                        FFAppState().couponCode = getJsonField(
                                          (_model.apiResultrm2?.jsonBody ?? ''),
                                          r'''$.data.coupon_code''',
                                        ).toString();
                                        FFAppState().isCouponApplied = true;
                                        FFAppState().selectedCouponID =
                                            getJsonField(
                                          (_model.apiResultrm2?.jsonBody ?? ''),
                                          r'''$.data.coupon_id''',
                                        ).toString();
                                        FFAppState().couponDiscount =
                                            getJsonField(
                                          (_model.apiResultrm2?.jsonBody ?? ''),
                                          r'''$.data.save_amount''',
                                        );
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Text_update_page_state');
                                        _model.isLoadingIndicator = false;
                                        safeSetState(() {});
                                        logFirebaseEvent('Text_navigate_back');
                                        context.safePop();
                                        logFirebaseEvent('Text_custom_action');
                                        await actions.facebookEventClass(
                                          FFAppState().userID,
                                          _model.textController.text,
                                          FFAppState().couponType,
                                          0.0,
                                          1,
                                          0.0,
                                          'coupon',
                                          FFAppState().emptyJson,
                                          ' ',
                                          ' ',
                                          ' ',
                                          ' ',
                                          ' ',
                                        );
                                      } else {
                                        logFirebaseEvent('Text_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.apiResultrm2
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                              style: GoogleFonts.montserrat(
                                                color:
                                                    FFAppConstants.indigoColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 1250),
                                            backgroundColor: Color(0xFFDCD9D9),
                                          ),
                                        );
                                        logFirebaseEvent(
                                            'Text_update_page_state');
                                        _model.isLoadingIndicator = false;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Text_update_app_state');
                                        FFAppState().isCouponApplied = false;
                                        safeSetState(() {});
                                      }
                                    } else {
                                      logFirebaseEvent('Text_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.apiResultrm2?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
                                            style: GoogleFonts.montserrat(
                                              color: FFAppConstants.indigoColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 1250),
                                          backgroundColor: Color(0xFFDFDADA),
                                        ),
                                      );
                                      logFirebaseEvent('Text_update_app_state');
                                      FFAppState().isCouponApplied = false;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Text_update_page_state');
                                      _model.isLoadingIndicator = false;
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Text(
                                    'APPLY',
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
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Available Coupons',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppConstants.indigoColor,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.85,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_model.apiRequestCompleter ??= Completer<
                                    ApiCallResponse>()
                                  ..complete(QuickartGroup.couponListCall.call(
                                    userId: FFAppState().userID,
                                    storeId: '7',
                                    cartId: 'null',
                                    totalDelievery: '2',
                                    platform: isiOS ? 'ios' : 'android',
                                  )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/new_loader.gif',
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.25,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.25,
                                  ),
                                );
                              }
                              final listViewCouponListResponse = snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final couponData = getJsonField(
                                    listViewCouponListResponse.jsonBody,
                                    r'''$.data''',
                                  ).toList();
                                  if (couponData.isEmpty) {
                                    return Image.asset(
                                      'assets/images/No_data_available.png',
                                    );
                                  }

                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      logFirebaseEvent(
                                          'COUPONSAND_OFFERS_ListView_4x41du20_ON_P');
                                      logFirebaseEvent(
                                          'ListView_refresh_database_request');
                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                    },
                                    child: ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        FFAppState().couponsScreen != 'profile'
                                            ? 80.0
                                            : 50.0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: couponData.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 10.0),
                                      itemBuilder: (context, couponDataIndex) {
                                        final couponDataItem =
                                            couponData[couponDataIndex];
                                        return Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/subtract_n.png',
                                              ).image,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 20.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    7.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
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
                                                                  child:
                                                                      Container(
                                                                    width: 70.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onLongPress:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'COUPONSAND_OFFERS_Image_ab5q278w_ON_LONG');
                                                                        logFirebaseEvent(
                                                                            'Image_update_page_state');
                                                                        _model.couponImage =
                                                                            getJsonField(
                                                                          couponDataItem,
                                                                          r'''$.coupon_image''',
                                                                        ).toString();
                                                                        _model.couponimgBool =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          getJsonField(
                                                                            couponDataItem,
                                                                            r'''$.coupon_image''',
                                                                          ).toString(),
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.7,
                                                                          height:
                                                                              40.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
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
                                                                      Container(
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FFAppConstants
                                                                          .primaryPurpleE4D8F5,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FFAppConstants
                                                                            .indigoColor,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        couponDataItem,
                                                                        r'''$.coupon_code''',
                                                                      ).toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
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
                                                                                FFAppConstants.indigoColor,
                                                                            fontSize:
                                                                                13.0,
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
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (FFAppState()
                                                                        .couponsScreen !=
                                                                    'profile')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'COUPONSAND_OFFERS_Text_h2yom5h4_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Text_update_page_state');
                                                                        _model.isLoadingIndicator =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Text_backend_call');
                                                                        _model.apiResulth77 = await QuickartGroup
                                                                            .applyCouponCall
                                                                            .call(
                                                                          storeId:
                                                                              FFAppState().storeID,
                                                                          userId:
                                                                              FFAppState().userID,
                                                                          couponCode:
                                                                              getJsonField(
                                                                            couponDataItem,
                                                                            r'''$.coupon_code''',
                                                                          ).toString(),
                                                                          orderType:
                                                                              FFAppState().couponType,
                                                                          platform: isiOS
                                                                              ? 'ios'
                                                                              : 'android',
                                                                        );

                                                                        if ((_model.apiResulth77?.succeeded ??
                                                                            true)) {
                                                                          if (_model.status !=
                                                                              getJsonField(
                                                                                (_model.apiResulth77?.jsonBody ?? ''),
                                                                                r'''$.status''',
                                                                              )) {
                                                                            logFirebaseEvent('Text_update_app_state');
                                                                            FFAppState().couponCode =
                                                                                getJsonField(
                                                                              (_model.apiResulth77?.jsonBody ?? ''),
                                                                              r'''$.data.coupon_code''',
                                                                            ).toString();
                                                                            FFAppState().isCouponApplied =
                                                                                true;
                                                                            FFAppState().selectedCouponID =
                                                                                getJsonField(
                                                                              (_model.apiResulth77?.jsonBody ?? ''),
                                                                              r'''$.data.coupon_id''',
                                                                            ).toString();
                                                                            FFAppState().couponDiscount =
                                                                                functions.checkDoubleValue(getJsonField(
                                                                              (_model.apiResulth77?.jsonBody ?? ''),
                                                                              r'''$.data.save_amount''',
                                                                            ).toString())!;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Text_update_page_state');
                                                                            _model.isLoadingIndicator =
                                                                                false;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Text_show_snack_bar');
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  getJsonField(
                                                                                    (_model.apiResulth77?.jsonBody ?? ''),
                                                                                    r'''$.message''',
                                                                                  ).toString(),
                                                                                  style: GoogleFonts.montserrat(
                                                                                    color: FFAppConstants.indigoColor,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontSize: 12.0,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 1400),
                                                                                backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                              ),
                                                                            );
                                                                            logFirebaseEvent('Text_navigate_back');
                                                                            context.pop();
                                                                            logFirebaseEvent('Text_custom_action');
                                                                            await actions.facebookEventClass(
                                                                              FFAppState().userID,
                                                                              getJsonField(
                                                                                couponDataItem,
                                                                                r'''$.coupon_code''',
                                                                              ).toString(),
                                                                              FFAppState().couponType,
                                                                              0.0,
                                                                              1,
                                                                              0.0,
                                                                              'coupon',
                                                                              FFAppState().emptyJson,
                                                                              ' ',
                                                                              ' ',
                                                                              ' ',
                                                                              ' ',
                                                                              ' ',
                                                                            );
                                                                            logFirebaseEvent('Text_google_analytics_event');
                                                                            logFirebaseEvent(
                                                                              'Apply Coupon',
                                                                              parameters: {
                                                                                'Screen Name': 'Coupons and Offers',
                                                                                'API Name': 'Apply Coupon',
                                                                              },
                                                                            );
                                                                          } else {
                                                                            logFirebaseEvent('Text_alert_dialog');
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text(FFAppState().AppName),
                                                                                  content: Text(getJsonField(
                                                                                    (_model.apiResulth77?.jsonBody ?? ''),
                                                                                    r'''$.message''',
                                                                                  ).toString()),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                            logFirebaseEvent('Text_update_page_state');
                                                                            _model.isLoadingIndicator =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          }
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Text_alert_dialog');
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text(FFAppState().AppName),
                                                                                content: Text(getJsonField(
                                                                                  (_model.apiResulth77?.jsonBody ?? ''),
                                                                                  r'''$.message''',
                                                                                ).toString()),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Text_update_page_state');
                                                                          _model.isLoadingIndicator =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'APPLY',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FFAppConstants.redDF3F56,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                        .couponsScreen ==
                                                                    'profile')
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'COUPONSAND_OFFERS_PAGE_COPY_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_copy_to_clipboard');
                                                                      await Clipboard.setData(
                                                                          ClipboardData(
                                                                              text: getJsonField(
                                                                        couponDataItem,
                                                                        r'''$.coupon_code''',
                                                                      ).toString()));
                                                                    },
                                                                    text:
                                                                        'Copy ',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .content_copy_outlined,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FFAppConstants
                                                                          .whiteColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FFAppConstants.lightBlack7a7a7a,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    showLoadingIndicator:
                                                                        false,
                                                                  ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    5.0,
                                                                    5.0,
                                                                    10.0),
                                                        child: Text(
                                                          getJsonField(
                                                            couponDataItem,
                                                            r'''$.coupon_description''',
                                                          ).toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppConstants
                                                                    .indigoColor,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    25.0,
                                                                    15.0,
                                                                    25.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 0.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    18.0,
                                                                    15.0,
                                                                    5.0),
                                                        child: RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Use  the code  ',
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
                                                                      fontSize:
                                                                          10.0,
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
                                                              TextSpan(
                                                                text:
                                                                    getJsonField(
                                                                  couponDataItem,
                                                                  r'''$.coupon_code''',
                                                                ).toString(),
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    ' from the   ',
                                                                style: GoogleFonts
                                                                    .montserrat(),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    getJsonField(
                                                                  couponDataItem,
                                                                  r'''$.coupon_name''',
                                                                ).toString(),
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    ' to  get ',
                                                                style: GoogleFonts
                                                                    .montserrat(),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    getJsonField(
                                                                  couponDataItem,
                                                                  r'''$.amount''',
                                                                ).toString(),
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: _model.discountType ==
                                                                        getJsonField(
                                                                          couponDataItem,
                                                                          r'''$.type''',
                                                                        ).toString()
                                                                    ? '%'
                                                                    : ' AED',
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    ' off on your order.',
                                                                style: GoogleFonts
                                                                    .montserrat(),
                                                              )
                                                            ],
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
                                                                  fontSize:
                                                                      10.0,
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
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'Offer Valid till - ',
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
                                                                          .indigoColor,
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
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  functions.customDateFormatter(
                                                                      getJsonField(
                                                                        couponDataItem,
                                                                        r'''$.end_date''',
                                                                      ).toString(),
                                                                      '1'),
                                                                  '0',
                                                                ),
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  color: FFAppConstants
                                                                      .indigoColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                              )
                                                            ],
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
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
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
                if (_model.couponimgBool == true)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'COUPONSAND_OFFERS_Container_2y8zx147_ON_');
                      logFirebaseEvent('Container_update_page_state');
                      _model.couponimgBool = false;
                      safeSetState(() {});
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0x5114181B),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 40.0, 5.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'COUPONSAND_OFFERS_Container_u10c3u4z_ON_');
                                  logFirebaseEvent(
                                      'Container_update_page_state');
                                  _model.couponimgBool = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                _model.couponImage!,
                                width: MediaQuery.sizeOf(context).width * 0.75,
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (_model.isLoadingIndicator == true)
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
                            width: 100.0,
                            height: 100.0,
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
      ),
    );
  }
}
