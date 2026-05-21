import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_g_v_model.dart';
export 'product_g_v_model.dart';

class ProductGVWidget extends StatefulWidget {
  const ProductGVWidget({
    super.key,
    required this.productModel,
  });

  final dynamic productModel;

  @override
  State<ProductGVWidget> createState() => _ProductGVWidgetState();
}

class _ProductGVWidgetState extends State<ProductGVWidget> {
  late ProductGVModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductGVModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PRODUCT_G_V_COMP_productGV_ON_INIT_STATE');
      logFirebaseEvent('productGV_update_component_state');
      _model.productJson = widget!.productModel;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final productModelv = _model.productJson?.toList() ?? [];

        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 1.42,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: productModelv.length,
          itemBuilder: (context, productModelvIndex) {
            final productModelvItem = productModelv[productModelvIndex];
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('PRODUCT_G_V_Container_p4i8hht9_ON_TAP');
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed(ProductDetailsScreenWidget.routeName);

                logFirebaseEvent('Container_update_app_state');
                FFAppState().productID = getJsonField(
                  productModelvItem,
                  r'''$.product_id''',
                ).toString();
                FFAppState().storeID = FFAppState().storeID;
                FFAppState().userID = FFAppState().userID;
                FFAppState().productName = getJsonField(
                  productModelvItem,
                  r'''$.product_name''',
                ).toString();
                safeSetState(() {});
                logFirebaseEvent('Container_custom_action');
                await actions.facebookEventClass(
                  getJsonField(
                    productModelvItem,
                    r'''$.product_id''',
                  ).toString(),
                  getJsonField(
                    productModelvItem,
                    r'''$.product_name''',
                  ).toString(),
                  'product detail',
                  getJsonField(
                    productModelvItem,
                    r'''$.price''',
                  ),
                  0,
                  0.0,
                  'productdetail',
                  FFAppState().emptyJson,
                  ' ',
                  ' ',
                  ' ',
                  ' ',
                  ' ',
                );
                logFirebaseEvent('Container_google_analytics_event');
                logFirebaseEvent(
                  'Navigation',
                  parameters: {
                    'Navigate To': 'Product Detail Screen',
                  },
                );
              },
              child: Container(
                width: 150.0,
                height: 215.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.16, -0.9),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height:
                                    (MediaQuery.sizeOf(context).width / 2) - 1,
                                decoration: BoxDecoration(
                                  color: FFAppConstants.productBgClr,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  child: Image.network(
                                    getJsonField(
                                      productModelvItem,
                                      r'''$.product_image''',
                                    ).toString(),
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if ((FFAppConstants.quickAvailability ==
                                    getJsonField(
                                      productModelvItem,
                                      r'''$.availability''',
                                    ).toString()) ||
                                (FFAppConstants.allAvailability ==
                                    getJsonField(
                                      productModelvItem,
                                      r'''$.availability''',
                                    ).toString()))
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        (MediaQuery.sizeOf(context).width / 2) -
                                            52,
                                        0.0,
                                      ),
                                      5.0,
                                      2.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (FFAppState().qtyZeroCheck >=
                                          getJsonField(
                                            productModelvItem,
                                            r'''$.total_cart_qty''',
                                          )) {
                                        return Visibility(
                                          visible:
                                              functions.checkVariantsWithStock(
                                                      getJsonField(
                                                    productModelvItem,
                                                    r'''$.varients''',
                                                  )) ==
                                                  true,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'PRODUCT_G_V_COMP_ADD_BTN_ON_TAP');
                                                  if (functions
                                                          .checkVariantFeatureCondition(
                                                              productModelvItem) ==
                                                      true) {
                                                    logFirebaseEvent(
                                                        'Button_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              VarientBotttomSheetWidget(
                                                            productModel:
                                                                productModelvItem,
                                                            cartType: 'daily',
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() =>
                                                            _model.returnjson4 =
                                                                value));

                                                    logFirebaseEvent(
                                                        'Button_update_component_state');
                                                    _model.productJson = functions
                                                        .updateSelectedIndexData(
                                                            _model.productJson!,
                                                            _model.returnjson4!,
                                                            productModelvIndex);
                                                    safeSetState(() {});
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_custom_action');
                                                    _model.internetcheck =
                                                        await actions
                                                            .checkInternetConnection();
                                                    if (_model.internetcheck ==
                                                        true) {
                                                      logFirebaseEvent(
                                                          'Button_haptic_feedback');
                                                      HapticFeedback
                                                          .heavyImpact();
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      _model.cartAdd =
                                                          await QuickartGroup
                                                              .addToCartCall
                                                              .call(
                                                        userid:
                                                            FFAppState().userID,
                                                        qty: '1',
                                                        storeid: FFAppState()
                                                            .storeID,
                                                        varientid: getJsonField(
                                                          productModelvItem,
                                                          r'''$.varient_id''',
                                                        ).toString(),
                                                        deviceid: FFAppState()
                                                            .deviceID,
                                                        itemPrice: getJsonField(
                                                          productModelvItem,
                                                          r'''$.price''',
                                                        ).toString(),
                                                        itemName: getJsonField(
                                                          productModelvItem,
                                                          r'''$.product_name''',
                                                        ).toString(),
                                                        platform: isiOS
                                                            ? 'ios'
                                                            : 'android',
                                                      );

                                                      if ((_model.cartAdd
                                                              ?.succeeded ??
                                                          true)) {
                                                        if (FFAppConstants
                                                                .checkStatus ==
                                                            getJsonField(
                                                              (_model.cartAdd
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.status''',
                                                            ).toString()) {
                                                          logFirebaseEvent(
                                                              'Button_update_app_state');
                                                          FFAppState()
                                                                  .isCartShow =
                                                              false;
                                                          FFAppState()
                                                                  .cartTotalCount =
                                                              QuickartGroup
                                                                  .addToCartCall
                                                                  .totalItems(
                                                            (_model.cartAdd
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!;
                                                          FFAppState()
                                                                  .cartSavingPrice =
                                                              functions.stringToDouble(
                                                                  QuickartGroup
                                                                      .addToCartCall
                                                                      .savingPrice(
                                                                        (_model.cartAdd?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toString());
                                                          FFAppState()
                                                                  .cartTotalPrice =
                                                              functions.stringToDouble(
                                                                  QuickartGroup
                                                                      .addToCartCall
                                                                      .totalPrice(
                                                                        (_model.cartAdd?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toString());
                                                          FFAppState()
                                                                  .refreshTrigger =
                                                              true;
                                                          _model.updatePage(
                                                              () {});
                                                          logFirebaseEvent(
                                                              'Button_custom_action');
                                                          await actions
                                                              .facebookEventClass(
                                                            getJsonField(
                                                              productModelvItem,
                                                              r'''$.varient_id''',
                                                            ).toString(),
                                                            getJsonField(
                                                              productModelvItem,
                                                              r'''$.product_name''',
                                                            ).toString(),
                                                            'product',
                                                            functions
                                                                .stringToDouble(
                                                                    getJsonField(
                                                              productModelvItem,
                                                              r'''$.price''',
                                                            ).toString()),
                                                            getJsonField(
                                                                  productModelvItem,
                                                                  r'''$.cart_qty''',
                                                                ) +
                                                                1,
                                                            functions
                                                                .stringToDouble(
                                                                    getJsonField(
                                                              productModelvItem,
                                                              r'''$.mrp''',
                                                            ).toString()),
                                                            'add',
                                                            FFAppState()
                                                                .emptyJson,
                                                            'emptyjons',
                                                            ' ',
                                                            ' ',
                                                            ' ',
                                                            ' ',
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_google_analytics_event');
                                                          logFirebaseEvent(
                                                            'AddToCartButtonAnalytics',
                                                            parameters: {
                                                              'VarientId':
                                                                  getJsonField(
                                                                productModelvItem,
                                                                r'''$.varient_id''',
                                                              ),
                                                              'Qty':
                                                                  getJsonField(
                                                                productModelvItem,
                                                                r'''$.cart_qty''',
                                                              ),
                                                            },
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_update_component_state');
                                                          _model.productJson = functions
                                                              .updateQtyPlusMinus(
                                                                  _model
                                                                      .productJson!,
                                                                  productModelvIndex,
                                                                  'add',
                                                                  0);
                                                          safeSetState(() {});
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  (_model.cartAdd
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.message''',
                                                                ).toString(),
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  color: FFAppConstants
                                                                      .indigoColor,
                                                                  fontSize:
                                                                      15.0,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
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
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.cartAdd
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString(),
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                color: FFAppConstants
                                                                    .indigoColor,
                                                                fontSize: 15.0,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
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
                                                              fontSize: 15.0,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  1500),
                                                          backgroundColor:
                                                              FFAppConstants
                                                                  .primaryPurpleE4D8F5,
                                                        ),
                                                      );
                                                    }
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text: 'ADD',
                                                options: FFButtonOptions(
                                                  width: 50.0,
                                                  height: 25.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FFAppConstants
                                                      .calculatorColor,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Visibility(
                                          visible:
                                              functions.checkVariantsWithStock(
                                                      getJsonField(
                                                    productModelvItem,
                                                    r'''$.varients''',
                                                  )) ==
                                                  true,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            child: Container(
                                              width: 90.0,
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(5.0),
                                                  bottomRight:
                                                      Radius.circular(5.0),
                                                  topLeft: Radius.circular(5.0),
                                                  topRight:
                                                      Radius.circular(5.0),
                                                ),
                                                border: Border.all(
                                                  color: FFAppConstants
                                                      .calculatorColor,
                                                  width: 0.0,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'PRODUCT_G_V_COMP__BTN_ON_TAP');
                                                        if (functions
                                                                .checkVariantFeatureCondition(
                                                                    productModelvItem) ==
                                                            true) {
                                                          logFirebaseEvent(
                                                              'Button_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            useSafeArea: true,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    VarientBotttomSheetWidget(
                                                                  productModel:
                                                                      productModelvItem,
                                                                  cartType:
                                                                      'daily',
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.returnjson5 =
                                                                      value));

                                                          logFirebaseEvent(
                                                              'Button_update_component_state');
                                                          _model.productJson = functions
                                                              .updateSelectedIndexData(
                                                                  _model
                                                                      .productJson!,
                                                                  _model
                                                                      .returnjson5!,
                                                                  productModelvIndex);
                                                          safeSetState(() {});
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_custom_action');
                                                          _model.internet =
                                                              await actions
                                                                  .checkInternetConnection();
                                                          if (_model.internet ==
                                                              true) {
                                                            logFirebaseEvent(
                                                                'Button_haptic_feedback');
                                                            HapticFeedback
                                                                .heavyImpact();
                                                            logFirebaseEvent(
                                                                'Button_backend_call');
                                                            _model.addtocart =
                                                                await QuickartGroup
                                                                    .addToCartCall
                                                                    .call(
                                                              userid:
                                                                  FFAppState()
                                                                      .userID,
                                                              storeid:
                                                                  FFAppState()
                                                                      .storeID,
                                                              deviceid:
                                                                  FFAppState()
                                                                      .deviceID,
                                                              qty: functions
                                                                  .addRemoveQTY(
                                                                      getJsonField(
                                                                        productModelvItem,
                                                                        r'''$.cart_qty''',
                                                                      ),
                                                                      'remove'),
                                                              varientid:
                                                                  getJsonField(
                                                                productModelvItem,
                                                                r'''$.varient_id''',
                                                              ).toString(),
                                                              platform: isiOS
                                                                  ? 'ios'
                                                                  : 'android',
                                                            );

                                                            if ((_model
                                                                    .addtocart
                                                                    ?.succeeded ??
                                                                true)) {
                                                              logFirebaseEvent(
                                                                  'Button_update_app_state');
                                                              FFAppState()
                                                                      .isCartShow =
                                                                  false;
                                                              FFAppState()
                                                                      .cartTotalCount =
                                                                  QuickartGroup
                                                                      .addToCartCall
                                                                      .totalItems(
                                                                (_model.addtocart
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!;
                                                              FFAppState()
                                                                      .cartSavingPrice =
                                                                  functions.stringToDouble(QuickartGroup
                                                                      .addToCartCall
                                                                      .savingPrice(
                                                                        (_model.addtocart?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toString());
                                                              FFAppState()
                                                                      .cartTotalPrice =
                                                                  functions.stringToDouble(QuickartGroup
                                                                      .addToCartCall
                                                                      .totalPrice(
                                                                        (_model.addtocart?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toString());
                                                              FFAppState()
                                                                      .refreshTrigger =
                                                                  true;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              logFirebaseEvent(
                                                                  'Button_google_analytics_event');
                                                              logFirebaseEvent(
                                                                'Remove From Cart',
                                                                parameters: {
                                                                  'API Name':
                                                                      'Add To Cart',
                                                                },
                                                              );
                                                              logFirebaseEvent(
                                                                  'Button_custom_action');
                                                              await actions
                                                                  .facebookEventClass(
                                                                getJsonField(
                                                                  productModelvItem,
                                                                  r'''$.varient_id''',
                                                                ).toString(),
                                                                getJsonField(
                                                                  productModelvItem,
                                                                  r'''$.product_name''',
                                                                ).toString(),
                                                                'product',
                                                                functions
                                                                    .stringToDouble(
                                                                        getJsonField(
                                                                  productModelvItem,
                                                                  r'''$.price''',
                                                                ).toString()),
                                                                getJsonField(
                                                                      productModelvItem,
                                                                      r'''$.cart_qty''',
                                                                    ) +
                                                                    1,
                                                                functions
                                                                    .stringToDouble(
                                                                        getJsonField(
                                                                  productModelvItem,
                                                                  r'''$.mrp''',
                                                                ).toString()),
                                                                'remove',
                                                                FFAppState()
                                                                    .emptyJson,
                                                                'emptyjons',
                                                                ' ',
                                                                ' ',
                                                                ' ',
                                                                ' ',
                                                              );
                                                              logFirebaseEvent(
                                                                  'Button_wait__delay');
                                                              await Future
                                                                  .delayed(
                                                                Duration(
                                                                  milliseconds:
                                                                      1000,
                                                                ),
                                                              );
                                                              logFirebaseEvent(
                                                                  'Button_update_component_state');
                                                              _model.productJson =
                                                                  functions.updateQtyPlusMinus(
                                                                      _model
                                                                          .productJson!,
                                                                      productModelvIndex,
                                                                      'remove',
                                                                      0);
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Button_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    getJsonField(
                                                                      (_model.addtocart
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.message''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
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
                                                                          .primaryPurpleE4D8F5,
                                                                ),
                                                              );
                                                            }
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Button_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  FFAppConstants
                                                                      .internetString,
                                                                  style:
                                                                      TextStyle(
                                                                    color: FFAppConstants
                                                                        .indigoColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        15.0,
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
                                                          }
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      text: '-',
                                                      options: FFButtonOptions(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FFAppConstants
                                                            .calculatorColor,
                                                        textStyle:
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
                                                                      .whiteColor,
                                                                  fontSize:
                                                                      20.0,
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
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  5.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 30.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: FFAppConstants
                                                            .whiteColor,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            productModelvItem,
                                                            r'''$.total_cart_qty''',
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
                                                                          .bold,
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
                                                                        .bold,
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
                                                            0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) =>
                                                          FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'PRODUCT_G_V_COMP__BTN_ON_TAP');
                                                          if (functions
                                                                  .checkVariantFeatureCondition(
                                                                      productModelvItem) ==
                                                              true) {
                                                            logFirebaseEvent(
                                                                'Button_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      VarientBotttomSheetWidget(
                                                                    productModel:
                                                                        productModelvItem,
                                                                    cartType:
                                                                        'daily',
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(() =>
                                                                    _model.returnjson6 =
                                                                        value));

                                                            logFirebaseEvent(
                                                                'Button_update_component_state');
                                                            _model.productJson =
                                                                functions.updateSelectedIndexData(
                                                                    _model
                                                                        .productJson!,
                                                                    _model
                                                                        .returnjson6!,
                                                                    productModelvIndex);
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Button_custom_action');
                                                            _model.network =
                                                                await actions
                                                                    .checkInternetConnection();
                                                            if (getJsonField(
                                                                  productModelvItem,
                                                                  r'''$.stock''',
                                                                ) ==
                                                                getJsonField(
                                                                  productModelvItem,
                                                                  r'''$.cart_qty''',
                                                                )) {
                                                              logFirebaseEvent(
                                                                  'Button_alert_dialog');
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        CustomAlertDailogWidget(
                                                                      des: FFAppConstants
                                                                          .noStock,
                                                                      height:
                                                                          150.0,
                                                                      title: "",
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              if (_model
                                                                      .network ==
                                                                  true) {
                                                                logFirebaseEvent(
                                                                    'Button_haptic_feedback');
                                                                HapticFeedback
                                                                    .heavyImpact();
                                                                logFirebaseEvent(
                                                                    'Button_backend_call');
                                                                _model.cartadd =
                                                                    await QuickartGroup
                                                                        .addToCartCall
                                                                        .call(
                                                                  userid:
                                                                      FFAppState()
                                                                          .userID,
                                                                  qty: functions
                                                                      .addRemoveQTY(
                                                                          getJsonField(
                                                                            productModelvItem,
                                                                            r'''$.cart_qty''',
                                                                          ),
                                                                          'add'),
                                                                  storeid:
                                                                      FFAppState()
                                                                          .storeID,
                                                                  varientid:
                                                                      getJsonField(
                                                                    productModelvItem,
                                                                    r'''$.varient_id''',
                                                                  ).toString(),
                                                                  deviceid:
                                                                      FFAppState()
                                                                          .deviceID,
                                                                  itemPrice:
                                                                      getJsonField(
                                                                    productModelvItem,
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  itemName:
                                                                      getJsonField(
                                                                    productModelvItem,
                                                                    r'''$.product_name''',
                                                                  ).toString(),
                                                                  platform: isiOS
                                                                      ? 'ios'
                                                                      : 'android',
                                                                );

                                                                if ((_model
                                                                        .cartadd
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  if (FFAppConstants
                                                                          .checkStatus ==
                                                                      getJsonField(
                                                                        (_model.cartadd?.jsonBody ??
                                                                            ''),
                                                                        r'''$.status''',
                                                                      ).toString()) {
                                                                    logFirebaseEvent(
                                                                        'Button_update_app_state');
                                                                    FFAppState()
                                                                            .isCartShow =
                                                                        false;
                                                                    FFAppState()
                                                                            .cartTotalCount =
                                                                        QuickartGroup
                                                                            .addToCartCall
                                                                            .totalItems(
                                                                      (_model.cartadd
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!;
                                                                    FFAppState()
                                                                            .cartSavingPrice =
                                                                        functions.stringToDouble(QuickartGroup
                                                                            .addToCartCall
                                                                            .savingPrice(
                                                                              (_model.cartadd?.jsonBody ?? ''),
                                                                            )!
                                                                            .toString());
                                                                    FFAppState()
                                                                            .cartTotalPrice =
                                                                        functions.stringToDouble(QuickartGroup
                                                                            .addToCartCall
                                                                            .totalPrice(
                                                                              (_model.cartadd?.jsonBody ?? ''),
                                                                            )!
                                                                            .toString());
                                                                    FFAppState()
                                                                            .refreshTrigger =
                                                                        true;
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    logFirebaseEvent(
                                                                        'Button_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                      'Add To Cart',
                                                                      parameters: {
                                                                        'API Name':
                                                                            'Add To Cart',
                                                                      },
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Button_custom_action');
                                                                    await actions
                                                                        .facebookEventClass(
                                                                      getJsonField(
                                                                        productModelvItem,
                                                                        r'''$.varient_id''',
                                                                      ).toString(),
                                                                      getJsonField(
                                                                        productModelvItem,
                                                                        r'''$.product_name''',
                                                                      ).toString(),
                                                                      'product',
                                                                      functions
                                                                          .stringToDouble(
                                                                              getJsonField(
                                                                        productModelvItem,
                                                                        r'''$.price''',
                                                                      ).toString()),
                                                                      getJsonField(
                                                                            productModelvItem,
                                                                            r'''$.cart_qty''',
                                                                          ) +
                                                                          1,
                                                                      functions
                                                                          .stringToDouble(
                                                                              getJsonField(
                                                                        productModelvItem,
                                                                        r'''$.mrp''',
                                                                      ).toString()),
                                                                      'add',
                                                                      FFAppState()
                                                                          .emptyJson,
                                                                      'emptyjons',
                                                                      ' ',
                                                                      ' ',
                                                                      ' ',
                                                                      ' ',
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Button_wait__delay');
                                                                    await Future
                                                                        .delayed(
                                                                      Duration(
                                                                        milliseconds:
                                                                            1000,
                                                                      ),
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'Button_update_component_state');
                                                                    _model.productJson = functions.updateQtyPlusMinus(
                                                                        _model
                                                                            .productJson!,
                                                                        productModelvIndex,
                                                                        'add',
                                                                        0);
                                                                    safeSetState(
                                                                        () {});
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
                                                                            (_model.cartadd?.jsonBody ??
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
                                                                                12.0,
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
                                                                      'Button_show_snack_bar');
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        getJsonField(
                                                                          (_model.cartadd?.jsonBody ??
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
                                                                              12.0,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              4000),
                                                                      backgroundColor:
                                                                          FFAppConstants
                                                                              .primaryPurpleE4D8F5,
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
                                                                          TextStyle(
                                                                        color: FFAppConstants
                                                                            .indigoColor,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            15.0,
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
                                                            }
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text: '+',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FFAppConstants
                                                              .calculatorColor,
                                                          textStyle:
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
                                                                        .whiteColor,
                                                                    fontSize:
                                                                        20.0,
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
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    5.0),
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
                                      }
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (functions.checkVariantsWithStock(getJsonField(
                              productModelvItem,
                              r'''$.varients''',
                            )) ==
                            true)
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              height: ((getJsonField(
                                            productModelvItem,
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
                                      (FFAppConstants.stockNotify ==
                                          getJsonField(
                                            productModelvItem,
                                            r'''$.vareints[0].stock''',
                                          ).toString())
                                  ? 0.0
                                  : 85.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              productModelvItem,
                                              r'''$.product_name''',
                                            ).toString().maybeHandleOverflow(
                                                  maxChars: 40,
                                                  replacement: '…',
                                                ),
                                            maxLines: 2,
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
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 3.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  productModelvItem,
                                                  r'''$.quantity''',
                                                ).toString(),
                                                textAlign: TextAlign.start,
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
                                                              .lightBlack7a7a7a,
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
                                            Text(
                                              getJsonField(
                                                productModelvItem,
                                                r'''$.unit''',
                                              ).toString(),
                                              textAlign: TextAlign.start,
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
                                                        .lightBlack7a7a7a,
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
                                          ],
                                        ),
                                      ),
                                      if ((getJsonField(
                                            productModelvItem,
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
                                              .length >=
                                          2)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PRODUCT_G_V_COMP_Row_ncmys7q4_ON_TAP');
                                            logFirebaseEvent(
                                                'Row_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      VarientBotttomSheetWidget(
                                                    productModel:
                                                        productModelvItem,
                                                    cartType: 'daily',
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.returnJson11 = value));

                                            logFirebaseEvent(
                                                'Row_update_component_state');
                                            _model.productJson = functions
                                                .updateSelectedIndexData(
                                                    _model.productJson!,
                                                    _model.returnjson4!,
                                                    productModelvIndex);
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if ((getJsonField(
                                                    productModelvItem,
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
                                                      .length >=
                                                  2)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(1.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '${(getJsonField(
                                                        productModelvItem,
                                                        r'''$.varients''',
                                                      ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>).withoutNulls?.length?.toString()} options',
                                                      textAlign:
                                                          TextAlign.start,
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
                                                                .indigoColor,
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
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        1.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  size: 18.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(
                                              -0.79, -0.97),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'AED ',
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
                                                          color:
                                                              Color(0xFF0A0A0A),
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
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      functions.setDecimalValue(
                                                          getJsonField(
                                                        productModelvItem,
                                                        r'''$.price''',
                                                      ).toString()),
                                                      '0',
                                                    ),
                                                    style: TextStyle(
                                                      color: FFAppConstants
                                                          .blackColor0A0A0A,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 13.0,
                                                    ),
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF0A0A0A),
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
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (getJsonField(
                                                        productModelvItem,
                                                        r'''$.price''',
                                                      ) !=
                                                      getJsonField(
                                                        productModelvItem,
                                                        r'''$.mrp''',
                                                      )) {
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'AED',
                                                          textAlign:
                                                              TextAlign.start,
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
                                                                    .lightBlack7a7a7a,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
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
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .setDecimalValue(
                                                                      getJsonField(
                                                                productModelvItem,
                                                                r'''$.mrp''',
                                                              ).toString()),
                                                              '0',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
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
                                                                      .lightBlack7a7a7a,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: 1.0,
                                                      height: 1.0,
                                                      decoration: BoxDecoration(
                                                        color: FFAppConstants
                                                            .whiteColor,
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
                                ],
                              ),
                            ),
                          ),
                        if (((getJsonField(
                                  productModelvItem,
                                  r'''$.varients''',
                                )
                                            .toList()
                                            .map<ProductCountStruct?>(
                                                ProductCountStruct.maybeFromMap)
                                            .toList()
                                        as Iterable<ProductCountStruct?>)
                                    .withoutNulls
                                    ?.length ==
                                1) &&
                            (FFAppConstants.stockNotify ==
                                getJsonField(
                                  productModelvItem,
                                  r'''$.varients[0].stock''',
                                ).toString()))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: FFAppConstants.greyBgd6d2d3,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 2.0, 5.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.37,
                                          height: 32.0,
                                          decoration: BoxDecoration(),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  productModelvItem,
                                                  r'''$.product_name''',
                                                )
                                                    .toString()
                                                    .maybeHandleOverflow(
                                                      maxChars: 40,
                                                      replacement: '…',
                                                    ),
                                                maxLines: 2,
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
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 3.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                productModelvItem,
                                                r'''$.quantity''',
                                              ).toString(),
                                              textAlign: TextAlign.start,
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
                                                    color: Color(0xFF7A7A7A),
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
                                          Text(
                                            getJsonField(
                                              productModelvItem,
                                              r'''$.unit''',
                                            ).toString(),
                                            textAlign: TextAlign.start,
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
                                                  color: Color(0xFF7A7A7A),
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
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 2.0, 0.0, 0.0),
                                        child: Text(
                                          FFAppConstants.unavailable,
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
                                                fontSize: 10.0,
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
                                          5.0, 2.0, 0.0, 2.0),
                                      child: Text(
                                        FFAppConstants.notifyMe ==
                                                getJsonField(
                                                  productModelvItem,
                                                  r'''$.notify_me''',
                                                ).toString()
                                            ? FFAppConstants.notified
                                            : 'You will be notified.',
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
                                              fontSize: 8.0,
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
                                if (FFAppConstants.stockNotify ==
                                    getJsonField(
                                      productModelvItem,
                                      r'''$.stock''',
                                    ).toString())
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Builder(
                                      builder: (context) {
                                        if (FFAppConstants.notifyMe ==
                                            getJsonField(
                                              productModelvItem,
                                              r'''$.notify_me''',
                                            ).toString()) {
                                          return FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 46.0,
                                            icon: Icon(
                                              Icons.notifications_none,
                                              color: FFAppConstants
                                                  .blackColor0A0A0A,
                                              size: 25.0,
                                            ),
                                            showLoadingIndicator: true,
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'PRODUCT_G_V_notifications_none_ICN_ON_TA');
                                              logFirebaseEvent(
                                                  'IconButton_custom_action');
                                              _model.connnectivtyC =
                                                  await actions
                                                      .checkInternetConnection();
                                              if (_model.connnectivtyC ==
                                                  true) {
                                                logFirebaseEvent(
                                                    'IconButton_haptic_feedback');
                                                HapticFeedback.mediumImpact();
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');
                                                _model.apiResultb11 =
                                                    await QuickartGroup
                                                        .addnotifymeCall
                                                        .call(
                                                  productID: getJsonField(
                                                    productModelvItem,
                                                    r'''$.product_id''',
                                                  ).toString(),
                                                  varientID: getJsonField(
                                                    productModelvItem,
                                                    r'''$.varient_id''',
                                                  ).toString(),
                                                  userID: FFAppState().userID,
                                                  platform:
                                                      FFAppState().platform,
                                                  fcmToken:
                                                      FFAppState().fcmToken,
                                                );

                                                if ((_model.apiResultb11
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'IconButton_update_component_state');
                                                  _model.productJson =
                                                      functions.updateNotifyme(
                                                          'add',
                                                          widget!.productModel!,
                                                          productModelvIndex);
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'IconButton_update_app_state');

                                                  _model.updatePage(() {});
                                                } else {
                                                  logFirebaseEvent(
                                                      'IconButton_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.apiResultb11
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.message''',
                                                        ).toString(),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 1000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .blackColor666666,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'IconButton_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      FFAppConstants
                                                          .internetString,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 1000),
                                                    backgroundColor:
                                                        FFAppConstants
                                                            .blackColor666666,
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                          );
                                        } else {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 2.0, 0.0),
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
                                                        'PRODUCT_G_V_CircleImage_7xtrsz78_ON_TAP');
                                                    logFirebaseEvent(
                                                        'CircleImage_navigate_to');

                                                    context.pushNamed(
                                                        NotifyProductsListScreenWidget
                                                            .routeName);
                                                  },
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/notifyme.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              if (FFAppConstants.percentageCheck <
                                  getJsonField(
                                    productModelvItem,
                                    r'''$.discountper''',
                                  )) {
                                return Container(
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FFAppConstants.green44AC20,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 2.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFAppConstants
                                                          .discountperdouble >
                                                      getJsonField(
                                                        productModelvItem,
                                                        r'''$.discountper''',
                                                      )
                                                  ? functions
                                                      .setDecimalValueWithCount(
                                                          getJsonField(
                                                            productModelvItem,
                                                            r'''$.discountper''',
                                                          ).toString(),
                                                          0,
                                                          true)
                                                  : functions
                                                      .setDecimalValueWithCount(
                                                          getJsonField(
                                                            productModelvItem,
                                                            r'''$.discountper''',
                                                          ).toString(),
                                                          0,
                                                          true),
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
                                                    color: Colors.white,
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
                                            TextSpan(
                                              text: '% OFF',
                                              style: TextStyle(
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
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  height: 10.0,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    '\n',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 15.0,
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
                                );
                              }
                            },
                          ),
                          if (FFAppState().nullValue !=
                              getJsonField(
                                productModelvItem,
                                r'''$.country_icon''',
                              ).toString())
                            Container(
                              width: 29.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F6F4),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppConstants.percentageCheck <
                                            getJsonField(
                                              productModelvItem,
                                              r'''$.discountper''',
                                            )
                                        ? 0.0
                                        : 8.0,
                                    0.0,
                                  )),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: Color(0xFFDCE9D8),
                                  width: 1.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        Duration(milliseconds: 500),
                                    imageUrl: getJsonField(
                                      productModelvItem,
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
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 25.0, 3.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if ((getJsonField(
                                      productModelvItem,
                                      r'''$.feature_tags''',
                                    ) !=
                                    null) &&
                                ((getJsonField(
                                      productModelvItem,
                                      r'''$.feature_tags''',
                                    )
                                                .toList()
                                                .map<ProductCountStruct?>(
                                                    ProductCountStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<ProductCountStruct?>)
                                        .withoutNulls
                                        .length >
                                    FFAppConstants.zeroValue)) {
                              return Container(
                                width: 30.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final featureTag = getJsonField(
                                      productModelvItem,
                                      r'''$.feature_tags''',
                                    ).toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      reverse: true,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: featureTag.length,
                                      itemBuilder: (context, featureTagIndex) {
                                        final featureTagItem =
                                            featureTag[featureTagIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 2.0),
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
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Builder(
                        builder: (context) {
                          if (FFAppConstants.isFavourite ==
                              getJsonField(
                                productModelvItem,
                                r'''$.isFavourite''',
                              ).toString()) {
                            return Container(
                              width: 35.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F6F4),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                border: Border.all(
                                  color: Color(0xFFDCE9D8),
                                  width: 1.0,
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PRODUCT_G_V_COMP_Icon1_ON_TAP');
                                  logFirebaseEvent('Icon1_custom_action');
                                  _model.connectivityResult =
                                      await actions.checkInternetConnection();
                                  if (_model.connectivityResult == true) {
                                    logFirebaseEvent('Icon1_haptic_feedback');
                                    HapticFeedback.mediumImpact();
                                    logFirebaseEvent('Icon1_backend_call');
                                    _model.addRemoveAPIResponse =
                                        await QuickartGroup.addremwishlistCall
                                            .call(
                                      userid: FFAppState().userID,
                                      storeID: FFAppState().storeID,
                                      varientID: getJsonField(
                                        productModelvItem,
                                        r'''$.varient_id''',
                                      ).toString(),
                                      deviceid: FFAppState().deviceID,
                                      platform: isiOS ? 'ios' : 'android',
                                    );

                                    if ((_model
                                            .addRemoveAPIResponse?.succeeded ??
                                        true)) {
                                      logFirebaseEvent(
                                          'Icon1_update_app_state');

                                      FFAppState().update(() {});
                                      logFirebaseEvent(
                                          'Icon1_google_analytics_event');
                                      logFirebaseEvent(
                                        'Remove From Favourites',
                                        parameters: {
                                          'API Name': 'Add Remove Wishlist',
                                        },
                                      );
                                      logFirebaseEvent('Icon1_custom_action');
                                      await actions.facebookEventClass(
                                        getJsonField(
                                          productModelvItem,
                                          r'''$.varient_id''',
                                        ).toString(),
                                        getJsonField(
                                          productModelvItem,
                                          r'''$.product_name''',
                                        ).toString(),
                                        'remove',
                                        getJsonField(
                                          productModelvItem,
                                          r'''$.price''',
                                        ),
                                        0,
                                        0.0,
                                        'wishList',
                                        FFAppState().emptyJson,
                                        'c',
                                        ' ',
                                        ' ',
                                        ' ',
                                        ' ',
                                      );
                                      logFirebaseEvent(
                                          'Icon1_update_component_state');
                                      _model.productJson =
                                          functions.updateQtyPlusMinus(
                                              _model.productJson!,
                                              productModelvIndex,
                                              'removeWish',
                                              0);
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent('Icon1_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.addRemoveAPIResponse
                                                      ?.jsonBody ??
                                                  ''),
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
                                          backgroundColor: FFAppConstants
                                              .primaryPurpleE4D8F5,
                                        ),
                                      );
                                    }
                                  } else {
                                    logFirebaseEvent('Icon1_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFAppConstants.internetString,
                                          style: GoogleFonts.montserrat(
                                            color:
                                                FFAppConstants.blackColor0A0A0A,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FFAppConstants.NeutralBlack50Color,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.favorite_sharp,
                                  color: FFAppConstants.redNotifyWish,
                                  size: 30.0,
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              width: 35.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F6F4),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                border: Border.all(
                                  color: Color(0xFFDCE9D8),
                                  width: 1.0,
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PRODUCT_G_V_COMP_Icon2_ON_TAP');
                                  logFirebaseEvent('Icon2_custom_action');
                                  _model.connectivityResult1 =
                                      await actions.checkInternetConnection();
                                  if (_model.connectivityResult1 == true) {
                                    logFirebaseEvent('Icon2_haptic_feedback');
                                    HapticFeedback.mediumImpact();
                                    logFirebaseEvent('Icon2_backend_call');
                                    _model.addRemoveAPIResult =
                                        await QuickartGroup.addremwishlistCall
                                            .call(
                                      userid: FFAppState().userID,
                                      storeID: FFAppState().storeID,
                                      varientID: getJsonField(
                                        productModelvItem,
                                        r'''$.varient_id''',
                                      ).toString(),
                                      deviceid: FFAppState().deviceID,
                                      platform: isiOS ? 'ios' : 'android',
                                    );

                                    if ((_model.addRemoveAPIResult?.succeeded ??
                                        true)) {
                                      logFirebaseEvent(
                                          'Icon2_update_app_state');

                                      FFAppState().update(() {});
                                      logFirebaseEvent('Icon2_custom_action');
                                      await actions.facebookEventClass(
                                        getJsonField(
                                          productModelvItem,
                                          r'''$.varient_id''',
                                        ).toString(),
                                        getJsonField(
                                          productModelvItem,
                                          r'''$.product_name''',
                                        ).toString(),
                                        'add',
                                        getJsonField(
                                          productModelvItem,
                                          r'''$.price''',
                                        ),
                                        0,
                                        0.0,
                                        'wishList',
                                        FFAppState().emptyJson,
                                        'c',
                                        ' ',
                                        ' ',
                                        ' ',
                                        ' ',
                                      );
                                      logFirebaseEvent(
                                          'Icon2_update_component_state');
                                      _model.productJson =
                                          functions.updateQtyPlusMinus(
                                              _model.productJson!,
                                              productModelvIndex,
                                              'addWish',
                                              0);
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Icon2_google_analytics_event');
                                      logFirebaseEvent(
                                        'Add To Favourites',
                                        parameters: {
                                          'API Name': 'Add Remove Wishlist',
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent('Icon2_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.addRemoveAPIResult
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ).toString(),
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
                                  } else {
                                    logFirebaseEvent('Icon2_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFAppConstants.internetString,
                                          style: GoogleFonts.montserrat(
                                            color:
                                                FFAppConstants.blackColor0A0A0A,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FFAppConstants.NeutralBlack50Color,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.favorite_border,
                                  color: FFAppConstants.redNotifyWish,
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
        );
      },
    );
  }
}
