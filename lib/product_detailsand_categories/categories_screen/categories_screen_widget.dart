import 'dart:io';

import '/backend/api_requests/api_calls.dart';
import '/components/bottomnav_bar/bottomnav_bar_widget.dart';
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
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'categories_screen_model.dart';
export 'categories_screen_model.dart';

class CategoriesScreenWidget extends StatefulWidget {
  const CategoriesScreenWidget({
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

  static String routeName = 'categoriesScreen';
  static String routePath = '/all-categories';

  @override
  State<CategoriesScreenWidget> createState() => _CategoriesScreenWidgetState();
}

class _CategoriesScreenWidgetState extends State<CategoriesScreenWidget> {
  late CategoriesScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'categoriesScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CATEGORIES_SCREEN_categoriesScreen_ON_IN');
      if (widget!.utmSource != null && widget!.utmSource != '') {
        logFirebaseEvent('categoriesScreen_backend_call');
        _model.apiResultSeoSource = await QuickartGroup.seosourceCall.call(
          utmSource: widget!.utmSource,
          utmcampaign: widget!.utmCampaign,
          utmnetwork: widget!.utmNetwork,
          utmmedium: widget!.utmMedium,
          utmkeyword: widget!.utmNetwork,
          placement: widget!.utmPlacement,
          userid: FFAppState().userID,
          deviceid: FFAppState().deviceID,
          fcmtoken: FFAppState().fcmToken,
          platform: FFAppState().platform,
        );

        if ((_model.apiResultSeoSource?.succeeded ?? true)) {
          logFirebaseEvent('categoriesScreen_custom_action');
          await actions.facebookEventClass(
            widget!.utmKeyword!,
            widget!.utmPlacement!,
            FFAppState().userID,
            0.0,
            0,
            0.0,
            'utmSource',
            FFAppState().emptyJson,
            ' category listing',
            widget!.utmSource,
            widget!.utmCampaign,
            widget!.utmNetwork,
            widget!.utmMedium,
          );
        } else {
          logFirebaseEvent('categoriesScreen_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'seo api failed',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FFAppConstants.NeutralBlack50Color,
            ),
          );
        }
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
              'Product Categories',
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
              logFirebaseEvent('CATEGORIES_SCREEN_Stack_5pl9jiyp_ON_TAP');
              logFirebaseEvent('Stack_update_app_state');
              FFAppState().isCartShow = false;
              safeSetState(() {});
            },
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.85,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 2.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: (_model.apiRequestCompleter ??=
                              Completer<ApiCallResponse>()
                                ..complete(QuickartGroup.cateeCall.call(
                                  latest: 'null',
                                  byname: 'null',
                                  storeID: '7',
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
                        final gridViewCateeResponse = snapshot.data!;
        
                        return Builder(
                          builder: (context) {
                            final catteeData = getJsonField(
                              gridViewCateeResponse.jsonBody,
                              r'''$.data''',
                            ).toList();
                            if (catteeData.isEmpty) {
                              return Center(
                                child: Image.asset(
                                  'assets/images/No_data_available.png',
                                ),
                              );
                            }
        
                            return RefreshIndicator(
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'CATEGORIES_SCREEN_GridView_im2z9v91_ON_P');
                                logFirebaseEvent(
                                    'GridView_refresh_database_request');
                                safeSetState(
                                    () => _model.apiRequestCompleter = null);
                                await _model.waitForApiRequestCompleted();
                              },
                              child: GridView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  100.0,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio: 1.0,
                                ),
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: catteeData.length,
                                itemBuilder: (context, catteeDataIndex) {
                                  final catteeDataItem =
                                      catteeData[catteeDataIndex];
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
                                            'CATEGORIES_SCREEN_Container_hc604m3b_ON_');
                                        logFirebaseEvent('Container_navigate_to');
        
                                        context.pushNamed(
                                            SubCategoriesScreenWidget.routeName);
        
                                        logFirebaseEvent(
                                            'Container_update_app_state');
                                        FFAppState().categoryName = getJsonField(
                                          catteeDataItem,
                                          r'''$.title''',
                                        ).toString();
                                        FFAppState().catID = getJsonField(
                                          catteeDataItem,
                                          r'''$.cat_id''',
                                        ).toString();
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Container_custom_action');
                                        await actions.facebookEventClass(
                                          getJsonField(
                                            catteeDataItem,
                                            r'''$.cat_id''',
                                          ).toString(),
                                          getJsonField(
                                            catteeDataItem,
                                            r'''$.title''',
                                          ).toString(),
                                          ' ',
                                          0.0,
                                          0,
                                          0.0,
                                          'category',
                                          FFAppState().emptyJson,
                                          'c',
                                          ' ',
                                          ' ',
                                          ' ',
                                          ' ',
                                        );
                                        logFirebaseEvent(
                                            'Container_google_analytics_event');
                                        logFirebaseEvent(
                                            'SubCatCardClickAnalytics');
                                      },
                                      child: Container(
                                        width: 140.0,
                                        height: 140.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              5.0, 5.0, 5.0, 5.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 5.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            catteeDataItem,
                                                            r'''$.image''',
                                                          )?.toString(),
                                                          'https://tenor.com/en-GB/view/free-loader-gif-25681495',
                                                        ),
                                                        width: 120.0,
                                                        height: 120.0,
                                                        fit: BoxFit.contain,
                                                        alignment:
                                                            Alignment(0.0, -1.0),
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          width: 120.0,
                                                          height: 120.0,
                                                          fit: BoxFit.contain,
                                                          alignment: Alignment(
                                                              0.0, -1.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    catteeDataItem,
                                                    r'''$.title''',
                                                  ).toString(),
                                                  textAlign: TextAlign.center,
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
                                                                .blackColor0A0A0A,
                                                            fontSize: 10.0,
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
                        pageName: 'categories',
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
                              'CATEGORIES_SCREEN_cartbtnContainer_ON_TA');
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
                                                color: FFAppConstants
                                                    .blackColor0A0A0A,
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
                                  'CATEGORIES_SCREEN_Row_s8nir6lb_ON_TAP');
                              if (FFAppState().cartTotalCount < 1) {
                                logFirebaseEvent('Row_navigate_to');
        
                                context.pushNamed(
                                    CartSubscriptionScreenWidget.routeName);
        
                                logFirebaseEvent('Row_update_app_state');
                                FFAppState().isCartShow = false;
                                FFAppState().screenName = 'cartSubscription';
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
