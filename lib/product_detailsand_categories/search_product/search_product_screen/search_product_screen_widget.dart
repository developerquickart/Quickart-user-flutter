import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/components/empty_data_two_line_component/empty_data_two_line_component_widget.dart';
import '/components/varient_botttom_sheet/varient_botttom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_product_screen_model.dart';
export 'search_product_screen_model.dart';

class SearchProductScreenWidget extends StatefulWidget {
  const SearchProductScreenWidget({
    super.key,
    this.keywordPage,
  });

  final String? keywordPage;

  static String routeName = 'SearchProductScreen';
  static String routePath = '/searchProductScreen';

  @override
  State<SearchProductScreenWidget> createState() =>
      _SearchProductScreenWidgetState();
}

class _SearchProductScreenWidgetState extends State<SearchProductScreenWidget> {
  late SearchProductScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchProductScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchProductScreen'});
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FFAppConstants.whiteColor,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SEARCH_PRODUCT_SCREEN_Icon_8i03klzi_ON_T');
                          logFirebaseEvent('Icon_navigate_back');
                          context.safePop();
                          logFirebaseEvent('Icon_update_app_state');
                          FFAppState().isCartShow = false;
                          FFAppState().searchLoader = false;
                          safeSetState(() {});
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: FFAppConstants.appBarIconandTitleColor,
                          size: 32.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.83,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FFAppConstants.whiteColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          border: Border.all(
                            color: FFAppConstants.lightGreyColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.search,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 28.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 2.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onFieldSubmitted: (_) async {
                                      logFirebaseEvent(
                                          'SEARCH_PRODUCT_SCREEN_TextField_vf7036pr');
                                      logFirebaseEvent(
                                          'TextField_update_app_state');
                                      FFAppState().searchLoader = false;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'TextField_backend_call');
                                      _model.searchProductAPIResponse =
                                          await QuickartGroup
                                              .searchbystoreproductCall
                                              .call(
                                        userid: FFAppState().userID,
                                        storeid: FFAppState().storeID,
                                        keyword: widget!.keywordPage == null ||
                                                widget!.keywordPage == ''
                                            ? (_model.textController.text
                                                .trimRight())
                                            : widget!.keywordPage,
                                        minPrice: FFAppState().minPrice,
                                        maxPrice: FFAppState().maxPrice,
                                        byName: FFAppState().byName,
                                        stock: FFAppState().stock,
                                        minDiscount: FFAppState().minDiscount,
                                        maxDiscount: FFAppState().maxDiscount,
                                        sort: FFAppState().sort,
                                        sortPrice: FFAppState().sortPrice,
                                        sortName: FFAppState().sortName,
                                        subCatId: 'null',
                                        catId: 'null',
                                        minRating: FFAppState().minRating,
                                        maxRating: FFAppState().maxRating,
                                        perpage: 200,
                                        page: 1,
                                        platform: isiOS ? 'ios' : 'android',
                                      );

                                      if ((_model.searchProductAPIResponse
                                              ?.succeeded ??
                                          true)) {
                                        logFirebaseEvent(
                                            'TextField_update_page_state');
                                        _model.productModel1 = getJsonField(
                                          (_model.searchProductAPIResponse
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data''',
                                        );
                                        logFirebaseEvent(
                                            'TextField_update_app_state');
                                        FFAppState().searchLoader = true;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'TextField_custom_action');
                                        await actions.facebookEventClass(
                                          '0',
                                          widget!.keywordPage == null ||
                                                  widget!.keywordPage == ''
                                              ? (_model.textController.text
                                                  .trimRight())
                                              : widget!.keywordPage!,
                                          'search product',
                                          0.0,
                                          (getJsonField(
                                            (_model.searchProductAPIResponse
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data''',
                                          )
                                                      .toList()
                                                      .map<ProductCountStruct?>(
                                                          ProductCountStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      ProductCountStruct?>)
                                              .withoutNulls
                                              .length,
                                          0.0,
                                          'search',
                                          FFAppState().emptyJson,
                                          ' ',
                                          ' ',
                                          ' ',
                                          ' ',
                                          ' ',
                                        );
                                        logFirebaseEvent(
                                            'TextField_google_analytics_event');
                                        logFirebaseEvent(
                                          'SearchScreenAnalytics',
                                          parameters: {
                                            'Keyword': FFAppState().keyword,
                                            'apiName': 'searchbystoreproduct',
                                          },
                                        );
                                      } else {
                                        logFirebaseEvent(
                                            'TextField_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.searchProductAPIResponse
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
                                        logFirebaseEvent(
                                            'TextField_update_app_state');
                                        FFAppState().searchLoader = true;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    autofocus: true,
                                    textInputAction: TextInputAction.search,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
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
                                      hintText: 'Search here...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color:
                                                FFAppConstants.blackColor0A0A0A,
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
                                              5.0, 0.0, 0.0, 0.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
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
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
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
                                      'SEARCH_PRODUCT_SCREEN_Icon_8r5h3m6u_ON_T');
                                  logFirebaseEvent(
                                      'Icon_clear_text_fields_pin_codes');
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                },
                                child: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 35.0,
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
              Expanded(
                child: Builder(
                  builder: (context) {
                    if ((_model.productModel1 != null) &&
                        ((_model.productModel1!
                                    .toList()
                                    .map<ProductCountStruct?>(
                                        ProductCountStruct.maybeFromMap)
                                    .toList() as Iterable<ProductCountStruct?>)
                                .withoutNulls
                                .length >
                            0)) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'SEARCH_PRODUCT_SCREEN_Stack_vug5sier_ON_');
                          logFirebaseEvent('Stack_update_app_state');
                          FFAppState().isCartShow = false;
                          safeSetState(() {});
                        },
                        child: Stack(
                          children: [
                            Builder(
                              builder: (context) {
                                if (FFAppState().nullValue !=
                                    _model.productModel1?.toString()) {
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.9,
                                    decoration: BoxDecoration(
                                      color: FFAppConstants.whiteColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 10.0),
                                      child: Builder(
                                        builder: (context) {
                                          final productModel =
                                              _model.productModel1?.toList() ??
                                                  [];
                                          if (productModel.isEmpty) {
                                            return Center(
                                              child:
                                                  EmptyDataTwoLineComponentWidget(
                                                title: FFAppState().productMsg,
                                                msg: ' ',
                                                isShop: 1,
                                              ),
                                            );
                                          }

                                          return GridView.builder(
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              10.0,
                                              0,
                                              FFAppState().isCartShow == true
                                                  ? 90.0
                                                  : 20.0,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 5.0,
                                              mainAxisSpacing: 5.0,
                                              childAspectRatio: 0.68,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: productModel.length,
                                            itemBuilder:
                                                (context, productModelIndex) {
                                              final productModelItem =
                                                  productModel[
                                                      productModelIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'SEARCH_PRODUCT_SCREEN_Container_4rbrf4ad');
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                      ProductDetailsScreenWidget
                                                          .routeName);

                                                  logFirebaseEvent(
                                                      'Container_update_app_state');
                                                  FFAppState().productID =
                                                      getJsonField(
                                                    productModelItem,
                                                    r'''$.product_id''',
                                                  ).toString();
                                                  FFAppState().storeID =
                                                      FFAppState().storeID;
                                                  FFAppState().userID =
                                                      FFAppState().userID;
                                                  FFAppState().productName =
                                                      getJsonField(
                                                    productModelItem,
                                                    r'''$.product_name''',
                                                  ).toString();
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'Container_custom_action');
                                                  await actions
                                                      .facebookEventClass(
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
                                                    0.0,
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
                                                  height: 200.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(8.0),
                                                      bottomRight:
                                                          Radius.circular(8.0),
                                                      topLeft:
                                                          Radius.circular(8.0),
                                                      topRight:
                                                          Radius.circular(8.0),
                                                    ),
                                                    border: Border.all(
                                                      color: FFAppConstants
                                                          .whiteColor,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.16,
                                                                        -0.9),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    (MediaQuery.sizeOf(context).width /
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
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      getJsonField(
                                                                        productModelItem,
                                                                        r'''$.product_image''',
                                                                      ).toString(),
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              1.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.png',
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
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
                                                                        productModelItem,
                                                                        r'''$.availability''',
                                                                      )
                                                                          .toString()) ||
                                                                  (FFAppConstants
                                                                          .allAvailability ==
                                                                      getJsonField(
                                                                        productModelItem,
                                                                        r'''$.availability''',
                                                                      ).toString()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            valueOrDefault<double>(
                                                                              (MediaQuery.sizeOf(context).width / 2) - 52,
                                                                              0.0,
                                                                            ),
                                                                            5.0,
                                                                            2.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (FFAppState().qtyZeroCheck ==
                                                                            getJsonField(
                                                                              productModelItem,
                                                                              r'''$.total_cart_qty''',
                                                                            )) {
                                                                          return Visibility(
                                                                            visible: functions.checkVariantsWithStock(getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.varients''',
                                                                                )) ==
                                                                                true,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 0.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 50.0,
                                                                                  height: 25.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FFAppConstants.calculatorColor,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('SEARCH_PRODUCT_SCREEN_ADD_BTN_ON_TAP');
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
                                                                                        ).then((value) => safeSetState(() => _model.returnJson7 = value));

                                                                                        logFirebaseEvent('Button_update_page_state');
                                                                                        _model.productModel1 = functions.updateSelectedIndexData(_model.productModel1!, _model.returnJson7!, productModelIndex);
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Button_custom_action');
                                                                                        _model.checkInternet1 = await actions.checkInternetConnection();
                                                                                        if (_model.checkInternet1 == true) {
                                                                                          logFirebaseEvent('Button_haptic_feedback');
                                                                                          HapticFeedback.heavyImpact();
                                                                                          logFirebaseEvent('Button_backend_call');
                                                                                          _model.apiResultsmdc1 = await QuickartGroup.addToCartCall.call(
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

                                                                                          if ((_model.apiResultsmdc1?.succeeded ?? true)) {
                                                                                            logFirebaseEvent('Button_custom_action');
                                                                                            unawaited(
                                                                                              () async {
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
                                                                                                  'emptyjons',
                                                                                                  ' ',
                                                                                                  ' ',
                                                                                                  ' ',
                                                                                                  ' ',
                                                                                                );
                                                                                              }(),
                                                                                            );
                                                                                            logFirebaseEvent('Button_backend_call');
                                                                                            _model.apiResultbf5 = await QuickartGroup.searchbystoreproductCall.call(
                                                                                              userid: FFAppState().userID,
                                                                                              storeid: FFAppState().storeID,
                                                                                              keyword: _model.textController.text,
                                                                                              minPrice: FFAppState().minPrice,
                                                                                              maxPrice: FFAppState().maxPrice,
                                                                                              byName: FFAppState().byName,
                                                                                              stock: FFAppState().stock,
                                                                                              minDiscount: FFAppState().minDiscount,
                                                                                              maxDiscount: FFAppState().maxDiscount,
                                                                                              sort: FFAppState().sort,
                                                                                              sortPrice: FFAppState().sortPrice,
                                                                                              sortName: FFAppState().sortName,
                                                                                              subCatId: FFAppState().subCateID,
                                                                                              catId: 'null',
                                                                                              minRating: FFAppState().minRating,
                                                                                              maxRating: FFAppState().maxRating,
                                                                                              perpage: 100,
                                                                                              page: 1,
                                                                                              platform: isiOS ? 'ios' : 'android',
                                                                                            );

                                                                                            if ((_model.apiResultbf5?.succeeded ?? true)) {
                                                                                              logFirebaseEvent('Button_update_page_state');
                                                                                              _model.productModel1 = getJsonField(
                                                                                                (_model.apiResultbf5?.jsonBody ?? ''),
                                                                                                r'''$.data''',
                                                                                              );
                                                                                              safeSetState(() {});
                                                                                              logFirebaseEvent('Button_update_app_state');
                                                                                              FFAppState().isCartShow = false;
                                                                                              FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                (_model.apiResultsmdc1?.jsonBody ?? ''),
                                                                                              )!;
                                                                                              FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                  .savingPrice(
                                                                                                    (_model.apiResultsmdc1?.jsonBody ?? ''),
                                                                                                  )!
                                                                                                  .toString());
                                                                                              FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                  .totalPrice(
                                                                                                    (_model.apiResultsmdc1?.jsonBody ?? ''),
                                                                                                  )!
                                                                                                  .toString());
                                                                                              FFAppState().refreshTrigger = true;
                                                                                              safeSetState(() {});
                                                                                              logFirebaseEvent('Button_google_analytics_event');
                                                                                              logFirebaseEvent('AddToCartButtonAnalytics');
                                                                                            } else {
                                                                                              logFirebaseEvent('Button_show_snack_bar');
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    getJsonField(
                                                                                                      (_model.apiResultbf5?.jsonBody ?? ''),
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
                                                                                                  QuickartGroup.addToCartCall.message(
                                                                                                    (_model.apiResultsmdc1?.jsonBody ?? ''),
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

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    text: 'ADD',
                                                                                    options: FFButtonOptions(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FFAppConstants.calculatorColor,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            font: GoogleFonts.montserrat(
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                            color: FFAppConstants.whiteColor,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
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
                                                                                  productModelItem,
                                                                                  r'''$.varients''',
                                                                                )) ==
                                                                                true,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                width: 90.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: FFAppConstants.calculatorColor,
                                                                                    width: 0.0,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          logFirebaseEvent('SEARCH_PRODUCT_SCREEN_PAGE__BTN_ON_TAP');
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
                                                                                            ).then((value) => safeSetState(() => _model.returnJson8 = value));

                                                                                            logFirebaseEvent('Button_update_page_state');
                                                                                            _model.productModel1 = functions.updateSelectedIndexData(_model.productModel1!, _model.returnJson8!, productModelIndex);
                                                                                            safeSetState(() {});
                                                                                          } else {
                                                                                            logFirebaseEvent('Button_custom_action');
                                                                                            _model.internetcheck1Copy = await actions.checkInternetConnection();
                                                                                            if (_model.internetcheck1Copy == true) {
                                                                                              logFirebaseEvent('Button_haptic_feedback');
                                                                                              HapticFeedback.heavyImpact();
                                                                                              logFirebaseEvent('Button_backend_call');
                                                                                              _model.addtocartResult = await QuickartGroup.addToCartCall.call(
                                                                                                userid: FFAppState().userID,
                                                                                                qty: functions.addRemoveQTY(
                                                                                                    getJsonField(
                                                                                                      productModelItem,
                                                                                                      r'''$.cart_qty''',
                                                                                                    ),
                                                                                                    'remove'),
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

                                                                                              if ((_model.addtocartResult?.succeeded ?? true)) {
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
                                                                                                  'emptyjons',
                                                                                                  ' ',
                                                                                                  ' ',
                                                                                                  ' ',
                                                                                                  ' ',
                                                                                                );
                                                                                                logFirebaseEvent('Button_backend_call');
                                                                                                _model.apiResultbf55 = await QuickartGroup.searchbystoreproductCall.call(
                                                                                                  userid: FFAppState().userID,
                                                                                                  storeid: FFAppState().storeID,
                                                                                                  keyword: _model.textController.text,
                                                                                                  minPrice: FFAppState().minPrice,
                                                                                                  maxPrice: FFAppState().maxPrice,
                                                                                                  byName: FFAppState().byName,
                                                                                                  stock: FFAppState().stock,
                                                                                                  minDiscount: FFAppState().minDiscount,
                                                                                                  maxDiscount: FFAppState().maxDiscount,
                                                                                                  sort: FFAppState().sort,
                                                                                                  sortPrice: FFAppState().sortPrice,
                                                                                                  sortName: FFAppState().sortName,
                                                                                                  subCatId: FFAppState().subCateID,
                                                                                                  catId: 'null',
                                                                                                  minRating: FFAppState().minRating,
                                                                                                  maxRating: FFAppState().maxRating,
                                                                                                  perpage: 100,
                                                                                                  page: 1,
                                                                                                  platform: isiOS ? 'ios' : 'android',
                                                                                                );

                                                                                                if ((_model.apiResultbf55?.succeeded ?? true)) {
                                                                                                  logFirebaseEvent('Button_update_page_state');
                                                                                                  _model.productModel1 = getJsonField(
                                                                                                    (_model.apiResultbf55?.jsonBody ?? ''),
                                                                                                    r'''$.data''',
                                                                                                  );
                                                                                                  safeSetState(() {});
                                                                                                  logFirebaseEvent('Button_update_app_state');
                                                                                                  FFAppState().isCartShow = false;
                                                                                                  FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                    (_model.addtocartResult?.jsonBody ?? ''),
                                                                                                  )!;
                                                                                                  FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                      .savingPrice(
                                                                                                        (_model.addtocartResult?.jsonBody ?? ''),
                                                                                                      )!
                                                                                                      .toString());
                                                                                                  FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                      .totalPrice(
                                                                                                        (_model.addtocartResult?.jsonBody ?? ''),
                                                                                                      )!
                                                                                                      .toString());
                                                                                                  FFAppState().refreshTrigger = true;
                                                                                                  safeSetState(() {});
                                                                                                  logFirebaseEvent('Button_google_analytics_event');
                                                                                                  logFirebaseEvent(
                                                                                                    'Remove From Cart',
                                                                                                    parameters: {
                                                                                                      'API Name': 'Add To Cart',
                                                                                                      'Screen Name': 'Search Product Screen',
                                                                                                    },
                                                                                                  );
                                                                                                } else {
                                                                                                  logFirebaseEvent('Button_show_snack_bar');
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        getJsonField(
                                                                                                          (_model.apiResultbf55?.jsonBody ?? ''),
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
                                                                                                      QuickartGroup.addToCartCall.message(
                                                                                                        (_model.addtocartResult?.jsonBody ?? ''),
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
                                                                                                  duration: Duration(milliseconds: 2000),
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
                                                                                    Container(
                                                                                      width: 30.0,
                                                                                      height: 30.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FFAppConstants.calculatorColor,
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                          bottomRight: Radius.circular(5.0),
                                                                                          topLeft: Radius.circular(0.0),
                                                                                          topRight: Radius.circular(5.0),
                                                                                        ),
                                                                                      ),
                                                                                      child: Builder(
                                                                                        builder: (context) => FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            logFirebaseEvent('SEARCH_PRODUCT_SCREEN_PAGE__BTN_ON_TAP');
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
                                                                                              ).then((value) => safeSetState(() => _model.returnJson9 = value));

                                                                                              logFirebaseEvent('Button_update_page_state');
                                                                                              _model.productModel1 = functions.updateSelectedIndexData(_model.productModel1!, _model.returnJson9!, productModelIndex);
                                                                                              safeSetState(() {});
                                                                                            } else {
                                                                                              logFirebaseEvent('Button_custom_action');
                                                                                              _model.connectivityResult123 = await actions.checkInternetConnection();
                                                                                              if (_model.connectivityResult123 == true) {
                                                                                                logFirebaseEvent('Button_haptic_feedback');
                                                                                                HapticFeedback.heavyImpact();
                                                                                                if (getJsonField(
                                                                                                      productModelItem,
                                                                                                      r'''$.cart_qty''',
                                                                                                    ) ==
                                                                                                    getJsonField(
                                                                                                      productModelItem,
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
                                                                                                            height: 150.0,
                                                                                                            title: " ",
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

                                                                                                  if ((_model.apiResultAddCart123?.succeeded ?? true)) {
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
                                                                                                      'emptyjons',
                                                                                                      ' ',
                                                                                                      ' ',
                                                                                                      ' ',
                                                                                                      ' ',
                                                                                                    );
                                                                                                    logFirebaseEvent('Button_backend_call');
                                                                                                    _model.apiResultbf555 = await QuickartGroup.searchbystoreproductCall.call(
                                                                                                      userid: FFAppState().userID,
                                                                                                      storeid: FFAppState().storeID,
                                                                                                      keyword: _model.textController.text,
                                                                                                      minPrice: FFAppState().minPrice,
                                                                                                      maxPrice: FFAppState().maxPrice,
                                                                                                      byName: FFAppState().byName,
                                                                                                      stock: FFAppState().stock,
                                                                                                      minDiscount: FFAppState().minDiscount,
                                                                                                      maxDiscount: FFAppState().maxDiscount,
                                                                                                      sort: FFAppState().sort,
                                                                                                      sortPrice: FFAppState().sortPrice,
                                                                                                      sortName: FFAppState().sortName,
                                                                                                      subCatId: FFAppState().subCateID,
                                                                                                      catId: 'null',
                                                                                                      minRating: FFAppState().minRating,
                                                                                                      maxRating: FFAppState().maxRating,
                                                                                                      perpage: 100,
                                                                                                      page: 1,
                                                                                                      platform: isiOS ? 'ios' : 'android',
                                                                                                    );

                                                                                                    if ((_model.apiResultbf555?.succeeded ?? true)) {
                                                                                                      logFirebaseEvent('Button_update_page_state');
                                                                                                      _model.productModel1 = getJsonField(
                                                                                                        (_model.apiResultbf555?.jsonBody ?? ''),
                                                                                                        r'''$.data''',
                                                                                                      );
                                                                                                      safeSetState(() {});
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
                                                                                                      safeSetState(() {});
                                                                                                      logFirebaseEvent('Button_google_analytics_event');
                                                                                                      logFirebaseEvent(
                                                                                                        'Add To Cart',
                                                                                                        parameters: {
                                                                                                          'API Name': 'Add To Cart',
                                                                                                          'Screen Name': 'Search Product Screen',
                                                                                                        },
                                                                                                      );
                                                                                                    } else {
                                                                                                      logFirebaseEvent('Button_show_snack_bar');
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            getJsonField(
                                                                                                              (_model.apiResultbf5?.jsonBody ?? ''),
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
                                                                                              width: 1.0,
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
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (functions
                                                                      .checkVariantsWithStock(
                                                                          getJsonField(
                                                                    productModelItem,
                                                                    r'''$.varients''',
                                                                  )) ==
                                                                  false)
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    (MediaQuery.sizeOf(context).width /
                                                                            2) -
                                                                        10,
                                                                    150.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x5C14181B),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
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
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
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
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              2.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              productModelItem,
                                                                              r'''$.product_name''',
                                                                            ).toString().maybeHandleOverflow(
                                                                                  maxChars: 40,
                                                                                  replacement: '…',
                                                                                ),
                                                                            maxLines:
                                                                                2,
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
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 3.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.quantity''',
                                                                                ).toString(),
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
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.unit''',
                                                                                ).toString(),
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
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      if ((getJsonField(
                                                                            productModelItem,
                                                                            r'''$.varients''',
                                                                          ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
                                                                              .withoutNulls
                                                                              .length >=
                                                                          2)
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
                                                                            logFirebaseEvent('SEARCH_PRODUCT_SCREEN_Row_2p55q5dz_ON_TA');
                                                                            logFirebaseEvent('Row_bottom_sheet');
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
                                                                                safeSetState(() => _model.returnJson10 = value));

                                                                            logFirebaseEvent('Row_update_page_state');
                                                                            _model.productModel1 = functions.updateSelectedIndexData(
                                                                                _model.productModel1!,
                                                                                _model.returnJson10!,
                                                                                productModelIndex);
                                                                            safeSetState(() {});

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              if ((getJsonField(
                                                                                    productModelItem,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                                                                                child: Icon(
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
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
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                      child: RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: 'AED  ',
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
                                                                                              text: valueOrDefault<String>(
                                                                                                functions.setDecimalValue(getJsonField(
                                                                                                  productModelItem,
                                                                                                  r'''$.price''',
                                                                                                ).toString()),
                                                                                                '0',
                                                                                              ),
                                                                                              style: GoogleFonts.montserrat(
                                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontSize: 13.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
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
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          if (getJsonField(
                                                                                                productModelItem,
                                                                                                r'''$.price''',
                                                                                              ) !=
                                                                                              getJsonField(
                                                                                                productModelItem,
                                                                                                r'''$.mrp''',
                                                                                              )) {
                                                                                            return Row(
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
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          } else {
                                                                                            return Container(
                                                                                              width: 10.0,
                                                                                              height: 10.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FFAppConstants.whiteColor,
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
                                                                ],
                                                              ),
                                                            ),
                                                          if (functions
                                                                  .checkVariantsWithStock(
                                                                      getJsonField(
                                                                productModelItem,
                                                                r'''$.varients''',
                                                              )) ==
                                                              false)
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 84.5,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x5C14181B),
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
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
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
                                                                        alignment: AlignmentDirectional(
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
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.37,
                                                                            height:
                                                                                35.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 2.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.product_name''',
                                                                                ).toString().maybeHandleOverflow(
                                                                                      maxChars: 40,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                textAlign: TextAlign.start,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.quantity''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
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
                                                                                productModelItem,
                                                                                r'''$.unit''',
                                                                              ).toString(),
                                                                              textAlign: TextAlign.start,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              0.0,
                                                                              2.0),
                                                                          child:
                                                                              Text(
                                                                            FFAppConstants.unavailable,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Text(
                                                                          FFAppConstants.notifyMe ==
                                                                                  getJsonField(
                                                                                    productModelItem,
                                                                                    r'''$.notify_me''',
                                                                                  ).toString()
                                                                              ? FFAppConstants.notified
                                                                              : 'You will be notified.',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.montserrat(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 8.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  if (FFAppConstants
                                                                          .stockNotify ==
                                                                      getJsonField(
                                                                        productModelItem,
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
                                                                          if (FFAppConstants.notifyMe ==
                                                                              getJsonField(
                                                                                productModelItem,
                                                                                r'''$.notify_me''',
                                                                              ).toString()) {
                                                                            return FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 30.0,
                                                                              icon: Icon(
                                                                                Icons.notifications_none_sharp,
                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                size: 25.0,
                                                                              ),
                                                                              showLoadingIndicator: true,
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('SEARCH_PRODUCT_SCREEN_notifications_none');
                                                                                logFirebaseEvent('IconButton_custom_action');
                                                                                _model.connnectivty1 = await actions.checkInternetConnection();
                                                                                if (_model.connnectivty1 == true) {
                                                                                  logFirebaseEvent('IconButton_haptic_feedback');
                                                                                  HapticFeedback.mediumImpact();
                                                                                  logFirebaseEvent('IconButton_backend_call');
                                                                                  _model.aPInotify = await QuickartGroup.addnotifymeCall.call(
                                                                                    productID: getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.product_id''',
                                                                                    ).toString(),
                                                                                    varientID: getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.varient_id''',
                                                                                    ).toString(),
                                                                                    userID: FFAppState().userID,
                                                                                    platform: FFAppState().platform,
                                                                                    fcmToken: FFAppState().fcmToken,
                                                                                  );

                                                                                  if ((_model.aPInotify?.succeeded ?? true)) {
                                                                                    logFirebaseEvent('IconButton_backend_call');
                                                                                    _model.apiResultnotify = await QuickartGroup.searchbystoreproductCall.call(
                                                                                      userid: FFAppState().userID,
                                                                                      storeid: FFAppState().storeID,
                                                                                      keyword: _model.textController.text,
                                                                                      minPrice: FFAppState().minPrice,
                                                                                      maxPrice: FFAppState().maxPrice,
                                                                                      byName: FFAppState().byName,
                                                                                      stock: FFAppState().stock,
                                                                                      minDiscount: FFAppState().minDiscount,
                                                                                      maxDiscount: FFAppState().maxDiscount,
                                                                                      sort: FFAppState().sort,
                                                                                      sortPrice: FFAppState().sortPrice,
                                                                                      sortName: FFAppState().sortName,
                                                                                      subCatId: FFAppState().subCateID,
                                                                                      catId: 'null',
                                                                                      minRating: FFAppState().minRating,
                                                                                      maxRating: FFAppState().maxRating,
                                                                                      perpage: 100,
                                                                                      page: 1,
                                                                                    );

                                                                                    if ((_model.apiResultnotify?.succeeded ?? true)) {
                                                                                      logFirebaseEvent('IconButton_update_page_state');
                                                                                      _model.productModel1 = getJsonField(
                                                                                        (_model.apiResultnotify?.jsonBody ?? ''),
                                                                                        r'''$.data''',
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                      logFirebaseEvent('IconButton_google_analytics_event');
                                                                                      logFirebaseEvent(
                                                                                        'Add To Cart',
                                                                                        parameters: {
                                                                                          'API Name': 'Add To Cart',
                                                                                          'Screen Name': 'Search Product Screen',
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      logFirebaseEvent('IconButton_show_snack_bar');
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            getJsonField(
                                                                                              (_model.apiResultbf5?.jsonBody ?? ''),
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
                                                                                    logFirebaseEvent('IconButton_show_snack_bar');
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          getJsonField(
                                                                                            (_model.aPInotify?.jsonBody ?? ''),
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
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 2.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('SEARCH_PRODUCT_SCREEN_CircleImage_o7dszh');
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
                                                        decoration:
                                                            BoxDecoration(
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
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (FFAppConstants
                                                                        .percentageCheck <
                                                                    getJsonField(
                                                                      productModelItem,
                                                                      r'''$.discountper''',
                                                                    )) {
                                                                  return Container(
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FFAppConstants
                                                                          .green44AC20,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
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
                                                                            3.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
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
                                                                                text: '% OFF',
                                                                                style: GoogleFonts.montserrat(
                                                                                  color: Colors.white,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontSize: 10.0,
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
                                                                  );
                                                                } else {
                                                                  return Container(
                                                                    height:
                                                                        10.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      '\n',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.readexPro(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                            if (FFAppState()
                                                                    .nullValue !=
                                                                getJsonField(
                                                                  productModelItem,
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
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                      FFAppConstants.percentageCheck <
                                                                              getJsonField(
                                                                                productModelItem,
                                                                                r'''$.discountper''',
                                                                              )
                                                                          ? 0.0
                                                                          : 8.0,
                                                                      0.0,
                                                                    )),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFDCE9D8),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          getJsonField(
                                                                        productModelItem,
                                                                        r'''$.country_icon''',
                                                                      ).toString(),
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
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
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
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
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF4F6F4),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
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
                                                                        'SEARCH_PRODUCT_SCREEN_PAGE_Icon1_ON_TAP');
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
                                                                          productModelItem,
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
                                                                            'Icon1_backend_call');
                                                                        _model.apiResultbf1 = await QuickartGroup
                                                                            .searchbystoreproductCall
                                                                            .call(
                                                                          userid:
                                                                              FFAppState().userID,
                                                                          storeid:
                                                                              FFAppState().storeID,
                                                                          keyword: _model
                                                                              .textController
                                                                              .text,
                                                                          minPrice:
                                                                              FFAppState().minPrice,
                                                                          maxPrice:
                                                                              FFAppState().maxPrice,
                                                                          byName:
                                                                              FFAppState().byName,
                                                                          stock:
                                                                              FFAppState().stock,
                                                                          minDiscount:
                                                                              FFAppState().minDiscount,
                                                                          maxDiscount:
                                                                              FFAppState().maxDiscount,
                                                                          sort:
                                                                              FFAppState().sort,
                                                                          sortPrice:
                                                                              FFAppState().sortPrice,
                                                                          sortName:
                                                                              FFAppState().sortName,
                                                                          subCatId:
                                                                              FFAppState().subCateID,
                                                                          catId:
                                                                              'null',
                                                                          minRating:
                                                                              FFAppState().minRating,
                                                                          maxRating:
                                                                              FFAppState().maxRating,
                                                                          perpage:
                                                                              100,
                                                                          page:
                                                                              1,
                                                                        );

                                                                        if ((_model.apiResultbf1?.succeeded ??
                                                                            true)) {
                                                                          logFirebaseEvent(
                                                                              'Icon1_update_page_state');
                                                                          _model.productModel1 =
                                                                              getJsonField(
                                                                            (_model.apiResultbf1?.jsonBody ??
                                                                                ''),
                                                                            r'''$.data''',
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Icon1_google_analytics_event');
                                                                          logFirebaseEvent(
                                                                            'Remove From Wishlist',
                                                                            parameters: {
                                                                              'API Name': 'Add Remove Wishlist',
                                                                              'Screen Name': 'Search Product Screen',
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
                                                                            FFAppState().emptyJson,
                                                                            'c',
                                                                            ' ',
                                                                            ' ',
                                                                            ' ',
                                                                            ' ',
                                                                          );
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Icon1_show_snack_bar');
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                getJsonField(
                                                                                  (_model.apiResultbf1?.jsonBody ?? ''),
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
                                                                    color: FFAppConstants
                                                                        .redNotifyWish,
                                                                    size: 35.0,
                                                                  ),
                                                                ),
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
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
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
                                                                        'SEARCH_PRODUCT_SCREEN_PAGE_Icon2_ON_TAP');
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
                                                                      _model.addRemoveAPIResult = await QuickartGroup
                                                                          .addremwishlistCall
                                                                          .call(
                                                                        userid:
                                                                            FFAppState().userID,
                                                                        storeID:
                                                                            FFAppState().storeID,
                                                                        varientID:
                                                                            getJsonField(
                                                                          productModelItem,
                                                                          r'''$.varient_id''',
                                                                        ).toString(),
                                                                        deviceid:
                                                                            FFAppState().deviceID,
                                                                        platform: isiOS
                                                                            ? 'ios'
                                                                            : 'android',
                                                                      );

                                                                      if ((_model
                                                                              .addRemoveAPIResult
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        logFirebaseEvent(
                                                                            'Icon2_backend_call');
                                                                        _model.apiResultbf11 = await QuickartGroup
                                                                            .searchbystoreproductCall
                                                                            .call(
                                                                          userid:
                                                                              FFAppState().userID,
                                                                          storeid:
                                                                              FFAppState().storeID,
                                                                          keyword: _model
                                                                              .textController
                                                                              .text,
                                                                          minPrice:
                                                                              FFAppState().minPrice,
                                                                          maxPrice:
                                                                              FFAppState().maxPrice,
                                                                          byName:
                                                                              FFAppState().byName,
                                                                          stock:
                                                                              FFAppState().stock,
                                                                          minDiscount:
                                                                              FFAppState().minDiscount,
                                                                          maxDiscount:
                                                                              FFAppState().maxDiscount,
                                                                          sort:
                                                                              FFAppState().sort,
                                                                          sortPrice:
                                                                              FFAppState().sortPrice,
                                                                          sortName:
                                                                              FFAppState().sortName,
                                                                          subCatId:
                                                                              FFAppState().subCateID,
                                                                          catId:
                                                                              'null',
                                                                          minRating:
                                                                              FFAppState().minRating,
                                                                          maxRating:
                                                                              FFAppState().maxRating,
                                                                          perpage:
                                                                              100,
                                                                          page:
                                                                              1,
                                                                        );

                                                                        if ((_model.apiResultbf11?.succeeded ??
                                                                            true)) {
                                                                          logFirebaseEvent(
                                                                              'Icon2_update_page_state');
                                                                          _model.productModel1 =
                                                                              getJsonField(
                                                                            (_model.apiResultbf11?.jsonBody ??
                                                                                ''),
                                                                            r'''$.data''',
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Icon2_google_analytics_event');
                                                                          logFirebaseEvent(
                                                                            'Add To Wishlist',
                                                                            parameters: {
                                                                              'API Name': 'Add Remove Wishlist',
                                                                              'Screen Name': 'Search Product Screen',
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
                                                                            FFAppState().emptyJson,
                                                                            'c',
                                                                            ' ',
                                                                            ' ',
                                                                            ' ',
                                                                            ' ',
                                                                          );
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Icon2_show_snack_bar');
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                getJsonField(
                                                                                  (_model.apiResultbf11?.jsonBody ?? ''),
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
                                                                        logFirebaseEvent(
                                                                            'Icon2_show_snack_bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              getJsonField(
                                                                                (_model.addRemoveAPIResult?.jsonBody ?? ''),
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              style: GoogleFonts.montserrat(
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
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Icon2_show_snack_bar');
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
                                                                        .favorite_border,
                                                                    color: FFAppConstants
                                                                        .redNotifyWish,
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
                                      ),
                                    ),
                                  );
                                } else {
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 200.0, 0.0, 0.0),
                                      child: Text(
                                        (_model.productModel1
                                                            ?.toList()
                                                            .map<ProductCountStruct?>(
                                                                ProductCountStruct
                                                                    .maybeFromMap)
                                                            .toList()
                                                        as Iterable<
                                                            ProductCountStruct?>)
                                                    .withoutNulls
                                                    ?.length ==
                                                0
                                            ? FFAppConstants.productNotFound
                                            : 'Loading...',
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
                                  );
                                }
                              },
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
                                          'SEARCH_PRODUCT_SCREEN_cartbtnContainer_O');
                                      logFirebaseEvent(
                                          'cartbtnContainer_update_app_state');
                                      FFAppState().isCartShow =
                                          !(FFAppState().isCartShow ?? true);
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FFAppConstants.indigoColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
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
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      functions
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
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 8.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SEARCH_PRODUCT_SCREEN_Row_9xtnm34q_ON_TA');
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
                                            logFirebaseEvent(
                                                'Row_custom_action');
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
                                                'Screen Name':
                                                    'Search Product Screen',
                                              },
                                            );
                                          } else {
                                            logFirebaseEvent('Row_navigate_to');

                                            context.pushNamed(
                                                DailyCartScreenWidget
                                                    .routeName);

                                            logFirebaseEvent(
                                                'Row_update_app_state');
                                            FFAppState().isCartShow = false;
                                            FFAppState().screenName =
                                                'dailyCart';
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Row_custom_action');
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
                                                'Navigate To':
                                                    'Daily Cart Screen',
                                                'Screen Name':
                                                    'Search Product Screen',
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                                  fontSize:
                                                                      12.0,
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
                                                                'FREE DELIVERY.',
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
                                                                  fontSize:
                                                                      12.0,
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
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                  fontSize: 8.0,
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
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
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
                                                                    fontSize:
                                                                        16.0,
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
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16.0,
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
                                                            MediaQuery.of(
                                                                    context)
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
                                                                    fontSize:
                                                                        16.0,
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
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16.0,
                                                              ),
                                                            )
                                                          ],
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
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
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
                      );
                    } else {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: FFAppConstants.whiteColor,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (FFAppState().searchLoader == true) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Text(
                                        (_model.productModel1 != null) &&
                                                ((_model.productModel1
                                                                ?.toList()
                                                                .map<ProductCountStruct?>(
                                                                    ProductCountStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                ProductCountStruct?>)
                                                        .withoutNulls
                                                        ?.length ==
                                                    0)
                                            ? FFAppConstants.productNotFound
                                            : 'Search product here...',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: FFAppConstants
                                                  .blackColor666666,
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/new_loader.gif',
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
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
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
