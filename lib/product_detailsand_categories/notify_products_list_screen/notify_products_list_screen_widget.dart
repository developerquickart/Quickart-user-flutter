import '/backend/api_requests/api_calls.dart';
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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notify_products_list_screen_model.dart';
export 'notify_products_list_screen_model.dart';

class NotifyProductsListScreenWidget extends StatefulWidget {
  const NotifyProductsListScreenWidget({super.key});

  static String routeName = 'notifyProductsListScreen';
  static String routePath = '/notifyProductsListScreen';

  @override
  State<NotifyProductsListScreenWidget> createState() =>
      _NotifyProductsListScreenWidgetState();
}

class _NotifyProductsListScreenWidgetState
    extends State<NotifyProductsListScreenWidget> {
  late NotifyProductsListScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotifyProductsListScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'notifyProductsListScreen'});
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
          backgroundColor: FFAppConstants.appBarColor,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 46.0,
            icon: Icon(
              Icons.chevron_left,
              color: FFAppConstants.appBarIconandTitleColor,
              size: FFAppConstants.appBarIconFont.toDouble(),
            ),
            onPressed: () async {
              logFirebaseEvent('NOTIFY_PRODUCTS_LIST_SCREEN_chevron_left');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'NotifyMe Products List',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FFAppConstants.blackColor0A0A0A,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter ??= Completer<
                                ApiCallResponse>()
                              ..complete(QuickartGroup.shownotifymeCall.call(
                                userid: FFAppState().userID,
                                storeid: FFAppState().storeID,
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
                                height:
                                    MediaQuery.sizeOf(context).height * 0.25,
                              ),
                            );
                          }
                          final gridViewShownotifymeResponse = snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final productModel = getJsonField(
                                gridViewShownotifymeResponse.jsonBody,
                                r'''$.data''',
                              ).toList();
                              if (productModel.isEmpty) {
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
                                      'NOTIFY_PRODUCTS_LIST_SCREEN_GridView_bkt');
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
                                    FFAppState().isCartShow == true
                                        ? 90.0
                                        : 20.0,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 2.0,
                                    childAspectRatio: 0.64,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: productModel.length,
                                  itemBuilder: (context, productModelIndex) {
                                    final productModelItem =
                                        productModel[productModelIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'NOTIFY_PRODUCTS_LIST_SCREEN_Container_f2');
                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                            ProductDetailsScreenWidget
                                                .routeName);

                                        logFirebaseEvent(
                                            'Container_update_app_state');
                                        FFAppState().productID = getJsonField(
                                          productModelItem,
                                          r'''$.product_id''',
                                        ).toString();
                                        FFAppState().storeID =
                                            FFAppState().storeID;
                                        FFAppState().userID =
                                            FFAppState().userID;
                                        FFAppState().productName = getJsonField(
                                          productModelItem,
                                          r'''$.product_name''',
                                        ).toString();
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Container_custom_action');
                                        await actions.facebookEventClass(
                                          getJsonField(
                                            productModelItem,
                                            r'''$.product_id''',
                                          ).toString(),
                                          getJsonField(
                                            productModelItem,
                                            r'''$.product_name''',
                                          ).toString(),
                                          'product detail',
                                          getJsonField(
                                            productModelItem,
                                            r'''$.price''',
                                          ),
                                          0,
                                          getJsonField(
                                            productModelItem,
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
                                          'Navigation',
                                          parameters: {
                                            'Navigate To':
                                                'Product Detail Screen',
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 170.0,
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                          border: Border.all(
                                            color: FFAppConstants.whiteColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.16, -0.9),
                                                        child: Container(
                                                          width: (MediaQuery.sizeOf(
                                                                          context)
                                                                      .width /
                                                                  2) -
                                                              10,
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            (MediaQuery.sizeOf(
                                                                            context)
                                                                        .width /
                                                                    2) -
                                                                10,
                                                            150.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppConstants
                                                                .productBgClr,
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
                                                                      8.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      8.0),
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
                                                                  'NOTIFY_PRODUCTS_LIST_SCREEN_Image_l623as');
                                                              logFirebaseEvent(
                                                                  'Image_refresh_database_request');
                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted(
                                                                      maxWait:
                                                                          3000);
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                getJsonField(
                                                                  productModelItem,
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
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
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
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if ((FFAppConstants
                                                                  .quickAvailability ==
                                                              getJsonField(
                                                                productModelItem,
                                                                r'''$.availability''',
                                                              ).toString()) ||
                                                          (FFAppConstants
                                                                  .allAvailability ==
                                                              getJsonField(
                                                                productModelItem,
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
                                                                      (MediaQuery.sizeOf(context).width /
                                                                              2) -
                                                                          55,
                                                                      0.0,
                                                                    ),
                                                                    5.0,
                                                                    2.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                if (FFAppState()
                                                                        .qtyZeroCheck ==
                                                                    getJsonField(
                                                                      productModelItem,
                                                                      r'''$.total_cart_qty''',
                                                                    )) {
                                                                  return Visibility(
                                                                    visible: functions
                                                                            .checkVariantsWithStock(getJsonField(
                                                                          productModelItem,
                                                                          r'''$.varients''',
                                                                        )) ==
                                                                        true,
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'NOTIFY_PRODUCTS_LIST_SCREEN_ADD_BTN_ON_T');
                                                                          if (functions.checkVariantFeatureCondition(productModelItem) ==
                                                                              true) {
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
                                                                                      productModel: productModelItem,
                                                                                      cartType: 'daily',
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));

                                                                            logFirebaseEvent('Button_refresh_database_request');
                                                                            safeSetState(() =>
                                                                                _model.apiRequestCompleter = null);
                                                                            await _model.waitForApiRequestCompleted(maxWait: 5000);
                                                                          } else {
                                                                            logFirebaseEvent('Button_custom_action');
                                                                            _model.networkCheck =
                                                                                await actions.checkInternetConnection();
                                                                            if (_model.networkCheck ==
                                                                                true) {
                                                                              logFirebaseEvent('Button_haptic_feedback');
                                                                              HapticFeedback.heavyImpact();
                                                                              logFirebaseEvent('Button_backend_call');
                                                                              _model.addtoCart = await QuickartGroup.addToCartCall.call(
                                                                                userid: FFAppState().userID,
                                                                                qty: '1',
                                                                                storeid: FFAppState().storeID,
                                                                                varientid: getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.varient_id''',
                                                                                ).toString(),
                                                                                deviceid: FFAppState().deviceID,
                                                                                itemPrice: getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.price''',
                                                                                ).toString(),
                                                                                itemName: getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.product_name''',
                                                                                ).toString(),
                                                                                platform: isiOS ? 'ios' : 'android',
                                                                              );

                                                                              if ((_model.addtoCart?.succeeded ?? true)) {
                                                                                if (FFAppConstants.checkStatus ==
                                                                                    getJsonField(
                                                                                      (_model.addtoCart?.jsonBody ?? ''),
                                                                                      r'''$.status''',
                                                                                    ).toString()) {
                                                                                  logFirebaseEvent('Button_refresh_database_request');
                                                                                  safeSetState(() => _model.apiRequestCompleter = null);
                                                                                  await _model.waitForApiRequestCompleted();
                                                                                  logFirebaseEvent('Button_update_app_state');
                                                                                  FFAppState().isCartShow = false;
                                                                                  FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                    (_model.addtoCart?.jsonBody ?? ''),
                                                                                  )!;
                                                                                  FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                      .savingPrice(
                                                                                        (_model.addtoCart?.jsonBody ?? ''),
                                                                                      )!
                                                                                      .toString());
                                                                                  FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                      .totalPrice(
                                                                                        (_model.addtoCart?.jsonBody ?? ''),
                                                                                      )!
                                                                                      .toString());
                                                                                  FFAppState().refreshTrigger = true;
                                                                                  FFAppState().update(() {});
                                                                                  logFirebaseEvent('Button_custom_action');
                                                                                  await actions.facebookEventClass(
                                                                                    getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.varient_id''',
                                                                                    ).toString(),
                                                                                    getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.product_name''',
                                                                                    ).toString(),
                                                                                    'product',
                                                                                    getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.price''',
                                                                                    ),
                                                                                    1,
                                                                                    getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.mrp''',
                                                                                    ),
                                                                                    'add',
                                                                                    FFAppState().emptyJson,
                                                                                    ' ',
                                                                                    ' ',
                                                                                    ' ',
                                                                                    ' ',
                                                                                    ' ',
                                                                                  );
                                                                                  logFirebaseEvent('Button_google_analytics_event');
                                                                                  logFirebaseEvent(
                                                                                    'Add To Cart',
                                                                                    parameters: {
                                                                                      'API Name': 'Add To Cart',
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
                                                                                          (_model.addtoCart?.jsonBody ?? ''),
                                                                                          r'''$.message''',
                                                                                        ).toString(),
                                                                                        style: GoogleFonts.montserrat(
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
                                                                              } else {
                                                                                logFirebaseEvent('Button_show_snack_bar');
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      getJsonField(
                                                                                        (_model.addtoCart?.jsonBody ?? ''),
                                                                                        r'''$.message''',
                                                                                      ).toString(),
                                                                                      style: GoogleFonts.montserrat(
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
                                                                            } else {
                                                                              logFirebaseEvent('Button_show_snack_bar');
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    FFAppConstants.internetString,
                                                                                    style: GoogleFonts.montserrat(
                                                                                      color: FFAppConstants.blackColor0A0A0A,
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: FFAppConstants.NeutralBlack50Color,
                                                                                ),
                                                                              );
                                                                            }
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'ADD',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              25.0,
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
                                                                          color:
                                                                              FFAppConstants.darkGreen,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                          elevation:
                                                                              0.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Visibility(
                                                                    visible: functions
                                                                            .checkVariantsWithStock(getJsonField(
                                                                          productModelItem,
                                                                          r'''$.varients''',
                                                                        )) ==
                                                                        true,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          90.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(5.0),
                                                                          bottomRight:
                                                                              Radius.circular(5.0),
                                                                          topLeft:
                                                                              Radius.circular(5.0),
                                                                          topRight:
                                                                              Radius.circular(5.0),
                                                                        ),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FFAppConstants.calculatorColor,
                                                                          width:
                                                                              0.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('NOTIFY_PRODUCTS_LIST_SCREEN__BTN_ON_TAP');
                                                                                if (functions.checkVariantFeatureCondition(productModelItem) == true) {
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
                                                                                            productModel: productModelItem,
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
                                                                                  _model.internet = await actions.checkInternetConnection();
                                                                                  if (_model.internet == true) {
                                                                                    logFirebaseEvent('Button_haptic_feedback');
                                                                                    HapticFeedback.mediumImpact();
                                                                                    logFirebaseEvent('Button_backend_call');
                                                                                    _model.addtocart = await QuickartGroup.addToCartCall.call(
                                                                                      userid: FFAppState().userID,
                                                                                      storeid: FFAppState().storeID,
                                                                                      deviceid: FFAppState().deviceID,
                                                                                      qty: functions.addRemoveQTY(
                                                                                          getJsonField(
                                                                                            productModelItem,
                                                                                            r'''$.cart_qty''',
                                                                                          ),
                                                                                          'remove'),
                                                                                      varientid: getJsonField(
                                                                                        productModelItem,
                                                                                        r'''$.varient_id''',
                                                                                      ).toString(),
                                                                                      itemPrice: getJsonField(
                                                                                        productModelItem,
                                                                                        r'''$.price''',
                                                                                      ).toString(),
                                                                                      itemName: getJsonField(
                                                                                        productModelItem,
                                                                                        r'''$.product_name''',
                                                                                      ).toString(),
                                                                                      platform: isiOS ? 'ios' : 'android',
                                                                                    );

                                                                                    if ((_model.addtocart?.succeeded ?? true)) {
                                                                                      logFirebaseEvent('Button_refresh_database_request');
                                                                                      safeSetState(() => _model.apiRequestCompleter = null);
                                                                                      await _model.waitForApiRequestCompleted();
                                                                                      logFirebaseEvent('Button_update_app_state');
                                                                                      FFAppState().isCartShow = false;
                                                                                      FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                        (_model.addtocart?.jsonBody ?? ''),
                                                                                      )!;
                                                                                      FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                          .savingPrice(
                                                                                            (_model.addtocart?.jsonBody ?? ''),
                                                                                          )!
                                                                                          .toString());
                                                                                      FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                          .totalPrice(
                                                                                            (_model.addtocart?.jsonBody ?? ''),
                                                                                          )!
                                                                                          .toString());
                                                                                      FFAppState().refreshTrigger = true;
                                                                                      FFAppState().update(() {});
                                                                                      logFirebaseEvent('Button_google_analytics_event');
                                                                                      logFirebaseEvent(
                                                                                        'Remove From Cart',
                                                                                        parameters: {
                                                                                          'API Name': 'Add To Cart',
                                                                                        },
                                                                                      );
                                                                                      logFirebaseEvent('Button_custom_action');
                                                                                      await actions.facebookEventClass(
                                                                                        getJsonField(
                                                                                          productModelItem,
                                                                                          r'''$.varient_id''',
                                                                                        ).toString(),
                                                                                        getJsonField(
                                                                                          productModelItem,
                                                                                          r'''$.product_name''',
                                                                                        ).toString(),
                                                                                        'product',
                                                                                        functions.stringToDouble(getJsonField(
                                                                                          productModelItem,
                                                                                          r'''$.price''',
                                                                                        ).toString()),
                                                                                        getJsonField(
                                                                                              productModelItem,
                                                                                              r'''$.cart_qty''',
                                                                                            ) -
                                                                                            1,
                                                                                        functions.stringToDouble(getJsonField(
                                                                                          productModelItem,
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
                                                                                          milliseconds: 1000,
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      logFirebaseEvent('Button_show_snack_bar');
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            getJsonField(
                                                                                              (_model.addtocart?.jsonBody ?? ''),
                                                                                              r'''$.message''',
                                                                                            ).toString(),
                                                                                            style: TextStyle(
                                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FFAppConstants.NeutralBlack50Color,
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
                                                                                  bottomLeft: Radius.circular(5.0),
                                                                                  bottomRight: Radius.circular(0.0),
                                                                                  topLeft: Radius.circular(5.0),
                                                                                  topRight: Radius.circular(0.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 30.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FFAppConstants.whiteColor,
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    productModelItem,
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
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) => FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('NOTIFY_PRODUCTS_LIST_SCREEN__BTN_ON_TAP');
                                                                                  if (functions.checkVariantFeatureCondition(productModelItem) == true) {
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
                                                                                              productModel: productModelItem,
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
                                                                                    _model.network = await actions.checkInternetConnection();
                                                                                    if (_model.network == true) {
                                                                                      if (getJsonField(
                                                                                            productModelItem,
                                                                                            r'''$.stock''',
                                                                                          ) ==
                                                                                          getJsonField(
                                                                                            productModelItem,
                                                                                            r'''$.cart_qty''',
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
                                                                                                  title: "",
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      } else {
                                                                                        logFirebaseEvent('Button_haptic_feedback');
                                                                                        HapticFeedback.mediumImpact();
                                                                                        logFirebaseEvent('Button_backend_call');
                                                                                        _model.cartadd = await QuickartGroup.addToCartCall.call(
                                                                                          userid: FFAppState().userID,
                                                                                          qty: functions.addRemoveQTY(
                                                                                              getJsonField(
                                                                                                productModelItem,
                                                                                                r'''$.cart_qty''',
                                                                                              ),
                                                                                              'add'),
                                                                                          storeid: FFAppState().storeID,
                                                                                          varientid: getJsonField(
                                                                                            productModelItem,
                                                                                            r'''$.varient_id''',
                                                                                          ).toString(),
                                                                                          deviceid: FFAppState().deviceID,
                                                                                          itemPrice: getJsonField(
                                                                                            productModelItem,
                                                                                            r'''$.price''',
                                                                                          ).toString(),
                                                                                          itemName: getJsonField(
                                                                                            productModelItem,
                                                                                            r'''$.product_name''',
                                                                                          ).toString(),
                                                                                          platform: isiOS ? 'ios' : 'android',
                                                                                        );

                                                                                        if ((_model.cartadd?.succeeded ?? true)) {
                                                                                          if (FFAppConstants.checkStatus ==
                                                                                              getJsonField(
                                                                                                (_model.cartadd?.jsonBody ?? ''),
                                                                                                r'''$.status''',
                                                                                              ).toString()) {
                                                                                            logFirebaseEvent('Button_refresh_database_request');
                                                                                            safeSetState(() => _model.apiRequestCompleter = null);
                                                                                            await _model.waitForApiRequestCompleted();
                                                                                            logFirebaseEvent('Button_update_app_state');
                                                                                            FFAppState().isCartShow = false;
                                                                                            FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                              (_model.cartadd?.jsonBody ?? ''),
                                                                                            )!;
                                                                                            FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                .savingPrice(
                                                                                                  (_model.cartadd?.jsonBody ?? ''),
                                                                                                )!
                                                                                                .toString());
                                                                                            FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                .totalPrice(
                                                                                                  (_model.cartadd?.jsonBody ?? ''),
                                                                                                )!
                                                                                                .toString());
                                                                                            FFAppState().refreshTrigger = true;
                                                                                            FFAppState().update(() {});
                                                                                            logFirebaseEvent('Button_google_analytics_event');
                                                                                            logFirebaseEvent(
                                                                                              'Add To Cart',
                                                                                              parameters: {
                                                                                                'API Name': 'Add To Cart',
                                                                                              },
                                                                                            );
                                                                                            logFirebaseEvent('Button_custom_action');
                                                                                            await actions.facebookEventClass(
                                                                                              getJsonField(
                                                                                                productModelItem,
                                                                                                r'''$.varient_id''',
                                                                                              ).toString(),
                                                                                              getJsonField(
                                                                                                productModelItem,
                                                                                                r'''$.product_name''',
                                                                                              ).toString(),
                                                                                              'product',
                                                                                              functions.stringToDouble(getJsonField(
                                                                                                productModelItem,
                                                                                                r'''$.price''',
                                                                                              ).toString()),
                                                                                              getJsonField(
                                                                                                    productModelItem,
                                                                                                    r'''$.cart_qty''',
                                                                                                  ) +
                                                                                                  1,
                                                                                              functions.stringToDouble(getJsonField(
                                                                                                productModelItem,
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
                                                                                                    (_model.cartadd?.jsonBody ?? ''),
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
                                                                                                  (_model.cartadd?.jsonBody ?? ''),
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
                                                                                          duration: Duration(milliseconds: 4000),
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
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                ),
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
                                                                        productModelItem,
                                                                        r'''$.feature_tags''',
                                                                      ) !=
                                                                      null) &&
                                                                  ((getJsonField(
                                                                        productModelItem,
                                                                        r'''$.feature_tags''',
                                                                      ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<
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
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final featureTag =
                                                                          getJsonField(
                                                                        productModelItem,
                                                                        r'''$.feature_tags''',
                                                                      ).toList();

                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        reverse:
                                                                            true,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            featureTag.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                featureTagIndex) {
                                                                          final featureTagItem =
                                                                              featureTag[featureTagIndex];
                                                                          return Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                              child: Container(
                                                                                width: 28.0,
                                                                                height: 28.0,
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
                                                      ),
                                                    ],
                                                  ),
                                                  if (functions
                                                          .checkVariantsWithStock(
                                                              getJsonField(
                                                        productModelItem,
                                                        r'''$.varients''',
                                                      )) ==
                                                      true)
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 35.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        productModelItem,
                                                                        r'''$.product_name''',
                                                                      )
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                45,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          2,
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
                                                                                FFAppConstants.blackColor0A0A0A,
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
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                          productModelItem,
                                                                          r'''$.quantity''',
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
                                                                          productModelItem,
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
                                                                    productModelItem,
                                                                    r'''$.varients''',
                                                                  ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList()
                                                                          as Iterable<
                                                                              ProductCountStruct?>)
                                                                      .withoutNulls
                                                                      .length >=
                                                                  2)
                                                                InkWell(
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
                                                                        'NOTIFY_PRODUCTS_LIST_SCREEN_Row_wdb2f6co');
                                                                    logFirebaseEvent(
                                                                        'Row_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      useSafeArea:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                VarientBotttomSheetWidget(
                                                                              productModel: productModelItem,
                                                                              cartType: 'daily',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(() =>
                                                                            _model.returnJson10 =
                                                                                value));

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
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if ((getJsonField(
                                                                            productModelItem,
                                                                            r'''$.varients''',
                                                                          ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
                                                                              .withoutNulls
                                                                              .length >=
                                                                          2)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                1.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '${(getJsonField(
                                                                                productModelItem,
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
                                                                          Icons
                                                                              .keyboard_arrow_down,
                                                                          color:
                                                                              FFAppConstants.indigoColor,
                                                                          size:
                                                                              24.0,
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
                                                                        3.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-0.79, -0.97),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
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
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: functions.setDecimalValue(getJsonField(
                                                                                          productModelItem,
                                                                                          r'''$.price''',
                                                                                        ).toString())!,
                                                                                        style: GoogleFonts.montserrat(
                                                                                          color: FFAppConstants.blackColor0A0A0A,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontSize: 12.0,
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
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.price''',
                                                                                ) !=
                                                                                getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.mrp''',
                                                                                )) {
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'AED ',
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
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions.setDecimalValue(getJsonField(
                                                                                          productModelItem,
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
                                                                                  ],
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
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
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
                                                                      'NOTIFY_PRODUCTS_LIST_SCREEN_Text_hh6yh0a');
                                                                  logFirebaseEvent(
                                                                      'Text_custom_action');
                                                                  _model.connectivityc =
                                                                      await actions
                                                                          .checkInternetConnection();
                                                                  if (_model
                                                                          .connectivityc ==
                                                                      true) {
                                                                    logFirebaseEvent(
                                                                        'Text_backend_call');
                                                                    _model.apiResulte1n =
                                                                        await QuickartGroup
                                                                            .deletenotifymeCall
                                                                            .call(
                                                                      productID:
                                                                          getJsonField(
                                                                        productModelItem,
                                                                        r'''$.product_id''',
                                                                      ).toString(),
                                                                      userID: FFAppState()
                                                                          .userID,
                                                                      varientID:
                                                                          getJsonField(
                                                                        productModelItem,
                                                                        r'''$.varient_id''',
                                                                      ).toString(),
                                                                      fcmToken:
                                                                          FFAppState()
                                                                              .fcmToken,
                                                                      platform:
                                                                          FFAppState()
                                                                              .platform,
                                                                    );

                                                                    if ((_model
                                                                            .apiResulte1n
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'Text_show_snack_bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            getJsonField(
                                                                              (_model.apiResulte1n?.jsonBody ?? ''),
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
                                                                              Duration(milliseconds: 1250),
                                                                          backgroundColor:
                                                                              FFAppConstants.NeutralBlack50Color,
                                                                        ),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Text_refresh_database_request');
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter =
                                                                              null);
                                                                      await _model.waitForApiRequestCompleted(
                                                                          maxWait:
                                                                              2000);
                                                                      logFirebaseEvent(
                                                                          'Text_update_app_state');

                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Text_show_snack_bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            getJsonField(
                                                                              (_model.apiResulte1n?.jsonBody ?? ''),
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
                                                                              Duration(milliseconds: 1250),
                                                                          backgroundColor:
                                                                              FFAppConstants.blackColor666666,
                                                                        ),
                                                                      );
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Text_show_snack_bar');
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
                                                                            Duration(milliseconds: 1250),
                                                                        backgroundColor:
                                                                            FFAppConstants.blackColor666666,
                                                                      ),
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Text(
                                                                  'Click to remove from notify me',
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
                                                                        color: Color(
                                                                            0xFFC82038),
                                                                        fontSize:
                                                                            10.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  if (((getJsonField(
                                                            productModelItem,
                                                            r'''$.varients''',
                                                          )
                                                                      .toList()
                                                                      .map<ProductCountStruct?>(
                                                                          ProductCountStruct
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
                                                            productModelItem,
                                                            r'''$.varients[0].stock''',
                                                          ).toString()))
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FFAppConstants
                                                            .greyBgd6d2d3,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
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
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 35.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        productModelItem,
                                                                        r'''$.product_name''',
                                                                      )
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                45,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      maxLines:
                                                                          2,
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
                                                                                FFAppConstants.blackColor0A0A0A,
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
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      productModelItem,
                                                                      r'''$.quantity''',
                                                                    ).toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
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
                                                                              Color(0xFF7A7A7A),
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
                                                                Text(
                                                                  getJsonField(
                                                                    productModelItem,
                                                                    r'''$.unit''',
                                                                  ).toString(),
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
                                                                        color: Color(
                                                                            0xFF7A7A7A),
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
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFAppConstants
                                                                    .unavailable,
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
                                                                      color: FFAppConstants
                                                                          .blackColor0A0A0A,
                                                                      fontSize:
                                                                          10.0,
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
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        4.0,
                                                                        0.0,
                                                                        3.0),
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      'Remove  from list',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          2,
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
                                                                                Color(0xFFC82038),
                                                                            fontSize:
                                                                                10.0,
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
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'NOTIFY_PRODUCTS_LIST_SCREEN__BTN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Button_custom_action');
                                                                    _model.connectivitycC =
                                                                        await actions
                                                                            .checkInternetConnection();
                                                                    if (_model
                                                                            .connectivitycC ==
                                                                        true) {
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      _model.apiResulte1nC = await QuickartGroup
                                                                          .deletenotifymeCall
                                                                          .call(
                                                                        productID:
                                                                            getJsonField(
                                                                          productModelItem,
                                                                          r'''$.product_id''',
                                                                        ).toString(),
                                                                        varientID:
                                                                            getJsonField(
                                                                          productModelItem,
                                                                          r'''$.varient_id''',
                                                                        ).toString(),
                                                                        userID:
                                                                            FFAppState().userID,
                                                                        fcmToken:
                                                                            FFAppState().fcmToken,
                                                                        platform:
                                                                            FFAppState().platform,
                                                                      );

                                                                      if ((_model
                                                                              .apiResulte1nC
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        logFirebaseEvent(
                                                                            'Button_refresh_database_request');
                                                                        safeSetState(() =>
                                                                            _model.apiRequestCompleter =
                                                                                null);
                                                                        await _model.waitForApiRequestCompleted(
                                                                            maxWait:
                                                                                3000);
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');

                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_show_snack_bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                (_model.apiResulte1nC?.jsonBody ?? ''),
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: GoogleFonts.montserrat(
                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 1250),
                                                                            backgroundColor:
                                                                                FFAppConstants.NeutralBlack50Color,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button_show_snack_bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                (_model.apiResulte1nC?.jsonBody ?? ''),
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: GoogleFonts.montserrat(
                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 1250),
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
                                                                            FFAppConstants.internetString,
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 1250),
                                                                          backgroundColor:
                                                                              FFAppConstants.blackColor666666,
                                                                        ),
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text: '',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        23.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0x00FFF3F5),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FFAppConstants.blackColor0A0A0A,
                                                                          fontSize:
                                                                              8.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(0.0),
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
                                                            productModelItem,
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
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      8.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                                          2.0,
                                                                          0.0,
                                                                          2.0,
                                                                          0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFAppConstants.discountperdouble >
                                                                              getJsonField(
                                                                                productModelItem,
                                                                                r'''$.discountper''',
                                                                              )
                                                                          ? functions.setDecimalValueWithCount(
                                                                              getJsonField(
                                                                                productModelItem,
                                                                                r'''$.discountper''',
                                                                              ).toString(),
                                                                              0,
                                                                              true)
                                                                          : functions.setDecimalValueWithCount(
                                                                              getJsonField(
                                                                                productModelItem,
                                                                                r'''$.discountper''',
                                                                              ).toString(),
                                                                              0,
                                                                              true),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.readexPro(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.white,
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
                                                                    TextSpan(
                                                                      text:
                                                                          '% Off',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            8.0,
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
                                                        );
                                                      } else {
                                                        return Text(
                                                          '\n',
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
                                                                fontSize: 15.0,
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
                                                        productModelItem,
                                                        r'''$.country_icon''',
                                                      ).toString())
                                                    Container(
                                                      width: 29.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF4F6F4),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppConstants
                                                                        .percentageCheck <
                                                                    getJsonField(
                                                                      productModelItem,
                                                                      r'''$.discountper''',
                                                                    )
                                                                ? 0.0
                                                                : 8.0,
                                                            0.0,
                                                          )),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
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
                                                              productModelItem,
                                                              r'''$.country_icon''',
                                                            ).toString(),
                                                            width: 25.0,
                                                            height: 25.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Builder(
                                                builder: (context) {
                                                  if (FFAppConstants
                                                          .isFavourite ==
                                                      getJsonField(
                                                        productModelItem,
                                                        r'''$.isFavourite''',
                                                      ).toString()) {
                                                    return Container(
                                                      width: 35.0,
                                                      height: 35.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF4F6F4),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFDCE9D8),
                                                          width: 1.0,
                                                        ),
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
                                                              'NOTIFY_PRODUCTS_LIST_SCREEN_Icon1_ON_TAP');
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
                                                            _model.addRemoveAPIResponse =
                                                                await QuickartGroup
                                                                    .addremwishlistCall
                                                                    .call(
                                                              userid:
                                                                  FFAppState()
                                                                      .userID,
                                                              storeID:
                                                                  FFAppState()
                                                                      .storeID,
                                                              varientID:
                                                                  getJsonField(
                                                                productModelItem,
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
                                                                    .addRemoveAPIResponse
                                                                    ?.succeeded ??
                                                                true)) {
                                                              logFirebaseEvent(
                                                                  'Icon1_refresh_database_request');
                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted(
                                                                      maxWait:
                                                                          3000);
                                                              logFirebaseEvent(
                                                                  'Icon1_google_analytics_event');
                                                              logFirebaseEvent(
                                                                'Remove From Wishlist',
                                                                parameters: {
                                                                  'API Name':
                                                                      'Add Remove Wishlist',
                                                                },
                                                              );
                                                              logFirebaseEvent(
                                                                  'Icon1_custom_action');
                                                              await actions
                                                                  .facebookEventClass(
                                                                getJsonField(
                                                                  productModelItem,
                                                                  r'''$.varient_id''',
                                                                ).toString(),
                                                                getJsonField(
                                                                  productModelItem,
                                                                  r'''$.product_name''',
                                                                ).toString(),
                                                                'remove',
                                                                getJsonField(
                                                                  productModelItem,
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
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Icon1_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    getJsonField(
                                                                      (_model.addRemoveAPIResponse
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
                                                            }
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Icon1_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  FFAppConstants
                                                                      .internetString,
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
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.favorite_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          size: 35.0,
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: 35.0,
                                                      height: 35.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF4F6F4),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFDCE9D8),
                                                          width: 1.0,
                                                        ),
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
                                                              'NOTIFY_PRODUCTS_LIST_SCREEN_Icon2_ON_TAP');
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
                                                              userid:
                                                                  FFAppState()
                                                                      .userID,
                                                              storeID:
                                                                  FFAppState()
                                                                      .storeID,
                                                              varientID:
                                                                  getJsonField(
                                                                productModelItem,
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
                                                              await _model
                                                                  .waitForApiRequestCompleted(
                                                                      maxWait:
                                                                          3000);
                                                              logFirebaseEvent(
                                                                  'Icon2_update_app_state');

                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              logFirebaseEvent(
                                                                  'Icon2_google_analytics_event');
                                                              logFirebaseEvent(
                                                                'Add To Wishlist',
                                                                parameters: {
                                                                  'API Name':
                                                                      'Add Remove Wishlist',
                                                                },
                                                              );
                                                              logFirebaseEvent(
                                                                  'Icon2_custom_action');
                                                              await actions
                                                                  .facebookEventClass(
                                                                getJsonField(
                                                                  productModelItem,
                                                                  r'''$.varient_id''',
                                                                ).toString(),
                                                                getJsonField(
                                                                  productModelItem,
                                                                  r'''$.product_name''',
                                                                ).toString(),
                                                                'add',
                                                                getJsonField(
                                                                  productModelItem,
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
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Icon2_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    getJsonField(
                                                                      (_model.addRemoveAPIResult
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.message''',
                                                                    ).toString(),
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      color: FFAppConstants
                                                                          .primaryPurpleE4D8F5,
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
                                                                'Icon2_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  FFAppConstants
                                                                      .internetString,
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
                                                                        4000),
                                                                backgroundColor:
                                                                    FFAppConstants
                                                                        .NeutralBlack50Color,
                                                              ),
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.favorite_border,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                    if ((FFAppState().cartTotalCount > 0) ||
                        (FFAppState().subCartTotalItem > 0))
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 110.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NOTIFY_PRODUCTS_LIST_SCREEN_Container_bd');
                              logFirebaseEvent('Container_update_app_state');
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
                                                    FFAppState()
                                                        .subCartTotalItem)
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
                                                      FFAppState()
                                                          .cartTotalCount,
                                                      FFAppState()
                                                          .subCartTotalItem)
                                                  .toString(),
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
                    if (FFAppState().isCartShow == true)
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 20.0),
                          child: SafeArea(
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
                                        'NOTIFY_PRODUCTS_LIST_SCREEN_Row_08uv5stk');
                                    if (FFAppState().cartTotalCount < 1) {
                                      logFirebaseEvent('Row_navigate_to');

                                      context.pushNamed(
                                          CartSubscriptionScreenWidget
                                              .routeName);

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
                                      logFirebaseEvent('Row_update_app_state');
                                      FFAppState().isCartShow = false;
                                      FFAppState().screenName =
                                          'subscriptionCart';
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent('Row_navigate_to');

                                      context.pushNamed(
                                          DailyCartScreenWidget.routeName);

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
                                      logFirebaseEvent('Row_update_app_state');
                                      FFAppState().isCartShow = false;
                                      FFAppState().screenName = 'dailyCart';
                                      safeSetState(() {});
                                    }

                                    logFirebaseEvent(
                                        'Row_google_analytics_event');
                                    logFirebaseEvent(
                                        'PlaceOrderButtonClickAnalytics');
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
