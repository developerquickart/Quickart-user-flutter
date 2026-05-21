import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trial_product_listing_model.dart';
export 'trial_product_listing_model.dart';

class TrialProductListingWidget extends StatefulWidget {
  const TrialProductListingWidget({super.key});

  static String routeName = 'TrialProductListing';
  static String routePath = '/trialProductListing';

  @override
  State<TrialProductListingWidget> createState() =>
      _TrialProductListingWidgetState();
}

class _TrialProductListingWidgetState extends State<TrialProductListingWidget>
    with TickerProviderStateMixin {
  late TrialProductListingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrialProductListingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TrialProductListing'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TRIAL_PRODUCT_LISTING_TrialProductListin');
      logFirebaseEvent('TrialProductListing_backend_call');
      _model.apiResult80q = await QuickartGroup.trialPackDetailsCall.call(
        trialId: FFAppState().trialId,
        platform: isiOS ? 'ios' : 'android',
        userId: FFAppState().userID,
      );

      if ((_model.apiResult80q?.succeeded ?? true)) {
        logFirebaseEvent('TrialProductListing_update_app_state');
        FFAppState().trialPackBannerImage = getJsonField(
          (_model.apiResult80q?.jsonBody ?? ''),
          r'''$.data.image''',
        ).toString();
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.linear,
            delay: 1000.0.ms,
            duration: 1500.0.ms,
            color: FFAppConstants.indigoColor,
            angle: 0.262,
          ),
        ],
      ),
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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(QuickartGroup.trialPackDetailsCall.call(
              trialId: FFAppState().trialId,
              userId: FFAppState().userID,
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
        final trialProductListingTrialPackDetailsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: NestedScrollView(
              floatHeaderSlivers: false,
              headerSliverBuilder: (context, _) => [
                SliverAppBar(
                  expandedHeight: 300.0,
                  pinned: true,
                  floating: false,
                  backgroundColor: FFAppConstants.appBarColor,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 46.0,
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: FFAppConstants.appBarIconandTitleColor,
                                  size:
                                      FFAppConstants.appBarIconFont.toDouble(),
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'TRIAL_PRODUCT_LISTING_chevron_left_ICN_O');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed(
                                      TrialPackcategoriesWidget.routeName);

                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  FFAppState().isCartShow = false;
                                  safeSetState(() {});
                                },
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0x9B14181B),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Text(
                                    FFAppState().trialPackCategoryName,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          color: FFAppConstants.whiteColor,
                                          fontSize: FFAppConstants
                                              .appBartitleFont
                                              .toDouble(),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        FFAppState().trialPackBannerImage,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                  ),
                  elevation: 2.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return SafeArea(
                    top: false,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 50.0),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 60.0, 0.0, 10.0),
                                      child: Builder(
                                        builder: (context) {
                                          final repeatList = getJsonField(
                                            trialProductListingTrialPackDetailsResponse
                                                .jsonBody,
                                            r'''$.data.product_details''',
                                          ).toList();
                                          if (repeatList.isEmpty) {
                                            return Center(
                                              child: Image.asset(
                                                'assets/images/No_data_available.png',
                                              ),
                                            );
                                          }

                                          return RefreshIndicator(
                                            onRefresh: () async {
                                              logFirebaseEvent(
                                                  'TRIAL_PRODUCT_LISTING_ListView_r95f2t09_');
                                              logFirebaseEvent(
                                                  'ListView_refresh_database_request');
                                              safeSetState(() => _model
                                                  .apiRequestCompleter = null);
                                              await _model
                                                  .waitForApiRequestCompleted();
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
                                              itemBuilder:
                                                  (context, repeatListIndex) {
                                                final repeatListItem =
                                                    repeatList[repeatListIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
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
                                                          'TRIAL_PRODUCT_LISTING_Container_zl31xpbz');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                          ProductDetailsScreenWidget
                                                              .routeName);

                                                      logFirebaseEvent(
                                                          'Container_update_app_state');
                                                      FFAppState().productID =
                                                          getJsonField(
                                                        repeatListItem,
                                                        r'''$.product_id''',
                                                      ).toString();
                                                      FFAppState().productName =
                                                          getJsonField(
                                                        repeatListItem,
                                                        r'''$.product_name''',
                                                      ).toString();
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Container_google_analytics_event');
                                                      logFirebaseEvent(
                                                          'ProductDetailScreenAnalytics');
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      getJsonField(
                                                                        repeatListItem,
                                                                        r'''$.product_image''',
                                                                      ).toString(),
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.png',
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 2.0, 9.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  repeatListItem,
                                                                                  r'''$.product_name''',
                                                                                ).toString().maybeHandleOverflow(
                                                                                      maxChars: 35,
                                                                                    ),
                                                                                textAlign: TextAlign.start,
                                                                                maxLines: 3,
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
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: 'AED ',
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
                                                                                          text: valueOrDefault<String>(
                                                                                            functions.setDecimalValue(getJsonField(
                                                                                              repeatListItem,
                                                                                              r'''$.discounted_price''',
                                                                                            ).toString()),
                                                                                            '0.00',
                                                                                          ),
                                                                                          style: GoogleFonts.montserrat(
                                                                                            color: FFAppConstants.blackColor0A0A0A,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
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
                                                                                            text: functions.setDecimalValue(getJsonField(
                                                                                              repeatListItem,
                                                                                              r'''$.mrp''',
                                                                                            ).toString())!,
                                                                                            style: GoogleFonts.montserrat(
                                                                                              color: FFAppConstants.blackColor666666,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 10.0,
                                                                                              decoration: TextDecoration.lineThrough,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            15.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (FFAppConstants.stockNotify !=
                                                                            getJsonField(
                                                                              repeatListItem,
                                                                              r'''$.stock''',
                                                                            ).toString()) {
                                                                          return Container(
                                                                            width:
                                                                                25.0,
                                                                            height:
                                                                                80.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final featureTag = getJsonField(
                                                                                  repeatListItem,
                                                                                  r'''$.feature_tags''',
                                                                                ).toList();

                                                                                return ListView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: featureTag.length,
                                                                                  itemBuilder: (context, featureTagIndex) {
                                                                                    final featureTagItem = featureTag[featureTagIndex];
                                                                                    return Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                        child: Container(
                                                                                          width: 23.0,
                                                                                          height: 23.0,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.network(
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
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.readexPro(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 0.5,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FFAppConstants
                                                                    .lightBlack7a7a7a,
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
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 15.0, 15.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FFAppConstants.green86DF67,
                                                FFAppConstants.whiteColor
                                              ],
                                              stops: [0.65, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, -0.64),
                                              end: AlignmentDirectional(
                                                  -1.0, 0.64),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              width: 0.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 70.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  color: FFAppConstants
                                                      .green86DF67,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
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
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppConstants
                                                                  .primaryYellowColor,
                                                              fontSize: 10.0,
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
                                                      TextSpan(
                                                        text: functions
                                                            .setDecimalValueWithCount(
                                                                getJsonField(
                                                                  trialProductListingTrialPackDetailsResponse
                                                                      .jsonBody,
                                                                  r'''$.data.total_saving_price''',
                                                                ).toString(),
                                                                2,
                                                                false),
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .primaryYellowColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12.0,
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
                                                          color: FFAppConstants
                                                              .primaryYellowColor,
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
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'SAVING on this order with TRIAL PACK',
                                                  style: GoogleFonts.montserrat(
                                                    color: FFAppConstants
                                                        .whiteColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13.0,
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'textOnPageLoadAnimation']!),
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
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'TRIAL_PRODUCT_LISTING_Button_6oh6ya3r_ON');
                                            if (FFAppState().qtyZeroCheck ==
                                                getJsonField(
                                                  trialProductListingTrialPackDetailsResponse
                                                      .jsonBody,
                                                  r'''$.data.cartQty''',
                                                )) {
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              _model.apiResultcAddCart31 =
                                                  await QuickartGroup
                                                      .addtrailpackCall
                                                      .call(
                                                trialid: FFAppState().trialId,
                                                userid: FFAppState().userID,
                                                qty: '1',
                                                platform:
                                                    isiOS ? 'ios' : 'android',
                                              );

                                              if ((_model.apiResultcAddCart31
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'Button_refresh_database_request');
                                                safeSetState(() =>
                                                    _model.apiRequestCompleter =
                                                        null);
                                                await _model
                                                    .waitForApiRequestCompleted();
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            CustomAlertDailogWidget(
                                                          des: getJsonField(
                                                            (_model.apiResultcAddCart31
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString(),
                                                          height: 140.0,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                  TrialProductCartScreenWidget
                                                      .routeName);
                                            }

                                            safeSetState(() {});
                                          },
                                          text: FFAppState().qtyZeroCheck ==
                                                  getJsonField(
                                                    trialProductListingTrialPackDetailsResponse
                                                        .jsonBody,
                                                    r'''$.data.cartQty''',
                                                  )
                                              ? 'ADD TO CART'
                                              : 'GO TO CART',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FFAppConstants.indigoColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color:
                                                      FFAppConstants.whiteColor,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                      if (FFAppState().qtyZeroCheck ==
                                          getJsonField(
                                            trialProductListingTrialPackDetailsResponse
                                                .jsonBody,
                                            r'''$.data.cartQty''',
                                          ))
                                        Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'TRIAL_PRODUCT_LISTING_BUY_NOW_BTN_ON_TAP');
                                              if (FFAppState().qtyZeroCheck ==
                                                  getJsonField(
                                                    trialProductListingTrialPackDetailsResponse
                                                        .jsonBody,
                                                    r'''$.data.cartQty''',
                                                  )) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');
                                                _model.apiResultcAddCart3 =
                                                    await QuickartGroup
                                                        .addtrailpackCall
                                                        .call(
                                                  trialid: FFAppState().trialId,
                                                  userid: FFAppState().userID,
                                                  qty: '1',
                                                  platform:
                                                      isiOS ? 'ios' : 'android',
                                                );

                                                if ((_model.apiResultcAddCart3
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.pushNamed(
                                                      TrialProductCartScreenWidget
                                                          .routeName);
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_alert_dialog');
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
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
                                                              CustomAlertDailogWidget(
                                                            des: getJsonField(
                                                              (_model.apiResultcAddCart3
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.message''',
                                                            ).toString(),
                                                            height: 130.0,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                    TrialProductCartScreenWidget
                                                        .routeName);
                                              }

                                              safeSetState(() {});
                                            },
                                            text: 'BUY NOW',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.45,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FFAppConstants
                                                        .whiteColor,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(width: 5.0)),
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
              ),
            ),
          ),
        );
      },
    );
  }
}
