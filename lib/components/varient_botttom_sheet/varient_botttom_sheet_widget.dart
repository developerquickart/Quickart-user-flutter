import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
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
import 'varient_botttom_sheet_model.dart';
export 'varient_botttom_sheet_model.dart';

class VarientBotttomSheetWidget extends StatefulWidget {
  const VarientBotttomSheetWidget({
    super.key,
    required this.productModel,
    required this.cartType,
  });

  final dynamic productModel;
  final String? cartType;

  @override
  State<VarientBotttomSheetWidget> createState() =>
      _VarientBotttomSheetWidgetState();
}

class _VarientBotttomSheetWidgetState extends State<VarientBotttomSheetWidget> {
  late VarientBotttomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VarientBotttomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VARIENT_BOTTTOM_SHEET_VarientBotttomShee');
      logFirebaseEvent('VarientBotttomSheet_update_component_sta');
      _model.productJson = widget!.productModel;
      _model.itemTotalAmt = functions.calculateVariantTotals(
          _model.productJson!, widget!.cartType!);
      _model.varientIDs = functions
          .getVarientIdsWithCartQty(
              getJsonField(
                widget!.productModel,
                r'''$.varients''',
              ),
              widget!.cartType == 'daily' ? 'daily' : 'sub')
          .toList()
          .cast<dynamic>();
      _model.isFeaturesSelected = (functions.getProductFeatureId(getJsonField(
                    _model.productJson,
                    r'''$.varients''',
                  )) ==
                  0) &&
              ((getJsonField(
                        _model.productJson,
                        r'''$.features''',
                      ) !=
                      null) &&
                  ((getJsonField(
                        _model.productJson,
                        r'''$.features''',
                      )
                              .toList()
                              .map<ProductCountStruct?>(
                                  ProductCountStruct.maybeFromMap)
                              .toList() as Iterable<ProductCountStruct?>)
                          .withoutNulls
                          .length >
                      0))
          ? getJsonField(
              _model.productJson,
              r'''$.features[0].id''',
            )
          : functions.getProductFeatureId(getJsonField(
              _model.productJson,
              r'''$.varients''',
            ));
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

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0x8514181B),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('VARIENT_BOTTTOM_SHEET_Icon_bewi847h_ON_T');
                logFirebaseEvent('Icon_bottom_sheet');
                Navigator.pop(context, _model.productJson);
                logFirebaseEvent('Icon_update_component_state');

                _model.updatePage(() {});
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: SafeArea(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: (((getJsonField(
                              _model.productJson,
                              r'''$.varients''',
                            )
                                    .toList()
                                    .map<ProductCountStruct?>(
                                        ProductCountStruct.maybeFromMap)
                                    .toList() as Iterable<ProductCountStruct?>)
                                .withoutNulls
                                .length *
                            100) +
                        50 +
                        30 +
                        ((getJsonField(
                                      _model.productJson,
                                      r'''$.features''',
                                    ) !=
                                    null) &&
                                ((getJsonField(
                                      _model.productJson,
                                      r'''$.features''',
                                    )
                                                .toList()
                                                .map<ProductCountStruct?>(
                                                    ProductCountStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<ProductCountStruct?>)
                                        .withoutNulls
                                        .length >
                                    0)
                            ? 130
                            : 0))
                    .toDouble(),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            getJsonField(
                              widget!.productModel,
                              r'''$.product_name''',
                            ).toString().maybeHandleOverflow(
                                  maxChars: 35,
                                  replacement: '…',
                                ),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FFAppConstants.blackColor0A0A0A,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final productDetail = getJsonField(
                                _model.productJson,
                                r'''$.varients''',
                              ).toList();

                              return ListView.separated(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  2.0,
                                  0,
                                  0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: productDetail.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.0),
                                itemBuilder: (context, productDetailIndex) {
                                  final productDetailItem =
                                      productDetail[productDetailIndex];
                                  return Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Container(
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FFAppConstants.whiteColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0),
                                        ),
                                        border: Border.all(
                                          color: Color(0xFFCECACA),
                                          width: 0.7,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
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
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FFAppConstants
                                                              .productBgClr,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            getJsonField(
                                                              productDetailItem,
                                                              r'''$.product_image''',
                                                            ).toString(),
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
                                                            fit: BoxFit.contain,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
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
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width -
                                                        150,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
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
                                                                    2.0,
                                                                    0.0),
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
                                                                          productDetailItem,
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
                                                                              fontSize: 14.0,
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
                                                                          productDetailItem,
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -0.79,
                                                                            -0.97),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          7.0,
                                                                          0.0,
                                                                          7.0),
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
                                                                                    color: FFAppConstants.blackColor0A0A0A,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                functions.setDecimalValue(getJsonField(
                                                                                  productDetailItem,
                                                                                  r'''$.price''',
                                                                                ).toString()),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.montserrat(
                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 14.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (getJsonField(
                                                                              productDetailItem,
                                                                              r'''$.price''',
                                                                            ) !=
                                                                            getJsonField(
                                                                              productDetailItem,
                                                                              r'''$.mrp''',
                                                                            )) {
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      decoration: TextDecoration.lineThrough,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  functions.setDecimalValue(getJsonField(
                                                                                    productDetailItem,
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
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      decoration: TextDecoration.lineThrough,
                                                                                    ),
                                                                              ),
                                                                            ],
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
                                                                  ),
                                                                ],
                                                              ),
                                                              if (FFAppConstants
                                                                      .stockNotify !=
                                                                  getJsonField(
                                                                    productDetailItem,
                                                                    r'''$.stock''',
                                                                  ).toString())
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          if ((FFAppConstants.quickAvailability ==
                                                                                  getJsonField(
                                                                                    widget!.productModel,
                                                                                    r'''$.availability''',
                                                                                  ).toString()) ||
                                                                              (FFAppConstants.allAvailability ==
                                                                                  getJsonField(
                                                                                    widget!.productModel,
                                                                                    r'''$.availability''',
                                                                                  ).toString()))
                                                                            Builder(
                                                                              builder: (context) {
                                                                                if (FFAppState().qtyZeroCheck ==
                                                                                    ((String cartType, int var2, int var3) {
                                                                                      return cartType.toLowerCase() == "daily" ? var2 : var3;
                                                                                    }(
                                                                                        widget!.cartType!,
                                                                                        getJsonField(
                                                                                          productDetailItem,
                                                                                          r'''$.cart_qty''',
                                                                                        ),
                                                                                        getJsonField(
                                                                                          productDetailItem,
                                                                                          r'''$.subcartQty''',
                                                                                        )))) {
                                                                                  return Align(
                                                                                    alignment: AlignmentDirectional(1.0, 1.0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        logFirebaseEvent('VARIENT_BOTTTOM_SHEET_ADD_BTN_ON_TAP');
                                                                                        if (widget!.cartType == 'daily') {
                                                                                          logFirebaseEvent('Button_custom_action');
                                                                                          _model.networkCheck = await actions.checkInternetConnection();
                                                                                          if (_model.networkCheck == true) {
                                                                                            logFirebaseEvent('Button_haptic_feedback');
                                                                                            HapticFeedback.heavyImpact();
                                                                                            logFirebaseEvent('Button_backend_call');
                                                                                            _model.addtoCart = await QuickartGroup.addToCartCall.call(
                                                                                              userid: FFAppState().userID,
                                                                                              qty: '1',
                                                                                              storeid: FFAppState().storeID,
                                                                                              varientid: getJsonField(
                                                                                                productDetailItem,
                                                                                                r'''$.varient_id''',
                                                                                              ).toString(),
                                                                                              deviceid: FFAppState().deviceID,
                                                                                              itemPrice: getJsonField(
                                                                                                productDetailItem,
                                                                                                r'''$.price''',
                                                                                              ).toString(),
                                                                                              itemName: getJsonField(
                                                                                                widget!.productModel,
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
                                                                                                logFirebaseEvent('Button_update_component_state');
                                                                                                _model.productJson = functions.updateQtyPlusMinus(_model.productJson!, productDetailIndex, 'add1', _model.isFeaturesSelected);
                                                                                                _model.itemTotalAmt = functions.calculateVariantTotals(_model.productJson!, widget!.cartType!);
                                                                                                _model.varientIDs = functions
                                                                                                    .getVarientIdsWithCartQty(
                                                                                                        getJsonField(
                                                                                                          _model.productJson,
                                                                                                          r'''$.varients''',
                                                                                                        ),
                                                                                                        'daily')
                                                                                                    .toList()
                                                                                                    .cast<dynamic>();
                                                                                                safeSetState(() {});
                                                                                                logFirebaseEvent('Button_backend_call');
                                                                                                _model.apiResult21i = await QuickartGroup.updatecartCall.call(
                                                                                                  userID: FFAppState().userID,
                                                                                                  storeID: FFAppState().storeID,
                                                                                                  varientIDJson: _model.varientIDs,
                                                                                                  productFeatureID: _model.isFeaturesSelected.toString(),
                                                                                                );

                                                                                                if ((_model.apiResult21i?.succeeded ?? true)) {
                                                                                                  logFirebaseEvent('Button_custom_action');
                                                                                                  await actions.facebookEventClass(
                                                                                                    getJsonField(
                                                                                                      productDetailItem,
                                                                                                      r'''$.varient_id''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      widget!.productModel,
                                                                                                      r'''$.product_name''',
                                                                                                    ).toString(),
                                                                                                    'product',
                                                                                                    getJsonField(
                                                                                                      productDetailItem,
                                                                                                      r'''$.price''',
                                                                                                    ),
                                                                                                    1,
                                                                                                    getJsonField(
                                                                                                      productDetailItem,
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
                                                                                                } else {
                                                                                                  logFirebaseEvent('Button_show_snack_bar');
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        QuickartGroup.updatecartCall.message(
                                                                                                          (_model.apiResult21i?.jsonBody ?? ''),
                                                                                                        )!,
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
                                                                                        } else {
                                                                                          logFirebaseEvent('Button_custom_action');
                                                                                          _model.isInternet3 = await actions.checkInternetConnection();
                                                                                          if (_model.isInternet3 == true) {
                                                                                            logFirebaseEvent('Button_backend_call');
                                                                                            _model.apiResultco3 = await QuickartGroup.addtosubcartCall.call(
                                                                                              userid: FFAppState().userID,
                                                                                              qty: '1',
                                                                                              storeid: FFAppState().storeID,
                                                                                              varientid: getJsonField(
                                                                                                productDetailItem,
                                                                                                r'''$.varient_id''',
                                                                                              ).toString(),
                                                                                              deviceid: FFAppState().deviceID,
                                                                                              repeatOrder: functions.getRepeatdays(FFAppState().isSunSelected, FFAppState().isMonSelected, FFAppState().isTueSelected, FFAppState().isWedSelected, FFAppState().isThuSelected, FFAppState().isFriSelected, FFAppState().isSatSelected),
                                                                                              timeSlot: FFAppState().isDeliveryTimeSlotSelected,
                                                                                              itemName: getJsonField(
                                                                                                widget!.productModel,
                                                                                                r'''$.product_name''',
                                                                                              ).toString(),
                                                                                              itemPrice: functions.setDecimalValue(getJsonField(
                                                                                                productDetailItem,
                                                                                                r'''$.price''',
                                                                                              ).toString()),
                                                                                              platform: isiOS ? 'ios' : 'android',
                                                                                            );

                                                                                            if ((_model.apiResultco3?.succeeded ?? true)) {
                                                                                              logFirebaseEvent('Button_update_component_state');
                                                                                              _model.productJson = functions.updateQtyPlusMinus(_model.productJson!, productDetailIndex, 'addSub', _model.isFeaturesSelected);
                                                                                              _model.itemTotalAmt = functions.calculateVariantTotals(_model.productJson!, widget!.cartType!);
                                                                                              _model.varientIDs = functions
                                                                                                  .getVarientIdsWithCartQty(
                                                                                                      getJsonField(
                                                                                                        _model.productJson,
                                                                                                        r'''$.varients''',
                                                                                                      ),
                                                                                                      'sub')
                                                                                                  .toList()
                                                                                                  .cast<dynamic>();
                                                                                              safeSetState(() {});
                                                                                              logFirebaseEvent('Button_update_app_state');
                                                                                              FFAppState().isWedSelected = false;
                                                                                              FFAppState().isSunSelected = false;
                                                                                              FFAppState().isMonSelected = false;
                                                                                              FFAppState().isTueSelected = false;
                                                                                              FFAppState().isThuSelected = false;
                                                                                              FFAppState().isFriSelected = false;
                                                                                              FFAppState().isSatSelected = false;
                                                                                              FFAppState().categoryName = 'sub';
                                                                                              FFAppState().isWeekSelected = 0;
                                                                                              FFAppState().isSubcribeCartVisible = false;
                                                                                              FFAppState().isDeliveryTimeSlotSelected = 'no';
                                                                                              FFAppState().subCartTotalItem = QuickartGroup.addtosubcartCall.totalItems(
                                                                                                (_model.apiResultco3?.jsonBody ?? ''),
                                                                                              )!;
                                                                                              FFAppState().subCartTotalPrice = QuickartGroup.addtosubcartCall.totalPrice(
                                                                                                (_model.apiResultco3?.jsonBody ?? ''),
                                                                                              )!;
                                                                                              FFAppState().subCartSavingAmount = QuickartGroup.addtosubcartCall.savingPrice(
                                                                                                (_model.apiResultco3?.jsonBody ?? ''),
                                                                                              )!;
                                                                                              FFAppState().refreshTrigger = true;
                                                                                              safeSetState(() {});
                                                                                              logFirebaseEvent('Button_backend_call');
                                                                                              _model.apiResultupdateSubCart2 = await QuickartGroup.updatessubcartCall.call(
                                                                                                userID: FFAppState().userID,
                                                                                                storeID: FFAppState().storeID,
                                                                                                varientIDJson: _model.varientIDs,
                                                                                                productFeatureID: _model.isFeaturesSelected.toString(),
                                                                                              );

                                                                                              if ((_model.apiResultupdateSubCart2?.succeeded ?? true)) {
                                                                                                if (FFAppConstants.checkStatus ==
                                                                                                    QuickartGroup.updatessubcartCall.status(
                                                                                                      (_model.apiResultupdateSubCart2?.jsonBody ?? ''),
                                                                                                    )) {
                                                                                                  logFirebaseEvent('Button_custom_action');
                                                                                                  await actions.facebookEventClass(
                                                                                                    getJsonField(
                                                                                                      productDetailItem,
                                                                                                      r'''$.varient_id''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      _model.productJson,
                                                                                                      r'''$.product_name''',
                                                                                                    ).toString(),
                                                                                                    'subscription product',
                                                                                                    getJsonField(
                                                                                                      productDetailItem,
                                                                                                      r'''$.price''',
                                                                                                    ),
                                                                                                    1,
                                                                                                    getJsonField(
                                                                                                      productDetailItem,
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
                                                                                                  logFirebaseEvent('Button_google_analytics_event');
                                                                                                  logFirebaseEvent(
                                                                                                    'Navigation',
                                                                                                    parameters: {
                                                                                                      'Screen Name': 'Product Detail Screen',
                                                                                                      'Confirm': 'Confirm Subscription',
                                                                                                      'Navigate To': 'Subscription Cart Screen',
                                                                                                      'API Name': 'Add To SubCart',
                                                                                                    },
                                                                                                  );
                                                                                                } else {
                                                                                                  logFirebaseEvent('Button_show_snack_bar');
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        QuickartGroup.updatessubcartCall.message(
                                                                                                          (_model.apiResultupdateSubCart2?.jsonBody ?? ''),
                                                                                                        )!,
                                                                                                        style: GoogleFonts.montserrat(
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
                                                                                                      QuickartGroup.updatessubcartCall.message(
                                                                                                        (_model.apiResultupdateSubCart2?.jsonBody ?? ''),
                                                                                                      )!,
                                                                                                      style: GoogleFonts.montserrat(
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
                                                                                                    getJsonField(
                                                                                                      (_model.apiResultco3?.jsonBody ?? ''),
                                                                                                      r'''$.message''',
                                                                                                    ).toString(),
                                                                                                    style: GoogleFonts.montserrat(
                                                                                                      color: FFAppConstants.blackColor0A0A0A,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontSize: 12.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  duration: Duration(milliseconds: 2050),
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
                                                                                                duration: Duration(milliseconds: 1750),
                                                                                                backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      text: 'ADD',
                                                                                      options: FFButtonOptions(
                                                                                        width: 100.0,
                                                                                        height: 30.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FFAppConstants.calculatorColor,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FFAppConstants.whiteColor,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return Align(
                                                                                    alignment: AlignmentDirectional(1.0, 1.0),
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      height: 30.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                logFirebaseEvent('VARIENT_BOTTTOM_SHEET_COMP__BTN_ON_TAP');
                                                                                                if (widget!.cartType == 'daily') {
                                                                                                  logFirebaseEvent('Button_custom_action');
                                                                                                  _model.internet = await actions.checkInternetConnection();
                                                                                                  if (_model.internet == true) {
                                                                                                    logFirebaseEvent('Button_haptic_feedback');
                                                                                                    HapticFeedback.heavyImpact();
                                                                                                    logFirebaseEvent('Button_backend_call');
                                                                                                    _model.addtocart = await QuickartGroup.addToCartCall.call(
                                                                                                      userid: FFAppState().userID,
                                                                                                      storeid: FFAppState().storeID,
                                                                                                      deviceid: FFAppState().deviceID,
                                                                                                      qty: functions.addRemoveQTY(
                                                                                                          getJsonField(
                                                                                                            productDetailItem,
                                                                                                            r'''$.cart_qty''',
                                                                                                          ),
                                                                                                          'remove'),
                                                                                                      varientid: getJsonField(
                                                                                                        productDetailItem,
                                                                                                        r'''$.varient_id''',
                                                                                                      ).toString(),
                                                                                                      itemPrice: getJsonField(
                                                                                                        productDetailItem,
                                                                                                        r'''$.price''',
                                                                                                      ).toString(),
                                                                                                      itemName: getJsonField(
                                                                                                        widget!.productModel,
                                                                                                        r'''$.product_name''',
                                                                                                      ).toString(),
                                                                                                      platform: isiOS ? 'ios' : 'android',
                                                                                                    );

                                                                                                    if ((_model.addtocart?.succeeded ?? true)) {
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
                                                                                                      logFirebaseEvent('Button_update_component_state');
                                                                                                      _model.productJson = functions.updateQtyPlusMinus(_model.productJson!, productDetailIndex, 'remove1', _model.isFeaturesSelected);
                                                                                                      _model.itemTotalAmt = functions.calculateVariantTotals(_model.productJson!, widget!.cartType!);
                                                                                                      _model.updatePage(() {});
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
                                                                                                          productDetailItem,
                                                                                                          r'''$.varient_id''',
                                                                                                        ).toString(),
                                                                                                        getJsonField(
                                                                                                          _model.productJson,
                                                                                                          r'''$.product_name''',
                                                                                                        ).toString(),
                                                                                                        ' product',
                                                                                                        getJsonField(
                                                                                                          productDetailItem,
                                                                                                          r'''$.price''',
                                                                                                        ),
                                                                                                        int.parse((functions.addRemoveQTY(
                                                                                                            getJsonField(
                                                                                                              productDetailItem,
                                                                                                              r'''$.cart_qty''',
                                                                                                            ),
                                                                                                            'remove')!)),
                                                                                                        getJsonField(
                                                                                                          productDetailItem,
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
                                                                                                } else {
                                                                                                  logFirebaseEvent('Button_custom_action');
                                                                                                  _model.isInternet2 = await actions.checkInternetConnection();
                                                                                                  if (_model.isInternet2 == true) {
                                                                                                    logFirebaseEvent('Button_backend_call');
                                                                                                    _model.apiResultco2 = await QuickartGroup.addtosubcartCall.call(
                                                                                                      userid: FFAppState().userID,
                                                                                                      qty: functions.addRemoveQTY(
                                                                                                          getJsonField(
                                                                                                            productDetailItem,
                                                                                                            r'''$.subcartQty''',
                                                                                                          ),
                                                                                                          'remove'),
                                                                                                      storeid: FFAppState().storeID,
                                                                                                      varientid: getJsonField(
                                                                                                        productDetailItem,
                                                                                                        r'''$.varient_id''',
                                                                                                      ).toString(),
                                                                                                      deviceid: FFAppState().deviceID,
                                                                                                      repeatOrder: functions.getRepeatdays(FFAppState().isSunSelected, FFAppState().isMonSelected, FFAppState().isTueSelected, FFAppState().isWedSelected, FFAppState().isThuSelected, FFAppState().isFriSelected, FFAppState().isSatSelected),
                                                                                                      timeSlot: FFAppState().isDeliveryTimeSlotSelected,
                                                                                                      itemName: getJsonField(
                                                                                                        widget!.productModel,
                                                                                                        r'''$.product_name''',
                                                                                                      ).toString(),
                                                                                                      itemPrice: functions.setDecimalValue(getJsonField(
                                                                                                        productDetailItem,
                                                                                                        r'''$.price''',
                                                                                                      ).toString()),
                                                                                                      platform: isiOS ? 'ios' : 'android',
                                                                                                    );

                                                                                                    if ((_model.apiResultco2?.succeeded ?? true)) {
                                                                                                      logFirebaseEvent('Button_update_component_state');
                                                                                                      _model.productJson = functions.updateQtyPlusMinus(_model.productJson!, productDetailIndex, 'removeSub', _model.isFeaturesSelected);
                                                                                                      _model.itemTotalAmt = functions.calculateVariantTotals(_model.productJson!, widget!.cartType!);
                                                                                                      safeSetState(() {});
                                                                                                      logFirebaseEvent('Button_update_app_state');
                                                                                                      FFAppState().isWedSelected = false;
                                                                                                      FFAppState().isSunSelected = false;
                                                                                                      FFAppState().isMonSelected = false;
                                                                                                      FFAppState().isTueSelected = false;
                                                                                                      FFAppState().isThuSelected = false;
                                                                                                      FFAppState().isFriSelected = false;
                                                                                                      FFAppState().isSatSelected = false;
                                                                                                      FFAppState().categoryName = 'sub';
                                                                                                      FFAppState().isWeekSelected = 0;
                                                                                                      FFAppState().isSubcribeCartVisible = false;
                                                                                                      FFAppState().isDeliveryTimeSlotSelected = 'no';
                                                                                                      FFAppState().subCartTotalItem = QuickartGroup.addtosubcartCall.totalItems(
                                                                                                        (_model.apiResultco2?.jsonBody ?? ''),
                                                                                                      )!;
                                                                                                      FFAppState().subCartTotalPrice = QuickartGroup.addtosubcartCall.totalPrice(
                                                                                                        (_model.apiResultco2?.jsonBody ?? ''),
                                                                                                      )!;
                                                                                                      FFAppState().subCartSavingAmount = QuickartGroup.addtosubcartCall.savingPrice(
                                                                                                        (_model.apiResultco2?.jsonBody ?? ''),
                                                                                                      )!;
                                                                                                      FFAppState().refreshTrigger = true;
                                                                                                      safeSetState(() {});
                                                                                                      logFirebaseEvent('Button_custom_action');
                                                                                                      await actions.facebookEventClass(
                                                                                                        getJsonField(
                                                                                                          productDetailItem,
                                                                                                          r'''$.varient_id''',
                                                                                                        ).toString(),
                                                                                                        getJsonField(
                                                                                                          _model.productJson,
                                                                                                          r'''$.product_name''',
                                                                                                        ).toString(),
                                                                                                        'subscription product',
                                                                                                        getJsonField(
                                                                                                          productDetailItem,
                                                                                                          r'''$.price''',
                                                                                                        ),
                                                                                                        int.parse((functions.addRemoveQTY(
                                                                                                            getJsonField(
                                                                                                              productDetailItem,
                                                                                                              r'''$.subcartQty''',
                                                                                                            ),
                                                                                                            'remove')!)),
                                                                                                        getJsonField(
                                                                                                          productDetailItem,
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
                                                                                                      logFirebaseEvent('Button_google_analytics_event');
                                                                                                      logFirebaseEvent(
                                                                                                        'Navigation',
                                                                                                        parameters: {
                                                                                                          'Screen Name': 'Product Detail Screen',
                                                                                                          'Confirm': 'Confirm Subscription',
                                                                                                          'Navigate To': 'Subscription Cart Screen',
                                                                                                          'API Name': 'Add To SubCart',
                                                                                                        },
                                                                                                      );
                                                                                                    } else {
                                                                                                      logFirebaseEvent('Button_show_snack_bar');
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            getJsonField(
                                                                                                              (_model.apiResultco2?.jsonBody ?? ''),
                                                                                                              r'''$.message''',
                                                                                                            ).toString(),
                                                                                                            style: GoogleFonts.montserrat(
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
                                                                                                        duration: Duration(milliseconds: 4000),
                                                                                                        backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                }

                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              text: '-',
                                                                                              options: FFButtonOptions(
                                                                                                width: 35.0,
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
                                                                                              height: 40.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FFAppConstants.whiteColor,
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  widget!.cartType == 'daily'
                                                                                                      ? getJsonField(
                                                                                                          productDetailItem,
                                                                                                          r'''$.cart_qty''',
                                                                                                        ).toString()
                                                                                                      : getJsonField(
                                                                                                          productDetailItem,
                                                                                                          r'''$.subcartQty''',
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
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Builder(
                                                                                              builder: (context) => FFButtonWidget(
                                                                                                onPressed: () async {
                                                                                                  logFirebaseEvent('VARIENT_BOTTTOM_SHEET_COMP__BTN_ON_TAP');
                                                                                                  if (widget!.cartType == 'daily') {
                                                                                                    logFirebaseEvent('Button_custom_action');
                                                                                                    _model.network = await actions.checkInternetConnection();
                                                                                                    if (_model.network == true) {
                                                                                                      if (getJsonField(
                                                                                                            productDetailItem,
                                                                                                            r'''$.stock''',
                                                                                                          ) ==
                                                                                                          getJsonField(
                                                                                                            productDetailItem,
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
                                                                                                              child: CustomAlertDailogWidget(
                                                                                                                des: FFAppConstants.noStock,
                                                                                                                height: 120.0,
                                                                                                                title: ' ',
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      } else {
                                                                                                        logFirebaseEvent('Button_haptic_feedback');
                                                                                                        HapticFeedback.heavyImpact();
                                                                                                        logFirebaseEvent('Button_backend_call');
                                                                                                        _model.cartadd = await QuickartGroup.addToCartCall.call(
                                                                                                          userid: FFAppState().userID,
                                                                                                          qty: functions.addRemoveQTY(
                                                                                                              getJsonField(
                                                                                                                productDetailItem,
                                                                                                                r'''$.cart_qty''',
                                                                                                              ),
                                                                                                              'add'),
                                                                                                          storeid: FFAppState().storeID,
                                                                                                          varientid: getJsonField(
                                                                                                            productDetailItem,
                                                                                                            r'''$.varient_id''',
                                                                                                          ).toString(),
                                                                                                          deviceid: FFAppState().deviceID,
                                                                                                          itemPrice: getJsonField(
                                                                                                            productDetailItem,
                                                                                                            r'''$.price''',
                                                                                                          ).toString(),
                                                                                                          itemName: getJsonField(
                                                                                                            widget!.productModel,
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
                                                                                                            logFirebaseEvent('Button_update_component_state');
                                                                                                            _model.productJson = functions.updateQtyPlusMinus(_model.productJson!, productDetailIndex, 'add1', _model.isFeaturesSelected);
                                                                                                            _model.itemTotalAmt = functions.calculateVariantTotals(_model.productJson!, widget!.cartType!);
                                                                                                            _model.varientIDs = functions
                                                                                                                .getVarientIdsWithCartQty(
                                                                                                                    getJsonField(
                                                                                                                      _model.productJson,
                                                                                                                      r'''$.varients''',
                                                                                                                    ),
                                                                                                                    'daily')
                                                                                                                .toList()
                                                                                                                .cast<dynamic>();
                                                                                                            _model.updatePage(() {});
                                                                                                            logFirebaseEvent('Button_custom_action');
                                                                                                            await actions.facebookEventClass(
                                                                                                              getJsonField(
                                                                                                                productDetailItem,
                                                                                                                r'''$.varient_id''',
                                                                                                              ).toString(),
                                                                                                              getJsonField(
                                                                                                                widget!.productModel,
                                                                                                                r'''$.product_name''',
                                                                                                              ).toString(),
                                                                                                              'product',
                                                                                                              getJsonField(
                                                                                                                productDetailItem,
                                                                                                                r'''$.price''',
                                                                                                              ),
                                                                                                              getJsonField(
                                                                                                                    productDetailItem,
                                                                                                                    r'''$.cart_qty''',
                                                                                                                  ) +
                                                                                                                  1,
                                                                                                              getJsonField(
                                                                                                                productDetailItem,
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
                                                                                                            logFirebaseEvent('Button_backend_call');
                                                                                                            _model.apiResultl9n = await QuickartGroup.updatecartCall.call(
                                                                                                              userID: FFAppState().userID,
                                                                                                              storeID: FFAppState().storeID,
                                                                                                              varientIDJson: _model.varientIDs,
                                                                                                              productFeatureID: _model.isFeaturesSelected.toString(),
                                                                                                            );

                                                                                                            if (!(_model.apiResultl9n?.succeeded ?? true)) {
                                                                                                              logFirebaseEvent('Button_show_snack_bar');
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    QuickartGroup.updatecartCall.message(
                                                                                                                      (_model.apiResultl9n?.jsonBody ?? ''),
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
                                                                                                  } else {
                                                                                                    logFirebaseEvent('Button_custom_action');
                                                                                                    _model.isInternet1 = await actions.checkInternetConnection();
                                                                                                    if (_model.isInternet1 == true) {
                                                                                                      logFirebaseEvent('Button_backend_call');
                                                                                                      _model.apiResultco1 = await QuickartGroup.addtosubcartCall.call(
                                                                                                        userid: FFAppState().userID,
                                                                                                        qty: functions.addRemoveQTY(
                                                                                                            getJsonField(
                                                                                                              productDetailItem,
                                                                                                              r'''$.subcartQty''',
                                                                                                            ),
                                                                                                            'add'),
                                                                                                        storeid: FFAppState().storeID,
                                                                                                        varientid: getJsonField(
                                                                                                          productDetailItem,
                                                                                                          r'''$.varient_id''',
                                                                                                        ).toString(),
                                                                                                        deviceid: FFAppState().deviceID,
                                                                                                        repeatOrder: functions.getRepeatdays(FFAppState().isSunSelected, FFAppState().isMonSelected, FFAppState().isTueSelected, FFAppState().isWedSelected, FFAppState().isThuSelected, FFAppState().isFriSelected, FFAppState().isSatSelected),
                                                                                                        timeSlot: FFAppState().isDeliveryTimeSlotSelected,
                                                                                                        itemName: getJsonField(
                                                                                                          widget!.productModel,
                                                                                                          r'''$.product_name''',
                                                                                                        ).toString(),
                                                                                                        itemPrice: functions.setDecimalValue(getJsonField(
                                                                                                          productDetailItem,
                                                                                                          r'''$.price''',
                                                                                                        ).toString()),
                                                                                                        platform: isiOS ? 'ios' : 'android',
                                                                                                      );

                                                                                                      if ((_model.apiResultco1?.succeeded ?? true)) {
                                                                                                        logFirebaseEvent('Button_update_component_state');
                                                                                                        _model.productJson = functions.updateQtyPlusMinus(_model.productJson!, productDetailIndex, 'addSub', _model.isFeaturesSelected);
                                                                                                        _model.itemTotalAmt = functions.calculateVariantTotals(_model.productJson!, widget!.cartType!);
                                                                                                        _model.varientIDs = functions
                                                                                                            .getVarientIdsWithCartQty(
                                                                                                                getJsonField(
                                                                                                                  _model.productJson,
                                                                                                                  r'''$.varients''',
                                                                                                                ),
                                                                                                                'sub')
                                                                                                            .toList()
                                                                                                            .cast<dynamic>();
                                                                                                        safeSetState(() {});
                                                                                                        logFirebaseEvent('Button_update_app_state');
                                                                                                        FFAppState().isWedSelected = false;
                                                                                                        FFAppState().isSunSelected = false;
                                                                                                        FFAppState().isMonSelected = false;
                                                                                                        FFAppState().isTueSelected = false;
                                                                                                        FFAppState().isThuSelected = false;
                                                                                                        FFAppState().isFriSelected = false;
                                                                                                        FFAppState().isSatSelected = false;
                                                                                                        FFAppState().categoryName = 'sub';
                                                                                                        FFAppState().isWeekSelected = 0;
                                                                                                        FFAppState().isSubcribeCartVisible = false;
                                                                                                        FFAppState().isDeliveryTimeSlotSelected = 'no';
                                                                                                        FFAppState().subCartTotalItem = QuickartGroup.addtosubcartCall.totalItems(
                                                                                                          (_model.apiResultco1?.jsonBody ?? ''),
                                                                                                        )!;
                                                                                                        FFAppState().subCartTotalPrice = QuickartGroup.addtosubcartCall.totalPrice(
                                                                                                          (_model.apiResultco1?.jsonBody ?? ''),
                                                                                                        )!;
                                                                                                        FFAppState().subCartSavingAmount = QuickartGroup.addtosubcartCall.savingPrice(
                                                                                                          (_model.apiResultco1?.jsonBody ?? ''),
                                                                                                        )!;
                                                                                                        FFAppState().refreshTrigger = true;
                                                                                                        safeSetState(() {});
                                                                                                        logFirebaseEvent('Button_backend_call');
                                                                                                        _model.apiResultupdateSubCart4 = await QuickartGroup.updatessubcartCall.call(
                                                                                                          userID: FFAppState().userID,
                                                                                                          storeID: FFAppState().storeID,
                                                                                                          varientIDJson: _model.varientIDs,
                                                                                                          productFeatureID: _model.isFeaturesSelected.toString(),
                                                                                                        );

                                                                                                        if ((_model.apiResultupdateSubCart4?.succeeded ?? true)) {
                                                                                                          if (FFAppConstants.checkStatus ==
                                                                                                              QuickartGroup.updatessubcartCall.status(
                                                                                                                (_model.apiResultupdateSubCart4?.jsonBody ?? ''),
                                                                                                              )) {
                                                                                                            logFirebaseEvent('Button_custom_action');
                                                                                                            await actions.facebookEventClass(
                                                                                                              getJsonField(
                                                                                                                productDetailItem,
                                                                                                                r'''$.varient_id''',
                                                                                                              ).toString(),
                                                                                                              getJsonField(
                                                                                                                _model.productJson,
                                                                                                                r'''$.product_name''',
                                                                                                              ).toString(),
                                                                                                              'subscription product',
                                                                                                              getJsonField(
                                                                                                                productDetailItem,
                                                                                                                r'''$.price''',
                                                                                                              ),
                                                                                                              1,
                                                                                                              getJsonField(
                                                                                                                productDetailItem,
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
                                                                                                            logFirebaseEvent('Button_google_analytics_event');
                                                                                                            logFirebaseEvent(
                                                                                                              'Navigation',
                                                                                                              parameters: {
                                                                                                                'Screen Name': 'Product Detail Screen',
                                                                                                                'Confirm': 'Confirm Subscription',
                                                                                                                'Navigate To': 'Subscription Cart Screen',
                                                                                                                'API Name': 'Add To SubCart',
                                                                                                              },
                                                                                                            );
                                                                                                          } else {
                                                                                                            logFirebaseEvent('Button_show_snack_bar');
                                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                                              SnackBar(
                                                                                                                content: Text(
                                                                                                                  QuickartGroup.updatessubcartCall.message(
                                                                                                                    (_model.apiResultupdateSubCart4?.jsonBody ?? ''),
                                                                                                                  )!,
                                                                                                                  style: GoogleFonts.montserrat(
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
                                                                                                                QuickartGroup.updatessubcartCall.message(
                                                                                                                  (_model.apiResultupdateSubCart4?.jsonBody ?? ''),
                                                                                                                )!,
                                                                                                                style: GoogleFonts.montserrat(
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
                                                                                                              getJsonField(
                                                                                                                (_model.apiResultco1?.jsonBody ?? ''),
                                                                                                                r'''$.message''',
                                                                                                              ).toString(),
                                                                                                              style: GoogleFonts.montserrat(
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
                                                                                                  width: 35.0,
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
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          if ((FFAppConstants.subscriptionAvailability ==
                                                                                  getJsonField(
                                                                                    widget!.productModel,
                                                                                    r'''$.availability''',
                                                                                  ).toString()) ||
                                                                              (FFAppConstants.allAvailability ==
                                                                                  getJsonField(
                                                                                    widget!.productModel,
                                                                                    r'''$.availability''',
                                                                                  ).toString()))
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                if ((FFAppConstants.isSubcribe ==
                                                                                        getJsonField(
                                                                                          widget!.productModel,
                                                                                          r'''$.isSubscription''',
                                                                                        ).toString()) &&
                                                                                    (((getJsonField(
                                                                                              widget!.productModel,
                                                                                              r'''$.varients''',
                                                                                            ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
                                                                                                .withoutNulls
                                                                                                ?.length ==
                                                                                            1) &&
                                                                                        ((getJsonField(
                                                                                              widget!.productModel,
                                                                                              r'''$.varients''',
                                                                                            ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
                                                                                                .withoutNulls
                                                                                                ?.length ==
                                                                                            0)))
                                                                                  Container(
                                                                                    width: 110.0,
                                                                                    height: 30.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FFAppConstants.yellowColor,
                                                                                      borderRadius: BorderRadius.only(
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                        bottomLeft: Radius.circular(8.0),
                                                                                        bottomRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      border: Border.all(
                                                                                        color: FFAppConstants.yellowDDC66C,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                        child: RichText(
                                                                                          textScaler: MediaQuery.of(context).textScaler,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: 'SUBSCRIBE ',
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      font: GoogleFonts.montserrat(
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                      color: FFAppConstants.blackColor0A0A0A,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.readexPro(
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
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    if ((getJsonField(
                                                                                              widget!.productModel,
                                                                                              r'''$.varients''',
                                                                                            ) !=
                                                                                            null) &&
                                                                                        (FFAppState().qtyZeroCheck <
                                                                                            getJsonField(
                                                                                              productDetailItem,
                                                                                              r'''$.subcartQty''',
                                                                                            ))) {
                                                                                      return InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('VARIENT_BOTTTOM_SHEET_Container_cbee2tgw');
                                                                                          logFirebaseEvent('Container_bottom_sheet');
                                                                                          Navigator.pop(context, _model.productJson);
                                                                                          logFirebaseEvent('Container_update_component_state');

                                                                                          _model.updatePage(() {});
                                                                                          logFirebaseEvent('Container_navigate_to');

                                                                                          context.pushNamed(CartSubscriptionScreenWidget.routeName);

                                                                                          logFirebaseEvent('Container_update_app_state');
                                                                                          FFAppState().categoryName = 'sub';
                                                                                          safeSetState(() {});
                                                                                          logFirebaseEvent('Container_custom_action');
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
                                                                                          logFirebaseEvent('Container_google_analytics_event');
                                                                                          logFirebaseEvent(
                                                                                            'Navigation',
                                                                                            parameters: {
                                                                                              'Screen Name': 'Product Detail Screen',
                                                                                              'Navigate To': 'Subscription Cart Screen',
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 110.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FFAppConstants.yellowColor,
                                                                                            borderRadius: BorderRadius.only(
                                                                                              topLeft: Radius.circular(8.0),
                                                                                              topRight: Radius.circular(8.0),
                                                                                              bottomLeft: Radius.circular(8.0),
                                                                                              bottomRight: Radius.circular(8.0),
                                                                                            ),
                                                                                            border: Border.all(
                                                                                              color: FFAppConstants.yellowDDC66C,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                              child: RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: 'SUBSCRIBED ',
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
                                                                                      );
                                                                                    } else {
                                                                                      return InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('VARIENT_BOTTTOM_SHEET_Container_cjucpdj0');
                                                                                          logFirebaseEvent('Container_custom_action');
                                                                                          _model.isInternet34 = await actions.checkInternetConnection();
                                                                                          if (_model.isInternet34 == true) {
                                                                                            logFirebaseEvent('Container_backend_call');
                                                                                            _model.apiResultco33 = await QuickartGroup.addtosubcartCall.call(
                                                                                              userid: FFAppState().userID,
                                                                                              qty: '1',
                                                                                              storeid: FFAppState().storeID,
                                                                                              varientid: getJsonField(
                                                                                                productDetailItem,
                                                                                                r'''$.varient_id''',
                                                                                              ).toString(),
                                                                                              deviceid: FFAppState().deviceID,
                                                                                              repeatOrder: functions.getRepeatdays(FFAppState().isSunSelected, FFAppState().isMonSelected, FFAppState().isTueSelected, FFAppState().isWedSelected, FFAppState().isThuSelected, FFAppState().isFriSelected, FFAppState().isSatSelected),
                                                                                              timeSlot: FFAppState().isDeliveryTimeSlotSelected,
                                                                                              itemName: getJsonField(
                                                                                                widget!.productModel,
                                                                                                r'''$.product_name''',
                                                                                              ).toString(),
                                                                                              itemPrice: functions.setDecimalValue(getJsonField(
                                                                                                productDetailItem,
                                                                                                r'''$.price''',
                                                                                              ).toString()),
                                                                                              platform: isiOS ? 'ios' : 'android',
                                                                                            );

                                                                                            if ((_model.apiResultco33?.succeeded ?? true)) {
                                                                                              logFirebaseEvent('Container_update_component_state');
                                                                                              _model.productJson = functions.updateQtyPlusMinus(_model.productJson!, productDetailIndex, 'addSub', _model.isFeaturesSelected);
                                                                                              _model.itemTotalAmt = functions.calculateVariantTotals(_model.productJson!, widget!.cartType!);
                                                                                              _model.varientIDs = functions
                                                                                                  .getVarientIdsWithCartQty(
                                                                                                      getJsonField(
                                                                                                        _model.productJson,
                                                                                                        r'''$.varients''',
                                                                                                      ),
                                                                                                      'sub')
                                                                                                  .toList()
                                                                                                  .cast<dynamic>();
                                                                                              safeSetState(() {});
                                                                                              logFirebaseEvent('Container_update_app_state');
                                                                                              FFAppState().isWedSelected = false;
                                                                                              FFAppState().isSunSelected = false;
                                                                                              FFAppState().isMonSelected = false;
                                                                                              FFAppState().isTueSelected = false;
                                                                                              FFAppState().isThuSelected = false;
                                                                                              FFAppState().isFriSelected = false;
                                                                                              FFAppState().isSatSelected = false;
                                                                                              FFAppState().categoryName = 'sub';
                                                                                              FFAppState().isWeekSelected = 0;
                                                                                              FFAppState().isSubcribeCartVisible = false;
                                                                                              FFAppState().isDeliveryTimeSlotSelected = 'no';
                                                                                              FFAppState().subCartTotalItem = QuickartGroup.addtosubcartCall.totalItems(
                                                                                                (_model.apiResultco33?.jsonBody ?? ''),
                                                                                              )!;
                                                                                              FFAppState().subCartTotalPrice = QuickartGroup.addtosubcartCall.totalPrice(
                                                                                                (_model.apiResultco33?.jsonBody ?? ''),
                                                                                              )!;
                                                                                              FFAppState().subCartSavingAmount = QuickartGroup.addtosubcartCall.savingPrice(
                                                                                                (_model.apiResultco33?.jsonBody ?? ''),
                                                                                              )!;
                                                                                              FFAppState().refreshTrigger = true;
                                                                                              safeSetState(() {});
                                                                                              logFirebaseEvent('Container_backend_call');
                                                                                              _model.apiResultupdateSubCart22 = await QuickartGroup.updatessubcartCall.call(
                                                                                                userID: FFAppState().userID,
                                                                                                storeID: FFAppState().storeID,
                                                                                                varientIDJson: _model.varientIDs,
                                                                                                productFeatureID: _model.isFeaturesSelected.toString(),
                                                                                              );

                                                                                              if ((_model.apiResultupdateSubCart22?.succeeded ?? true)) {
                                                                                                if (FFAppConstants.checkStatus ==
                                                                                                    QuickartGroup.updatessubcartCall.status(
                                                                                                      (_model.apiResultupdateSubCart22?.jsonBody ?? ''),
                                                                                                    )) {
                                                                                                  logFirebaseEvent('Container_custom_action');
                                                                                                  await actions.facebookEventClass(
                                                                                                    getJsonField(
                                                                                                      productDetailItem,
                                                                                                      r'''$.varient_id''',
                                                                                                    ).toString(),
                                                                                                    getJsonField(
                                                                                                      _model.productJson,
                                                                                                      r'''$.product_name''',
                                                                                                    ).toString(),
                                                                                                    'subscription product',
                                                                                                    getJsonField(
                                                                                                      productDetailItem,
                                                                                                      r'''$.price''',
                                                                                                    ),
                                                                                                    1,
                                                                                                    getJsonField(
                                                                                                      productDetailItem,
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
                                                                                                  logFirebaseEvent('Container_google_analytics_event');
                                                                                                  logFirebaseEvent(
                                                                                                    'Navigation',
                                                                                                    parameters: {
                                                                                                      'Screen Name': 'Product Detail Screen',
                                                                                                      'Confirm': 'Confirm Subscription',
                                                                                                      'Navigate To': 'Subscription Cart Screen',
                                                                                                      'API Name': 'Add To SubCart',
                                                                                                    },
                                                                                                  );
                                                                                                  logFirebaseEvent('Container_bottom_sheet');
                                                                                                  Navigator.pop(context);
                                                                                                  logFirebaseEvent('Container_navigate_to');

                                                                                                  context.pushNamed(CartSubscriptionScreenWidget.routeName);
                                                                                                } else {
                                                                                                  logFirebaseEvent('Container_show_snack_bar');
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        QuickartGroup.updatessubcartCall.message(
                                                                                                          (_model.apiResultupdateSubCart2?.jsonBody ?? ''),
                                                                                                        )!,
                                                                                                        style: GoogleFonts.montserrat(
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
                                                                                                logFirebaseEvent('Container_show_snack_bar');
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      QuickartGroup.updatessubcartCall.message(
                                                                                                        (_model.apiResultupdateSubCart22?.jsonBody ?? ''),
                                                                                                      )!,
                                                                                                      style: GoogleFonts.montserrat(
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
                                                                                              logFirebaseEvent('Container_show_snack_bar');
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    getJsonField(
                                                                                                      (_model.apiResultco33?.jsonBody ?? ''),
                                                                                                      r'''$.message''',
                                                                                                    ).toString(),
                                                                                                    style: GoogleFonts.montserrat(
                                                                                                      color: FFAppConstants.blackColor0A0A0A,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontSize: 12.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  duration: Duration(milliseconds: 2050),
                                                                                                  backgroundColor: FFAppConstants.NeutralBlack50Color,
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                          } else {
                                                                                            logFirebaseEvent('Container_show_snack_bar');
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
                                                                                                duration: Duration(milliseconds: 1750),
                                                                                                backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                              ),
                                                                                            );
                                                                                          }

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 110.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FFAppConstants.yellowColor,
                                                                                            borderRadius: BorderRadius.only(
                                                                                              topLeft: Radius.circular(8.0),
                                                                                              topRight: Radius.circular(8.0),
                                                                                              bottomLeft: Radius.circular(8.0),
                                                                                              bottomRight: Radius.circular(8.0),
                                                                                            ),
                                                                                            border: Border.all(
                                                                                              color: FFAppConstants.yellowDDC66C,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                              child: RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: 'SUBSCRIBE ',
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            font: GoogleFonts.montserrat(
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                            ),
                                                                                                            color: FFAppConstants.blackColor0A0A0A,
                                                                                                            fontSize: 12.0,
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
                                                                                                        color: FFAppConstants.yellowColor,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppConstants
                                                            .stockNotify ==
                                                        getJsonField(
                                                          productDetailItem,
                                                          r'''$.stock''',
                                                        ).toString())
                                                      Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FFAppConstants
                                                              .greyBgd6d2d3,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if (FFAppConstants
                                                                      .stockNotify ==
                                                                  getJsonField(
                                                                    productDetailItem,
                                                                    r'''$.stock''',
                                                                  ).toString())
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (FFAppConstants
                                                                              .notifyMe ==
                                                                          getJsonField(
                                                                            productDetailItem,
                                                                            r'''$.notify_me''',
                                                                          ).toString()) {
                                                                        return FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.notifications_none,
                                                                            color:
                                                                                FFAppConstants.blackColor0A0A0A,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                          showLoadingIndicator:
                                                                              true,
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('VARIENT_BOTTTOM_SHEET_notifications_none');
                                                                            logFirebaseEvent('IconButton_custom_action');
                                                                            _model.connnectivtyC =
                                                                                await actions.checkInternetConnection();
                                                                            if (_model.connnectivtyC ==
                                                                                true) {
                                                                              logFirebaseEvent('IconButton_haptic_feedback');
                                                                              HapticFeedback.mediumImpact();
                                                                              logFirebaseEvent('IconButton_backend_call');
                                                                              _model.apiResultb11 = await QuickartGroup.addnotifymeCall.call(
                                                                                productID: getJsonField(
                                                                                  widget!.productModel,
                                                                                  r'''$.product_id''',
                                                                                ).toString(),
                                                                                varientID: getJsonField(
                                                                                  productDetailItem,
                                                                                  r'''$.varient_id''',
                                                                                ).toString(),
                                                                                userID: FFAppState().userID,
                                                                                platform: FFAppState().platform,
                                                                                fcmToken: FFAppState().fcmToken,
                                                                              );

                                                                              if ((_model.apiResultb11?.succeeded ?? true)) {
                                                                                logFirebaseEvent('IconButton_update_component_state');
                                                                                _model.productJson = functions.updateNotifyme('add1', _model.productJson!, productDetailIndex);
                                                                                safeSetState(() {});
                                                                                logFirebaseEvent('IconButton_update_app_state');

                                                                                _model.updatePage(() {});
                                                                              } else {
                                                                                logFirebaseEvent('IconButton_show_snack_bar');
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      getJsonField(
                                                                                        (_model.apiResultb11?.jsonBody ?? ''),
                                                                                        r'''$.message''',
                                                                                      ).toString(),
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
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 2.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('VARIENT_BOTTTOM_SHEET_CircleImage_yiydc1');
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
                                                                            ),
                                                                          ],
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Currently unavailable',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FFAppConstants.blackColor0A0A0A,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (FFAppConstants
                                                                      .notifyMe ==
                                                                  getJsonField(
                                                                    productDetailItem,
                                                                    r'''$.notify_me''',
                                                                  ).toString())
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child: Text(
                                                                      'Tap the bell to get notified',
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
                                                                                FFAppConstants.blackColor0A0A0A,
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
                                                                ),
                                                              if (FFAppConstants
                                                                      .notifyMe !=
                                                                  getJsonField(
                                                                    productDetailItem,
                                                                    r'''$.notify_me''',
                                                                  ).toString())
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child: Text(
                                                                      'You will be notified.',
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
                                                                ),
                                                            ],
                                                          ),
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
                                                          productDetailItem,
                                                          r'''$.discountper''',
                                                        )) {
                                                      return Container(
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FFAppConstants
                                                              .green44AC20,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
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
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFAppConstants.discountperdouble >
                                                                            getJsonField(
                                                                              productDetailItem,
                                                                              r'''$.discountper''',
                                                                            )
                                                                        ? functions.setDecimalValueWithCount(
                                                                            getJsonField(
                                                                              productDetailItem,
                                                                              r'''$.discountper''',
                                                                            ).toString(),
                                                                            0,
                                                                            true)
                                                                        : functions.setDecimalValueWithCount(
                                                                            getJsonField(
                                                                              productDetailItem,
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
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
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
                                                                  TextSpan(
                                                                    text:
                                                                        '%  Off',
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
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
                                                      );
                                                    } else {
                                                      return Text(
                                                        ' ',
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
                                                                  fontSize:
                                                                      15.0,
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
                                                      widget!.productModel,
                                                      r'''$.country_icon''',
                                                    ).toString())
                                                  Container(
                                                    width: 29.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF4F6F4),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                valueOrDefault<
                                                                    double>(
                                                          FFAppConstants
                                                                      .percentageCheck <
                                                                  getJsonField(
                                                                    widget!
                                                                        .productModel,
                                                                    r'''$.discountper''',
                                                                  )
                                                              ? 0.0
                                                              : 8.0,
                                                          0.0,
                                                        )),
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
                                                            widget!
                                                                .productModel,
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
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        if ((getJsonField(
                                  _model.productJson,
                                  r'''$.features''',
                                ) !=
                                null) &&
                            ((getJsonField(
                                  _model.productJson,
                                  r'''$.features''',
                                )
                                            .toList()
                                            .map<ProductCountStruct?>(
                                                ProductCountStruct.maybeFromMap)
                                            .toList()
                                        as Iterable<ProductCountStruct?>)
                                    .withoutNulls
                                    .length >
                                0))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xFFD3CFCF),
                                  width: 0.7,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        'Select Packaging Preference: ',
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
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
                                              fontSize: 16.0,
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
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 10.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final featureModel = getJsonField(
                                            widget!.productModel,
                                            r'''$.features''',
                                          ).toList();

                                          return Wrap(
                                            spacing: 0.0,
                                            runSpacing: 0.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                featureModel.length,
                                                (featureModelIndex) {
                                              final featureModelItem =
                                                  featureModel[
                                                      featureModelIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 9.0, 5.0),
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
                                                        'VARIENT_BOTTTOM_SHEET_Container_2tlyew0s');
                                                    if (_model
                                                            .isFeaturesSelected ==
                                                        getJsonField(
                                                          featureModelItem,
                                                          r'''$.id''',
                                                        )) {
                                                      logFirebaseEvent(
                                                          'Container_update_component_state');
                                                      _model.isFeaturesSelected =
                                                          0;
                                                      safeSetState(() {});
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Container_update_component_state');
                                                      _model.isFeaturesSelected =
                                                          getJsonField(
                                                        featureModelItem,
                                                        r'''$.id''',
                                                      );
                                                      safeSetState(() {});
                                                    }

                                                    if (widget!.cartType ==
                                                        'daily') {
                                                      logFirebaseEvent(
                                                          'Container_custom_action');
                                                      _model.isInternet4 =
                                                          await actions
                                                              .checkInternetConnection();
                                                      if (_model.isInternet4 ==
                                                          true) {
                                                        logFirebaseEvent(
                                                            'Container_update_component_state');
                                                        _model.varientIDs = functions
                                                            .getVarientIdsWithCartQty(
                                                                getJsonField(
                                                                  _model
                                                                      .productJson,
                                                                  r'''$.varients''',
                                                                ),
                                                                'daily')
                                                            .toList()
                                                            .cast<dynamic>();
                                                        logFirebaseEvent(
                                                            'Container_backend_call');
                                                        _model.apiResultupdate =
                                                            await QuickartGroup
                                                                .updatecartCall
                                                                .call(
                                                          userID: FFAppState()
                                                              .userID,
                                                          storeID: FFAppState()
                                                              .storeID,
                                                          productFeatureID:
                                                              getJsonField(
                                                            featureModelItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          varientIDJson:
                                                              _model.varientIDs,
                                                        );

                                                        if ((_model
                                                                .apiResultupdate
                                                                ?.succeeded ??
                                                            true)) {
                                                          if (FFAppConstants
                                                                  .checkStatus ==
                                                              QuickartGroup
                                                                  .updatecartCall
                                                                  .status(
                                                                (_model.apiResultupdate
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )) {
                                                            logFirebaseEvent(
                                                                'Container_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  QuickartGroup
                                                                      .updatecartCall
                                                                      .message(
                                                                    (_model.apiResultupdate
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!,
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
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  QuickartGroup
                                                                      .updatecartCall
                                                                      .message(
                                                                    (_model.apiResultupdate
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!,
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
                                                              'Container_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                QuickartGroup
                                                                    .updatecartCall
                                                                    .message(
                                                                  (_model.apiResultupdate
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!,
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
                                                            'Container_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFAppConstants
                                                                  .internetString,
                                                              style: TextStyle(
                                                                color: FFAppConstants
                                                                    .indigoColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 15.0,
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
                                                          'Container_custom_action');
                                                      _model.isInternet5 =
                                                          await actions
                                                              .checkInternetConnection();
                                                      if (_model.isInternet5 ==
                                                          true) {
                                                        logFirebaseEvent(
                                                            'Container_update_component_state');
                                                        _model.varientIDs = functions
                                                            .getVarientIdsWithCartQty(
                                                                getJsonField(
                                                                  _model
                                                                      .productJson,
                                                                  r'''$.varients''',
                                                                ),
                                                                'sub')
                                                            .toList()
                                                            .cast<dynamic>();
                                                        logFirebaseEvent(
                                                            'Container_backend_call');
                                                        _model.apiResultupdateSubCart =
                                                            await QuickartGroup
                                                                .updatessubcartCall
                                                                .call(
                                                          userID: FFAppState()
                                                              .userID,
                                                          storeID: FFAppState()
                                                              .storeID,
                                                          varientIDJson:
                                                              _model.varientIDs,
                                                          productFeatureID:
                                                              getJsonField(
                                                            featureModelItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                        );

                                                        if ((_model
                                                                .apiResultupdateSubCart
                                                                ?.succeeded ??
                                                            true)) {
                                                          if (FFAppConstants
                                                                  .checkStatus ==
                                                              QuickartGroup
                                                                  .updatessubcartCall
                                                                  .status(
                                                                (_model.apiResultupdateSubCart
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )) {
                                                            logFirebaseEvent(
                                                                'Container_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  QuickartGroup
                                                                      .updatessubcartCall
                                                                      .message(
                                                                    (_model.apiResultupdateSubCart
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!,
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
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  QuickartGroup
                                                                      .updatessubcartCall
                                                                      .message(
                                                                    (_model.apiResultupdateSubCart
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!,
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
                                                              'Container_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                QuickartGroup
                                                                    .updatessubcartCall
                                                                    .message(
                                                                  (_model.apiResultupdateSubCart
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!,
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
                                                            'Container_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFAppConstants
                                                                  .internetString,
                                                              style: TextStyle(
                                                                color: FFAppConstants
                                                                    .indigoColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 15.0,
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
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: _model
                                                                  .isFeaturesSelected ==
                                                              getJsonField(
                                                                featureModelItem,
                                                                r'''$.id''',
                                                              )
                                                          ? Color(0xFFEDFFED)
                                                          : FFAppConstants
                                                              .neutralWhiteF5F5F5,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      border: Border.all(
                                                        color: _model
                                                                    .isFeaturesSelected ==
                                                                getJsonField(
                                                                  featureModelItem,
                                                                  r'''$.id''',
                                                                )
                                                            ? Color(0xFF9BF79B)
                                                            : Color(0xFFC0BEBE),
                                                        width: 0.7,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (_model
                                                                        .isFeaturesSelected ==
                                                                    getJsonField(
                                                                      featureModelItem,
                                                                      r'''$.id''',
                                                                    )) {
                                                                  return Icon(
                                                                    Icons
                                                                        .radio_button_checked_sharp,
                                                                    color: FFAppConstants
                                                                        .darkGreen,
                                                                    size: 24.0,
                                                                  );
                                                                } else {
                                                                  return Icon(
                                                                    Icons
                                                                        .radio_button_off,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  featureModelItem,
                                                                  r'''$.feature_value''',
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
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (functions.setDecimalValueWithCount(
                                _model.itemTotalAmt, 2, false) ==
                            '- 0.05')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FFAppConstants.indigoColor,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'Item Total:  AED ',
                                            textAlign: TextAlign.start,
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
                                                  color: Colors.white,
                                                  fontSize: 16.0,
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
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            functions
                                                .setDecimalValueWithCount(
                                                    _model.itemTotalAmt,
                                                    2,
                                                    false)
                                                .maybeHandleOverflow(
                                                  maxChars: 35,
                                                  replacement: '…',
                                                ),
                                            textAlign: TextAlign.start,
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
                                                  color: Colors.white,
                                                  fontSize: 16.0,
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
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VARIENT_BOTTTOM_SHEET_Text_i3lqnccn_ON_T');
                                          logFirebaseEvent('Text_bottom_sheet');
                                          Navigator.pop(
                                              context, _model.productJson);
                                          logFirebaseEvent(
                                              'Text_update_component_state');

                                          _model.updatePage(() {});
                                        },
                                        child: Text(
                                          'Done',
                                          textAlign: TextAlign.start,
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
                                                color: Colors.white,
                                                fontSize: 16.0,
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
                                  ],
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
        ],
      ),
    );
  }
}
