import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/components/empty_data_two_line_component/empty_data_two_line_component_widget.dart';
import '/components/varient_botttom_sheet/varient_botttom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'occasional_category_model.dart';
export 'occasional_category_model.dart';

class OccasionalCategoryWidget extends StatefulWidget {
  const OccasionalCategoryWidget({
    super.key,
    this.utmSource,
    this.utmCampaign,
    this.utmNetwork,
    this.utmMedium,
    this.utmKeyword,
    this.utmPlacement,
    this.name,
  });

  final String? utmSource;
  final String? utmCampaign;
  final String? utmNetwork;
  final String? utmMedium;
  final String? utmKeyword;
  final String? utmPlacement;
  final String? name;

  static String routeName = 'OccasionalCategory';
  static String routePath = '/occasional-product-list';

  @override
  State<OccasionalCategoryWidget> createState() =>
      _OccasionalCategoryWidgetState();
}

class _OccasionalCategoryWidgetState extends State<OccasionalCategoryWidget> {
  late OccasionalCategoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OccasionalCategoryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OccasionalCategory'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('OCCASIONAL_CATEGORY_OccasionalCategory_O');
      logFirebaseEvent('OccasionalCategory_refresh_database_requ');
      safeSetState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
      if (widget!.name != null && widget!.name != '') {
        logFirebaseEvent('OccasionalCategory_backend_call');
        _model.apiResultSeoSourceOc = await QuickartGroup.seosourceCall.call(
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

        if ((_model.apiResultSeoSourceOc?.succeeded ?? true)) {
          logFirebaseEvent('OccasionalCategory_google_analytics_even');
          logFirebaseEvent(
            'SearchScreenAnalytics',
            parameters: {
              'API Name': 'seosource',
              'Keyword': widget!.name,
            },
          );
          logFirebaseEvent('OccasionalCategory_custom_action');
          await actions.facebookEventClass(
            widget!.utmKeyword!,
            widget!.utmPlacement!,
            FFAppState().userID,
            0.0,
            0,
            0.0,
            'utmSource',
            FFAppState().emptyJson,
            ' occanal category',
            widget!.utmSource,
            widget!.utmCampaign,
            widget!.utmNetwork,
            widget!.utmMedium,
          );
        } else {
          logFirebaseEvent('OccasionalCategory_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                getJsonField(
                  (_model.apiResultSeoSourceOc?.jsonBody ?? ''),
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FFAppConstants.whiteColor,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
              logFirebaseEvent('OCCASIONAL_CATEGORY_chevron_left_ICN_ON_');
              if (FFAppState().categoryName != null &&
                  FFAppState().categoryName != '') {
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
                logFirebaseEvent('IconButton_update_app_state');
                FFAppState().isCartShow = false;
                safeSetState(() {});
              } else {
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed(LoginOnBoardScreenWidget.routeName);

                logFirebaseEvent('IconButton_update_app_state');
                FFAppState().isCartShow = false;
                safeSetState(() {});
              }
            },
          ),
          title: Text(
            widget!.name != null && widget!.name != ''
                ? ((String var1) {
                    return var1.replaceAll(RegExp('_'), ' ');
                  }(widget!.name!))
                : FFAppState().categoryName.maybeHandleOverflow(
                      maxChars: 30,
                      replacement: '…',
                    ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FFAppConstants.appBarIconandTitleColor,
                  fontSize: FFAppConstants.appBartitleFont.toDouble(),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'OCCASIONAL_CATEGORY_Stack_8e73xe8x_ON_TA');
                      logFirebaseEvent('Stack_update_app_state');
                      FFAppState().isCartShow = false;
                      safeSetState(() {});
                    },
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 10.0, 5.0, 10.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(QuickartGroup
                                            .occasionalcatsearchCall
                                            .call(
                                          userid: FFAppState().userID,
                                          storeid: FFAppState().storeID,
                                          page: FFAppState().page,
                                          pageCount: FFAppState().pageCount,
                                          byName: widget!.name != null &&
                                                  widget!.name != ''
                                              ? ((String var1) {
                                                  return var1.replaceAll(
                                                      RegExp('_'), ' ');
                                                }(widget!.name!))
                                              : FFAppState().categoryName,
                                          platform: isiOS ? 'ios' : 'android',
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Image.asset(
                                      'assets/images/new_loader.gif',
                                      width: MediaQuery.sizeOf(context).width *
                                          0.25,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.25,
                                    ),
                                  );
                                }
                                final gridViewOccasionalcatsearchResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final productModel1 = getJsonField(
                                      gridViewOccasionalcatsearchResponse
                                          .jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    if (productModel1.isEmpty) {
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
                                            'OCCASIONAL_CATEGORY_GridView_zcnwcdh1_ON');
                                        logFirebaseEvent(
                                            'GridView_refresh_database_request');
                                        safeSetState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: GridView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          FFAppState().isCartShow == true
                                              ? 90.0
                                              : 20.0,
                                        ),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 5.0,
                                          mainAxisSpacing: 0.0,
                                          childAspectRatio: 0.67,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: productModel1.length,
                                        itemBuilder:
                                            (context, productModel1Index) {
                                          final productModel1Item =
                                              productModel1[productModel1Index];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'OCCASIONAL_CATEGORY_Container_7uwbl6ud_O');
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                  ProductDetailsScreenWidget
                                                      .routeName);

                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().productID =
                                                  getJsonField(
                                                productModel1Item,
                                                r'''$.product_id''',
                                              ).toString();
                                              FFAppState().storeID =
                                                  FFAppState().storeID;
                                              FFAppState().userID =
                                                  FFAppState().userID;
                                              FFAppState().productName =
                                                  getJsonField(
                                                productModel1Item,
                                                r'''$.product_name''',
                                              ).toString();
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Container_custom_action');
                                              await actions.facebookEventClass(
                                                getJsonField(
                                                  productModel1Item,
                                                  r'''$.product_id''',
                                                ).toString(),
                                                getJsonField(
                                                  productModel1Item,
                                                  r'''$.product_name''',
                                                ).toString(),
                                                'product detail',
                                                getJsonField(
                                                  productModel1Item,
                                                  r'''$.price''',
                                                ),
                                                0,
                                                getJsonField(
                                                  productModel1Item,
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
                                                  'ProductModelWidgetClickAnalytics');
                                            },
                                            child: Container(
                                              width: 150.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                ),
                                                border: Border.all(
                                                  color:
                                                      FFAppConstants.whiteColor,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.16,
                                                                    -0.9),
                                                            child: Container(
                                                              height:
                                                                  valueOrDefault<
                                                                      double>(
                                                                (MediaQuery.sizeOf(context)
                                                                            .width /
                                                                        2) -
                                                                    10,
                                                                130.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FFAppConstants
                                                                    .productBgClr,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                ),
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  getJsonField(
                                                                    productModel1Item,
                                                                    r'''$.product_image''',
                                                                  ).toString(),
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      1.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if ((FFAppConstants
                                                                      .quickAvailability ==
                                                                  getJsonField(
                                                                    productModel1Item,
                                                                    r'''$.availability''',
                                                                  )
                                                                      .toString()) ||
                                                              (FFAppConstants
                                                                      .allAvailability ==
                                                                  getJsonField(
                                                                    productModel1Item,
                                                                    r'''$.availability''',
                                                                  ).toString()))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 1.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        valueOrDefault<
                                                                            double>(
                                                                          (MediaQuery.sizeOf(context).width / 2) -
                                                                              55,
                                                                          0.0,
                                                                        ),
                                                                        2.0,
                                                                        2.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (FFAppState()
                                                                            .qtyZeroCheck ==
                                                                        getJsonField(
                                                                          productModel1Item,
                                                                          r'''$.total_cart_qty''',
                                                                        )) {
                                                                      return Visibility(
                                                                        visible: functions.checkVariantsWithStock(getJsonField(
                                                                              productModel1Item,
                                                                              r'''$.varients''',
                                                                            )) ==
                                                                            true,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                25.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FFAppConstants.calculatorColor,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('OCCASIONAL_CATEGORY_PAGE_ADD_BTN_ON_TAP');
                                                                                  if (functions.checkVariantFeatureCondition(productModel1Item) == true) {
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
                                                                                              productModel: productModel1Item,
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
                                                                                    _model.internetcheck = await actions.checkInternetConnection();
                                                                                    if (_model.internetcheck == true) {
                                                                                      logFirebaseEvent('Button_haptic_feedback');
                                                                                      HapticFeedback.heavyImpact();
                                                                                      logFirebaseEvent('Button_backend_call');
                                                                                      _model.cartAdd = await QuickartGroup.addToCartCall.call(
                                                                                        userid: FFAppState().userID,
                                                                                        qty: '1',
                                                                                        storeid: FFAppState().storeID,
                                                                                        varientid: getJsonField(
                                                                                          productModel1Item,
                                                                                          r'''$.varient_id''',
                                                                                        ).toString(),
                                                                                        deviceid: FFAppState().deviceID,
                                                                                        itemPrice: getJsonField(
                                                                                          productModel1Item,
                                                                                          r'''$.price''',
                                                                                        ).toString(),
                                                                                        itemName: getJsonField(
                                                                                          productModel1Item,
                                                                                          r'''$.product_name''',
                                                                                        ).toString(),
                                                                                        platform: isiOS ? 'ios' : 'android',
                                                                                      );

                                                                                      if ((_model.cartAdd?.succeeded ?? true)) {
                                                                                        if (FFAppConstants.checkStatus ==
                                                                                            getJsonField(
                                                                                              (_model.cartAdd?.jsonBody ?? ''),
                                                                                              r'''$.status''',
                                                                                            ).toString()) {
                                                                                          logFirebaseEvent('Button_update_app_state');
                                                                                          FFAppState().isCartShow = false;
                                                                                          FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                            (_model.cartAdd?.jsonBody ?? ''),
                                                                                          )!;
                                                                                          FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                              .savingPrice(
                                                                                                (_model.cartAdd?.jsonBody ?? ''),
                                                                                              )!
                                                                                              .toString());
                                                                                          FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                              .totalPrice(
                                                                                                (_model.cartAdd?.jsonBody ?? ''),
                                                                                              )!
                                                                                              .toString());
                                                                                          FFAppState().refreshTrigger = true;
                                                                                          safeSetState(() {});
                                                                                          logFirebaseEvent('Button_refresh_database_request');
                                                                                          safeSetState(() => _model.apiRequestCompleter = null);
                                                                                          await _model.waitForApiRequestCompleted(maxWait: 5000);
                                                                                          logFirebaseEvent('Button_google_analytics_event');
                                                                                          logFirebaseEvent(
                                                                                            'Add To Cart',
                                                                                            parameters: {
                                                                                              'API Name': 'Add  To Cart',
                                                                                            },
                                                                                          );
                                                                                          logFirebaseEvent('Button_custom_action');
                                                                                          await actions.facebookEventClass(
                                                                                            getJsonField(
                                                                                              productModel1Item,
                                                                                              r'''$.varient_id''',
                                                                                            ).toString(),
                                                                                            getJsonField(
                                                                                              productModel1Item,
                                                                                              r'''$.product_name''',
                                                                                            ).toString(),
                                                                                            'product',
                                                                                            functions.stringToDouble(getJsonField(
                                                                                              productModel1Item,
                                                                                              r'''$.price''',
                                                                                            ).toString()),
                                                                                            getJsonField(
                                                                                                  productModel1Item,
                                                                                                  r'''$.cart_qty''',
                                                                                                ) +
                                                                                                1,
                                                                                            functions.stringToDouble(getJsonField(
                                                                                              productModel1Item,
                                                                                              r'''$.mrp''',
                                                                                            ).toString()),
                                                                                            'add',
                                                                                            FFAppState().emptyJson,
                                                                                            'emptyjson',
                                                                                            ' ',
                                                                                            ' ',
                                                                                            ' ',
                                                                                            ' ',
                                                                                          );
                                                                                          logFirebaseEvent('Button_wait__delay');
                                                                                          await Future.delayed(
                                                                                            Duration(
                                                                                              milliseconds: 1000,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          logFirebaseEvent('Button_show_snack_bar');
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.cartAdd?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: GoogleFonts.montserrat(
                                                                                                  color: FFAppConstants.indigoColor,
                                                                                                  fontSize: 15.0,
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 1200),
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
                                                                                                (_model.cartAdd?.jsonBody ?? ''),
                                                                                                r'''$.message''',
                                                                                              ).toString(),
                                                                                              style: GoogleFonts.montserrat(
                                                                                                color: FFAppConstants.indigoColor,
                                                                                                fontSize: 15.0,
                                                                                              ),
                                                                                              textAlign: TextAlign.start,
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 1200),
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
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontSize: 15.0,
                                                                                            ),
                                                                                            textAlign: TextAlign.start,
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 1500),
                                                                                          backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: 'ADD',
                                                                                options: FFButtonOptions(
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FFAppConstants.calculatorColor,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.montserrat(
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FFAppConstants.whiteColor,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 0.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Visibility(
                                                                        visible: functions.checkVariantsWithStock(getJsonField(
                                                                              productModel1Item,
                                                                              r'''$.varients''',
                                                                            )) ==
                                                                            true,
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                90.0,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(5.0),
                                                                                topRight: Radius.circular(5.0),
                                                                                bottomLeft: Radius.circular(5.0),
                                                                                bottomRight: Radius.circular(5.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FFAppConstants.calculatorColor,
                                                                                width: 0.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('OCCASIONAL_CATEGORY_PAGE__BTN_ON_TAP');
                                                                                      if (functions.checkVariantFeatureCondition(productModel1Item) == true) {
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
                                                                                                  productModel: productModel1Item,
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
                                                                                                  productModel1Item,
                                                                                                  r'''$.cart_qty''',
                                                                                                ),
                                                                                                'remove'),
                                                                                            varientid: getJsonField(
                                                                                              productModel1Item,
                                                                                              r'''$.varient_id''',
                                                                                            ).toString(),
                                                                                            itemPrice: getJsonField(
                                                                                              productModel1Item,
                                                                                              r'''$.price''',
                                                                                            ).toString(),
                                                                                            itemName: getJsonField(
                                                                                              productModel1Item,
                                                                                              r'''$.product_name''',
                                                                                            ).toString(),
                                                                                            platform: isiOS ? 'ios' : 'android',
                                                                                          );

                                                                                          if ((_model.addtoCartAPI1?.succeeded ?? true)) {
                                                                                            logFirebaseEvent('Button_refresh_database_request');
                                                                                            safeSetState(() => _model.apiRequestCompleter = null);
                                                                                            await _model.waitForApiRequestCompleted(maxWait: 5000);
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
                                                                                                'API Name': 'Add  To Cart',
                                                                                              },
                                                                                            );
                                                                                            logFirebaseEvent('Button_custom_action');
                                                                                            await actions.facebookEventClass(
                                                                                              getJsonField(
                                                                                                productModel1Item,
                                                                                                r'''$.varient_id''',
                                                                                              ).toString(),
                                                                                              getJsonField(
                                                                                                productModel1Item,
                                                                                                r'''$.product_name''',
                                                                                              ).toString(),
                                                                                              'product',
                                                                                              getJsonField(
                                                                                                productModel1Item,
                                                                                                r'''$.price''',
                                                                                              ),
                                                                                              getJsonField(
                                                                                                    productModel1Item,
                                                                                                    r'''$.cart_qty''',
                                                                                                  ) -
                                                                                                  1,
                                                                                              getJsonField(
                                                                                                productModel1Item,
                                                                                                r'''$.mrp''',
                                                                                              ),
                                                                                              'remove',
                                                                                              FFAppState().emptyJson,
                                                                                              'emptyjson',
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
                                                                                      width: 30.0,
                                                                                      height: 30.0,
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
                                                                                        topLeft: Radius.circular(5.0),
                                                                                        bottomLeft: Radius.circular(5.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 30.0,
                                                                                    height: 30.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FFAppConstants.whiteColor,
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Text(
                                                                                        getJsonField(
                                                                                          productModel1Item,
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
                                                                                      logFirebaseEvent('OCCASIONAL_CATEGORY_PAGE__BTN_ON_TAP');
                                                                                      if (functions.checkVariantFeatureCondition(productModel1Item) == true) {
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
                                                                                                  productModel: productModel1Item,
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
                                                                                                productModel1Item,
                                                                                                r'''$.cart_qty''',
                                                                                              ) ==
                                                                                              getJsonField(
                                                                                                productModel1Item,
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
                                                                                                      height: 250.0,
                                                                                                      title: FFAppState().AppName,
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
                                                                                                    productModel1Item,
                                                                                                    r'''$.cart_qty''',
                                                                                                  ),
                                                                                                  'add'),
                                                                                              storeid: FFAppState().storeID,
                                                                                              varientid: getJsonField(
                                                                                                productModel1Item,
                                                                                                r'''$.varient_id''',
                                                                                              ).toString(),
                                                                                              deviceid: FFAppState().deviceID,
                                                                                              itemPrice: getJsonField(
                                                                                                productModel1Item,
                                                                                                r'''$.price''',
                                                                                              ).toString(),
                                                                                              itemName: getJsonField(
                                                                                                productModel1Item,
                                                                                                r'''$.product_name''',
                                                                                              ).toString(),
                                                                                              platform: isiOS ? 'ios' : 'android',
                                                                                            );

                                                                                            if ((_model.apiResultAddCart123?.succeeded ?? true)) {
                                                                                              if (FFAppConstants.checkStatus ==
                                                                                                  getJsonField(
                                                                                                    (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                    r'''$.status''',
                                                                                                  ).toString()) {
                                                                                                logFirebaseEvent('Button_refresh_database_request');
                                                                                                safeSetState(() => _model.apiRequestCompleter = null);
                                                                                                await _model.waitForApiRequestCompleted(maxWait: 5000);
                                                                                                logFirebaseEvent('Button_update_app_state');
                                                                                                FFAppState().isCartShow = false;
                                                                                                FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                  (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                )!;
                                                                                                FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                    .savingPrice(
                                                                                                      (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                    )!
                                                                                                    .toString());
                                                                                                FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                    .totalPrice(
                                                                                                      (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                    )!
                                                                                                    .toString());
                                                                                                FFAppState().refreshTrigger = true;
                                                                                                FFAppState().update(() {});
                                                                                                logFirebaseEvent('Button_google_analytics_event');
                                                                                                logFirebaseEvent(
                                                                                                  'Add To Cart',
                                                                                                  parameters: {
                                                                                                    'API Name': 'Add  To Cart',
                                                                                                  },
                                                                                                );
                                                                                                logFirebaseEvent('Button_custom_action');
                                                                                                await actions.facebookEventClass(
                                                                                                  getJsonField(
                                                                                                    productModel1Item,
                                                                                                    r'''$.varient_id''',
                                                                                                  ).toString(),
                                                                                                  getJsonField(
                                                                                                    productModel1Item,
                                                                                                    r'''$.product_name''',
                                                                                                  ).toString(),
                                                                                                  'product',
                                                                                                  getJsonField(
                                                                                                    productModel1Item,
                                                                                                    r'''$.price''',
                                                                                                  ),
                                                                                                  getJsonField(
                                                                                                        productModel1Item,
                                                                                                        r'''$.cart_qty''',
                                                                                                      ) +
                                                                                                      1,
                                                                                                  getJsonField(
                                                                                                    productModel1Item,
                                                                                                    r'''$.mrp''',
                                                                                                  ),
                                                                                                  'add',
                                                                                                  FFAppState().emptyJson,
                                                                                                  'emptyjson',
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
                                                                                              duration: Duration(milliseconds: 2150),
                                                                                              backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    text: '+',
                                                                                    options: FFButtonOptions(
                                                                                      width: 30.0,
                                                                                      height: 30.0,
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
                                                                                        topRight: Radius.circular(5.0),
                                                                                        bottomRight: Radius.circular(5.0),
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
                                                        ],
                                                      ),
                                                      if (functions
                                                              .checkVariantsWithStock(
                                                                  getJsonField(
                                                            productModel1Item,
                                                            r'''$.varients''',
                                                          )) ==
                                                          true)
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        35.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            productModel1Item,
                                                                            r'''$.product_name''',
                                                                          ).toString().maybeHandleOverflow(
                                                                                maxChars: 40,
                                                                                replacement: '…',
                                                                              ),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              3.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              productModel1Item,
                                                                              r'''$.quantity''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppConstants.lightBlack7a7a7a,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
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
                                                                            getJsonField(
                                                                              productModel1Item,
                                                                              r'''$.unit''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FFAppConstants.lightBlack7a7a7a,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if ((getJsonField(
                                                                        productModel1Item,
                                                                        r'''$.varients''',
                                                                      ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList()
                                                                              as Iterable<ProductCountStruct?>)
                                                                          .withoutNulls
                                                                          .length >=
                                                                      2)
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
                                                                            'OCCASIONAL_CATEGORY_Row_bk5foejb_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Row_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          useSafeArea:
                                                                              true,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: VarientBotttomSheetWidget(
                                                                                  productModel: productModel1Item,
                                                                                  cartType: 'daily',
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() =>
                                                                                _model.returnJson10 = value));

                                                                        logFirebaseEvent(
                                                                            'Row_refresh_database_request');
                                                                        safeSetState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model.waitForApiRequestCompleted(
                                                                            maxWait:
                                                                                5000);

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          if ((getJsonField(
                                                                                productModel1Item,
                                                                                r'''$.varients''',
                                                                              ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
                                                                                  .withoutNulls
                                                                                  .length >=
                                                                              2)
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '${(getJsonField(
                                                                                    productModel1Item,
                                                                                    r'''$.varients''',
                                                                                  ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>).withoutNulls?.length?.toString()} options',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.montserrat(
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FFAppConstants.indigoColor,
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                1.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down,
                                                                              color: FFAppConstants.indigoColor,
                                                                              size: 24.0,
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
                                                                            5.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-0.79, -0.97),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
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
                                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: functions.setDecimalValue(getJsonField(
                                                                                          productModel1Item,
                                                                                          r'''$.price''',
                                                                                        ).toString())!,
                                                                                        style: GoogleFonts.montserrat(
                                                                                          color: FFAppConstants.blackColor0A0A0A,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontSize: 13.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.readexPro(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF0A0A0A),
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Builder(
                                                                              builder: (context) {
                                                                                if (getJsonField(
                                                                                      productModel1Item,
                                                                                      r'''$.price''',
                                                                                    ) !=
                                                                                    getJsonField(
                                                                                      productModel1Item,
                                                                                      r'''$.mrp''',
                                                                                    )) {
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'AED',
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FFAppConstants.lightBlack7a7a7a,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                decoration: TextDecoration.lineThrough,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.setDecimalValue(getJsonField(
                                                                                                productModel1Item,
                                                                                                r'''$.mrp''',
                                                                                              ).toString()),
                                                                                              '0',
                                                                                            ),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FFAppConstants.lightBlack7a7a7a,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  decoration: TextDecoration.lineThrough,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return Container(
                                                                                    width: 10.0,
                                                                                    height: 10.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (((getJsonField(
                                                                productModel1Item,
                                                                r'''$.varients''',
                                                              )
                                                                          .toList()
                                                                          .map<ProductCountStruct?>(ProductCountStruct
                                                                              .maybeFromMap)
                                                                          .toList()
                                                                      as Iterable<
                                                                          ProductCountStruct?>)
                                                                  .withoutNulls
                                                                  ?.length ==
                                                              1) &&
                                                          (FFAppConstants
                                                                  .stockNotify ==
                                                              getJsonField(
                                                                productModel1Item,
                                                                r'''$.varients[0].stock''',
                                                              ).toString()))
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppConstants
                                                                .greyBgd6d2d3,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      8.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.35,
                                                                        height:
                                                                            35.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                productModel1Item,
                                                                                r'''$.product_name''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 35,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              maxLines: 2,
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
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              3.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              productModel1Item,
                                                                              r'''$.quantity''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF7A7A7A),
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            productModel1Item,
                                                                            r'''$.unit''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.montserrat(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF7A7A7A),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFAppConstants
                                                                            .unavailable,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child: Text(
                                                                      FFAppConstants.notifyMe ==
                                                                              getJsonField(
                                                                                productModel1Item,
                                                                                r'''$.notify_me''',
                                                                              ).toString()
                                                                          ? FFAppConstants.notified
                                                                          : 'You will be notified.',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.montserrat(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                8.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              if (FFAppConstants
                                                                      .stockNotify ==
                                                                  getJsonField(
                                                                    productModel1Item,
                                                                    r'''$.stock''',
                                                                  ).toString())
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (FFAppConstants
                                                                              .notifyMe ==
                                                                          getJsonField(
                                                                            productModel1Item,
                                                                            r'''$.notify_me''',
                                                                          ).toString()) {
                                                                        return FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          hoverColor:
                                                                              FFAppConstants.whiteColor,
                                                                          hoverIconColor:
                                                                              FFAppConstants.notifyMeUnSelectedColor,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.notifications_none_sharp,
                                                                            color:
                                                                                FFAppConstants.blackColor0A0A0A,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                          showLoadingIndicator:
                                                                              true,
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('OCCASIONAL_CATEGORY_notifications_none_s');
                                                                            logFirebaseEvent('IconButton_custom_action');
                                                                            _model.bestselling =
                                                                                await actions.checkInternetConnection();
                                                                            if (_model.bestselling ==
                                                                                true) {
                                                                              logFirebaseEvent('IconButton_haptic_feedback');
                                                                              HapticFeedback.mediumImpact();
                                                                              logFirebaseEvent('IconButton_backend_call');
                                                                              _model.bestseller = await QuickartGroup.addnotifymeCall.call(
                                                                                productID: getJsonField(
                                                                                  productModel1Item,
                                                                                  r'''$.product_id''',
                                                                                ).toString(),
                                                                                varientID: getJsonField(
                                                                                  productModel1Item,
                                                                                  r'''$.varient_id''',
                                                                                ).toString(),
                                                                                userID: FFAppState().userID,
                                                                                platform: FFAppState().platform,
                                                                                fcmToken: FFAppState().fcmToken,
                                                                              );

                                                                              if ((_model.bestseller?.succeeded ?? true)) {
                                                                                logFirebaseEvent('IconButton_refresh_database_request');
                                                                                safeSetState(() => _model.apiRequestCompleter = null);
                                                                                await _model.waitForApiRequestCompleted(maxWait: 5000);
                                                                              } else {
                                                                                logFirebaseEvent('IconButton_show_snack_bar');
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      getJsonField(
                                                                                        (_model.bestseller?.jsonBody ?? ''),
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              2.0,
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
                                                                              logFirebaseEvent('OCCASIONAL_CATEGORY_CircleImage_t3wmw7a6');
                                                                              logFirebaseEvent('CircleImage_navigate_to');

                                                                              context.pushNamed(NotifyProductsListScreenWidget.routeName);
                                                                            },
                                                                            child:
                                                                                Container(
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
                                                            ],
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                8.0),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            if (FFAppConstants
                                                                    .percentageCheck <
                                                                getJsonField(
                                                                  productModel1Item,
                                                                  r'''$.discountper''',
                                                                )) {
                                                              return Container(
                                                                height: 20.0,
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
                                                                child: Align(
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
                                                                            2.0,
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
                                                                            text: FFAppConstants.discountperdouble >
                                                                                    getJsonField(
                                                                                      productModel1Item,
                                                                                      r'''$.discountper''',
                                                                                    )
                                                                                ? functions.setDecimalValueWithCount(
                                                                                    getJsonField(
                                                                                      productModel1Item,
                                                                                      r'''$.discountper''',
                                                                                    ).toString(),
                                                                                    0,
                                                                                    true)
                                                                                : functions.setDecimalValueWithCount(
                                                                                    getJsonField(
                                                                                      productModel1Item,
                                                                                      r'''$.discountper''',
                                                                                    ).toString(),
                                                                                    0,
                                                                                    true),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.montserrat(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                '% OFF',
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 8.0,
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
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            } else {
                                                              return Container(
                                                                height: 10.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Text(
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
                                                                        fontSize:
                                                                            15.0,
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
                                                              );
                                                            }
                                                          },
                                                        ),
                                                        if (FFAppState()
                                                                .nullValue !=
                                                            getJsonField(
                                                              productModel1Item,
                                                              r'''$.country_icon''',
                                                            ).toString())
                                                          Container(
                                                            width: 29.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF4F6F4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFAppConstants
                                                                              .percentageCheck <
                                                                          getJsonField(
                                                                            productModel1Item,
                                                                            r'''$.discountper''',
                                                                          )
                                                                      ? 0.0
                                                                      : 8.0,
                                                                  0.0,
                                                                )),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFDCE9D8),
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
                                                                    productModel1Item,
                                                                    r'''$.country_icon''',
                                                                  ).toString(),
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
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
                                                                  2.0,
                                                                  25.0,
                                                                  3.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          if ((getJsonField(
                                                                    productModel1Item,
                                                                    r'''$.feature_tags''',
                                                                  ) !=
                                                                  null) &&
                                                              ((getJsonField(
                                                                    productModel1Item,
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
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final featureTag =
                                                                      getJsonField(
                                                                    productModel1Item,
                                                                    r'''$.feature_tags''',
                                                                  ).toList();

                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    reverse:
                                                                        true,
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
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (FFAppConstants
                                                                .isFavourite ==
                                                            getJsonField(
                                                              productModel1Item,
                                                              r'''$.isFavourite''',
                                                            ).toString()) {
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 35.0,
                                                                height: 35.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF4F6F4),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFDCE9D8),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
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
                                                                        'OCCASIONAL_CATEGORY_PAGE_Icon1_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon1_custom_action');
                                                                    _model.connectivityResult =
                                                                        await actions
                                                                            .checkInternetConnection();
                                                                    if (_model
                                                                            .connectivityResult ==
                                                                        true) {
                                                                      logFirebaseEvent(
                                                                          'Icon1_haptic_feedback');
                                                                      HapticFeedback
                                                                          .mediumImpact();
                                                                      logFirebaseEvent(
                                                                          'Icon1_backend_call');
                                                                      _model.addRemoveAPIResponse = await QuickartGroup
                                                                          .addremwishlistCall
                                                                          .call(
                                                                        userid:
                                                                            FFAppState().userID,
                                                                        storeID:
                                                                            FFAppState().storeID,
                                                                        varientID:
                                                                            getJsonField(
                                                                          productModel1Item,
                                                                          r'''$.varient_id''',
                                                                        ).toString(),
                                                                        deviceid:
                                                                            FFAppState().deviceID,
                                                                        platform: isiOS
                                                                            ? 'ios'
                                                                            : 'android',
                                                                      );

                                                                      if ((_model
                                                                              .addRemoveAPIResponse
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        logFirebaseEvent(
                                                                            'Icon1_refresh_database_request');
                                                                        safeSetState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model.waitForApiRequestCompleted(
                                                                            maxWait:
                                                                                5000);
                                                                        logFirebaseEvent(
                                                                            'Icon1_update_app_state');

                                                                        FFAppState()
                                                                            .update(() {});
                                                                        logFirebaseEvent(
                                                                            'Icon1_custom_action');
                                                                        await actions
                                                                            .facebookEventClass(
                                                                          getJsonField(
                                                                            productModel1Item,
                                                                            r'''$.varient_id''',
                                                                          ).toString(),
                                                                          getJsonField(
                                                                            productModel1Item,
                                                                            r'''$.product_name''',
                                                                          ).toString(),
                                                                          'remove',
                                                                          getJsonField(
                                                                            productModel1Item,
                                                                            r'''$.price''',
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
                                                                            'Icon1_google_analytics_event');
                                                                        logFirebaseEvent(
                                                                          'Remove From Wishlist',
                                                                          parameters: {
                                                                            'API Name':
                                                                                'Add Remove Wishlist',
                                                                          },
                                                                        );
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Icon1_show_snack_bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                (_model.addRemoveAPIResponse?.jsonBody ?? ''),
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: GoogleFonts.montserrat(
                                                                                color: FFAppConstants.indigoColor,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
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
                                                                          'Icon1_show_snack_bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            FFAppConstants.internetString,
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

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    size: 35.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        } else {
                                                          return Container(
                                                            width: 35.0,
                                                            height: 35.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF4F6F4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
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
                                                                    'OCCASIONAL_CATEGORY_PAGE_Icon2_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Icon2_custom_action');
                                                                _model.connectivityResult1 =
                                                                    await actions
                                                                        .checkInternetConnection();
                                                                if (_model
                                                                        .connectivityResult1 ==
                                                                    true) {
                                                                  logFirebaseEvent(
                                                                      'Icon2_haptic_feedback');
                                                                  HapticFeedback
                                                                      .mediumImpact();
                                                                  logFirebaseEvent(
                                                                      'Icon2_backend_call');
                                                                  _model.addRemoveAPIResult =
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
                                                                      productModel1Item,
                                                                      r'''$.varient_id''',
                                                                    ).toString(),
                                                                    deviceid:
                                                                        FFAppState()
                                                                            .deviceID,
                                                                    platform: isiOS
                                                                        ? 'ios'
                                                                        : 'android',
                                                                  );

                                                                  if ((_model
                                                                          .addRemoveAPIResult
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    logFirebaseEvent(
                                                                        'Icon2_refresh_database_request');
                                                                    safeSetState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model.waitForApiRequestCompleted(
                                                                        maxWait:
                                                                            5000);
                                                                    logFirebaseEvent(
                                                                        'Icon2_update_app_state');

                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    logFirebaseEvent(
                                                                        'Icon2_custom_action');
                                                                    await actions
                                                                        .facebookEventClass(
                                                                      getJsonField(
                                                                        productModel1Item,
                                                                        r'''$.varient_id''',
                                                                      ).toString(),
                                                                      getJsonField(
                                                                        productModel1Item,
                                                                        r'''$.product_name''',
                                                                      ).toString(),
                                                                      'add',
                                                                      getJsonField(
                                                                        productModel1Item,
                                                                        r'''$.price''',
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
                                                                        'Icon2_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                      'Add To Wishlist',
                                                                      parameters: {
                                                                        'API Name':
                                                                            'Add Remove Wishlist',
                                                                      },
                                                                    );
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Icon2_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          getJsonField(
                                                                            (_model.addRemoveAPIResult?.jsonBody ??
                                                                                ''),
                                                                            r'''$.message''',
                                                                          ).toString(),
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
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Icon2_show_snack_bar');
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
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                size: 35.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
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
                        if ((FFAppState().cartTotalCount > 0) ||
                            (FFAppState().subCartTotalItem > 0))
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 130.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'OCCASIONAL_CATEGORY_cartbtnContainer_ON_');
                                  logFirebaseEvent(
                                      'cartbtnContainer_update_app_state');
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                        FFAppState()
                                                            .cartTotalCount,
                                                        FFAppState()
                                                            .subCartTotalItem)
                                                    .toString())
                                                .toString() !=
                                            '0')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  functions
                                                      .additionFunctionInt(
                                                          FFAppState()
                                                              .cartTotalCount,
                                                          FFAppState()
                                                              .subCartTotalItem)
                                                      .toString(),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 0.0, 30.0, 20.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FFAppConstants.indigoColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
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
                                          'OCCASIONAL_CATEGORY_Row_85tbog1q_ON_TAP');
                                      if (FFAppState().cartTotalCount < 1) {
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed(
                                            CartSubscriptionScreenWidget
                                                .routeName);

                                        logFirebaseEvent(
                                            'Row_update_app_state');
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
                                            'Screen Name': 'Top Deal Screen',
                                          },
                                        );
                                      } else {
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed(
                                            DailyCartScreenWidget.routeName);

                                        logFirebaseEvent(
                                            'Row_update_app_state');
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
                                            'Screen Name': 'Top Deal Screen',
                                          },
                                        );
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppConstants
                                                                  .neutralWhiteF5F5F5,
                                                              fontSize: 12.0,
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
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppConstants
                                                                  .neutralWhiteF5F5F5,
                                                              fontSize: 12.0,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 3.0),
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
                                                                fontStyle: FlutterFlowTheme.of(
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
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: functions.setDecimalValue(functions
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
                                                          text:
                                                              'You have saved ',
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
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: 'AED ',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color:
                                                                FFAppConstants
                                                                    .whiteColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13.0,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: functions.setDecimalValue(functions
                                                              .additionFunction(
                                                                  FFAppState()
                                                                      .cartSavingPrice,
                                                                  FFAppState()
                                                                      .subCartSavingAmount)
                                                              ?.toString())!,
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color:
                                                                FFAppConstants
                                                                    .whiteColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13.0,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' on your order',
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
                      ],
                    ),
                  ),
                ),
                if (FFAppState().refreshTrigger == true)
                  Container(
                    width: 10.0,
                    height: 20.0,
                    decoration: BoxDecoration(),
                    child: FlutterFlowTimer(
                      initialTime: _model.timerInitialTimeMs,
                      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        milliSecond: false,
                      ),
                      controller: _model.timerController,
                      updateStateInterval: Duration(milliseconds: 1000),
                      onChanged: (value, displayTime, shouldUpdate) {
                        _model.timerMilliseconds = value;
                        _model.timerValue = displayTime;
                        if (shouldUpdate) safeSetState(() {});
                      },
                      onEnded: () async {
                        logFirebaseEvent(
                            'OCCASIONAL_CATEGORY_Timer_wqi7o7bw_ON_TI');
                        logFirebaseEvent('Timer_refresh_database_request');
                        safeSetState(() => _model.apiRequestCompleter = null);
                        await _model.waitForApiRequestCompleted(maxWait: 5000);
                      },
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.outfit(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                color: Color(0x0014181B),
                                fontSize: 1.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
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
  }
}
