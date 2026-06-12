import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/components/empty_data_two_line_component/empty_data_two_line_component_widget.dart';
import '/components/similar_pproduct/similar_pproduct_widget.dart';
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
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'product_details_screen_model.dart';
export 'product_details_screen_model.dart';

class ProductDetailsScreenWidget extends StatefulWidget {
  const ProductDetailsScreenWidget({
    super.key,
    this.id,
    this.utmSource,
    this.utmCampaign,
    this.utmNetwork,
    this.utmMedium,
    this.utmKeyword,
    this.utmPlacement,
  });

  final int? id;
  final String? utmSource;
  final String? utmCampaign;
  final String? utmNetwork;
  final String? utmMedium;
  final String? utmKeyword;
  final String? utmPlacement;

  static String routeName = 'product_details_screen';
  static String routePath = '/product-details';

  @override
  State<ProductDetailsScreenWidget> createState() =>
      _ProductDetailsScreenWidgetState();
}

class _ProductDetailsScreenWidgetState
    extends State<ProductDetailsScreenWidget> {
  late ProductDetailsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'product_details_screen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PRODUCT_DETAILS_SCREEN_product_details_s');
      logFirebaseEvent('product_details_screen_update_app_state');
      FFAppState().productID = widget!.id!.toString();
      FFAppState().isSubcribeCartVisible = false;
      safeSetState(() {});
      if (widget!.id != null) {
        logFirebaseEvent('product_details_screen_update_app_state');
        FFAppState().productID = widget!.id!.toString();
        safeSetState(() {});
        logFirebaseEvent('product_details_screen_backend_call');
        _model.apiResultSeoSource = await QuickartGroup.seosourceCall.call(
          utmSource: widget!.utmSource,
          utmcampaign: widget!.utmCampaign,
          utmnetwork: widget!.utmNetwork,
          utmmedium: widget!.utmMedium,
          utmkeyword: widget!.utmKeyword,
          placement: widget!.utmPlacement,
          userid: FFAppState().userID,
          deviceid: FFAppState().deviceID,
          fcmtoken: FFAppState().fcmToken,
          platform: isiOS == true ? 'ios' : 'android',
        );

        if ((_model.apiResultSeoSource?.succeeded ?? true)) {
          logFirebaseEvent('product_details_screen_custom_action');
          await actions.facebookEventClass(
            widget!.utmKeyword!,
            widget!.utmPlacement!,
            FFAppState().userID,
            0.0,
            0,
            0.0,
            'utmSource',
            FFAppState().emptyJson,
            'product detail',
            widget!.utmSource,
            widget!.utmCampaign,
            widget!.utmNetwork,
            widget!.utmMedium,
          );
        } else {
          logFirebaseEvent('product_details_screen_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                getJsonField(
                  (_model.apiResultSeoSource?.jsonBody ?? ''),
                  r'''$.message''',
                ).toString(),
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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(QuickartGroup.productDetailCall.call(
              storeID: FFAppState().storeID,
              userID: FFAppState().userID,
              productID: widget!.id != null
                  ? valueOrDefault<String>(
                      widget!.id?.toString(),
                      '1561',
                    )
                  : FFAppState().productID,
              platform: isiOS ? 'ios' : 'android',
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FFAppConstants.whiteColor,
            body: Center(
              child: Image.asset(
                'assets/images/new_loader.gif',
                width: MediaQuery.sizeOf(context).width * 0.25,
                height: MediaQuery.sizeOf(context).height * 0.25,
              ),
            ),
          );
        }
        final productDetailsScreenProductDetailResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FFAppConstants.whiteColor,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                icon: Icon(
                  Icons.chevron_left,
                  color: FFAppConstants.appBarIconandTitleColor,
                  size: FFAppConstants.appBarIconFont.toDouble(),
                ),
                onPressed: () async {
                  logFirebaseEvent('PRODUCT_DETAILS_SCREEN_chevron_left_ICN_');
                  logFirebaseEvent('IconButton_update_app_state');
                  FFAppState().isSubcribeCartVisible = false;
                  safeSetState(() {});
                  if (FFAppState().isUserLogin == true) {
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
                  } else {
                    logFirebaseEvent('IconButton_navigate_to');

                    context.goNamed(LoginOnBoardScreenWidget.routeName);
                  }
                },
              ),
              title: Text(
                'Product Details',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
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
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      if (FFAppConstants.statusAPI1 ==
                          getJsonField(
                            productDetailsScreenProductDetailResponse.jsonBody,
                            r'''$.status''',
                          ).toString()) {
                        return Container(
                          decoration: BoxDecoration(),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Container(
                                    height: 420.0,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            height: MediaQuery.sizeOf(context)
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final imageLis = getJsonField(
                                                  productDetailsScreenProductDetailResponse
                                                      .jsonBody,
                                                  r'''$.detail.images''',
                                                ).toList();

                                                return Stack(
                                                  children: [
                                                    PageView.builder(
                                                      controller: _model
                                                              .pageViewController ??=
                                                          PageController(
                                                              initialPage: max(
                                                                  0,
                                                                  min(
                                                                      0,
                                                                      imageLis.length -
                                                                          1))),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          imageLis.length,
                                                      itemBuilder: (context,
                                                          imageLisIndex) {
                                                        final imageLisItem =
                                                            imageLis[
                                                                imageLisIndex];
                                                        return ClipRRect(
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
                                                              imageLisItem,
                                                              r'''$.image''',
                                                            ).toString(),
                                                            width: MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width,
                                                            height: MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width,
                                                            fit: BoxFit.contain,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width,
                                                              height: MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: smooth_page_indicator
                                                            .SmoothPageIndicator(
                                                          controller: _model
                                                                  .pageViewController ??=
                                                              PageController(
                                                                  initialPage: max(
                                                                      0,
                                                                      min(
                                                                          0,
                                                                          imageLis.length -
                                                                              1))),
                                                          count:
                                                              imageLis.length,
                                                          axisDirection:
                                                              Axis.horizontal,
                                                          onDotClicked:
                                                              (i) async {
                                                            await _model
                                                                .pageViewController!
                                                                .animateToPage(
                                                              i,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          effect: smooth_page_indicator
                                                              .ExpandingDotsEffect(
                                                            expansionFactor:
                                                                3.0,
                                                            spacing: 5.0,
                                                            radius: 16.0,
                                                            dotWidth: 8.0,
                                                            dotHeight: 5.0,
                                                            dotColor: Color(
                                                                0xFFE0E0E0),
                                                            activeDotColor:
                                                                Color(
                                                                    0xFF2E317E),
                                                            paintStyle:
                                                                PaintingStyle
                                                                    .fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1.0, 0.0, 200.0, 0.0),
                                          child: Container(
                                            height: 28.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8.0),
                                                bottomRight:
                                                    Radius.circular(8.0),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    if (FFAppConstants
                                                            .percentageCheck <
                                                        getJsonField(
                                                          productDetailsScreenProductDetailResponse
                                                              .jsonBody,
                                                          r'''$.detail.discountper''',
                                                        )) {
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF4F6F4),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width: 80.0,
                                                          height: 28.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppConstants
                                                                .green44AC20,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      8.0),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: functions.setDecimalValueWithCount(
                                                                          getJsonField(
                                                                            productDetailsScreenProductDetailResponse.jsonBody,
                                                                            r'''$.detail.discountper''',
                                                                          ).toString(),
                                                                          0,
                                                                          true),
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
                                                                                Colors.white,
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
                                                                      text:
                                                                          '% OFF',
                                                                      style: GoogleFonts
                                                                          .montserrat(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            10.0,
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
                                                        ),
                                                      );
                                                    } else {
                                                      return Text(
                                                        '\n',
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
                                                      );
                                                    }
                                                  },
                                                ),
                                                if (FFAppState().nullValue !=
                                                    getJsonField(
                                                      productDetailsScreenProductDetailResponse
                                                          .jsonBody,
                                                      r'''$.detail.country_icon''',
                                                    ).toString())
                                                  Container(
                                                    width: 39.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF4F6F4),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(
                                                                8.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFDCE9D8),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
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
                                                            productDetailsScreenProductDetailResponse
                                                                .jsonBody,
                                                            r'''$.detail.country_icon''',
                                                          ).toString(),
                                                          width: 30.0,
                                                          height: 30.0,
                                                          fit: BoxFit.fill,
                                                          errorWidget: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            width: 30.0,
                                                            height: 30.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 35.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 1.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Builder(
                                                    builder: (context) =>
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
                                                            'PRODUCT_DETAILS_SCREEN_Container_ckxj5nk');
                                                        logFirebaseEvent(
                                                            'Container_update_app_state');
                                                        FFAppState().productID =
                                                            getJsonField(
                                                          productDetailsScreenProductDetailResponse
                                                              .jsonBody,
                                                          r'''$.detail.product_id''',
                                                        ).toString();
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Container_share');
                                                        await Share.share(
                                                          ' Product link-https://www.quickart.ae/productDetailsScreen?productId=${getJsonField(
                                                            productDetailsScreenProductDetailResponse
                                                                .jsonBody,
                                                            r'''$.detail.product_id''',
                                                          ).toString()}',
                                                          sharePositionOrigin:
                                                              getWidgetBoundingBox(
                                                                  context),
                                                        );
                                                        logFirebaseEvent(
                                                            'Container_google_analytics_event');
                                                        logFirebaseEvent(
                                                          'Share',
                                                          parameters: {
                                                            'Screen Name':
                                                                'Product Detail Screen',
                                                            'Share':
                                                                'Share Product',
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF4F6F4),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    1.0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFDCE9D8),
                                                          ),
                                                        ),
                                                        child: Builder(
                                                          builder: (context) =>
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
                                                                  'PRODUCT_DETAILS_SCREEN_Icon_skkn74wf_ON_');
                                                              logFirebaseEvent(
                                                                  'Icon_update_app_state');
                                                              FFAppState()
                                                                      .productID =
                                                                  getJsonField(
                                                                productDetailsScreenProductDetailResponse
                                                                    .jsonBody,
                                                                r'''$.detail.product_id''',
                                                              ).toString();
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'Icon_share');
                                                              await Share.share(
                                                                'Product details: https://www.quickart.ae/product-details?id=${FFAppState().productID}',
                                                                sharePositionOrigin:
                                                                    getWidgetBoundingBox(
                                                                        context),
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons.share_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (FFAppConstants
                                                                .isFavourite ==
                                                            getJsonField(
                                                              productDetailsScreenProductDetailResponse
                                                                  .jsonBody,
                                                              r'''$.detail.isFavourite''',
                                                            ).toString()) {
                                                          return Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF4F6F4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFDCE9D8),
                                                                width: 1.0,
                                                              ),
                                                            ),
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
                                                                    'PRODUCT_DETAILS_SCREEN_Icon_cb6cqzzw_ON_');
                                                                logFirebaseEvent(
                                                                    'Icon_custom_action');
                                                                _model.connectivityCheck =
                                                                    await actions
                                                                        .checkInternetConnection();
                                                                if (_model
                                                                        .connectivityCheck ==
                                                                    true) {
                                                                  logFirebaseEvent(
                                                                      'Icon_haptic_feedback');
                                                                  HapticFeedback
                                                                      .mediumImpact();
                                                                  logFirebaseEvent(
                                                                      'Icon_backend_call');
                                                                  _model.apiResultcb8 =
                                                                      await QuickartGroup
                                                                          .addremwishlistCall
                                                                          .call(
                                                                    userid: FFAppState()
                                                                        .userID,
                                                                    storeID:
                                                                        FFAppState()
                                                                            .storeID,
                                                                    varientID:
                                                                        getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.varient_id''',
                                                                    ).toString(),
                                                                    platform: isiOS
                                                                        ? 'ios'
                                                                        : 'android',
                                                                  );

                                                                  if ((_model
                                                                          .apiResultcb8
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    logFirebaseEvent(
                                                                        'Icon_update_app_state');

                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Icon_refresh_database_request');
                                                                    safeSetState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted();
                                                                    logFirebaseEvent(
                                                                        'Icon_custom_action');
                                                                    await actions
                                                                        .facebookEventClass(
                                                                      getJsonField(
                                                                        productDetailsScreenProductDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.detail.varient_id''',
                                                                      ).toString(),
                                                                      getJsonField(
                                                                        productDetailsScreenProductDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.detail.product_name''',
                                                                      ).toString(),
                                                                      'remove',
                                                                      getJsonField(
                                                                        productDetailsScreenProductDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.detail.price''',
                                                                      ),
                                                                      0,
                                                                      0.0,
                                                                      'wishList',
                                                                      FFAppState()
                                                                          .emptyJson,
                                                                      'c',
                                                                      ' ',
                                                                      ' ',
                                                                      ' ',
                                                                      ' ',
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Icon_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                      'Remove From Wishlist',
                                                                      parameters: {
                                                                        'API Name':
                                                                            'Add Remove Wishlist',
                                                                        'Screen Name':
                                                                            'Product Detail Screen',
                                                                      },
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Icon_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          getJsonField(
                                                                            (_model.apiResultcb8?.jsonBody ??
                                                                                ''),
                                                                            r'''$.message''',
                                                                          ).toString(),
                                                                          style:
                                                                              GoogleFonts.montserrat(
                                                                            color:
                                                                                FFAppConstants.indigoColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FFAppConstants.primaryPurpleE4D8F5,
                                                                      ),
                                                                    );
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Icon_show_snack_bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        FFAppConstants
                                                                            .internetString,
                                                                        style: GoogleFonts
                                                                            .montserrat(
                                                                          color:
                                                                              FFAppConstants.indigoColor,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              14.0,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1300),
                                                                      backgroundColor:
                                                                          FFAppConstants
                                                                              .primaryPurpleE4D8F5,
                                                                    ),
                                                                  );
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          return Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF4F6F4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFDCE9D8),
                                                                width: 1.0,
                                                              ),
                                                            ),
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
                                                                    'PRODUCT_DETAILS_SCREEN_Icon_41si0ayu_ON_');
                                                                logFirebaseEvent(
                                                                    'Icon_custom_action');
                                                                _model.connectivityResultf =
                                                                    await actions
                                                                        .checkInternetConnection();
                                                                if (_model
                                                                        .connectivityResultf ==
                                                                    true) {
                                                                  logFirebaseEvent(
                                                                      'Icon_haptic_feedback');
                                                                  HapticFeedback
                                                                      .mediumImpact();
                                                                  logFirebaseEvent(
                                                                      'Icon_backend_call');
                                                                  _model.apiResultj2l =
                                                                      await QuickartGroup
                                                                          .addremwishlistCall
                                                                          .call(
                                                                    userid: FFAppState()
                                                                        .userID,
                                                                    storeID:
                                                                        FFAppState()
                                                                            .storeID,
                                                                    varientID:
                                                                        getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.varient_id''',
                                                                    ).toString(),
                                                                    platform: isiOS
                                                                        ? 'ios'
                                                                        : 'android',
                                                                  );

                                                                  if ((_model
                                                                          .apiResultj2l
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    logFirebaseEvent(
                                                                        'Icon_update_app_state');

                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Icon_refresh_database_request');
                                                                    safeSetState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted();
                                                                    logFirebaseEvent(
                                                                        'Icon_custom_action');
                                                                    await actions
                                                                        .facebookEventClass(
                                                                      getJsonField(
                                                                        productDetailsScreenProductDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.detail.varient_id''',
                                                                      ).toString(),
                                                                      getJsonField(
                                                                        productDetailsScreenProductDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.detail.product_name''',
                                                                      ).toString(),
                                                                      'add',
                                                                      getJsonField(
                                                                        productDetailsScreenProductDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.detail.price''',
                                                                      ),
                                                                      0,
                                                                      0.0,
                                                                      'wishList',
                                                                      FFAppState()
                                                                          .emptyJson,
                                                                      'c',
                                                                      ' ',
                                                                      ' ',
                                                                      ' ',
                                                                      ' ',
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Icon_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                      'Add To Wishlist',
                                                                      parameters: {
                                                                        'API Name':
                                                                            'Add Remove Wishlist',
                                                                        'Screen Name':
                                                                            'Product Detail Screen',
                                                                      },
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Icon_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          getJsonField(
                                                                            (_model.apiResultj2l?.jsonBody ??
                                                                                ''),
                                                                            r'''$.message''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FFAppConstants.indigoColor,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FFAppConstants.primaryPurpleE4D8F5,
                                                                      ),
                                                                    );
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Icon_show_snack_bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        FFAppConstants
                                                                            .internetString,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FFAppConstants.indigoColor,
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
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                size: 24.0,
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
                                        ),
                                        if ((getJsonField(
                                                  QuickartGroup
                                                      .productDetailCall
                                                      .productDetailData(
                                                    productDetailsScreenProductDetailResponse
                                                        .jsonBody,
                                                  ),
                                                  r'''$.feature_tags''',
                                                ) !=
                                                null) &&
                                            ((getJsonField(
                                                  QuickartGroup
                                                      .productDetailCall
                                                      .productDetailData(
                                                    productDetailsScreenProductDetailResponse
                                                        .jsonBody,
                                                  ),
                                                  r'''$.feature_tags''',
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
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 90.0, 20.0, 0.0),
                                              child: Container(
                                                width: 50.0,
                                                decoration: BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    final featureTag =
                                                        getJsonField(
                                                      QuickartGroup
                                                          .productDetailCall
                                                          .productDetailData(
                                                        productDetailsScreenProductDetailResponse
                                                            .jsonBody,
                                                      ),
                                                      r'''$.feature_tags''',
                                                    ).toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      reverse: true,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          featureTag.length,
                                                      itemBuilder: (context,
                                                          featureTagIndex) {
                                                        final featureTagItem =
                                                            featureTag[
                                                                featureTagIndex];
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
                                                                        0.0,
                                                                        2.0),
                                                            child: Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                  featureTagItem,
                                                                  r'''$.image''',
                                                                ).toString(),
                                                                fit: BoxFit
                                                                    .cover,
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
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.98, 0.63),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 5.0, 10.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        productDetailsScreenProductDetailResponse
                                            .jsonBody,
                                        r'''$.detail.product_name''',
                                      ).toString(),
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
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width <
                                                    385.0
                                                ? 16.0
                                                : 20.0,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'Select Unit',
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
                                                    .neutralBlack3D3D3D,
                                                fontSize: 16.0,
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
                                    if (FFAppState().qtyZeroCheck !=
                                        getJsonField(
                                          productDetailsScreenProductDetailResponse
                                              .jsonBody,
                                          r'''$.detail.countrating''',
                                        ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 20.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PRODUCT_DETAILS_SCREEN_Row_llt2m1mn_ON_T');
                                            logFirebaseEvent('Row_navigate_to');

                                            context.pushNamed(
                                              ProductRatingReveiwScreenWidget
                                                  .routeName,
                                              queryParameters: {
                                                'varientID': serializeParam(
                                                  getJsonField(
                                                    productDetailsScreenProductDetailResponse
                                                        .jsonBody,
                                                    r'''$.detail.varient_id''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'productName': serializeParam(
                                                  getJsonField(
                                                    productDetailsScreenProductDetailResponse
                                                        .jsonBody,
                                                    r'''$.detail.product_name''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'varientid': serializeParam(
                                                  getJsonField(
                                                    productDetailsScreenProductDetailResponse
                                                        .jsonBody,
                                                    r'''$.detail.varient_id''',
                                                  ),
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                functions
                                                    .setDecimalValueWithCount(
                                                        getJsonField(
                                                          productDetailsScreenProductDetailResponse
                                                              .jsonBody,
                                                          r'''$.detail.avgrating''',
                                                        ).toString(),
                                                        1,
                                                        false),
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: RatingBarIndicator(
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.star_rounded,
                                                    color: FFAppConstants
                                                        .yellowColor,
                                                  ),
                                                  direction: Axis.horizontal,
                                                  rating: double.parse(functions
                                                      .setDecimalValueWithCount(
                                                          getJsonField(
                                                            productDetailsScreenProductDetailResponse
                                                                .jsonBody,
                                                            r'''$.detail.avgrating''',
                                                          ).toString(),
                                                          1,
                                                          false)),
                                                  unratedColor:
                                                      Color(0xFFDBDADA),
                                                  itemCount: 5,
                                                  itemSize: 20.0,
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  productDetailsScreenProductDetailResponse
                                                      .jsonBody,
                                                  r'''$.detail.countrating''',
                                                ).toString(),
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
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final productVarients = getJsonField(
                                        QuickartGroup.productDetailCall
                                            .productDetailData(
                                          productDetailsScreenProductDetailResponse
                                              .jsonBody,
                                        ),
                                        r'''$.varients''',
                                      ).toList();

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              productVarients.length,
                                              (productVarientsIndex) {
                                            final productVarientsItem =
                                                productVarients[
                                                    productVarientsIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 9.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'PRODUCT_DETAILS_SCREEN_Container_4omzlct');
                                                  logFirebaseEvent(
                                                      'Container_update_page_state');
                                                  _model.selectedVarient =
                                                      getJsonField(
                                                    productVarientsItem,
                                                    r'''$.varient_id''',
                                                  );
                                                  _model.selectedVariantIndx =
                                                      productVarientsIndex;
                                                  _model.selectedVariantDataJson =
                                                      productVarientsItem;
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'Container_refresh_database_request');
                                                  safeSetState(() => _model
                                                          .apiRequestCompleter =
                                                      null);
                                                  await _model
                                                      .waitForApiRequestCompleted(
                                                          maxWait: 5000);
                                                  logFirebaseEvent(
                                                      'Container_update_app_state');
                                                  FFAppState().productID =
                                                      getJsonField(
                                                    productVarientsItem,
                                                    r'''$.product_id''',
                                                  ).toString();
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: functions
                                                        .setbackgroundColorSubcategories(
                                                            '0',
                                                            '0',
                                                            getJsonField(
                                                              productVarientsItem,
                                                              r'''$.varient_id''',
                                                            ),
                                                            _model.selectedVarient ==
                                                                    0
                                                                ? getJsonField(
                                                                    QuickartGroup
                                                                        .productDetailCall
                                                                        .productDetailData(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    r'''$.varients[0].varient_id''',
                                                                  )
                                                                : _model
                                                                    .selectedVarient),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: FFAppConstants
                                                          .darkGreen,
                                                      width: 0.7,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(7.0, 7.0,
                                                                7.0, 7.0),
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.98,
                                                                      0.74),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    productVarientsItem,
                                                                    r'''$.quantity''',
                                                                  ).toString(),
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
                                                                            .blackColor666666,
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
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.98,
                                                                      0.74),
                                                              child: Text(
                                                                getJsonField(
                                                                  productVarientsItem,
                                                                  r'''$.unit''',
                                                                ).toString(),
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
                                                                          .blackColor666666,
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
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
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
                                                                    text:
                                                                        'AED ',
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
                                                                              FFAppConstants.blackColor0A0A0A,
                                                                          fontSize: MediaQuery.sizeOf(context).width < 385.0
                                                                              ? 16.0
                                                                              : 20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: functions
                                                                        .setDecimalValue(
                                                                            getJsonField(
                                                                      productVarientsItem,
                                                                      r'''$.price''',
                                                                    ).toString())!,
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      color: FFAppConstants
                                                                          .blackColor0A0A0A,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize: MediaQuery.sizeOf(context).width <
                                                                              385.0
                                                                          ? 16.0
                                                                          : 20.0,
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
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FFAppConstants
                                                                          .blackColor666666,
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
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Builder(
                                                            builder: (context) {
                                                              if (getJsonField(
                                                                    productVarientsItem,
                                                                    r'''$.price''',
                                                                  ) !=
                                                                  getJsonField(
                                                                    productVarientsItem,
                                                                    r'''$.mrp''',
                                                                  )) {
                                                                return Text(
                                                                  'AED ${valueOrDefault<String>(
                                                                    functions.setDecimalValue(
                                                                        functions
                                                                            .setDecimalValue(getJsonField(
                                                                      productVarientsItem,
                                                                      r'''$.mrp''',
                                                                    ).toString())),
                                                                    '0',
                                                                  )}',
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
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FFAppConstants
                                                                            .lightBlack7a7a7a,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                        decoration:
                                                                            TextDecoration.lineThrough,
                                                                      ),
                                                                );
                                                              } else {
                                                                return Text(
                                                                  '\n',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .readexPro(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Container(
                                      width: 360.0,
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF5F5F5),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (functions.checkVarientStockAvailable(
                                              _model.selectedVarient!,
                                              getJsonField(
                                                QuickartGroup.productDetailCall
                                                    .productDetailData(
                                                  productDetailsScreenProductDetailResponse
                                                      .jsonBody,
                                                ),
                                                r'''$.varients''',
                                              )) ==
                                          true) {
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if (false ==
                                                    getJsonField(
                                                      productDetailsScreenProductDetailResponse
                                                          .jsonBody,
                                                      r'''$.detail.is_offer_product''',
                                                    )) {
                                                  return Visibility(
                                                    visible: (FFAppConstants
                                                                .subscriptionAvailability ==
                                                            getJsonField(
                                                              productDetailsScreenProductDetailResponse
                                                                  .jsonBody,
                                                              r'''$.detail.availability''',
                                                            ).toString()) ||
                                                        (FFAppConstants
                                                                .allAvailability ==
                                                            getJsonField(
                                                              productDetailsScreenProductDetailResponse
                                                                  .jsonBody,
                                                              r'''$.detail.availability''',
                                                            ).toString()),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            if ((getJsonField(
                                                                      QuickartGroup
                                                                          .productDetailCall
                                                                          .productDetailData(
                                                                        productDetailsScreenProductDetailResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      r'''$.varients''',
                                                                    ) !=
                                                                    null) &&
                                                                (FFAppState()
                                                                        .qtyZeroCheck !=
                                                                    functions.getItemQtyByIndex(
                                                                        getJsonField(
                                                                          QuickartGroup
                                                                              .productDetailCall
                                                                              .productDetailData(
                                                                            productDetailsScreenProductDetailResponse.jsonBody,
                                                                          ),
                                                                          r'''$.varients''',
                                                                        ),
                                                                        _model.selectedVariantIndx,
                                                                        true))) {
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        10.0),
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
                                                                        'PRODUCT_DETAILS_SCREEN_Container_n8y2nz4');
                                                                    logFirebaseEvent(
                                                                        'Container_navigate_to');

                                                                    context.pushNamed(
                                                                        CartSubscriptionScreenWidget
                                                                            .routeName);

                                                                    logFirebaseEvent(
                                                                        'Container_update_app_state');
                                                                    FFAppState()
                                                                            .categoryName =
                                                                        'sub';
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Container_custom_action');
                                                                    await actions
                                                                        .facebookEventClass(
                                                                      FFAppState()
                                                                          .userID,
                                                                      ' ',
                                                                      ' ',
                                                                      FFAppState()
                                                                          .cartTotalPrice,
                                                                      FFAppState()
                                                                          .cartTotalCount,
                                                                      0.0,
                                                                      'cart',
                                                                      FFAppState()
                                                                          .emptyJson,
                                                                      'subscription cart',
                                                                      ' ',
                                                                      ' ',
                                                                      ' ',
                                                                      ' ',
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Container_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                      'Navigation',
                                                                      parameters: {
                                                                        'Screen Name':
                                                                            'Product Detail Screen',
                                                                        'Navigate To':
                                                                            'Subscription Cart Screen',
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context).width /
                                                                            2 -
                                                                        30,
                                                                    height:
                                                                        36.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FFAppConstants
                                                                          .yellowColor,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FFAppConstants
                                                                            .yellowDDC66C,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: 'GO TO SUBSCRIPTION',
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
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppConstants.neutralWhiteF5F5F5,
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
                                                                ),
                                                              );
                                                            } else {
                                                              return Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        10.0),
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
                                                                        'PRODUCT_DETAILS_SCREEN_Container_qaxkcjv');
                                                                    logFirebaseEvent(
                                                                        'Container_haptic_feedback');
                                                                    HapticFeedback
                                                                        .mediumImpact();
                                                                    logFirebaseEvent(
                                                                        'Container_update_page_state');
                                                                    _model.isLoaderIndicator =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Container_backend_call');
                                                                    _model.apiResultWeek1 =
                                                                        await QuickartGroup
                                                                            .totaldeliveriesCall
                                                                            .call();

                                                                    if ((_model
                                                                            .apiResultWeek1
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.weekModelJson =
                                                                          getJsonField(
                                                                        (_model.apiResultWeek1?.jsonBody ??
                                                                            ''),
                                                                        r'''$.data''',
                                                                      );
                                                                      _model.selectedVariantDataJson = functions.getItemByIndex(
                                                                          getJsonField(
                                                                            productDetailsScreenProductDetailResponse.jsonBody,
                                                                            r'''$.detail.varients''',
                                                                          ),
                                                                          _model.selectedVariantIndx);
                                                                      _model.isLoaderIndicator =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Container_update_app_state');
                                                                      FFAppState()
                                                                              .isSubcribeCartVisible =
                                                                          true;
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
                                                                              .isWedSelected =
                                                                          false;
                                                                      FFAppState()
                                                                          .isWeekSelected = 0;
                                                                      FFAppState()
                                                                              .isDeliveryTimeSlotSelected =
                                                                          'no';
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
                                                                              (_model.apiResultWeek1?.jsonBody ?? ''),
                                                                              r'''$.message''',
                                                                            ).toString(),
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              color: FFAppConstants.indigoColor,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 1300),
                                                                          backgroundColor:
                                                                              FFAppConstants.primaryPurpleE4D8F5,
                                                                        ),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.isLoaderIndicator =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context).width /
                                                                            2 -
                                                                        20,
                                                                    height:
                                                                        36.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FFAppConstants
                                                                          .yellowColor,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FFAppConstants
                                                                            .yellowDDC66C,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: 'SUBSCRIBE ',
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                      ),
                                                                                      color: FFAppConstants.blackColor0A0A0A,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: () {
                                                                                  if (FFAppState().nullValue ==
                                                                                      getJsonField(
                                                                                        productDetailsScreenProductDetailResponse.jsonBody,
                                                                                        r'''$.detail.percentage''',
                                                                                      ).toString()) {
                                                                                    return ' ';
                                                                                  } else if (FFAppState().qtyZeroCheck ==
                                                                                      getJsonField(
                                                                                        productDetailsScreenProductDetailResponse.jsonBody,
                                                                                        r'''$.detail.percentage''',
                                                                                      )) {
                                                                                    return ' ';
                                                                                  } else {
                                                                                    return '& SAVE ${getJsonField(
                                                                                      productDetailsScreenProductDetailResponse.jsonBody,
                                                                                      r'''$.detail.percentage''',
                                                                                    ).toString()}%';
                                                                                  }
                                                                                }(),
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                      ),
                                                                                      color: FFAppConstants.blackColor0A0A0A,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return Text(
                                                    'j',
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
                                                  );
                                                }
                                              },
                                            ),
                                            Builder(
                                              builder: (context) {
                                                if (false ==
                                                    getJsonField(
                                                      productDetailsScreenProductDetailResponse
                                                          .jsonBody,
                                                      r'''$.detail.is_offer_product''',
                                                    )) {
                                                  return Visibility(
                                                    visible: (FFAppConstants
                                                                .quickAvailability ==
                                                            getJsonField(
                                                              QuickartGroup
                                                                  .productDetailCall
                                                                  .productDetailData(
                                                                productDetailsScreenProductDetailResponse
                                                                    .jsonBody,
                                                              ),
                                                              r'''$.availability''',
                                                            ).toString()) ||
                                                        (FFAppConstants
                                                                .allAvailability ==
                                                            getJsonField(
                                                              QuickartGroup
                                                                  .productDetailCall
                                                                  .productDetailData(
                                                                productDetailsScreenProductDetailResponse
                                                                    .jsonBody,
                                                              ),
                                                              r'''$.availability''',
                                                            ).toString()),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if ((getJsonField(
                                                                  QuickartGroup
                                                                      .productDetailCall
                                                                      .productDetailData(
                                                                    productDetailsScreenProductDetailResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  r'''$.varients''',
                                                                ) !=
                                                                null) &&
                                                            (FFAppState()
                                                                    .qtyZeroCheck ==
                                                                functions.getItemQtyByIndex(
                                                                    getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.varients''',
                                                                    ),
                                                                    _model.selectedVariantIndx,
                                                                    false))) {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        10.0),
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
                                                                    'PRODUCT_DETAILS_SCREEN_Container_gcigfyn');
                                                                logFirebaseEvent(
                                                                    'Container_custom_action');
                                                                _model.connectivtyResultC1 =
                                                                    await actions
                                                                        .checkInternetConnection();
                                                                if (_model
                                                                        .connectivtyResultC1 ==
                                                                    true) {
                                                                  logFirebaseEvent(
                                                                      'Container_haptic_feedback');
                                                                  HapticFeedback
                                                                      .mediumImpact();
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.selectedVariantDataJson = functions
                                                                      .getItemByIndex(
                                                                          getJsonField(
                                                                            productDetailsScreenProductDetailResponse.jsonBody,
                                                                            r'''$.detail.varients''',
                                                                          ),
                                                                          _model
                                                                              .selectedVariantIndx);
                                                                  _model.isLoaderIndicator =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Container_backend_call');
                                                                  _model.apiResultAddCart =
                                                                      await QuickartGroup
                                                                          .addToCartCall
                                                                          .call(
                                                                    userid: FFAppState()
                                                                        .userID,
                                                                    storeid:
                                                                        FFAppState()
                                                                            .storeID,
                                                                    varientid:
                                                                        getJsonField(
                                                                      _model
                                                                          .selectedVariantDataJson,
                                                                      r'''$.varient_id''',
                                                                    ).toString(),
                                                                    deviceid:
                                                                        FFAppState()
                                                                            .deviceID,
                                                                    qty: '1',
                                                                    itemPrice:
                                                                        getJsonField(
                                                                      _model
                                                                          .selectedVariantDataJson,
                                                                      r'''$.price''',
                                                                    ).toString(),
                                                                    itemName:
                                                                        getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.product_name''',
                                                                    ).toString(),
                                                                    platform: isiOS
                                                                        ? 'ios'
                                                                        : 'android',
                                                                  );

                                                                  if ((_model
                                                                          .apiResultAddCart
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    logFirebaseEvent(
                                                                        'Container_update_app_state');
                                                                    FFAppState()
                                                                            .isCartShow =
                                                                        false;
                                                                    FFAppState()
                                                                            .cartSavingPrice =
                                                                        functions.stringToDouble(QuickartGroup
                                                                            .addToCartCall
                                                                            .savingPrice(
                                                                              (_model.apiResultAddCart?.jsonBody ?? ''),
                                                                            )!
                                                                            .toString());
                                                                    FFAppState()
                                                                            .cartTotalPrice =
                                                                        functions.stringToDouble(QuickartGroup
                                                                            .addToCartCall
                                                                            .totalPrice(
                                                                              (_model.apiResultAddCart?.jsonBody ?? ''),
                                                                            )!
                                                                            .toString());
                                                                    FFAppState()
                                                                            .cartTotalCount =
                                                                        QuickartGroup
                                                                            .addToCartCall
                                                                            .totalItems(
                                                                      (_model.apiResultAddCart
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!;
                                                                    FFAppState()
                                                                            .refreshTrigger =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Container_refresh_database_request');
                                                                    safeSetState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model.waitForApiRequestCompleted(
                                                                        maxWait:
                                                                            2000);
                                                                    logFirebaseEvent(
                                                                        'Container_update_page_state');
                                                                    _model.isLoaderIndicator =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Container_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                      'Add To Cart',
                                                                      parameters: {
                                                                        'API Name':
                                                                            'Add To Cart',
                                                                        'Screen Name':
                                                                            'Product Detail Screen',
                                                                      },
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Container_custom_action');
                                                                    await actions
                                                                        .facebookEventClass(
                                                                      getJsonField(
                                                                        _model
                                                                            .selectedVariantDataJson,
                                                                        r'''$.varient_id''',
                                                                      ).toString(),
                                                                      getJsonField(
                                                                        productDetailsScreenProductDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.product_name''',
                                                                      ).toString(),
                                                                      'product',
                                                                      getJsonField(
                                                                        _model
                                                                            .selectedVariantDataJson,
                                                                        r'''$.price''',
                                                                      ),
                                                                      getJsonField(
                                                                            _model.selectedVariantDataJson,
                                                                            r'''$.cart_qty''',
                                                                          ) +
                                                                          1,
                                                                      getJsonField(
                                                                        _model
                                                                            .selectedVariantDataJson,
                                                                        r'''$.mrp''',
                                                                      ),
                                                                      'add',
                                                                      FFAppState()
                                                                          .emptyJson,
                                                                      'emptyjson',
                                                                      ' ',
                                                                      ' ',
                                                                      ' ',
                                                                      ' ',
                                                                    );
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
                                                                            (_model.apiResultAddCart?.jsonBody ??
                                                                                ''),
                                                                            r'''$.message''',
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
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 2000),
                                                                        backgroundColor:
                                                                            FFAppConstants.primaryPurpleE4D8F5,
                                                                      ),
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Container_update_page_state');
                                                                    _model.isLoaderIndicator =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Container_show_snack_bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        FFAppConstants
                                                                            .internetString,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FFAppConstants.blackColor0A0A0A,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              12.0,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FFAppConstants
                                                                              .NeutralBlack50Color,
                                                                    ),
                                                                  );
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(context)
                                                                            .width /
                                                                        2 -
                                                                    30,
                                                                height: 36.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FFAppConstants
                                                                      .calculatorColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: FFAppConstants
                                                                        .calculatorColor,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'ADD TO CART ',
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
                                                                                FFAppConstants.whiteColor,
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
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        10.0),
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
                                                                    'PRODUCT_DETAILS_SCREEN_Container_fxqbckz');
                                                                logFirebaseEvent(
                                                                    'Container_navigate_to');

                                                                context.pushNamed(
                                                                    DailyCartScreenWidget
                                                                        .routeName);

                                                                logFirebaseEvent(
                                                                    'Container_google_analytics_event');
                                                                logFirebaseEvent(
                                                                  'Navigation',
                                                                  parameters: {
                                                                    'Screen Name':
                                                                        'Product Detail Screen',
                                                                    'Navigate To':
                                                                        'Daily Cart Screen',
                                                                  },
                                                                );
                                                                logFirebaseEvent(
                                                                    'Container_custom_action');
                                                                await actions
                                                                    .facebookEventClass(
                                                                  FFAppState()
                                                                      .userID,
                                                                  ' ',
                                                                  ' ',
                                                                  FFAppState()
                                                                      .cartTotalPrice,
                                                                  FFAppState()
                                                                      .cartTotalCount,
                                                                  0.0,
                                                                  'cart',
                                                                  FFAppState()
                                                                      .emptyJson,
                                                                  'daily cart',
                                                                  ' ',
                                                                  ' ',
                                                                  ' ',
                                                                  ' ',
                                                                );
                                                              },
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(context)
                                                                            .width /
                                                                        2 -
                                                                    30,
                                                                height: 36.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FFAppConstants
                                                                      .calculatorColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: FFAppConstants
                                                                        .calculatorColor,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'GO TO CART',
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
                                                                                FFAppConstants.whiteColor,
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
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  );
                                                } else {
                                                  return Text(
                                                    '',
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
                                                  );
                                                }
                                              },
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        );
                                      } else {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FFAppConstants.greyBgd6d2d3,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 0.0, 5.0),
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
                                                      Text(
                                                        FFAppConstants
                                                            .unavailable,
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
                                                                  .blackColor0A0A0A,
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
                                                      Builder(
                                                        builder: (context) {
                                                          if (FFAppConstants
                                                                  .notifyMe ==
                                                              getJsonField(
                                                                productDetailsScreenProductDetailResponse
                                                                    .jsonBody,
                                                                r'''$.detail.notifyMe''',
                                                              ).toString()) {
                                                            return Text(
                                                              'Click on the bell to get notified',
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
                                                                        .indigoColor,
                                                                    fontSize:
                                                                        12.0,
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
                                                            );
                                                          } else {
                                                            return Text(
                                                              FFAppConstants
                                                                          .notifyMe ==
                                                                      getJsonField(
                                                                        productDetailsScreenProductDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.detail.notifyMe''',
                                                                      )
                                                                          .toString()
                                                                  ? FFAppConstants
                                                                      .notified
                                                                  : 'You will be notified when product  available.',
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
                                                                        .indigoColor,
                                                                    fontSize:
                                                                        12.0,
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
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (FFAppConstants
                                                                .notifyMe ==
                                                            getJsonField(
                                                              productDetailsScreenProductDetailResponse
                                                                  .jsonBody,
                                                              r'''$.detail.notifyMe''',
                                                            ).toString()) {
                                                          return FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            hoverColor:
                                                                FFAppConstants
                                                                    .whiteColor,
                                                            hoverIconColor:
                                                                FFAppConstants
                                                                    .notifyMeUnSelectedColor,
                                                            icon: Icon(
                                                              Icons
                                                                  .notifications_none_sharp,
                                                              color: FFAppConstants
                                                                  .blackColor0A0A0A,
                                                              size: 25.0,
                                                            ),
                                                            showLoadingIndicator:
                                                                true,
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'PRODUCT_DETAILS_SCREEN_notifications_non');
                                                              logFirebaseEvent(
                                                                  'IconButton_custom_action');
                                                              _model.connnectivtyfavourites =
                                                                  await actions
                                                                      .checkInternetConnection();
                                                              if (_model
                                                                      .connnectivtyfavourites ==
                                                                  true) {
                                                                logFirebaseEvent(
                                                                    'IconButton_haptic_feedback');
                                                                HapticFeedback
                                                                    .mediumImpact();
                                                                logFirebaseEvent(
                                                                    'IconButton_backend_call');
                                                                _model.favourites =
                                                                    await QuickartGroup
                                                                        .addnotifymeCall
                                                                        .call(
                                                                  productID:
                                                                      getJsonField(
                                                                    productDetailsScreenProductDetailResponse
                                                                        .jsonBody,
                                                                    r'''$.detail.product_id''',
                                                                  ).toString(),
                                                                  varientID:
                                                                      getJsonField(
                                                                    productDetailsScreenProductDetailResponse
                                                                        .jsonBody,
                                                                    r'''$.detail.varient_id''',
                                                                  ).toString(),
                                                                  userID:
                                                                      FFAppState()
                                                                          .userID,
                                                                  platform:
                                                                      FFAppState()
                                                                          .platform,
                                                                  fcmToken:
                                                                      FFAppState()
                                                                          .fcmToken,
                                                                );

                                                                if ((_model
                                                                        .favourites
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  logFirebaseEvent(
                                                                      'IconButton_refresh_database_request');
                                                                  safeSetState(() =>
                                                                      _model.apiRequestCompleter =
                                                                          null);
                                                                  await _model
                                                                      .waitForApiRequestCompleted(
                                                                          maxWait:
                                                                              5000);
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'IconButton_show_snack_bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        getJsonField(
                                                                          (_model.favourites?.jsonBody ??
                                                                              ''),
                                                                          r'''$.message''',
                                                                        ).toString(),
                                                                        style: GoogleFonts
                                                                            .montserrat(
                                                                          color:
                                                                              FFAppConstants.indigoColor,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              12.0,
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
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'IconButton_show_snack_bar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      FFAppConstants
                                                                          .internetString,
                                                                      style: GoogleFonts
                                                                          .montserrat(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    backgroundColor:
                                                                        FFAppConstants
                                                                            .blackColor666666,
                                                                  ),
                                                                );
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          );
                                                        } else {
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'PRODUCT_DETAILS_SCREEN_CircleImage_c7hkt');
                                                              logFirebaseEvent(
                                                                  'CircleImage_navigate_to');

                                                              context.pushNamed(
                                                                  NotifyProductsListScreenWidget
                                                                      .routeName);
                                                            },
                                                            child: Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/notifyme.png',
                                                                fit: BoxFit
                                                                    .cover,
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
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'About Product',
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
                                            color: FFAppConstants
                                                .neutralBlack3D3D3D,
                                            fontSize: 16.0,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 5.0, 0.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Description: ',
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
                                                          color:
                                                              Color(0xFF666666),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  )
                                                ],
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
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 10.0, 0.0),
                                        child: Text(
                                          functions.getVariantDescription(
                                              getJsonField(
                                                QuickartGroup.productDetailCall
                                                    .productDetailData(
                                                  productDetailsScreenProductDetailResponse
                                                      .jsonBody,
                                                ),
                                                r'''$.varients''',
                                              ),
                                              (_model.selectedVarient == 0
                                                      ? getJsonField(
                                                          QuickartGroup
                                                              .productDetailCall
                                                              .productDetailData(
                                                            productDetailsScreenProductDetailResponse
                                                                .jsonBody,
                                                          ),
                                                          r'''$.varients[0].varient_id''',
                                                        )
                                                      : _model.selectedVarient!)
                                                  .toString()),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF8F8F8F),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      if (FFAppState().nullValue !=
                                          getJsonField(
                                            productDetailsScreenProductDetailResponse
                                                .jsonBody,
                                            r'''$.detail.country_of_origin''',
                                          ).toString())
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          'Country of Origin: ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF666666),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().nullValue !=
                                          getJsonField(
                                            productDetailsScreenProductDetailResponse
                                                .jsonBody,
                                            r'''$.detail.country_of_origin''',
                                          ).toString())
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              productDetailsScreenProductDetailResponse
                                                  .jsonBody,
                                              r'''$.detail.country_of_origin''',
                                            ).toString(),
                                            textAlign: TextAlign.start,
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
                                                  color: Color(0xFF8F8F8F),
                                                  fontSize: 12.0,
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
                                      if ((FFAppState().nullValue !=
                                              getJsonField(
                                                productDetailsScreenProductDetailResponse
                                                    .jsonBody,
                                                r'''$.detail.shelf_life''',
                                              ).toString()) &&
                                          ('' !=
                                              getJsonField(
                                                productDetailsScreenProductDetailResponse
                                                    .jsonBody,
                                                r'''$.detail.shelf_life''',
                                              ).toString()))
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Shelf Life:  ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF666666),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                            ),
                                          ],
                                        ),
                                      if ((FFAppState().nullValue !=
                                              getJsonField(
                                                productDetailsScreenProductDetailResponse
                                                    .jsonBody,
                                                r'''$.detail.shelf_life''',
                                              ).toString()) &&
                                          ('' !=
                                              getJsonField(
                                                productDetailsScreenProductDetailResponse
                                                    .jsonBody,
                                                r'''$.detail.shelf_life''',
                                              ).toString()))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 10.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              productDetailsScreenProductDetailResponse
                                                  .jsonBody,
                                              r'''$.detail.shelf_life''',
                                            ).toString(),
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
                                                  color: Color(0xFF8F8F8F),
                                                  fontSize: 12.0,
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
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 360.0,
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF5F5F5),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      'Related Products',
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
                                            color: FFAppConstants
                                                .neutralBlack3D3D3D,
                                            fontSize: 16.0,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 20.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 259.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: wrapWithModel(
                                      model: _model.similarPproductModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: SimilarPproductWidget(
                                        similarProductList: getJsonField(
                                          productDetailsScreenProductDetailResponse
                                              .jsonBody,
                                          r'''$.similar_product''',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.emptyDataTwoLineComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              child: EmptyDataTwoLineComponentWidget(
                                title: 'Product not available',
                                msg: '',
                                isShop: 1,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  if (FFAppState().isSubcribeCartVisible == true)
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0x5114181B),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 500.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Repeat Days',
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
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
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
                                                  safeSetState(() =>
                                                      _model.checkboxValue =
                                                          newValue!);
                                                  if (newValue!) {
                                                    logFirebaseEvent(
                                                        'PRODUCT_DETAILS_SCREEN_Checkbox_0wobd1fe');
                                                    logFirebaseEvent(
                                                        'Checkbox_update_app_state');
                                                    FFAppState().isSunSelected =
                                                        functions.checkAvailableDays(
                                                                    'sun',
                                                                    getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.available_days''',
                                                                    ).toString()) ==
                                                                true
                                                            ? true
                                                            : false;
                                                    FFAppState().isMonSelected =
                                                        functions.checkAvailableDays(
                                                                    'mon',
                                                                    getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.available_days''',
                                                                    ).toString()) ==
                                                                true
                                                            ? true
                                                            : false;
                                                    FFAppState().isTueSelected =
                                                        functions.checkAvailableDays(
                                                                    'tue',
                                                                    getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.available_days''',
                                                                    ).toString()) ==
                                                                true
                                                            ? true
                                                            : false;
                                                    FFAppState().isWedSelected =
                                                        functions.checkAvailableDays(
                                                                    'wed',
                                                                    getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.available_days''',
                                                                    ).toString()) ==
                                                                true
                                                            ? true
                                                            : false;
                                                    FFAppState().isThuSelected =
                                                        functions.checkAvailableDays(
                                                                    'thu',
                                                                    getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.available_days''',
                                                                    ).toString()) ==
                                                                true
                                                            ? true
                                                            : false;
                                                    FFAppState().isFriSelected =
                                                        functions.checkAvailableDays(
                                                                    'fri',
                                                                    getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.available_days''',
                                                                    ).toString()) ==
                                                                true
                                                            ? true
                                                            : false;
                                                    FFAppState().isSatSelected =
                                                        functions.checkAvailableDays(
                                                                    'sat',
                                                                    getJsonField(
                                                                      productDetailsScreenProductDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.detail.available_days''',
                                                                    ).toString()) ==
                                                                true
                                                            ? true
                                                            : false;
                                                    safeSetState(() {});
                                                  } else {
                                                    logFirebaseEvent(
                                                        'PRODUCT_DETAILS_SCREEN_Checkbox_0wobd1fe');
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
                                                side: (FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText !=
                                                        null)
                                                    ? BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PRODUCT_DETAILS_SCREEN_Container_j4hkogw');
                                            if (functions.checkAvailableDays(
                                                    'sun',
                                                    getJsonField(
                                                      productDetailsScreenProductDetailResponse
                                                          .jsonBody,
                                                      r'''$.detail.available_days''',
                                                    ).toString()) ==
                                                true) {
                                              if (FFAppState().isSunSelected ==
                                                  true) {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isSunSelected =
                                                    false;
                                                FFAppState().isWeekSelected = 0;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isSunSelected =
                                                    true;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
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
                                                      'sun',
                                                      getJsonField(
                                                        productDetailsScreenProductDetailResponse
                                                            .jsonBody,
                                                        r'''$.detail.available_days''',
                                                      ).toString())!,
                                                  FFAppState().isSunSelected),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'S',
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
                                                          color: FFAppState()
                                                                      .isSunSelected ==
                                                                  true
                                                              ? FFAppConstants
                                                                  .whiteColor
                                                              : FFAppConstants
                                                                  .textBlack,
                                                          fontSize: 17.0,
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
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PRODUCT_DETAILS_SCREEN_Container_wcazwfn');
                                            if (functions.checkAvailableDays(
                                                    'mon',
                                                    getJsonField(
                                                      productDetailsScreenProductDetailResponse
                                                          .jsonBody,
                                                      r'''$.detail.available_days''',
                                                    ).toString()) ==
                                                true) {
                                              if (FFAppState().isMonSelected ==
                                                  true) {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isMonSelected =
                                                    false;
                                                FFAppState().isWeekSelected = 0;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isMonSelected =
                                                    true;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
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
                                                      'mon',
                                                      getJsonField(
                                                        productDetailsScreenProductDetailResponse
                                                            .jsonBody,
                                                        r'''$.detail.available_days''',
                                                      ).toString())!,
                                                  FFAppState().isMonSelected),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'M',
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
                                                          color: FFAppState()
                                                                      .isMonSelected ==
                                                                  true
                                                              ? FFAppConstants
                                                                  .whiteColor
                                                              : FFAppConstants
                                                                  .textBlack,
                                                          fontSize: 17.0,
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
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PRODUCT_DETAILS_SCREEN_Container_d9hq2jr');
                                            if (functions.checkAvailableDays(
                                                    'tue',
                                                    getJsonField(
                                                      productDetailsScreenProductDetailResponse
                                                          .jsonBody,
                                                      r'''$.detail.available_days''',
                                                    ).toString()) ==
                                                true) {
                                              if (FFAppState().isTueSelected ==
                                                  true) {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isTueSelected =
                                                    false;
                                                FFAppState().isWeekSelected = 0;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isTueSelected =
                                                    true;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
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
                                                      'tue',
                                                      getJsonField(
                                                        productDetailsScreenProductDetailResponse
                                                            .jsonBody,
                                                        r'''$.detail.available_days''',
                                                      ).toString())!,
                                                  FFAppState().isTueSelected),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'T',
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
                                                          color: FFAppState()
                                                                      .isTueSelected ==
                                                                  true
                                                              ? FFAppConstants
                                                                  .whiteColor
                                                              : FFAppConstants
                                                                  .textBlack,
                                                          fontSize: 17.0,
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
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PRODUCT_DETAILS_SCREEN_Container_zjnez94');
                                            if (functions.checkAvailableDays(
                                                    'Wed',
                                                    getJsonField(
                                                      productDetailsScreenProductDetailResponse
                                                          .jsonBody,
                                                      r'''$.detail.available_days''',
                                                    ).toString()) ==
                                                true) {
                                              if (FFAppState().isWedSelected ==
                                                  true) {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isWedSelected =
                                                    false;
                                                FFAppState().isWeekSelected = 0;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isWedSelected =
                                                    true;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
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
                                                      'wed',
                                                      getJsonField(
                                                        productDetailsScreenProductDetailResponse
                                                            .jsonBody,
                                                        r'''$.detail.available_days''',
                                                      ).toString())!,
                                                  FFAppState().isWedSelected),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'W',
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
                                                          color: FFAppState()
                                                                      .isWedSelected ==
                                                                  true
                                                              ? FFAppConstants
                                                                  .whiteColor
                                                              : FFAppConstants
                                                                  .textBlack,
                                                          fontSize: 17.0,
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
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PRODUCT_DETAILS_SCREEN_Container_q10iwlr');
                                            if (functions.checkAvailableDays(
                                                    'thu',
                                                    getJsonField(
                                                      productDetailsScreenProductDetailResponse
                                                          .jsonBody,
                                                      r'''$.detail.available_days''',
                                                    ).toString()) ==
                                                true) {
                                              if (FFAppState().isThuSelected ==
                                                  true) {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isThuSelected =
                                                    false;
                                                FFAppState().isWeekSelected = 0;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isThuSelected =
                                                    true;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
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
                                                      'thu',
                                                      getJsonField(
                                                        productDetailsScreenProductDetailResponse
                                                            .jsonBody,
                                                        r'''$.detail.available_days''',
                                                      ).toString())!,
                                                  FFAppState().isThuSelected),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'T',
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
                                                          color: FFAppState()
                                                                      .isThuSelected ==
                                                                  true
                                                              ? FFAppConstants
                                                                  .whiteColor
                                                              : FFAppConstants
                                                                  .textBlack,
                                                          fontSize: 17.0,
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
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PRODUCT_DETAILS_SCREEN_Container_bhw62g3');
                                            if (functions.checkAvailableDays(
                                                    'fri',
                                                    getJsonField(
                                                      productDetailsScreenProductDetailResponse
                                                          .jsonBody,
                                                      r'''$.detail.available_days''',
                                                    ).toString()) ==
                                                true) {
                                              if (FFAppState().isFriSelected ==
                                                  true) {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isFriSelected =
                                                    false;
                                                FFAppState().isWeekSelected = 0;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isFriSelected =
                                                    true;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
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
                                                      'fir',
                                                      getJsonField(
                                                        productDetailsScreenProductDetailResponse
                                                            .jsonBody,
                                                        r'''$.detail.available_days''',
                                                      ).toString())!,
                                                  FFAppState().isFriSelected),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'F',
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
                                                          color: FFAppState()
                                                                      .isFriSelected ==
                                                                  true
                                                              ? FFAppConstants
                                                                  .whiteColor
                                                              : FFAppConstants
                                                                  .textBlack,
                                                          fontSize: 17.0,
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
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PRODUCT_DETAILS_SCREEN_Container_td64d8r');
                                            if (functions.checkAvailableDays(
                                                    'sat',
                                                    getJsonField(
                                                      productDetailsScreenProductDetailResponse
                                                          .jsonBody,
                                                      r'''$.detail.available_days''',
                                                    ).toString()) ==
                                                true) {
                                              if (FFAppState().isSatSelected ==
                                                  true) {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isSatSelected =
                                                    false;
                                                FFAppState().isWeekSelected = 0;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isSatSelected =
                                                    true;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.subscriptionDate = null;
                                                _model.timeslots = [];
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
                                                      'sat',
                                                      getJsonField(
                                                        productDetailsScreenProductDetailResponse
                                                            .jsonBody,
                                                        r'''$.detail.available_days''',
                                                      ).toString())!,
                                                  FFAppState().isSatSelected),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'S',
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
                                                          color: FFAppState()
                                                                      .isSatSelected ==
                                                                  true
                                                              ? FFAppConstants
                                                                  .whiteColor
                                                              : FFAppConstants
                                                                  .textBlack,
                                                          fontSize: 17.0,
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
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 20.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 30.0, 20.0, 0.0),
                                    child: Row(
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                  'Select week duration for subscription',
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
                                                if (_model.weekModelJson !=
                                                    null)
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final weekModel = _model
                                                                  .weekModelJson
                                                                  ?.toList() ??
                                                              [];

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount: weekModel
                                                                .length,
                                                            itemBuilder: (context,
                                                                weekModelIndex) {
                                                              final weekModelItem =
                                                                  weekModel[
                                                                      weekModelIndex];
                                                              return Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
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
                                                                            'PRODUCT_DETAILS_SCREEN_Container_rizs4fz');
                                                                        if ((_model.totalDeli ==
                                                                                getJsonField(
                                                                                  weekModelItem,
                                                                                  r'''$.total_deliveries''',
                                                                                )) &&
                                                                            (functions.checkSelectionDaysCount(functions.getRepeatdays(FFAppState().isSunSelected, FFAppState().isMonSelected, FFAppState().isTueSelected, FFAppState().isWedSelected, FFAppState().isThuSelected, FFAppState().isFriSelected, FFAppState().isSatSelected)!).toString() == '1')) {
                                                                          logFirebaseEvent(
                                                                              'Container_alert_dialog');
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
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
                                                                          FFAppState().isWeekSelected =
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
                                                                        width:
                                                                            70.0,
                                                                        height:
                                                                            30.0,
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
                                                                              BorderRadius.circular(14.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFE0E0E0),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                              child: Text(
                                                                                '${getJsonField(
                                                                                  weekModelItem,
                                                                                  r'''$.total_deliveries''',
                                                                                ).toString()} ${getJsonField(
                                                                                  weekModelItem,
                                                                                  r'''$.types''',
                                                                                ).toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                        20.0, 20.0, 20.0, 20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
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
                                            'PRODUCT_DETAILS_SCREEN_Row_nbqwew8t_ON_T');
                                        if ((FFAppState().isSunSelected == true) ||
                                            (FFAppState().isMonSelected ==
                                                true) ||
                                            (FFAppState().isTueSelected ==
                                                true) ||
                                            (FFAppState().isWedSelected ==
                                                true) ||
                                            (FFAppState().isThuSelected ==
                                                true) ||
                                            (FFAppState().isFriSelected ==
                                                true) ||
                                            (FFAppState().isSatSelected ==
                                                true)) {
                                          logFirebaseEvent(
                                              'Row_date_time_picker');
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
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                          } else if (_model.datePicked !=
                                              null) {
                                            safeSetState(() {
                                              _model.datePicked = functions
                                                  .tCalenderDate(getJsonField(
                                                FFAppState().appInfo,
                                                r'''$.calendar_t_value''',
                                              ));
                                            });
                                          }
                                          logFirebaseEvent(
                                              'Row_update_page_state');
                                          _model.subscriptionDate =
                                              dateTimeFormat("yyyy-MM-dd",
                                                  _model.datePicked);
                                          safeSetState(() {});
                                          logFirebaseEvent('Row_backend_call');
                                          _model.apiResultTimeSlot =
                                              await QuickartGroup.timeslotCall
                                                  .call(
                                            storeID: FFAppState().storeID,
                                            selectedDate: dateTimeFormat(
                                                "yyyy-MM-dd",
                                                _model.datePicked),
                                            repeatedDays:
                                                functions.getRepeatdays(
                                                    FFAppState().isSunSelected,
                                                    FFAppState().isMonSelected,
                                                    FFAppState().isTueSelected,
                                                    FFAppState().isWedSelected,
                                                    FFAppState().isThuSelected,
                                                    FFAppState().isFriSelected,
                                                    FFAppState().isSatSelected),
                                            platform: isiOS ? 'ios' : 'android',
                                          );

                                          if ((_model.apiResultTimeSlot
                                                  ?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'Row_update_app_state');

                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Row_update_page_state');
                                            _model.subscriptionDate =
                                                dateTimeFormat("yyyy-MM-dd",
                                                    _model.datePicked);
                                            _model.timeslots = getJsonField(
                                              (_model.apiResultTimeSlot
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                              true,
                                            )!
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Row_google_analytics_event');
                                            logFirebaseEvent(
                                              'Selection',
                                              parameters: {
                                                'Screen Name':
                                                    'Product Detail Screen',
                                                'Selected': 'Date',
                                              },
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Row_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  getJsonField(
                                                    (_model.apiResultTimeSlot
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.message''',
                                                  ).toString(),
                                                  style: TextStyle(
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
                                          logFirebaseEvent('Row_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'Please select repeat days first'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
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
                                                        BorderRadius.circular(
                                                            8.0),
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Start Date of Delivery',
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
                                                            color:
                                                                FFAppConstants
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        functions
                                                            .setCustomDateFormate(
                                                                _model
                                                                    .subscriptionDate,
                                                                'yyyy-MM-dd',
                                                                'dd-MM-yyyy')!,
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
                                                                  .blackColor0A0A0A,
                                                              fontSize: 12.0,
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
                                                    if ((_model.subscriptionDate !=
                                                                null &&
                                                            _model.subscriptionDate !=
                                                                '') &&
                                                        (_model.subscriptionDate !=
                                                            'null'))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
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
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppConstants
                                                                    .redDF3F56,
                                                                fontSize: 12.0,
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
                                                    if ((_model.subscriptionDate !=
                                                                null &&
                                                            _model.subscriptionDate !=
                                                                '') &&
                                                        (_model.subscriptionDate !=
                                                            'null'))
                                                      Text(
                                                        'on - ${functions.setCustomDateFormate(QuickartGroup.timeslotCall.firstDeliveryDate(
                                                              (_model.apiResultTimeSlot
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ), 'yyyy-MM-dd', 'dd-MM-yyyy')}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                      .redDF3F56,
                                                                  fontSize:
                                                                      12.0,
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
                                        20.0, 10.0, 20.0, 10.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                  ),
                                  if (_model.datePicked != null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
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
                                                  if (_model.timeslots.length !=
                                                      null)
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 50.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final timeSlotModel =
                                                                _model.timeslots
                                                                    .toList();

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  timeSlotModel
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  timeSlotModelIndex) {
                                                                final timeSlotModelItem =
                                                                    timeSlotModel[
                                                                        timeSlotModelIndex];
                                                                return Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
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
                                                                            'PRODUCT_DETAILS_SCREEN_Container_fqfwqtn');
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState().isDeliveryTimeSlotSelected =
                                                                            getJsonField(
                                                                          timeSlotModelItem,
                                                                          r'''$.timeslot''',
                                                                        ).toString();
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_google_analytics_event');
                                                                        logFirebaseEvent(
                                                                          'Selection',
                                                                          parameters: {
                                                                            'Screen Name':
                                                                                'Product Detail Screen',
                                                                            'Selected':
                                                                                'Time',
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        height:
                                                                            30.0,
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
                                                                              BorderRadius.circular(14.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFE0E0E0),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  timeSlotModelItem,
                                                                                  r'''$.timeslot''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                        20.0, 3.0, 0.0, 0.0),
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
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'PRODUCT_DETAILS_SCREEN_Container_maozf7j');
                                                  logFirebaseEvent(
                                                      'Container_update_page_state');
                                                  _model.isAutoRenew = 'yes';
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'PRODUCT_DETAILS_SCREEN_Icon_4pz5xn7n_ON_');
                                                  logFirebaseEvent(
                                                      'Icon_update_page_state');
                                                  _model.isAutoRenew = 'no';
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.check_box_rounded,
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  size: 30.0,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Auto Renew Order',
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
                                                  fontSize: 14.0,
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'PRODUCT_DETAILS_SCREEN_CANCEL_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              FFAppState()
                                                      .isSubcribeCartVisible =
                                                  false;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.isAutoRenew = 'no';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_google_analytics_event');
                                              logFirebaseEvent(
                                                'Cancel',
                                                parameters: {
                                                  'Screen Name':
                                                      'Product Detail Screen',
                                                  'Cancel':
                                                      'Closed Subscription Popup',
                                                },
                                              );
                                            },
                                            text: 'Cancel',
                                            options: FFButtonOptions(
                                              width: 120.0,
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: FFAppConstants.redDF3F56,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'PRODUCT_DETAILS_SCREEN_CONFIRM_BTN_ON_TA');
                                              logFirebaseEvent(
                                                  'Button_custom_action');
                                              _model.connectivityResult =
                                                  await actions
                                                      .checkInternetConnection();
                                              if (_model.connectivityResult ==
                                                  true) {
                                                if (functions.getRepeatdays(
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
                                                            .isSatSelected) !=
                                                    '') {
                                                  if (FFAppState()
                                                          .isWeekSelected !=
                                                      0) {
                                                    if (_model.datePicked !=
                                                        null) {
                                                      if (FFAppState()
                                                              .isDeliveryTimeSlotSelected !=
                                                          'no') {
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        _model.apiResultco2 =
                                                            await QuickartGroup
                                                                .addtosubcartCall
                                                                .call(
                                                          userid: FFAppState()
                                                              .userID,
                                                          qty: '1',
                                                          storeid: FFAppState()
                                                              .storeID,
                                                          varientid:
                                                              getJsonField(
                                                            _model
                                                                .selectedVariantDataJson,
                                                            r'''$.varient_id''',
                                                          ).toString(),
                                                          deviceid: FFAppState()
                                                              .deviceID,
                                                          repeatOrder: functions.getRepeatdays(
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
                                                          subTotalDate: _model
                                                              .datePicked
                                                              ?.toString(),
                                                          itemName:
                                                              getJsonField(
                                                            productDetailsScreenProductDetailResponse
                                                                .jsonBody,
                                                            r'''$.detail.product_name''',
                                                          ).toString(),
                                                          itemPrice: functions
                                                              .setDecimalValue(
                                                                  getJsonField(
                                                            _model
                                                                .selectedVariantDataJson,
                                                            r'''$.price''',
                                                          ).toString()),
                                                          autoRenew: _model
                                                              .isAutoRenew,
                                                          platform: isiOS
                                                              ? 'ios'
                                                              : 'android',
                                                        );

                                                        if ((_model.apiResultco2
                                                                ?.succeeded ??
                                                            true)) {
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
                                                                      .indigoColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              backgroundColor:
                                                                  FFAppConstants
                                                                      .primaryPurpleE4D8F5,
                                                            ),
                                                          );
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
                                                                  .categoryName =
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
                                                                  .refreshTrigger =
                                                              true;
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'Button_custom_action');
                                                          await actions
                                                              .facebookEventClass(
                                                            getJsonField(
                                                              _model
                                                                  .selectedVariantDataJson,
                                                              r'''$.varient_id''',
                                                            ).toString(),
                                                            getJsonField(
                                                              productDetailsScreenProductDetailResponse
                                                                  .jsonBody,
                                                              r'''$.product_name''',
                                                            ).toString(),
                                                            'subscription product',
                                                            getJsonField(
                                                              _model
                                                                  .selectedVariantDataJson,
                                                              r'''$.price''',
                                                            ),
                                                            getJsonField(
                                                                  _model
                                                                      .selectedVariantDataJson,
                                                                  r'''$.subcartQty''',
                                                                ) +
                                                                1,
                                                            getJsonField(
                                                              _model
                                                                  .selectedVariantDataJson,
                                                              r'''$.mrp''',
                                                            ),
                                                            'add',
                                                            FFAppState()
                                                                .emptyJson,
                                                            'emptyjson',
                                                            ' ',
                                                            ' ',
                                                            ' ',
                                                            ' ',
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_google_analytics_event');
                                                          logFirebaseEvent(
                                                            'Navigation',
                                                            parameters: {
                                                              'Screen Name':
                                                                  'Product Detail Screen',
                                                              'Confirm':
                                                                  'Confirm Subscription',
                                                              'Navigate To':
                                                                  'Subscription Cart Screen',
                                                              'API Name':
                                                                  'Add To SubCart',
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
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FFAppConstants
                                                                      .NeutralBlack50Color,
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
                                                            content: Text(
                                                              FFAppConstants
                                                                  .timeSlotString,
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                color: FFAppConstants
                                                                    .blackColor0A0A0A,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12.0,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FFAppConstants
                                                                    .NeutralBlack50Color,
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
                                                          content: Text(
                                                            FFAppConstants
                                                                .StartDateofDelivery,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              color: FFAppConstants
                                                                  .blackColor0A0A0A,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12.0,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FFAppConstants
                                                                  .NeutralBlack50Color,
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
                                                        content: Text(
                                                          FFAppConstants
                                                              .subscriptionDurationString,
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
                                                            .repeatDays,
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
                                                          .internetString,
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

                                              safeSetState(() {});
                                            },
                                            text: 'Confirm',
                                            options: FFButtonOptions(
                                              width: 120.0,
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: FFAppConstants.green86DF67,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (_model.isLoaderIndicator == true)
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
        );
      },
    );
  }
}
