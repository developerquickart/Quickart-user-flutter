import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'save_letterproducts_list_model.dart';
export 'save_letterproducts_list_model.dart';

class SaveLetterproductsListWidget extends StatefulWidget {
  const SaveLetterproductsListWidget({
    super.key,
    this.productList,
    required this.isReload,
    bool? isSubscription,
  }) : this.isSubscription = isSubscription ?? false;

  final dynamic productList;
  final Future Function()? isReload;
  final bool isSubscription;

  @override
  State<SaveLetterproductsListWidget> createState() =>
      _SaveLetterproductsListWidgetState();
}

class _SaveLetterproductsListWidgetState
    extends State<SaveLetterproductsListWidget> {
  late SaveLetterproductsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaveLetterproductsListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SAVE_LETTERPRODUCTS_LIST_saveLetterprodu');
      logFirebaseEvent('saveLetterproductsList_update_component_');
      _model.productListC = widget!.productList;
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
        final productModelMM = widget!.productList?.toList() ?? [];

        return ListView.separated(
          padding: EdgeInsets.fromLTRB(
            2.0,
            0,
            0,
            0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: productModelMM.length,
          separatorBuilder: (_, __) => SizedBox(width: 5.0),
          itemBuilder: (context, productModelMMIndex) {
            final productModelMMItem = productModelMM[productModelMMIndex];
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('SAVE_LETTERPRODUCTS_LIST_Container_vorha');
                logFirebaseEvent('Container_navigate_to');

                context.pushNamed(ProductDetailsScreenWidget.routeName);

                logFirebaseEvent('Container_update_app_state');
                FFAppState().productID = getJsonField(
                  productModelMMItem,
                  r'''$.product_id''',
                ).toString();
                FFAppState().storeID = FFAppState().storeID;
                FFAppState().userID = FFAppState().userID;
                FFAppState().productName = getJsonField(
                  productModelMMItem,
                  r'''$.product_name''',
                ).toString();
                safeSetState(() {});
                logFirebaseEvent('Container_custom_action');
                await actions.facebookEventClass(
                  getJsonField(
                    productModelMMItem,
                    r'''$.product_id''',
                  ).toString(),
                  getJsonField(
                    productModelMMItem,
                    r'''$.product_name''',
                  ).toString(),
                  'product detail',
                  getJsonField(
                    productModelMMItem,
                    r'''$.price''',
                  ),
                  0,
                  getJsonField(
                    productModelMMItem,
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
                logFirebaseEvent('Container_google_analytics_event');
                logFirebaseEvent(
                  'Navigation',
                  parameters: {
                    'Navigate To': 'Product Detail Screen',
                  },
                );
              },
              child: Container(
                width: 170.0,
                height: 277.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  border: Border.all(
                    color: FFAppConstants.borderColor,
                    width: 0.5,
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.16, -0.9),
                                child: Container(
                                  width: 170.0,
                                  height: 170.0,
                                  decoration: BoxDecoration(
                                    color: FFAppConstants.productBgClr,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Image.network(
                                      getJsonField(
                                        productModelMMItem,
                                        r'''$.varient_image''',
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
                            ],
                          ),
                        ),
                        if (FFAppState().qtyZeroCheck !=
                            getJsonField(
                              productModelMMItem,
                              r'''$.stock''',
                            ))
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 4.0, 5.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        productModelMMItem,
                                        r'''$.product_name''',
                                      ).toString().maybeHandleOverflow(
                                            maxChars: 60,
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
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color:
                                                FFAppConstants.blackColor0A0A0A,
                                            fontSize: 13.0,
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
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 3.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    productModelMMItem,
                                                    r'''$.quantity''',
                                                  ).toString(),
                                                  textAlign: TextAlign.start,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    productModelMMItem,
                                                    r'''$.unit''',
                                                  ).toString(),
                                                  textAlign: TextAlign.start,
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 2.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.79, -0.97),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 3.0, 5.0, 0.0),
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
                                                                          .w600,
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
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            functions
                                                                .setDecimalValue(
                                                                    getJsonField(
                                                              productModelMMItem,
                                                              r'''$.price''',
                                                            ).toString()),
                                                            '0',
                                                          ),
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12.0,
                                                          ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF0A0A0A),
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (getJsonField(
                                                          productModelMMItem,
                                                          r'''$.price''',
                                                        ) !=
                                                        getJsonField(
                                                          productModelMMItem,
                                                          r'''$.mrp''',
                                                        )) {
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'AED ',
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
                                                          Text(
                                                            functions
                                                                .setDecimalValue(
                                                                    getJsonField(
                                                              productModelMMItem,
                                                              r'''$.mrp''',
                                                            ).toString())!,
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
                                                        ],
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
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SAVE_LETTERPRODUCTS_LIST_DELETE_BTN_ON_T');
                                    logFirebaseEvent('Button_custom_action');
                                    _model.networkCheck11 =
                                        await actions.checkInternetConnection();
                                    if (_model.networkCheck11 == true) {
                                      logFirebaseEvent(
                                          'Button_haptic_feedback');
                                      HapticFeedback.heavyImpact();
                                      logFirebaseEvent('Button_backend_call');
                                      _model.remvoeSaveLater =
                                          await QuickartGroup.removesavecartCall
                                              .call(
                                        userID: FFAppState().userID,
                                        variantID: getJsonField(
                                          productModelMMItem,
                                          r'''$.varient_id''',
                                        ).toString(),
                                        isSubscription:
                                            widget!.isSubscription == true
                                                ? '1'
                                                : '0',
                                      );

                                      if ((_model.remvoeSaveLater?.succeeded ??
                                          true)) {
                                        if (FFAppConstants.checkStatus ==
                                            QuickartGroup.removesavecartCall
                                                .status(
                                              (_model.remvoeSaveLater
                                                      ?.jsonBody ??
                                                  ''),
                                            )) {
                                          logFirebaseEvent(
                                              'Button_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                QuickartGroup.removesavecartCall
                                                    .message(
                                                  (_model.remvoeSaveLater
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                style: GoogleFonts.montserrat(
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 1500),
                                              backgroundColor: FFAppConstants
                                                  .primaryPurpleE4D8F5,
                                            ),
                                          );
                                          logFirebaseEvent(
                                              'Button_execute_callback');
                                          await widget.isReload?.call();
                                        } else {
                                          logFirebaseEvent(
                                              'Button_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                QuickartGroup.removesavecartCall
                                                    .message(
                                                  (_model.remvoeSaveLater
                                                          ?.jsonBody ??
                                                      ''),
                                                )!,
                                                style: GoogleFonts.montserrat(
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 1500),
                                              backgroundColor: FFAppConstants
                                                  .primaryPurpleE4D8F5,
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
                                              QuickartGroup.removesavecartCall
                                                  .message(
                                                (_model.remvoeSaveLater
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              style: GoogleFonts.montserrat(
                                                color:
                                                    FFAppConstants.indigoColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 1500),
                                            backgroundColor: FFAppConstants
                                                .primaryPurpleE4D8F5,
                                          ),
                                        );
                                      }
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            FFAppConstants.internetString,
                                            style: GoogleFonts.montserrat(
                                              color: FFAppConstants
                                                  .blackColor0A0A0A,
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

                                    safeSetState(() {});
                                  },
                                  text: 'Delete',
                                  options: FFButtonOptions(
                                    width: 70.0,
                                    height: 25.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FFAppConstants.whiteColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color:
                                              FFAppConstants.blackColor0A0A0A,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FFAppConstants.greyBgd6d2d3,
                                      width: 0.7,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              if (FFAppState().qtyZeroCheck !=
                                  getJsonField(
                                    productModelMMItem,
                                    r'''$.stock''',
                                  ))
                                Align(
                                  alignment: AlignmentDirectional(1.0, 1.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SAVE_LETTERPRODUCTS_LIST_ADD_BTN_ON_TAP');
                                      logFirebaseEvent('Button_custom_action');
                                      _model.networkCheck1 = await actions
                                          .checkInternetConnection();
                                      if (_model.networkCheck1 == true) {
                                        logFirebaseEvent(
                                            'Button_haptic_feedback');
                                        HapticFeedback.heavyImpact();
                                        if (widget!.isSubscription == false) {
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.addtoCart = await QuickartGroup
                                              .addtosavecartCall
                                              .call(
                                            userID: FFAppState().userID,
                                            variantID: getJsonField(
                                              productModelMMItem,
                                              r'''$.varient_id''',
                                            ).toString(),
                                            orderCartID: 'incart',
                                            platform: FFAppState().platform,
                                          );

                                          if ((_model.addtoCart?.succeeded ??
                                              true)) {
                                            if (FFAppConstants.checkStatus ==
                                                QuickartGroup.addtosavecartCall
                                                    .status(
                                                  (_model.addtoCart?.jsonBody ??
                                                      ''),
                                                )) {
                                              logFirebaseEvent(
                                                  'Button_update_component_state');

                                              _model.updatePage(() {});
                                              logFirebaseEvent(
                                                  'Button_execute_callback');
                                              await widget.isReload?.call();
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    QuickartGroup
                                                        .addtosavecartCall
                                                        .message(
                                                      (_model.addtoCart
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: FFAppConstants
                                                          .indigoColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 1500),
                                                  backgroundColor:
                                                      FFAppConstants
                                                          .primaryPurpleE4D8F5,
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
                                                  QuickartGroup
                                                      .addtosavecartCall
                                                      .message(
                                                    (_model.addtoCart
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!,
                                                  style: GoogleFonts.montserrat(
                                                    color: FFAppConstants
                                                        .indigoColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1500),
                                                backgroundColor: FFAppConstants
                                                    .primaryPurpleE4D8F5,
                                              ),
                                            );
                                          }
                                        } else {
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.addtosubCart =
                                              await QuickartGroup
                                                  .addtosavesubcartCall
                                                  .call(
                                            userID: FFAppState().userID,
                                            variantID: getJsonField(
                                              productModelMMItem,
                                              r'''$.varient_id''',
                                            ).toString(),
                                            orderCartID: 'incart',
                                            platform: FFAppState().platform,
                                          );

                                          if ((_model.addtosubCart?.succeeded ??
                                              true)) {
                                            if (FFAppConstants.checkStatus ==
                                                QuickartGroup
                                                    .addtosavesubcartCall
                                                    .status(
                                                  (_model.addtosubCart
                                                          ?.jsonBody ??
                                                      ''),
                                                )) {
                                              logFirebaseEvent(
                                                  'Button_execute_callback');
                                              await widget.isReload?.call();
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    QuickartGroup
                                                        .addtosavesubcartCall
                                                        .message(
                                                      (_model.addtosubCart
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: FFAppConstants
                                                          .indigoColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 1500),
                                                  backgroundColor:
                                                      FFAppConstants
                                                          .primaryPurpleE4D8F5,
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
                                                  QuickartGroup
                                                      .addtosavesubcartCall
                                                      .message(
                                                    (_model.addtosubCart
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!,
                                                  style: GoogleFonts.montserrat(
                                                    color: FFAppConstants
                                                        .indigoColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1500),
                                                backgroundColor: FFAppConstants
                                                    .primaryPurpleE4D8F5,
                                              ),
                                            );
                                          }
                                        }
                                      } else {
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              FFAppConstants.internetString,
                                              style: GoogleFonts.montserrat(
                                                color: FFAppConstants
                                                    .blackColor0A0A0A,
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

                                      safeSetState(() {});
                                    },
                                    text: 'Add ',
                                    options: FFButtonOptions(
                                      width: 70.0,
                                      height: 25.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FFAppConstants.calculatorColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FFAppConstants.whiteColor,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (FFAppConstants.stockNotify ==
                        getJsonField(
                          productModelMMItem,
                          r'''$.stock''',
                        ).toString())
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF3F5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 2.0, 5.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      productModelMMItem,
                                      r'''$.product_name''',
                                    ).toString().maybeHandleOverflow(
                                          maxChars: 30,
                                          replacement: '…',
                                        ),
                                    maxLines: 1,
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
                                          fontSize: 13.0,
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
                                    5.0, 0.0, 5.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 3.0, 0.0),
                                      child: Text(
                                        getJsonField(
                                          productModelMMItem,
                                          r'''$.quantity''',
                                        ).toString(),
                                        textAlign: TextAlign.start,
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
                                              color: Color(0xFF7A7A7A),
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        getJsonField(
                                          productModelMMItem,
                                          r'''$.unit''',
                                        ).toString(),
                                        textAlign: TextAlign.start,
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
                                              color: Color(0xFF7A7A7A),
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
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 2.0, 0.0, 0.0),
                                  child: Text(
                                    'Product Unavailable',
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
                                          color: Color(0xFFC82038),
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
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFAppConstants.notifyMe ==
                                          getJsonField(
                                            productModelMMItem,
                                            r'''$.notify_me''',
                                          ).toString()
                                      ? 'Click on the bell to get notified.'
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
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
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
            );
          },
        );
      },
    );
  }
}
