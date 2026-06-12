import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/bottomnav_bar/bottomnav_bar_widget.dart';
import '/components/brand_widget/brand_widget_widget.dart';
import '/components/custom_alert_signup_dailog/custom_alert_signup_dailog_widget.dart';
import '/components/order_again_list_view/order_again_list_view_widget.dart';
import '/components/products_list_view/products_list_view_widget.dart';
import '/components/top_category_widget/top_category_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dashboard_screen_model.dart';
export 'dashboard_screen_model.dart';

class DashboardScreenWidget extends StatefulWidget {
  const DashboardScreenWidget({
    super.key,
    this.utmSource,
    this.utmCampaign,
    this.utmNetwork,
    this.utmMedium,
    this.utmKeyword,
    this.utmPlacement,
  });

  final String? utmSource;
  final String? utmCampaign;
  final String? utmNetwork;
  final String? utmMedium;
  final String? utmKeyword;
  final String? utmPlacement;

  static String routeName = 'DashboardScreen';
  static String routePath = '/dashboardScreen';

  @override
  State<DashboardScreenWidget> createState() => _DashboardScreenWidgetState();
}

class _DashboardScreenWidgetState extends State<DashboardScreenWidget>
    with WidgetsBindingObserver {
  late DashboardScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    // updateFC();
    _model = createModel(context, () => DashboardScreenModel());
    // Load data on first open
    loadDashboard();
  }

  // updateFC() async {
  //   await FirebaseAnalytics.instance.logEvent(
  //     name: 'ios_debug_test',
  //     parameters: {'platform': 'ios'},
  //   );
  // }

  @override
  void dispose() {
    _model.dispose();
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      loadDashboard(); // reload API when app comes back
    }
  }

  // ✅ API CALL METHOD
  void loadDashboard() {
    setState(() {
      _model = createModel(context, () => DashboardScreenModel());

      logFirebaseEvent('screen_view',
          parameters: {'screen_name': 'DashboardScreen'});
      // On page load action.
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        logFirebaseEvent('DASHBOARD_SCREEN_DashboardScreen_ON_INIT');
        logFirebaseEvent('DashboardScreen_refresh_database_request');
        safeSetState(() => _model.apiRequestCompleter = null);
        await _model.waitForApiRequestCompleted(maxWait: 5000);
        logFirebaseEvent('DashboardScreen_custom_action');
        await actions.facebookEventClass(
          FFAppState().userID,
          ' ',
          ' ',
          0.0,
          0,
          0.0,
          'home',
          FFAppState().emptyJson,
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
        );
        logFirebaseEvent('DashboardScreen_custom_action');
        await actions.setAppsFlyerCUID(
          FFAppState().userID,
        );
        logFirebaseEvent('DashboardScreen_custom_action');
        await actions.facebookEventClass(
          FFAppState().userID,
          ' ',
          ' ',
          0.0,
          0,
          0.0,
          'location',
          FFAppState().emptyJson,
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
        );
        logFirebaseEvent('DashboardScreen_backend_call');
        _model.apiResultCartCount =
            await QuickartGroup.updateproductdetailsCall.call(
          userid: (FFAppState().userID == null || FFAppState().userID.isEmpty)
              ? "0"
              : FFAppState().userID,
        );

        if ((_model.apiResultCartCount?.succeeded ?? true)) {
          logFirebaseEvent('DashboardScreen_update_app_state');
          FFAppState().cartTotalCount = getJsonField(
            (_model.apiResultCartCount?.jsonBody ?? ''),
            r'''$.data.dailycartCount''',
          );
          FFAppState().cartTotalPrice = functions.checkDoubleValue(getJsonField(
            (_model.apiResultCartCount?.jsonBody ?? ''),
            r'''$.data.dailytotalPrice''',
          ).toString())!;
          FFAppState().cartSavingPrice =
              functions.checkDoubleValue(getJsonField(
            (_model.apiResultCartCount?.jsonBody ?? ''),
            r'''$.data.dailydiscountOnMrp''',
          ).toString())!;
          FFAppState().subCartTotalItem = getJsonField(
            (_model.apiResultCartCount?.jsonBody ?? ''),
            r'''$.data.subscriptioncartCount''',
          );
          FFAppState().subCartTotalPrice =
              functions.checkDoubleValue(getJsonField(
            (_model.apiResultCartCount?.jsonBody ?? ''),
            r'''$.data.subscriptiontotalPrice''',
          ).toString())!;
          FFAppState().subCartSavingAmount =
              functions.checkDoubleValue(getJsonField(
            (_model.apiResultCartCount?.jsonBody ?? ''),
            r'''$.data.subscriptiondiscountOnMrp''',
          ).toString())!;
          FFAppState().userWalletstr = getJsonField(
            (_model.apiResultCartCount?.jsonBody ?? ''),
            r'''$.data.userwallet''',
          ).toString();
          FFAppState().isCartShow = false;
          FFAppState().nullValue = 'null';
          safeSetState(() {});
          if (widget!.utmSource != null && widget!.utmSource != '') {
            logFirebaseEvent('DashboardScreen_backend_call');
            _model.apiResultSeoSouDashboard =
                await QuickartGroup.seosourceCall.call(
              utmSource: widget!.utmSource,
              utmcampaign: widget!.utmCampaign,
              utmnetwork: widget!.utmNetwork,
              utmmedium: widget!.utmNetwork,
              utmkeyword: FFAppState().utmKeyword,
              placement: widget!.utmPlacement,
              userid: FFAppState().userID,
              deviceid: FFAppState().deviceID,
              fcmtoken: FFAppState().fcmToken,
              platform: FFAppState().platform,
            );

            if ((_model.apiResultSeoSouDashboard?.succeeded ?? true)) {
              logFirebaseEvent('DashboardScreen_google_analytics_event');
              logFirebaseEvent(
                'DashboardAnalytics',
                parameters: {
                  'API Name': 'Dashboard',
                  'Keyword': FFAppState().keyword,
                },
              );
              logFirebaseEvent('DashboardScreen_custom_action');
              await actions.facebookEventClass(
                widget!.utmKeyword!,
                widget!.utmPlacement!,
                FFAppState().userID,
                0.0,
                0,
                0.0,
                'utmSource',
                FFAppState().emptyJson,
                ' dashboard',
                widget!.utmSource,
                widget!.utmCampaign,
                widget!.utmNetwork,
                widget!.utmMedium,
              );
            } else {
              logFirebaseEvent('DashboardScreen_show_snack_bar');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    getJsonField(
                      (_model.apiResultSeoSouDashboard?.jsonBody ?? ''),
                      r'''$.message''',
                    ).toString(),
                    style: GoogleFonts.montserrat(
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
                  duration: Duration(milliseconds: 1200),
                  backgroundColor: FFAppConstants.NeutralBlack50Color,
                ),
              );
            }

            logFirebaseEvent('DashboardScreen_backend_call');
            _model.apiResultso1IOS = await QuickartGroup.appinfoCall.call(
              userid: FFAppState().userID,
              stroreid: FFAppState().storeID,
              platform: 'ios',
              fcmToken: FFAppState().fcmToken,
              deviceid: FFAppState().deviceID,
            );

            if ((_model.apiResultso1IOS?.succeeded ?? true)) {
              logFirebaseEvent('DashboardScreen_update_app_state');
              FFAppState().appInfo = getJsonField(
                (_model.apiResultSeoSouDashboard?.jsonBody ?? ''),
                r'''$.data''',
              );
              FFAppState().userWalletstr = getJsonField(
                (_model.apiResultso1IOS?.jsonBody ?? ''),
                r'''$.data.userwallet''',
              ).toString();
              FFAppState().dashboardBanner = getJsonField(
                (_model.apiResultso1IOS?.jsonBody ?? ''),
                r'''$.oneapi_bg_first_image''',
              ).toString();
              FFAppState().trialPackBannerImage = getJsonField(
                (_model.apiResultso1IOS?.jsonBody ?? ''),
                r'''$.trailpackimage''',
              ).toString();
              FFAppState().update(() {});
            } else {
              logFirebaseEvent('DashboardScreen_show_snack_bar');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    QuickartGroup.appinfoCall.message(
                      (_model.apiResultso1IOS?.jsonBody ?? ''),
                    )!,
                    style: GoogleFonts.montserrat(
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FFAppConstants.NeutralBlack50Color,
                ),
              );
            }
          } else {
            logFirebaseEvent('DashboardScreen_backend_call');
            _model.apiResultso = await QuickartGroup.appinfoCall.call(
              userid: FFAppState().userID,
              stroreid: FFAppState().storeID,
              platform: 'ios',
              fcmToken: FFAppState().fcmToken,
              deviceid: FFAppState().deviceID,
            );

            if ((_model.apiResultso?.succeeded ?? true)) {
              logFirebaseEvent('DashboardScreen_update_app_state');
              FFAppState().appInfo = QuickartGroup.appinfoCall.data(
                (_model.apiResultso?.jsonBody ?? ''),
              );
              FFAppState().userWalletstr = getJsonField(
                (_model.apiResultso?.jsonBody ?? ''),
                r'''$.data.userwallet''',
              ).toString();
              FFAppState().dashboardBanner = getJsonField(
                (_model.apiResultso?.jsonBody ?? ''),
                r'''$.oneapi_bg_first_image''',
              ).toString();
              FFAppState().trialPackBannerImage = getJsonField(
                (_model.apiResultso?.jsonBody ?? ''),
                r'''$.trailpackimage''',
              ).toString();
              FFAppState().update(() {});
            }
          }
          logFirebaseEvent('DashboardScreen_custom_action');
          _model.refCodew = await actions.generateReferralLink(
            getJsonField(
              FFAppState().appInfo,
              r'''$.referral_code''',
            ).toString(),
          );
        } else {
          logFirebaseEvent('DashboardScreen_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                getJsonField(
                  (_model.apiResultCartCount?.jsonBody ?? ''),
                  r'''$.message''',
                ).toString(),
                style: GoogleFonts.montserrat(
                  color: FFAppConstants.indigoColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                ),
              ),
              duration: Duration(milliseconds: 3000),
              backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
            ),
          );
        }
      });

      WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(QuickartGroup.oneAPICall.call(
              storeID: FFAppState().storeID,
              userID:
                  (FFAppState().userID == null || FFAppState().userID.isEmpty)
                      ? "0"
                      : FFAppState().userID,
              deviceID: FFAppState().deviceID,
              platform: isiOS ? 'ios' : 'android',
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Image.asset(
                'assets/images/new_loader.gif',
                width: MediaQuery.sizeOf(context).width * 0.25,
                height: MediaQuery.sizeOf(context).height * 0.25,
              ),
            ),
          );
        }
        final dashboardScreenOneAPIResponse = snapshot.data!;
        print("OneAPI Response: ${(getJsonField(
              dashboardScreenOneAPIResponse.jsonBody,
              r'''$.message''',
            ) ?? '').toString()}");
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
              backgroundColor: Colors.white,
              body: Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Stack(
                  children: [
                    Builder(
                      builder: (context) {
                        if ("Internal Server Error" !=
                            getJsonField(
                              dashboardScreenOneAPIResponse.jsonBody,
                              r'''$.message''',
                            ).toString()) {
                          return Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.895,
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 350.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/bg-banner.jpg',
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.065,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 50),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 50),
                                                  imageUrl: getJsonField(
                                                    dashboardScreenOneAPIResponse
                                                        .jsonBody,
                                                    r'''$.oneapi_bg_first_image.home_bg_image''',
                                                  ).toString(),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.065,
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.065,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  child: custom_widgets
                                                      .CachedImage(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    imageUrl: getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.oneapi_bg_first_image.home_bg_image''',
                                                    ).toString(),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 30.0, 10.0, 0.0),
                                                child: Row(
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
                                                                  12.0,
                                                                  10.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        5.0,
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'DASHBOARD_SCREEN_Image_4n0hoim8_ON_TAP');
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Quickart_Icon.png',
                                                                  width: 25.0,
                                                                  height: 25.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: 'Hi, ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color:
                                                                            colorFromCssString(
                                                                          getJsonField(
                                                                            dashboardScreenOneAPIResponse.jsonBody,
                                                                            r'''$.oneapi_bg_first_image.bg_image_color''',
                                                                          ).toString(),
                                                                          defaultColor:
                                                                              Colors.black,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: functions
                                                                          .extractFirstName(
                                                                              FFAppState().userName) ??
                                                                      "",
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    color:
                                                                        colorFromCssString(
                                                                      getJsonField(
                                                                        dashboardScreenOneAPIResponse
                                                                            .jsonBody,
                                                                        r'''$.oneapi_bg_first_image.bg_image_color''',
                                                                      ).toString(),
                                                                      defaultColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        if ((FFAppState()
                                                                    .usserType !=
                                                                'guest') ||
                                                            (FFAppState()
                                                                    .userName !=
                                                                'Guest'))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        2.0,
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'DASHBOARD_SCREEN_RichText_xs97n668_ON_TA');
                                                                logFirebaseEvent(
                                                                    'RichText_navigate_to');

                                                                context.pushNamed(
                                                                    WalletScreenWidget
                                                                        .routeName);
                                                              },
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          'AED ',
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
                                                                                colorFromCssString(
                                                                              getJsonField(
                                                                                dashboardScreenOneAPIResponse.jsonBody,
                                                                                r'''$.oneapi_bg_first_image.bg_image_color''',
                                                                              ).toString(),
                                                                              defaultColor: Colors.black,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        functions
                                                                            .setDecimalValue(FFAppState().userWalletstr),
                                                                        '0.0',
                                                                      ),
                                                                      style: GoogleFonts
                                                                          .montserrat(
                                                                        color:
                                                                            colorFromCssString(
                                                                          getJsonField(
                                                                            dashboardScreenOneAPIResponse.jsonBody,
                                                                            r'''$.oneapi_bg_first_image.bg_image_color''',
                                                                          ).toString(),
                                                                          defaultColor:
                                                                              Colors.black,
                                                                        ),
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
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
                                                              ),
                                                            ),
                                                          ),
                                                        if ((FFAppState()
                                                                    .usserType !=
                                                                'guest') ||
                                                            (FFAppState()
                                                                    .userName !=
                                                                'Guest'))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        3.0,
                                                                        0.0,
                                                                        8.0,
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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'DASHBOARD_SCREEN_Icon_w4gh8mui_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon_navigate_to');

                                                                context.pushNamed(
                                                                    WalletScreenWidget
                                                                        .routeName);
                                                              },
                                                              child: Icon(
                                                                FFIcons.kwallet,
                                                                color:  colorFromCssString(
                                                                          getJsonField(
                                                                            dashboardScreenOneAPIResponse.jsonBody,
                                                                            r'''$.oneapi_bg_first_image.bg_icon_color''',
                                                                          ).toString(),
                                                                          defaultColor:
                                                                              Colors.black,
                                                                        ),
                                                                size: 25.0,
                                                              ),
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      3.0,
                                                                      5.0,
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'DASHBOARD_SCREEN_Icon_hnv7kjvz_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Icon_navigate_to');

                                                              context.pushNamed(
                                                                  NotificationsWidget
                                                                      .routeName);

                                                              logFirebaseEvent(
                                                                  'Icon_google_analytics_event');
                                                              logFirebaseEvent(
                                                                  'NotificationAnalytics');
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .notifications_sharp,
                                                              color: colorFromCssString(
                                                                          getJsonField(
                                                                            dashboardScreenOneAPIResponse.jsonBody,
                                                                            r'''$.oneapi_bg_first_image.bg_icon_color''',
                                                                          ).toString(),
                                                                          defaultColor:
                                                                              Colors.black,
                                                                        ),
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 70.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: 'Get ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color:
                                                                            colorFromCssString(
                                                                          getJsonField(
                                                                            dashboardScreenOneAPIResponse.jsonBody,
                                                                            r'''$.oneapi_bg_first_image.bg_image_color''',
                                                                          ).toString(),
                                                                          defaultColor:
                                                                              Colors.black,
                                                                        ),
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      'Freshness by ',
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    color:
                                                                        colorFromCssString(
                                                                      getJsonField(
                                                                        dashboardScreenOneAPIResponse
                                                                            .jsonBody,
                                                                        r'''$.oneapi_bg_first_image.bg_image_color''',
                                                                      ).toString(),
                                                                      defaultColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: functions
                                                                      .setTimeSlot(),
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    color:
                                                                        colorFromCssString(
                                                                      getJsonField(
                                                                        dashboardScreenOneAPIResponse
                                                                            .jsonBody,
                                                                        r'''$.oneapi_bg_first_image.bg_image_color''',
                                                                      ).toString(),
                                                                      defaultColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        13.0,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          13.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                      'DASHBOARD_SCREEN_Icon_7juhrwuo_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_update_app_state');
                                                                  FFAppState()
                                                                      .categoryName = '';
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.house,
                                                                  color:
                                                                      colorFromCssString(
                                                                    getJsonField(
                                                                      dashboardScreenOneAPIResponse
                                                                          .jsonBody,
                                                                      r'''$.oneapi_bg_first_image.bg_image_color''',
                                                                    ).toString(),
                                                                    defaultColor:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                        'DASHBOARD_SCREEN_Text_0c4x2k90_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Text_navigate_to');

                                                                    context.pushNamed(
                                                                        AddressListScreenWidget
                                                                            .routeName);

                                                                    logFirebaseEvent(
                                                                        'Text_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                        'AddressListScreenFromDashboardAnalytics');
                                                                  },
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                          .selectedAddress,
                                                                      'Dubai',
                                                                    ).maybeHandleOverflow(
                                                                      maxChars:
                                                                          25,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              colorFromCssString(
                                                                            getJsonField(
                                                                              dashboardScreenOneAPIResponse.jsonBody,
                                                                              r'''$.oneapi_bg_first_image.bg_image_color''',
                                                                            ).toString(),
                                                                            defaultColor:
                                                                                Colors.black,
                                                                          ),
                                                                          fontSize:
                                                                              13.0,
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                      'DASHBOARD_SCREEN_Icon_7pfuwx6l_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_navigate_to');

                                                                  context.pushNamed(
                                                                      AddressListScreenWidget
                                                                          .routeName);

                                                                  logFirebaseEvent(
                                                                      'Icon_google_analytics_event');
                                                                  logFirebaseEvent(
                                                                      'AddressListScreenFromDashboardAnalytics');
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color:
                                                                      colorFromCssString(
                                                                    getJsonField(
                                                                      dashboardScreenOneAPIResponse
                                                                          .jsonBody,
                                                                      r'''$.oneapi_bg_first_image.bg_image_color''',
                                                                    ).toString(),
                                                                    defaultColor:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                  size: 20.0,
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
                                                                    15.0,
                                                                    10.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: InkWell(
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
                                                                'DASHBOARD_SCREEN_Container_gjyh3t8i_ON_T');
                                                            logFirebaseEvent(
                                                                'Container_navigate_to');

                                                            context.pushNamed(
                                                                SearchScreenWidget
                                                                    .routeName);

                                                            logFirebaseEvent(
                                                                'Container_google_analytics_event');
                                                            logFirebaseEvent(
                                                                'SearchScreenAnalytics');
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 36.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                            ),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              child: custom_widgets
                                                                  .SearchAnimationScreen(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                              ),
                                                            ),
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
                                        if ((getJsonField(
                                                  dashboardScreenOneAPIResponse
                                                      .jsonBody,
                                                  r'''$.banner''',
                                                ) !=
                                                null) &&
                                            ((getJsonField(
                                                  dashboardScreenOneAPIResponse
                                                      .jsonBody,
                                                  r'''$.banner''',
                                                )
                                                            .toList()
                                                            .map<ProductCountStruct?>(
                                                                ProductCountStruct
                                                                    .maybeFromMap)
                                                            .toList()
                                                        as Iterable<
                                                            ProductCountStruct?>)
                                                    .withoutNulls
                                                    .length >
                                                0))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 280.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                                .height <
                                                            900.0
                                                        ? 235.0
                                                        : 240.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final imageSlider =
                                                        getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.banner''',
                                                    ).toList();

                                                    return Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.1,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      child: CarouselSlider
                                                          .builder(
                                                        itemCount:
                                                            imageSlider.length,
                                                        itemBuilder: (context,
                                                            imageSliderIndex,
                                                            _) {
                                                          final imageSliderItem =
                                                              imageSlider[
                                                                  imageSliderIndex];
                                                          return Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'DASHBOARD_SCREEN_Image_5mojqg6p_ON_TAP');
                                                                if (_model
                                                                        .bannerTypeRefer ==
                                                                    (getJsonField(
                                                                      imageSliderItem,
                                                                      r'''$.banner_name''',
                                                                    )
                                                                        .toString()
                                                                        .toLowerCase())) {
                                                                  if (FFAppState()
                                                                          .usserType !=
                                                                      'guest') {
                                                                    logFirebaseEvent(
                                                                        'Image_custom_action');

                                                                    await Share
                                                                        .share(
                                                                      '${getJsonField(
                                                                        FFAppState()
                                                                            .appInfo,
                                                                        r'''$.referral_message''',
                                                                      ).toString()}  ${_model.refCodew}',
                                                                      sharePositionOrigin:
                                                                          getWidgetBoundingBox(
                                                                              context),
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Image_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                      'Share',
                                                                      parameters: {
                                                                        'Screen Name':
                                                                            'Profile',
                                                                        'Share To':
                                                                            'Refer a Friend',
                                                                      },
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Image_alert_dialog');
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
                                                                                CustomAlertSignupDailogWidget(
                                                                              des: FFAppConstants.guestMsg,
                                                                              height: 230.0,
                                                                              title: ' ',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Image_navigate_to');

                                                                  context.pushNamed(
                                                                      SearchbyBannerWidget
                                                                          .routeName);

                                                                  logFirebaseEvent(
                                                                      'Image_update_app_state');
                                                                  FFAppState()
                                                                          .keyword =
                                                                      getJsonField(
                                                                    imageSliderItem,
                                                                    r'''$.banner_name''',
                                                                  ).toString();
                                                                  FFAppState()
                                                                          .categoryName =
                                                                      getJsonField(
                                                                    imageSliderItem,
                                                                    r'''$.banner_name''',
                                                                  ).toString();
                                                                  FFAppState()
                                                                          .catID =
                                                                      getJsonField(
                                                                    imageSliderItem,
                                                                    r'''$.banner_id''',
                                                                  ).toString();
                                                                  FFAppState()
                                                                          .brandID =
                                                                      ' ';
                                                                  FFAppState()
                                                                          .orderType =
                                                                      'store';
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Image_google_analytics_event');
                                                                  logFirebaseEvent(
                                                                      'SearchByBannerAnalytics');
                                                                }
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      getJsonField(
                                                                    imageSliderItem,
                                                                    r'''$.banner_image''',
                                                                  ).toString(),
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      2.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      1.0,
                                                                  fit: BoxFit
                                                                      .fitWidth,
                                                                  alignment:
                                                                      Alignment(
                                                                          0.0,
                                                                          0.0),
                                                                  errorWidget: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        2.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                    fit: BoxFit
                                                                        .fitWidth,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        carouselController: _model
                                                                .carouselController ??=
                                                            CarouselSliderController(),
                                                        options:
                                                            CarouselOptions(
                                                          initialPage: max(
                                                              0,
                                                              min(
                                                                  0,
                                                                  imageSlider
                                                                          .length -
                                                                      1)),
                                                          viewportFraction: 1.0,
                                                          disableCenter: true,
                                                          enlargeCenterPage:
                                                              false,
                                                          enlargeFactor: 0.0,
                                                          enableInfiniteScroll:
                                                              true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          autoPlay: true,
                                                          autoPlayAnimationDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      3500),
                                                          autoPlayInterval:
                                                              Duration(
                                                                  milliseconds:
                                                                      (3500 +
                                                                          1500)),
                                                          autoPlayCurve:
                                                              Curves.linear,
                                                          pauseAutoPlayInFiniteScroll:
                                                              true,
                                                          onPageChanged: (index,
                                                                  _) =>
                                                              _model.carouselCurrentIndex =
                                                                  index,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    if ((getJsonField(
                                              dashboardScreenOneAPIResponse
                                                  .jsonBody,
                                              r'''$.activesub_ordlist''',
                                            ) !=
                                            null) &&
                                        ((getJsonField(
                                              dashboardScreenOneAPIResponse
                                                  .jsonBody,
                                              r'''$.activesub_ordlist''',
                                            )
                                                        .toList()
                                                        .map<ProductCountStruct?>(
                                                            ProductCountStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        ProductCountStruct?>)
                                                .withoutNulls
                                                .length >
                                            0))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if ((getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.activesub_ordlist''',
                                                    ) !=
                                                    null) &&
                                                ((getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.activesub_ordlist''',
                                                    )
                                                                .toList()
                                                                .map<ProductCountStruct?>(
                                                                    ProductCountStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                ProductCountStruct?>)
                                                        .withoutNulls
                                                        .length >
                                                    0))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
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
                                                          'DASHBOARD_SCREEN_Text_p8lvroor_ON_TAP');
                                                    },
                                                    child: Text(
                                                      functions.getArrayCount(
                                                                  getJsonField(
                                                                dashboardScreenOneAPIResponse
                                                                    .jsonBody,
                                                                r'''$.activesub_ordlist''',
                                                              )) ==
                                                              '1'
                                                          ? 'YOUR ACTIVE SUBSCRIPTION'
                                                          : 'YOUR ACTIVE SUBSCRIPTION\'S',
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            fontSize: 17.0,
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
                                                  ),
                                                ),
                                              ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DASHBOARD_SCREEN_Text_qz4kaai2_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_update_app_state');
                                                FFAppState()
                                                        .cardScreenNavigation =
                                                    'subscriptionCart';
                                                FFAppState().screenName =
                                                    'daily';
                                                FFAppState().update(() {});
                                                logFirebaseEvent(
                                                    'Text_navigate_to');

                                                context.pushNamed(
                                                    AllOrdersTABLISTWidget
                                                        .routeName);
                                              },
                                              child: Text(
                                                'View all',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                          color:
                                                              Color(0xFF8F8F8F),
                                                          fontSize: 13.0,
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
                                          ],
                                        ),
                                      ),
                                    if ((getJsonField(
                                              dashboardScreenOneAPIResponse
                                                  .jsonBody,
                                              r'''$.activesub_ordlist''',
                                            ) !=
                                            null) &&
                                        ((getJsonField(
                                              dashboardScreenOneAPIResponse
                                                  .jsonBody,
                                              r'''$.activesub_ordlist''',
                                            )
                                                        .toList()
                                                        .map<ProductCountStruct?>(
                                                            ProductCountStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        ProductCountStruct?>)
                                                .withoutNulls
                                                .length >
                                            0))
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.02, 1.66),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 15.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 70.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final activeOrders =
                                                    getJsonField(
                                                  dashboardScreenOneAPIResponse
                                                      .jsonBody,
                                                  r'''$.activesub_ordlist''',
                                                ).toList();

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      activeOrders.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(width: 10.0),
                                                  itemBuilder: (context,
                                                      activeOrdersIndex) {
                                                    final activeOrdersItem =
                                                        activeOrders[
                                                            activeOrdersIndex];
                                                    return InkWell(
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
                                                            'DASHBOARD_SCREEN_Container_p3fi9114_ON_T');
                                                        logFirebaseEvent(
                                                            'Container_update_app_state');
                                                        FFAppState().cartID =
                                                            getJsonField(
                                                          activeOrdersItem,
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
                                                                activeOrdersItem,
                                                                r'''$.order_date''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'orderPrice':
                                                                serializeParam(
                                                              getJsonField(
                                                                activeOrdersItem,
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
                                                        width: 160.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FFAppConstants
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FFAppConstants
                                                                .neutralWhiteF5F5F5,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              activeOrdersItem,
                                                                              r'''$.productname''',
                                                                            ).toString().maybeHandleOverflow(
                                                                                  maxChars: 28,
                                                                                  replacement: '…',
                                                                                ),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppConstants.blackColor0A0A0A,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          getJsonField(
                                                                            activeOrdersItem,
                                                                            r'''$.prodList[0].varient_image''',
                                                                          ).toString(),
                                                                          width:
                                                                              45.0,
                                                                          height:
                                                                              45.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Container(
                                                                width: 40.0,
                                                                height: 15.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FFAppConstants
                                                                      .green44AC20,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: FFAppConstants
                                                                        .green44AC20,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'ACTIVE',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FFAppConstants.whiteColor,
                                                                          fontSize:
                                                                              8.0,
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    Builder(
                                      builder: (context) {
                                        if ((getJsonField(
                                                  dashboardScreenOneAPIResponse
                                                      .jsonBody,
                                                  r'''$.occasionalCategory''',
                                                ) !=
                                                null) &&
                                            ((getJsonField(
                                                  dashboardScreenOneAPIResponse
                                                      .jsonBody,
                                                  r'''$.occasionalCategory''',
                                                )
                                                            .toList()
                                                            .map<ProductCountStruct?>(
                                                                ProductCountStruct
                                                                    .maybeFromMap)
                                                            .toList()
                                                        as Iterable<
                                                            ProductCountStruct?>)
                                                    .withoutNulls
                                                    .length >
                                                0)) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    final occasionalCat =
                                                        getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.occasionalCategory''',
                                                    ).toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          occasionalCat.length,
                                                      itemBuilder: (context,
                                                          occasionalCatIndex) {
                                                        final occasionalCatItem =
                                                            occasionalCat[
                                                                occasionalCatIndex];
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          10.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        100,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            getJsonField(
                                                                              occasionalCatItem,
                                                                              r'''$.title''',
                                                                            ).toString(),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppConstants.blackColor0A0A0A,
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              occasionalCatItem,
                                                                              r'''$.sub_title''',
                                                                            ).toString().maybeHandleOverflow(
                                                                                  maxChars: 45,
                                                                                  replacement: '…',
                                                                                ),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppConstants.neutralBlack8F8F8F,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 65.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'DASHBOARD_SCREEN_Text_k00bb70y_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Text_navigate_to');

                                                                          context
                                                                              .pushNamed(OccasionalCategoryWidget.routeName);

                                                                          logFirebaseEvent(
                                                                              'Text_update_app_state');
                                                                          FFAppState().categoryName =
                                                                              getJsonField(
                                                                            occasionalCatItem,
                                                                            r'''$.title''',
                                                                          ).toString();
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Text_google_analytics_event');
                                                                          logFirebaseEvent(
                                                                              'AditionalCatFromDashboardAnalytics');
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'View all',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.montserrat(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF8F8F8F),
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
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
                                                                          15.0,
                                                                          10.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 255.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    ProductsListViewWidget(
                                                                  key: Key(
                                                                      'Keyu90_${occasionalCatIndex}_of_${occasionalCat.length}'),
                                                                  productList:
                                                                      getJsonField(
                                                                    occasionalCatItem,
                                                                    r'''$.product_details''',
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
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: 100.0,
                                            height: 0.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if ((getJsonField(
                                                    dashboardScreenOneAPIResponse
                                                        .jsonBody,
                                                    r'''$.topselling''',
                                                  ) !=
                                                  null) &&
                                              ((getJsonField(
                                                    dashboardScreenOneAPIResponse
                                                        .jsonBody,
                                                    r'''$.topselling''',
                                                  )
                                                              .toList()
                                                              .map<ProductCountStruct?>(
                                                                  ProductCountStruct
                                                                      .maybeFromMap)
                                                              .toList()
                                                          as Iterable<
                                                              ProductCountStruct?>)
                                                      .withoutNulls
                                                      .length >
                                                  0)) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 10.0,
                                                          15.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'BEST SELLERS',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppConstants
                                                                  .blackColor0A0A0A,
                                                              fontSize: 17.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                      InkWell(
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
                                                              'DASHBOARD_SCREEN_Text_ipr25qe9_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_navigate_to');

                                                          context.pushNamed(
                                                              TopDealsScreenWidget
                                                                  .routeName);

                                                          logFirebaseEvent(
                                                              'Text_update_app_state');
                                                          FFAppState()
                                                                  .screenName =
                                                              'topdeal';
                                                          FFAppState()
                                                                  .categoryName =
                                                              'Best Sellers';
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'Text_google_analytics_event');
                                                          logFirebaseEvent(
                                                              'TopDealsFromDashboard');
                                                        },
                                                        child: Text(
                                                          'View all',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF8F8F8F),
                                                                fontSize: 13.0,
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          15.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 255.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00FFFFFF),
                                                    ),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .productsListViewModel2,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          ProductsListViewWidget(
                                                        productList:
                                                            getJsonField(
                                                          dashboardScreenOneAPIResponse
                                                              .jsonBody,
                                                          r'''$.topselling''',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return Container(
                                              width: 100.0,
                                              height: 0.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              'CATEGORIES',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FFAppConstants
                                                        .blackColor0A0A0A,
                                                    fontSize: 17.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
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
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 15.0, 5.0, 0.0),
                                        child: Container(
                                          height: 350.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final topCategory = getJsonField(
                                                dashboardScreenOneAPIResponse
                                                    .jsonBody,
                                                r'''$.top_cat''',
                                              ).toList();

                                              return GridView.builder(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  5.0,
                                                  0,
                                                ),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 20.0,
                                                  childAspectRatio: 0.95,
                                                ),
                                                primary: false,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: topCategory.length,
                                                itemBuilder: (context,
                                                    topCategoryIndex) {
                                                  final topCategoryItem =
                                                      topCategory[
                                                          topCategoryIndex];
                                                  return Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child:
                                                        TopCategoryWidgetWidget(
                                                      key: Key(
                                                          'Key1qf_${topCategoryIndex}_of_${topCategory.length}'),
                                                      title: getJsonField(
                                                        topCategoryItem,
                                                        r'''$.title''',
                                                      ).toString(),
                                                      image: valueOrDefault<
                                                          String>(
                                                        getJsonField(
                                                          topCategoryItem,
                                                          r'''$.image''',
                                                        )?.toString(),
                                                        'https://picsum.photos/seed/399/600',
                                                      ),
                                                      catID: getJsonField(
                                                        topCategoryItem,
                                                        r'''$.cat_id''',
                                                      ).toString(),
                                                      model: topCategoryItem,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (FFAppState().arraylistCount <
                                            (getJsonField(
                                              dashboardScreenOneAPIResponse
                                                  .jsonBody,
                                              r'''$.orderlist''',
                                            )
                                                        .toList()
                                                        .map<ProductCountStruct?>(
                                                            ProductCountStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        ProductCountStruct?>)
                                                .withoutNulls
                                                .length) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 20.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'ORDER AGAIN',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            fontSize: 17.0,
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
                                                    InkWell(
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
                                                            'DASHBOARD_SCREEN_Text_7kucv9cl_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Text_navigate_to');

                                                        context.pushNamed(
                                                            AllOrdersTABLISTWidget
                                                                .routeName);

                                                        logFirebaseEvent(
                                                            'Text_update_app_state');
                                                        FFAppState()
                                                                .cardScreenNavigation =
                                                            'subscriptionCart';
                                                        FFAppState()
                                                                .screenName =
                                                            'daily';
                                                        FFAppState()
                                                            .update(() {});
                                                        logFirebaseEvent(
                                                            'Text_google_analytics_event');
                                                        logFirebaseEvent(
                                                            'SubscriptionOrdersFromDashboardAnalytics');
                                                      },
                                                      child: Text(
                                                        'View all',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF8F8F8F),
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                5.0, 5.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .orderAgainListViewModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          OrderAgainListViewWidget(
                                                        orderList: getJsonField(
                                                          dashboardScreenOneAPIResponse
                                                              .jsonBody,
                                                          r'''$.orderlist''',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container(
                                            width: 100.0,
                                            height: 0.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    if (getJsonField(
                                          dashboardScreenOneAPIResponse
                                              .jsonBody,
                                          r'''$.trailpackimage''',
                                        ) !=
                                        null)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 20.0, 0.0, 0.0),
                                          child: Text(
                                            'TRIAL PACK PRODUCTS',
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
                                                      .blackColor0A0A0A,
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.trailpackimage''',
                                                    ) !=
                                                    null
                                                ? 10.0
                                                : 0.0,
                                            0.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (getJsonField(
                                                dashboardScreenOneAPIResponse
                                                    .jsonBody,
                                                r'''$.trailpackimage''',
                                              ) !=
                                              null) {
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  -0.02, 1.66),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                                decoration: BoxDecoration(
                                                  color:
                                                      FFAppConstants.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
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
                                                        'DASHBOARD_SCREEN_Image_hn5awt89_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Image_navigate_to');

                                                    context.pushNamed(
                                                        TrialPackcategoriesWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'Image_google_analytics_event');
                                                    logFirebaseEvent(
                                                      'TrialPackScreen',
                                                      parameters: {
                                                        'Screen':
                                                            'Trial packScreen',
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: getJsonField(
                                                        dashboardScreenOneAPIResponse
                                                            .jsonBody,
                                                        r'''$.trailpackimage''',
                                                      ).toString(),
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      fit: BoxFit.contain,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Text(
                                              '',
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.trailpackimage''',
                                                    ) !=
                                                    null
                                                ? 20.0
                                                : 0.0,
                                            0.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ((getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.featurecategory''',
                                                    ) !=
                                                    null) &&
                                                ((getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.featurecategory''',
                                                    )
                                                                .toList()
                                                                .map<ProductCountStruct?>(
                                                                    ProductCountStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                ProductCountStruct?>)
                                                        .withoutNulls
                                                        .length >
                                                    0))
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  15.0),
                                                      child: Text(
                                                        'FILTER  BY TAGS',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppConstants
                                                                  .blackColor0A0A0A,
                                                              fontSize: 17.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FFAppConstants
                                                            .whiteColor,
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final featureCategory =
                                                              getJsonField(
                                                            dashboardScreenOneAPIResponse
                                                                .jsonBody,
                                                            r'''$.featurecategory''',
                                                          ).toList();

                                                          return ListView
                                                              .separated(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                              2.0,
                                                              0,
                                                              2.0,
                                                              0,
                                                            ),
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                featureCategory
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    width:
                                                                        10.0),
                                                            itemBuilder: (context,
                                                                featureCategoryIndex) {
                                                              final featureCategoryItem =
                                                                  featureCategory[
                                                                      featureCategoryIndex];
                                                              return InkWell(
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
                                                                      'DASHBOARD_SCREEN_Container_v7cwchbh_ON_T');
                                                                  logFirebaseEvent(
                                                                      'Container_update_app_state');
                                                                  FFAppState()
                                                                          .catID =
                                                                      getJsonField(
                                                                    featureCategoryItem,
                                                                    r'''$.id''',
                                                                  ).toString();
                                                                  FFAppState()
                                                                          .categoryName =
                                                                      getJsonField(
                                                                    featureCategoryItem,
                                                                    r'''$.title''',
                                                                  ).toString();
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Container_navigate_to');

                                                                  context.pushNamed(
                                                                      FeaturedCategoryWidget
                                                                          .routeName);
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          getJsonField(
                                                                            featureCategoryItem,
                                                                            r'''$.image''',
                                                                          ).toString(),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          errorBuilder: (context, error, stackTrace) =>
                                                                              Image.asset(
                                                                            'assets/images/error_image.png',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            60.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              featureCategoryItem,
                                                                              r'''$.title''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppConstants.indigoColor,
                                                                                  fontSize: 12.0,
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
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if ((getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.second_banner''',
                                                    ) !=
                                                    null) &&
                                                ((getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.second_banner''',
                                                    )
                                                                .toList()
                                                                .map<ProductCountStruct?>(
                                                                    ProductCountStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                ProductCountStruct?>)
                                                        .withoutNulls
                                                        .length >
                                                    0))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  height: 240.0,
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final imageSliderSecond =
                                                          getJsonField(
                                                        dashboardScreenOneAPIResponse
                                                            .jsonBody,
                                                        r'''$.second_banner''',
                                                      ).toList();

                                                      return Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.1,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        child: CarouselSlider
                                                            .builder(
                                                          itemCount:
                                                              imageSliderSecond
                                                                  .length,
                                                          itemBuilder: (context,
                                                              imageSliderSecondIndex,
                                                              _) {
                                                            final imageSliderSecondItem =
                                                                imageSliderSecond[
                                                                    imageSliderSecondIndex];
                                                            return Builder(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
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
                                                                      'DASHBOARD_SCREEN_Image_xgkuaq44_ON_TAP');
                                                                  if (_model
                                                                          .bannerTypeRefer ==
                                                                      (getJsonField(
                                                                        imageSliderSecondItem,
                                                                        r'''$.banner_name''',
                                                                      )
                                                                          .toString()
                                                                          .toLowerCase())) {
                                                                    if (FFAppState()
                                                                            .usserType !=
                                                                        'guest') {
                                                                      await Share
                                                                          .share(
                                                                        '${getJsonField(
                                                                          FFAppState()
                                                                              .appInfo,
                                                                          r'''$.referral_message''',
                                                                        ).toString()}  ${_model.refCodew}',
                                                                        sharePositionOrigin:
                                                                            getWidgetBoundingBox(context),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Image_google_analytics_event');
                                                                      logFirebaseEvent(
                                                                        'Share',
                                                                        parameters: {
                                                                          'Screen Name':
                                                                              'Profile',
                                                                          'Share To':
                                                                              'Refer a Friend',
                                                                        },
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Image_alert_dialog');
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
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: CustomAlertSignupDailogWidget(
                                                                                des: FFAppConstants.guestMsg,
                                                                                height: 230.0,
                                                                                title: ' ',
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Image_update_app_state');
                                                                    FFAppState()
                                                                            .searchText =
                                                                        getJsonField(
                                                                      imageSliderSecondItem,
                                                                      r'''$.banner_name''',
                                                                    ).toString();
                                                                    FFAppState()
                                                                            .catID =
                                                                        getJsonField(
                                                                      imageSliderSecondItem,
                                                                      r'''$.banner_id''',
                                                                    ).toString();
                                                                    FFAppState()
                                                                            .brandID =
                                                                        getJsonField(
                                                                      imageSliderSecondItem,
                                                                      r'''$.brand_id''',
                                                                    ).toString();
                                                                    FFAppState()
                                                                            .categoryName =
                                                                        getJsonField(
                                                                      imageSliderSecondItem,
                                                                      r'''$.banner_name''',
                                                                    ).toString();
                                                                    FFAppState()
                                                                            .orderType =
                                                                        'product';
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Image_navigate_to');

                                                                    context.pushNamed(
                                                                        SearchbyBannerWidget
                                                                            .routeName);

                                                                    logFirebaseEvent(
                                                                        'Image_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                        'SearchResultFromDashboardAnalytics');
                                                                  }
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child: Image
                                                                      .network(
                                                                    getJsonField(
                                                                      imageSliderSecondItem,
                                                                      r'''$.banner_image''',
                                                                    ).toString(),
                                                                    width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    alignment:
                                                                        Alignment(
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          carouselController: _model
                                                                  .carouselsecondController ??=
                                                              CarouselSliderController(),
                                                          options:
                                                              CarouselOptions(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    1,
                                                                    imageSliderSecond
                                                                            .length -
                                                                        1)),
                                                            viewportFraction:
                                                                1.0,
                                                            disableCenter: true,
                                                            enlargeCenterPage:
                                                                true,
                                                            enlargeFactor: 0.3,
                                                            enableInfiniteScroll:
                                                                true,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            autoPlay: true,
                                                            autoPlayAnimationDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        2000),
                                                            autoPlayInterval:
                                                                Duration(
                                                                    milliseconds:
                                                                        (2000 +
                                                                            1000)),
                                                            autoPlayCurve:
                                                                Curves.linear,
                                                            pauseAutoPlayInFiniteScroll:
                                                                true,
                                                            onPageChanged: (index,
                                                                    _) =>
                                                                _model.carouselsecondCurrentIndex =
                                                                    index,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (FFAppState().arraylistCount <
                                            (getJsonField(
                                              dashboardScreenOneAPIResponse
                                                  .jsonBody,
                                              r'''$.additional_category''',
                                            )
                                                        .toList()
                                                        .map<ProductCountStruct?>(
                                                            ProductCountStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        ProductCountStruct?>)
                                                .withoutNulls
                                                .length) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final additonalCat =
                                                      getJsonField(
                                                    dashboardScreenOneAPIResponse
                                                        .jsonBody,
                                                    r'''$.additional_category''',
                                                  ).toList();

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        additonalCat.length,
                                                    itemBuilder: (context,
                                                        additonalCatIndex) {
                                                      final additonalCatItem =
                                                          additonalCat[
                                                              additonalCatIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          additonalCatItem,
                                                                          r'''$.title''',
                                                                        ).toString(),
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        getJsonField(
                                                                          additonalCatItem,
                                                                          r'''$.sub_title''',
                                                                        )
                                                                            .toString()
                                                                            .maybeHandleOverflow(
                                                                              maxChars: 45,
                                                                              replacement: '…',
                                                                            ),
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FFAppConstants.neutralBlack8F8F8F,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ],
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
                                                                          'DASHBOARD_SCREEN_Text_uejx5lbd_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Text_navigate_to');

                                                                      context.pushNamed(
                                                                          AdditionalCatScreenWidget
                                                                              .routeName);

                                                                      logFirebaseEvent(
                                                                          'Text_update_app_state');
                                                                      FFAppState()
                                                                              .categoryName =
                                                                          getJsonField(
                                                                        additonalCatItem,
                                                                        r'''$.title''',
                                                                      ).toString();
                                                                      FFAppState()
                                                                              .catID =
                                                                          getJsonField(
                                                                        additonalCatItem,
                                                                        r'''$.id''',
                                                                      ).toString();
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Text_google_analytics_event');
                                                                      logFirebaseEvent(
                                                                          'AditionalCatFromDashboardAnalytics');
                                                                    },
                                                                    child: Text(
                                                                      'View all',
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
                                                                                Color(0xFF8F8F8F),
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                        15.0,
                                                                        10.0,
                                                                        15.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 255.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  ProductsListViewWidget(
                                                                key: Key(
                                                                    'Key9uu_${additonalCatIndex}_of_${additonalCat.length}'),
                                                                productList:
                                                                    getJsonField(
                                                                  additonalCatItem,
                                                                  r'''$.product_details''',
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
                                            ],
                                          );
                                        } else {
                                          return Container(
                                            width: 100.0,
                                            height: 0.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    if (getJsonField(
                                          dashboardScreenOneAPIResponse
                                              .jsonBody,
                                          r'''$.sneaky_banner.banner_image''',
                                        ) !=
                                        null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height:
                                              MediaQuery.sizeOf(context).width,
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'DASHBOARD_SCREEN_SneakyBannerImage_ON_TA');
                                                  if (_model.bannerTypeRefer ==
                                                      (getJsonField(
                                                        dashboardScreenOneAPIResponse
                                                            .jsonBody,
                                                        r'''$.sneaky_banner.banner_name''',
                                                      )
                                                          .toString()
                                                          .toLowerCase())) {
                                                    if (FFAppState()
                                                            .usserType !=
                                                        'guest') {
                                                      logFirebaseEvent(
                                                          'SneakyBannerImage_share');
                                                      await Share.share(
                                                        '${getJsonField(
                                                          FFAppState().appInfo,
                                                          r'''$.referral_message''',
                                                        ).toString()}  ${_model.refCodew}',
                                                        sharePositionOrigin:
                                                            getWidgetBoundingBox(
                                                                context),
                                                      );
                                                      logFirebaseEvent(
                                                          'Image_google_analytics_event');
                                                      logFirebaseEvent(
                                                        'Share',
                                                        parameters: {
                                                          'Screen Name':
                                                              'Profile',
                                                          'Share To':
                                                              'Refer a Friend',
                                                        },
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'SneakyBannerImage_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child:
                                                                  CustomAlertSignupDailogWidget(
                                                                des: FFAppConstants
                                                                    .guestMsg,
                                                                height: 230.0,
                                                                title: ' ',
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    logFirebaseEvent(
                                                        'SneakyBannerImage_navigate_to');

                                                    context.pushNamed(
                                                        SneakyProductListScreenWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'SneakyBannerImage_update_app_state');
                                                    FFAppState().categoryName =
                                                        getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.sneaky_banner.banner_name''',
                                                    ).toString();
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'SneakyBannerImage_google_analytics_event');
                                                    logFirebaseEvent(
                                                        'SneakyProductListScreenAnalytics');
                                                  }
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.sneaky_banner.banner_image''',
                                                    ).toString(),
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    height: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    Builder(
                                      builder: (context) {
                                        if ((getJsonField(
                                              dashboardScreenOneAPIResponse
                                                  .jsonBody,
                                              r'''$.recentselling''',
                                            )
                                                        .toList()
                                                        .map<ProductCountStruct?>(
                                                            ProductCountStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        ProductCountStruct?>)
                                                .withoutNulls
                                                .length >
                                            0) {
                                          return Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 20.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'TRENDING PRODUCTS',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            fontSize: 17.0,
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
                                                    InkWell(
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
                                                            'DASHBOARD_SCREEN_Text_bshcyg0r_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Text_navigate_to');

                                                        context.pushNamed(
                                                            TrendingProductsScreenWidget
                                                                .routeName);

                                                        logFirebaseEvent(
                                                            'Text_google_analytics_event');
                                                        logFirebaseEvent(
                                                            'TrendingProductsFromDashboardAnalytics');
                                                      },
                                                      child: Text(
                                                        'View all',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF8F8F8F),
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 50.0, 15.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 255.0,
                                                  decoration: BoxDecoration(),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .productsListViewModel4,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        ProductsListViewWidget(
                                                      productList: getJsonField(
                                                        dashboardScreenOneAPIResponse
                                                            .jsonBody,
                                                        r'''$.recentselling''',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (FFAppState().arraylistCount <
                                            (getJsonField(
                                              dashboardScreenOneAPIResponse
                                                  .jsonBody,
                                              r'''$.brand''',
                                            )
                                                        .toList()
                                                        .map<ProductCountStruct?>(
                                                            ProductCountStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        ProductCountStruct?>)
                                                .withoutNulls
                                                .length) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Row(
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
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'EXPLORE BY BRANDS',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppConstants
                                                                  .blackColor0A0A0A,
                                                              fontSize: 17.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
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
                                                                  0.0,
                                                                  15.0,
                                                                  0.0),
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
                                                              'DASHBOARD_SCREEN_Text_j22vt8l8_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_navigate_to');

                                                          context.pushNamed(
                                                              BrandListScreenWidget
                                                                  .routeName);

                                                          logFirebaseEvent(
                                                              'Text_google_analytics_event');
                                                          logFirebaseEvent(
                                                              'BrandListFromDashboardAnalytics');
                                                        },
                                                        child: Text(
                                                          'View all',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF8F8F8F),
                                                                fontSize: 13.0,
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
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 10.0, 15.0, 20.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 260.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  child: wrapWithModel(
                                                    model:
                                                        _model.brandWidgetModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: BrandWidgetWidget(
                                                      brandList: getJsonField(
                                                        dashboardScreenOneAPIResponse
                                                            .jsonBody,
                                                        r'''$.brand''',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Text(
                                            '',
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
                                          );
                                        }
                                      },
                                    ),
                                    if (FFAppState().refreshTrigger == true)
                                      Container(
                                        width: 10.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(),
                                        child: FlutterFlowTimer(
                                          initialTime:
                                              _model.timerInitialTimeMs,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller: _model.timerController,
                                          updateStateInterval:
                                              Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate)
                                              safeSetState(() {});
                                          },
                                          onEnded: () async {
                                            logFirebaseEvent(
                                                'DASHBOARD_SCREEN_Timer_zlk7axkq_ON_TIMER');
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                font: GoogleFonts.outfit(
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
                                                color: Color(0x0014181B),
                                                fontSize: 1.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Something went wrong..',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                            ),
                          );
                        }
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 15.0, 150.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'DASHBOARD_SCREEN_cartbtnContainer_ON_TAP');
                            if ((FFAppState().cartTotalCount == 0) &&
                                (FFAppState().subCartTotalItem == 0)) {
                              logFirebaseEvent('cartbtnContainer_navigate_to');

                              context
                                  .pushNamed(DailyCartScreenWidget.routeName);

                              logFirebaseEvent(
                                  'cartbtnContainer_google_analytics_event');
                              logFirebaseEvent(
                                  'CartScreenFromDashboardAnalytics');
                            } else {
                              logFirebaseEvent(
                                  'cartbtnContainer_update_app_state');
                              FFAppState().isCartShow =
                                  !(FFAppState().isCartShow ?? true);
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
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
                                  if (functions
                                          .setIngeterValue(functions
                                              .additionFunctionInt(
                                                  FFAppState().cartTotalCount,
                                                  FFAppState().subCartTotalItem)
                                              .toString())
                                          .toString() !=
                                      '0')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: FFAppConstants
                                              .NeutralBlack50Color,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            functions
                                                .additionFunctionInt(
                                                    FFAppState().cartTotalCount,
                                                    FFAppState()
                                                        .subCartTotalItem)
                                                .toString(),
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
                                                  color: FFAppConstants
                                                      .blackColor0A0A0A,
                                                  fontSize: 10.0,
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
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: wrapWithModel(
                            model: _model.bottomnavBarModel,
                            updateCallback: () => safeSetState(() {}),
                            child: BottomnavBarWidget(
                              pageName: 'home',
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (FFAppState().isCartShow == true)
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 30.0),
                          child: SafeArea(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
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
                                        'DASHBOARD_SCREEN_Row_gyyu0n9j_ON_TAP');
                                    if (FFAppState().cartTotalCount < 1) {
                                      logFirebaseEvent('Row_navigate_to');

                                      context.pushNamed(
                                          CartSubscriptionScreenWidget
                                              .routeName);

                                      logFirebaseEvent('Row_update_app_state');
                                      FFAppState().isCartShow = false;
                                      FFAppState().screenName =
                                          'subscriptionCart';
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
                                      logFirebaseEvent(
                                          'Row_google_analytics_event');
                                      logFirebaseEvent(
                                        'Navigation',
                                        parameters: {
                                          'Navigate To':
                                              'Subscription Cart Screen',
                                          'Screen Name': 'Dashboard Screen',
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent('Row_navigate_to');

                                      context.pushNamed(
                                          DailyCartScreenWidget.routeName);

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
                                      logFirebaseEvent(
                                          'Row_google_analytics_event');
                                      logFirebaseEvent(
                                        'Navigation',
                                        parameters: {
                                          'Navigate To': 'Daily Cart Screen',
                                          'Screen Name': 'Dashboard Screen',
                                        },
                                      );
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          'Congratulations !  You\'ve got ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                      text: 'FREE DELIVERY.',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                        fontSize: 8.0,
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
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                      MediaQuery.of(context)
                                                          .textScaler,
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
                                                                  .yellowColor,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: ' item',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: FFAppConstants
                                                              .yellowColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16.0,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    color: FFAppConstants
                                                        .yellowColor,
                                                  ),
                                                ),
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'AED ',
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
                                                                  .yellowColor,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: functions
                                                            .setDecimalValue(functions
                                                                .additionFunction(
                                                                    FFAppState()
                                                                        .cartTotalPrice,
                                                                    FFAppState()
                                                                        .subCartTotalPrice)
                                                                .toString())!,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: FFAppConstants
                                                              .yellowColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16.0,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                              if ((FFAppState()
                                                          .cartSavingPrice >
                                                      0.00) ||
                                                  (FFAppState()
                                                          .subCartSavingAmount >
                                                      0.00)) {
                                                return RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'You have saved ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppConstants
                                                                  .neutralWhiteF5F5F5,
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: 'AED ',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: FFAppConstants
                                                              .whiteColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: functions
                                                            .setDecimalValue(functions
                                                                .additionFunction(
                                                                    FFAppState()
                                                                        .cartSavingPrice,
                                                                    FFAppState()
                                                                        .subCartSavingAmount)
                                                                ?.toString())!,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: FFAppConstants
                                                              .whiteColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: ' on your order',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: FFAppConstants
                                                              .neutralWhiteF5F5F5,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10.0,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                            .whiteColor,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                      ),
                    if ((getJsonField(
                              dashboardScreenOneAPIResponse.jsonBody,
                              r'''$.popup_banner''',
                            ) !=
                            null) &&
                        (FFAppState().nullValue !=
                            getJsonField(
                              dashboardScreenOneAPIResponse.jsonBody,
                              r'''$.popup_banner''',
                            ).toString()) &&
                        (FFAppState().isPopUpShow != false))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'DASHBOARD_SCREEN_PopupContainer_ON_TAP');
                          logFirebaseEvent('PopupContainer_update_app_state');
                          FFAppState().isPopUpShow = false;
                          safeSetState(() {});
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: Color(0x8F14181B),
                          ),
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 350.0,
                              height: 350.0,
                              decoration: BoxDecoration(
                                color: FFAppConstants.productBgClr,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width - 20,
                                  height: 500.0,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/new_loader.gif',
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DASHBOARD_SCREEN_Image_vypich07_ON_TAP');
                                              if (_model.searchType ==
                                                  getJsonField(
                                                    dashboardScreenOneAPIResponse
                                                        .jsonBody,
                                                    r'''$.popup_banner.type''',
                                                  ).toString()) {
                                                logFirebaseEvent(
                                                    'Image_navigate_to');

                                                context.pushNamed(
                                                    SearchbyPopupBannerWidget
                                                        .routeName);

                                                logFirebaseEvent(
                                                    'Image_update_app_state');
                                                FFAppState().isPopUpShow =
                                                    false;
                                                FFAppState().categoryName =
                                                    getJsonField(
                                                  dashboardScreenOneAPIResponse
                                                      .jsonBody,
                                                  r'''$.popup_banner.banner_name''',
                                                ).toString();
                                                FFAppState().catID =
                                                    getJsonField(
                                                  dashboardScreenOneAPIResponse
                                                      .jsonBody,
                                                  r'''$.popup_banner.banner_id''',
                                                ).toString();
                                                safeSetState(() {});
                                              } else {
                                                if (_model.dashboardType ==
                                                    getJsonField(
                                                      dashboardScreenOneAPIResponse
                                                          .jsonBody,
                                                      r'''$.popup_banner.type''',
                                                    ).toString()) {
                                                  if (_model.bannerTypeRefer ==
                                                      (getJsonField(
                                                        dashboardScreenOneAPIResponse
                                                            .jsonBody,
                                                        r'''$.popup_banner.banner_name''',
                                                      )
                                                          .toString()
                                                          .toLowerCase())) {
                                                    if (FFAppState()
                                                            .usserType !=
                                                        'guest') {
                                                      logFirebaseEvent(
                                                          'Image_share');
                                                      await Share.share(
                                                        '${getJsonField(
                                                          FFAppState().appInfo,
                                                          r'''$.referral_message''',
                                                        ).toString()}  ${_model.refCodew}',
                                                        sharePositionOrigin:
                                                            getWidgetBoundingBox(
                                                                context),
                                                      );
                                                      logFirebaseEvent(
                                                          'Image_google_analytics_event');
                                                      logFirebaseEvent(
                                                        'Share',
                                                        parameters: {
                                                          'Screen Name':
                                                              'Profile',
                                                          'Share To':
                                                              'Refer a Friend',
                                                        },
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Image_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child:
                                                                  CustomAlertSignupDailogWidget(
                                                                des: FFAppConstants
                                                                    .guestMsg,
                                                                height: 230.0,
                                                                title: ' ',
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Image_update_app_state');
                                                    FFAppState().isPopUpShow =
                                                        false;
                                                    safeSetState(() {});
                                                  }
                                                } else {
                                                  if (_model.trialType ==
                                                      getJsonField(
                                                        dashboardScreenOneAPIResponse
                                                            .jsonBody,
                                                        r'''$.popup_banner.type''',
                                                      ).toString()) {
                                                    logFirebaseEvent(
                                                        'Image_navigate_to');

                                                    context.pushNamed(
                                                        TrialPackcategoriesWidget
                                                            .routeName);
                                                  } else {
                                                    if (_model.offersType ==
                                                        getJsonField(
                                                          dashboardScreenOneAPIResponse
                                                              .jsonBody,
                                                          r'''$.popup_banner.type''',
                                                        ).toString()) {
                                                      logFirebaseEvent(
                                                          'Image_navigate_to');

                                                      context.pushNamed(
                                                        WebViewAppWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'webURL':
                                                              serializeParam(
                                                            getJsonField(
                                                              dashboardScreenOneAPIResponse
                                                                  .jsonBody,
                                                              r'''$.popup_banner.offer_url''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                          'title':
                                                              serializeParam(
                                                            getJsonField(
                                                              dashboardScreenOneAPIResponse
                                                                  .jsonBody,
                                                              r'''$.popup_banner.banner_name''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    }
                                                  }
                                                }
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Image.network(
                                                getJsonField(
                                                  dashboardScreenOneAPIResponse
                                                      .jsonBody,
                                                  r'''$.popup_banner.banner_image''',
                                                ).toString(),
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                fit: BoxFit.contain,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DASHBOARD_SCREEN_Container_n1unrex2_ON_T');
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().isPopUpShow = false;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'DASHBOARD_SCREEN_Icon_9q6j3npy_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_update_app_state');
                                                  FFAppState().isPopUpShow =
                                                      false;
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
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
                          ),
                        ),
                      ),
                    if (FFAppState().updateContainer)
                      SafeArea(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: Color(0x5114181B),
                          ),
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 450.0,
                              decoration: BoxDecoration(
                                color: FFAppConstants.whiteColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if (FFAppState().platform ==
                                                    'ios') {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/app-store_5977575.png',
                                                      width: 35.0,
                                                      height: 35.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/game_14857377.png',
                                                      width: 35.0,
                                                      height: 35.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                            Builder(
                                              builder: (context) {
                                                if (FFAppState().platform ==
                                                    'ios') {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'App Store',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            fontSize: 18.0,
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
                                                  );
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Play Store',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            fontSize: 18.0,
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
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                        if (FFAppConstants.forcefullyUpdate ==
                                            getJsonField(
                                              FFAppState().appInfo,
                                              r'''$.forcefully_update''',
                                            ).toString())
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DASHBOARD_SCREEN_Icon_50d3jib2_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_update_app_state');
                                              FFAppState().updateContainer =
                                                  false;
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 30.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'DASHBOARD_SCREEN_Text_vdypy756_ON_TAP');
                                          logFirebaseEvent(
                                              'Text_update_app_state');
                                          FFAppState().updateContainer = false;
                                          safeSetState(() {});
                                        },
                                        child: Text(
                                          'Update available',
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
                                                fontSize: 20.0,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'To use this app, download the latest version. You can keep using this app while downloading the update .',
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
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Quickart_Icon.png',
                                              width: 60.0,
                                              height: 60.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Quickart: ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                    .blackColor0A0A0A,
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width <
                                                                            370.0
                                                                        ? 14.0
                                                                        : 16.0,
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
                                                    TextSpan(
                                                      text:
                                                          'Freshness Delivered Daily',
                                                      style: TextStyle(
                                                        color: FFAppConstants
                                                            .blackColor0A0A0A,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                370.0
                                                            ? 12.0
                                                            : 14.0,
                                                      ),
                                                    )
                                                  ],
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
                                                        fontSize: 14.0,
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
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                2.0, 0.0),
                                                    child: Text(
                                                      '5.0',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      Icons.star_sharp,
                                                      color: FFAppConstants
                                                          .blackColor666666,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      '',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                  Text(
                                                    'Rated for 3+',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'What\'s New',
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppConstants.updateWhatsNewText,
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
                                              color: FFAppConstants
                                                  .blackColor666666,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 30.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'DASHBOARD_SCREEN_UPDATE_NOW_BTN_ON_TAP');
                                              if (isiOS == true) {
                                                logFirebaseEvent(
                                                    'Button_launch_u_r_l');
                                                await launchURL(
                                                    'https://apps.apple.com/in/app/quickart/id1624846848');
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_launch_u_r_l');
                                                await launchURL(
                                                    'https://play.google.com/store/apps/details?id=com.quickart.customer');
                                              }
                                            },
                                            text: 'Update Now',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.6,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: FFAppConstants.indigoColor,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            showLoadingIndicator: false,
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
