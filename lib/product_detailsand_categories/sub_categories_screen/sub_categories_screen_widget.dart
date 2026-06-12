import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sub_categories_screen_model.dart';
export 'sub_categories_screen_model.dart';

class SubCategoriesScreenWidget extends StatefulWidget {
  const SubCategoriesScreenWidget({
    super.key,
    this.catid,
    this.utmSource,
    this.utmCampaign,
    this.utmNetwork,
    this.utmMedium,
    this.utmKeyword,
    this.utmPlacement,
    this.category,
    this.subcatid,
    this.name,
  });

  final String? catid;
  final String? utmSource;
  final String? utmCampaign;
  final String? utmNetwork;
  final String? utmMedium;
  final String? utmKeyword;
  final String? utmPlacement;
  final String? category;
  final String? subcatid;
  final String? name;

  static String routeName = 'subCategoriesScreen';
  static String routePath = '/subcategories-product-list';

  @override
  State<SubCategoriesScreenWidget> createState() =>
      _SubCategoriesScreenWidgetState();
}

class _SubCategoriesScreenWidgetState extends State<SubCategoriesScreenWidget> {
  late SubCategoriesScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubCategoriesScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'subCategoriesScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SUB_CATEGORIES_SCREEN_subCategoriesScree');
      logFirebaseEvent('subCategoriesScreen_custom_action');
      _model.connectivityResultCatee = await actions.checkInternetConnection();
      if (_model.connectivityResultCatee == true) {
        logFirebaseEvent('subCategoriesScreen_backend_call');
        _model.apiResultSubcatID = await QuickartGroup.subcateeCall.call(
          storeid: valueOrDefault<String>(
            FFAppState().storeID,
            '7',
          ),
          catid: widget!.catid == null || widget!.catid == ''
              ? FFAppState().catID
              : widget!.catid,
          platform: isiOS ? 'ios' : 'android',
        );

        if ((_model.apiResultSubcatID?.succeeded ?? true)) {
          logFirebaseEvent('subCategoriesScreen_wait__delay');
          await Future.delayed(
            Duration(
              milliseconds: 100,
            ),
          );
          logFirebaseEvent('subCategoriesScreen_custom_action');
          await actions.facebookEventClass(
            widget!.catid == null || widget!.catid == ''
                ? FFAppState().catID
                : widget!.catid!,
            getJsonField(
              (_model.apiResultSubcatID?.jsonBody ?? ''),
              r'''$.data[0].title''',
            ).toString(),
            widget!.subcatid == null || widget!.subcatid == ''
                ? getJsonField(
                    (_model.apiResultSubcatID?.jsonBody ?? ''),
                    r'''$.data[0].cat_id''',
                  ).toString()
                : widget!.subcatid!,
            0.0,
            0,
            0.0,
            'subcategory',
            FFAppState().emptyJson,
            'c',
            ' ',
            ' ',
            ' ',
            ' ',
          );
          logFirebaseEvent('subCategoriesScreen_backend_call');
          _model.apiResultCatProduct1 = await QuickartGroup.catproductCall.call(
            userid: FFAppState().userID,
            storeid: FFAppState().storeID,
            catid: widget!.catid == null || widget!.catid == ''
                ? FFAppState().catID
                : widget!.catid,
            byName: FFAppState().byName,
            minPrice: FFAppState().minPrice,
            maxPrice: FFAppState().maxPrice,
            stock: FFAppState().stock,
            minDiscount: FFAppState().minDiscount,
            maxDiscount: FFAppState().maxDiscount,
            sort: FFAppState().sort,
            sortName: FFAppState().sortName,
            sortPrice: FFAppState().sortPrice,
            subCatID: widget!.subcatid == null || widget!.subcatid == ''
                ? getJsonField(
                    (_model.apiResultSubcatID?.jsonBody ?? ''),
                    r'''$.data[0].cat_id''',
                  ).toString()
                : widget!.subcatid,
            platform: isiOS ? 'ios' : 'android',
          );

          if ((_model.apiResultCatProduct1?.succeeded ?? true)) {
            logFirebaseEvent('subCategoriesScreen_update_page_state');
            _model.productModelJson = getJsonField(
              (_model.apiResultCatProduct1?.jsonBody ?? ''),
              r'''$.data''',
            );
            _model.onCategorySelected = 'notSelected';
            _model.selectedSubCatID =
                widget!.subcatid == null || widget!.subcatid == ''
                    ? getJsonField(
                        (_model.apiResultSubcatID?.jsonBody ?? ''),
                        r'''$.data[0].cat_id''',
                      ).toString()
                    : widget!.subcatid;
            _model.subCatName =
                widget!.subcatid == null || widget!.subcatid == ''
                    ? getJsonField(
                        (_model.apiResultSubcatID?.jsonBody ?? ''),
                        r'''$.data[0].title''',
                      ).toString()
                    : widget!.name!;
            safeSetState(() {});
            logFirebaseEvent('subCategoriesScreen_update_app_state');
            FFAppState().categoryName =
                widget!.category == null || widget!.category == ''
                    ? FFAppState().categoryName
                    : widget!.category!;
            safeSetState(() {});
            if (widget!.catid != null && widget!.catid != '') {
              logFirebaseEvent('subCategoriesScreen_backend_call');
              _model.apiResultSeoSource =
                  await QuickartGroup.seosourceCall.call(
                utmSource: widget!.utmSource,
                utmcampaign: widget!.utmCampaign,
                utmnetwork: widget!.utmNetwork,
                utmmedium: widget!.utmMedium,
                utmkeyword: widget!.utmKeyword,
                placement: widget!.utmPlacement,
                userid: FFAppState().userID,
                deviceid: FFAppState().deviceID,
                fcmtoken: FFAppState().fcmToken,
                platform: FFAppState().platform,
              );

              if ((_model.apiResultSeoSource?.succeeded ?? true)) {
                logFirebaseEvent('subCategoriesScreen_update_page_state');
                _model.imagePath = getJsonField(
                  (_model.apiResultSubcatID?.jsonBody ?? ''),
                  r'''$.data[0].banner''',
                ).toString();
                safeSetState(() {});
                logFirebaseEvent('subCategoriesScreen_custom_action');
                await actions.facebookEventClass(
                  widget!.utmKeyword!,
                  widget!.utmPlacement!,
                  FFAppState().userID,
                  0.0,
                  0,
                  0.0,
                  'utmSource',
                  FFAppState().emptyJson,
                  'subcatgory',
                  widget!.utmSource,
                  widget!.utmCampaign,
                  widget!.utmNetwork,
                  widget!.utmMedium,
                );
              } else {
                logFirebaseEvent('subCategoriesScreen_show_snack_bar');
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
            } else {
              logFirebaseEvent('subCategoriesScreen_update_page_state');
              _model.imagePath = getJsonField(
                (_model.apiResultSubcatID?.jsonBody ?? ''),
                r'''$.data[0].banner''',
              ).toString();
              safeSetState(() {});
            }
          } else {
            logFirebaseEvent('subCategoriesScreen_show_snack_bar');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  getJsonField(
                    (_model.apiResultCatProduct1?.jsonBody ?? ''),
                    r'''$.message''',
                  ).toString(),
                  style: GoogleFonts.montserrat(
                    color: FFAppConstants.indigoColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                  ),
                ),
                duration: Duration(milliseconds: 5050),
                backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
              ),
            );
          }
        } else {
          logFirebaseEvent('subCategoriesScreen_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                getJsonField(
                  (_model.apiResultSubcatID?.jsonBody ?? ''),
                  r'''$.message''',
                ).toString(),
                style: GoogleFonts.montserrat(
                  color: FFAppConstants.blackColor0A0A0A,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                ),
              ),
              duration: Duration(milliseconds: 4100),
              backgroundColor: FFAppConstants.NeutralBlack50Color,
            ),
          );
        }

        logFirebaseEvent('subCategoriesScreen_google_analytics_eve');
        logFirebaseEvent(
          'SubCategoriesScreenAnalytics',
          parameters: {
            'ScreenName': 'Subcategory Screen',
            'ApiName': 'subcatee',
          },
        );
      } else {
        logFirebaseEvent('subCategoriesScreen_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FFAppConstants.internetString,
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
          backgroundColor: FFAppConstants.appBarColor,
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
               logFirebaseEvent('SUB_CATEGORIES_SCREEN_chevron_left_ICN_O');
              if (widget!.category == null || widget!.category == '') {
                logFirebaseEvent('IconButton_navigate_back');
                context.safePop();
                logFirebaseEvent('IconButton_update_app_state');
                FFAppState().isCartShow = false;
                safeSetState(() {});
              } else {
                if (FFAppState().isUserLogin == true) {
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(DashboardScreenWidget.routeName);

                  logFirebaseEvent('IconButton_update_app_state');
                  FFAppState().isCartShow = false;
                  safeSetState(() {});
                } else {
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(LoginOnBoardScreenWidget.routeName);
                }
              }
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                widget!.catid != null && widget!.catid != ''
                    ? ((String var1) {
                        return var1.replaceAll(RegExp('_'), ' ');
                      }(widget!.category!))
                    : FFAppState().categoryName,
                textAlign: TextAlign.start,
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
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('SUB_CATEGORIES_SCREEN_Stack_kh53r352_ON_');
              logFirebaseEvent('Stack_update_app_state');
              FFAppState().isCartShow = false;
              safeSetState(() {});
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      if (_model.apiResultSubcatID != null) {
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((getJsonField(
                                  (_model.apiResultSubcatID?.jsonBody ?? ''),
                                  r'''$.data''',
                                )
                                            .toList()
                                            .map<ProductCountStruct?>(
                                                ProductCountStruct.maybeFromMap)
                                            .toList()
                                        as Iterable<ProductCountStruct?>)
                                    .withoutNulls
                                    .length >
                                1)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    1.0, 10.0, 0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.18,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FFAppConstants.whiteColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final subcategory = getJsonField(
                                        (_model.apiResultSubcatID?.jsonBody ??
                                            ''),
                                        r'''$.data''',
                                      ).toList();
                                      if (subcategory.isEmpty) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/No_data_available.png',
                                          ),
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: subcategory.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 2.0),
                                        itemBuilder:
                                            (context, subcategoryIndex) {
                                          final subcategoryItem =
                                              subcategory[subcategoryIndex];
                                          return Container(
                                            width: 68.0,
                                            height: 95.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
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
                                                            'SUB_CATEGORIES_SCREEN_Container_dgznozse');
                                                        logFirebaseEvent(
                                                            'Container_update_page_state');
                                                        _model.selectedSubCatID =
                                                            getJsonField(
                                                          subcategoryItem,
                                                          r'''$.cat_id''',
                                                        ).toString();
                                                        _model.isLoadingIndicator =
                                                            false;
                                                        _model.imagePath =
                                                            getJsonField(
                                                          subcategoryItem,
                                                          r'''$.banner''',
                                                        ).toString();
                                                        _model.subCatName =
                                                            getJsonField(
                                                          subcategoryItem,
                                                          r'''$.title''',
                                                        ).toString();
                                                        _model.productModelJson =
                                                            null;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Container_custom_action');
                                                        await actions
                                                            .facebookEventClass(
                                                          widget!.catid == null ||
                                                                  widget!.catid ==
                                                                      ''
                                                              ? FFAppState()
                                                                  .catID
                                                              : widget!.catid!,
                                                          getJsonField(
                                                            subcategoryItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          getJsonField(
                                                            subcategoryItem,
                                                            r'''$.cat_id''',
                                                          ).toString(),
                                                          0.0,
                                                          0,
                                                          0.0,
                                                          'subcategory',
                                                          FFAppState()
                                                              .emptyJson,
                                                          'c',
                                                          ' ',
                                                          ' ',
                                                          ' ',
                                                          ' ',
                                                        );
                                                        logFirebaseEvent(
                                                            'Container_backend_call');
                                                        _model.apiResultCartProduct =
                                                            await QuickartGroup
                                                                .catproductCall
                                                                .call(
                                                          userid: FFAppState()
                                                              .userID,
                                                          storeid: FFAppState()
                                                              .storeID,
                                                          catid: widget!.catid ==
                                                                      null ||
                                                                  widget!.catid ==
                                                                      ''
                                                              ? FFAppState()
                                                                  .catID
                                                              : widget!.catid,
                                                          byName: FFAppState()
                                                              .byName,
                                                          minPrice: FFAppState()
                                                              .minPrice,
                                                          maxPrice: FFAppState()
                                                              .maxPrice,
                                                          stock: FFAppState()
                                                              .stock,
                                                          minDiscount:
                                                              FFAppState()
                                                                  .minPrice,
                                                          maxDiscount:
                                                              FFAppState()
                                                                  .maxDiscount,
                                                          sort:
                                                              FFAppState().sort,
                                                          sortName: FFAppState()
                                                              .sortName,
                                                          sortPrice:
                                                              FFAppState()
                                                                  .sortPrice,
                                                          subCatID:
                                                              getJsonField(
                                                            subcategoryItem,
                                                            r'''$.cat_id''',
                                                          ).toString(),
                                                          platform: isiOS
                                                              ? 'ios'
                                                              : 'android',
                                                        );

                                                        if ((_model
                                                                .apiResultCartProduct
                                                                ?.succeeded ??
                                                            true)) {
                                                          logFirebaseEvent(
                                                              'Container_update_page_state');
                                                          _model.productModelJson =
                                                              getJsonField(
                                                            (_model.apiResultCartProduct
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.data''',
                                                          );
                                                          _model.selectedSubCatID =
                                                              getJsonField(
                                                            subcategoryItem,
                                                            r'''$.cat_id''',
                                                          ).toString();
                                                          _model.isLoadingIndicator =
                                                              false;
                                                          safeSetState(() {});
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Container_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  (_model.apiResultCartProduct
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.message''',
                                                                ).toString(),
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  color: FFAppConstants
                                                                      .indigoColor,
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

                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: 60.0,
                                                        height: 90.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FFAppConstants
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    10.0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 0.3,
                                                          ),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: functions.setbackgroundColorSubcategories(
                                                                      getJsonField(
                                                                        subcategoryItem,
                                                                        r'''$.cat_id''',
                                                                      ).toString(),
                                                                      _model.selectedSubCatID,
                                                                      0,
                                                                      0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    getJsonField(
                                                                      subcategoryItem,
                                                                      r'''$.image''',
                                                                    ).toString(),
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.png',
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
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
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 90.0,
                                                                  height: 37.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        getJsonField(
                                                                          subcategoryItem,
                                                                          r'''$.title''',
                                                                        )
                                                                            .toString()
                                                                            .maybeHandleOverflow(
                                                                              maxChars: 18,
                                                                              replacement: '…',
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            2,
                                                                        minFontSize:
                                                                            10.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                              fontSize: 8.0,
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
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 6.0,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        color: functions
                                                            .setbackgroundColorSideBar(
                                                                getJsonField(
                                                                  subcategoryItem,
                                                                  r'''$.cat_id''',
                                                                ).toString(),
                                                                _model.selectedSubCatID !=
                                                                            null &&
                                                                        _model.selectedSubCatID !=
                                                                            ''
                                                                    ? _model
                                                                        .selectedSubCatID
                                                                    : widget!
                                                                        .subcatid,
                                                                0,
                                                                0),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  18.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  18.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 60.0,
                                                      height: 0.5,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFB4B7BB),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 2.0, 0.0),
                              child: Container(
                                width: 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: FFAppConstants.greyF4F6F4,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (FFAppState().nullValue !=
                                    _model.productModelJson?.toString()) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (_model.imagePath != 'null')
                                        Container(
                                          width: valueOrDefault<double>(
                                            (getJsonField(
                                                      (_model.apiResultSubcatID
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
                                                        .length >
                                                    1
                                                ? (MediaQuery.sizeOf(context)
                                                        .width -
                                                    82)
                                                : MediaQuery.sizeOf(context)
                                                    .width,
                                            300.0,
                                          ),
                                          height: _model.imagePath != 'null'
                                              ? 200.0
                                              : (MediaQuery.sizeOf(context)
                                                      .height -
                                                  60),
                                          decoration: BoxDecoration(
                                            color: FFAppConstants.greyF4F6F4,
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              _model.imagePath!,
                                              width: 200.0,
                                              height: 200.0,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if ((getJsonField(
                                                  (_model.apiResultSubcatID
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
                                                    .length >
                                                1) {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.8,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.83,
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final productModel = _model
                                                              .productModelJson
                                                              ?.toList() ??
                                                          [];
                                                      if (productModel
                                                          .isEmpty) {
                                                        return Center(
                                                          child: Image.asset(
                                                            'assets/images/new_loader.gif',
                                                            width: 70.0,
                                                            height: 70.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      }

                                                      return GridView.builder(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                          0,
                                                          0.0,
                                                          0,
                                                          0,
                                                        ),
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 5.0,
                                                          mainAxisSpacing: 5.0,
                                                          childAspectRatio:
                                                              (getJsonField(
                                                                        (_model.apiResultSubcatID?.jsonBody ??
                                                                            ''),
                                                                        r'''$.data''',
                                                                      ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList()
                                                                              as Iterable<ProductCountStruct?>)
                                                                          .withoutNulls
                                                                          .length >
                                                                      1
                                                                  ? 0.64
                                                                  : 0.68,
                                                        ),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            productModel.length,
                                                        itemBuilder: (context,
                                                            productModelIndex) {
                                                          final productModelItem =
                                                              productModel[
                                                                  productModelIndex];
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
                                                                  'SUB_CATEGORIES_SCREEN_Container_i3accfn3');
                                                              logFirebaseEvent(
                                                                  'Container_navigate_to');

                                                              context.pushNamed(
                                                                  ProductDetailsScreenWidget
                                                                      .routeName);

                                                              logFirebaseEvent(
                                                                  'Container_update_app_state');
                                                              FFAppState()
                                                                      .productID =
                                                                  getJsonField(
                                                                productModelItem,
                                                                r'''$.product_id''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .storeID =
                                                                  FFAppState()
                                                                      .storeID;
                                                              FFAppState()
                                                                      .userID =
                                                                  FFAppState()
                                                                      .userID;
                                                              FFAppState()
                                                                      .productName =
                                                                  getJsonField(
                                                                productModelItem,
                                                                r'''$.product_name''',
                                                              ).toString();
                                                              safeSetState(
                                                                  () {});
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
                                                                getJsonField(
                                                                  productModelItem,
                                                                  r'''$.mrp''',
                                                                ),
                                                                'productdetail',
                                                                FFAppState()
                                                                    .emptyJson,
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
                                                              width: 100.0,
                                                              height: 203.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(),
                                                                border:
                                                                    Border.all(
                                                                  color: FFAppConstants
                                                                      .whiteColor,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Container(
                                                                              width: isiOS ? ((MediaQuery.sizeOf(context).width - 88) / 2) : ((MediaQuery.sizeOf(context).width - 74) / 2),
                                                                              height: valueOrDefault<double>(
                                                                                (MediaQuery.sizeOf(context).width - 88) / 2,
                                                                                140.0,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FFAppConstants.productBgClr,
                                                                                borderRadius: BorderRadius.only(
                                                                                  topLeft: Radius.circular(8.0),
                                                                                  topRight: Radius.circular(8.0),
                                                                                ),
                                                                                border: Border.all(
                                                                                  color: FFAppConstants.whiteColor,
                                                                                  width: 0.0,
                                                                                ),
                                                                              ),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.only(
                                                                                  topLeft: Radius.circular(8.0),
                                                                                  topRight: Radius.circular(8.0),
                                                                                ),
                                                                                child: Image.network(
                                                                                  getJsonField(
                                                                                    productModelItem,
                                                                                    r'''$.product_image''',
                                                                                  ).toString(),
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                  fit: BoxFit.contain,
                                                                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                    'assets/images/error_image.png',
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if ((FFAppConstants.quickAvailability ==
                                                                                    getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.availability''',
                                                                                    ).toString()) ||
                                                                                (FFAppConstants.allAvailability ==
                                                                                    getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.availability''',
                                                                                    ).toString()))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, 1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                                      0.0,
                                                                                      valueOrDefault<double>(
                                                                                        (MediaQuery.sizeOf(context).width - 160) / 2,
                                                                                        0.0,
                                                                                      ),
                                                                                      0.0,
                                                                                      5.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
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
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 0.0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: 40.0,
                                                                                                height: 25.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FFAppConstants.calculatorColor,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    logFirebaseEvent('SUB_CATEGORIES_SCREEN_ADD_BTN_ON_TAP');
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
                                                                                                      _model.productModelJson = functions.updateSelectedIndexData(_model.productModelJson!, _model.returnJson9!, productModelIndex);
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      logFirebaseEvent('Button_custom_action');
                                                                                                      _model.connectivityResultAddCartCopy1 = await actions.checkInternetConnection();
                                                                                                      if (_model.connectivityResultAddCartCopy1 == true) {
                                                                                                        logFirebaseEvent('Button_haptic_feedback');
                                                                                                        HapticFeedback.heavyImpact();
                                                                                                        logFirebaseEvent('Button_backend_call');
                                                                                                        _model.apiResultsmdcCopy1 = await QuickartGroup.addToCartCall.call(
                                                                                                          userid: FFAppState().userID,
                                                                                                          qty: '1',
                                                                                                          storeid: FFAppState().storeID,
                                                                                                          varientid: getJsonField(
                                                                                                            productModelItem,
                                                                                                            r'''$.varient_id''',
                                                                                                          ).toString(),
                                                                                                          deviceid: FFAppState().deviceID,
                                                                                                          platform: isiOS ? 'ios' : 'android',
                                                                                                        );

                                                                                                        if ((_model.apiResultsmdcCopy1?.succeeded ?? true)) {
                                                                                                          logFirebaseEvent('Button_backend_call');
                                                                                                          _model.apiResultbf5Copy1 = await QuickartGroup.catproductCall.call(
                                                                                                            userid: FFAppState().userID,
                                                                                                            storeid: FFAppState().storeID,
                                                                                                            catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                                            byName: FFAppState().byName,
                                                                                                            minPrice: FFAppState().minPrice,
                                                                                                            maxPrice: FFAppState().maxPrice,
                                                                                                            stock: FFAppState().stock,
                                                                                                            minDiscount: FFAppState().minDiscount,
                                                                                                            maxDiscount: FFAppState().maxDiscount,
                                                                                                            sort: FFAppState().sort,
                                                                                                            sortName: FFAppState().sortName,
                                                                                                            sortPrice: FFAppState().sortPrice,
                                                                                                            subCatID: _model.selectedSubCatID,
                                                                                                            platform: isiOS ? 'ios' : 'android',
                                                                                                          );

                                                                                                          if ((_model.apiResultbf5Copy1?.succeeded ?? true)) {
                                                                                                            if (FFAppConstants.checkStatus ==
                                                                                                                getJsonField(
                                                                                                                  (_model.apiResultbf5Copy1?.jsonBody ?? ''),
                                                                                                                  r'''$.status''',
                                                                                                                ).toString()) {
                                                                                                              logFirebaseEvent('Button_update_page_state');
                                                                                                              _model.productModelJson = getJsonField(
                                                                                                                (_model.apiResultbf5Copy1?.jsonBody ?? ''),
                                                                                                                r'''$.data''',
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                              logFirebaseEvent('Button_update_app_state');
                                                                                                              FFAppState().isCartShow = false;
                                                                                                              FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                                (_model.apiResultsmdcCopy1?.jsonBody ?? ''),
                                                                                                              )!;
                                                                                                              FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                  .savingPrice(
                                                                                                                    (_model.apiResultsmdcCopy1?.jsonBody ?? ''),
                                                                                                                  )!
                                                                                                                  .toString());
                                                                                                              FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                  .totalPrice(
                                                                                                                    (_model.apiResultsmdcCopy1?.jsonBody ?? ''),
                                                                                                                  )!
                                                                                                                  .toString());
                                                                                                              FFAppState().refreshTrigger = true;
                                                                                                              safeSetState(() {});
                                                                                                              logFirebaseEvent('Button_google_analytics_event');
                                                                                                              logFirebaseEvent('AddToCartButtonAnalytics');
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
                                                                                                                    'emptyjson',
                                                                                                                    ' ',
                                                                                                                    ' ',
                                                                                                                    ' ',
                                                                                                                    ' ',
                                                                                                                  );
                                                                                                                }(),
                                                                                                              );
                                                                                                            } else {
                                                                                                              logFirebaseEvent('Button_show_snack_bar');
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    getJsonField(
                                                                                                                      (_model.apiResultbf5Copy1?.jsonBody ?? ''),
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
                                                                                                                    (_model.apiResultbf5Copy1?.jsonBody ?? ''),
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
                                                                                                                  (_model.apiResultsmdcCopy1?.jsonBody ?? ''),
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
                                                                                                          fontSize: 10.0,
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
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 75.0,
                                                                                              height: 30.0,
                                                                                              decoration: BoxDecoration(
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
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: () async {
                                                                                                        logFirebaseEvent('SUB_CATEGORIES_SCREEN_PAGE__BTN_ON_TAP');
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
                                                                                                          ).then((value) => safeSetState(() => _model.returnJson11 = value));

                                                                                                          logFirebaseEvent('Button_update_page_state');
                                                                                                          _model.productModelJson = functions.updateSelectedIndexData(_model.productModelJson!, _model.returnJson11!, productModelIndex);
                                                                                                          safeSetState(() {});
                                                                                                        } else {
                                                                                                          logFirebaseEvent('Button_custom_action');
                                                                                                          _model.internetcheck1Copy = await actions.checkInternetConnection();
                                                                                                          if (_model.internetcheck1Copy == true) {
                                                                                                            logFirebaseEvent('Button_haptic_feedback');
                                                                                                            HapticFeedback.mediumImpact();
                                                                                                            logFirebaseEvent('Button_backend_call');
                                                                                                            _model.addtocartremoveCopy = await QuickartGroup.addToCartCall.call(
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

                                                                                                            if ((_model.addtocartremoveCopy?.succeeded ?? true)) {
                                                                                                              logFirebaseEvent('Button_google_analytics_event');
                                                                                                              logFirebaseEvent(
                                                                                                                'Remove From Cart',
                                                                                                                parameters: {
                                                                                                                  'API Name': 'Add To Cart',
                                                                                                                  'Screen Name': 'Sub Categories Screen',
                                                                                                                },
                                                                                                              );
                                                                                                              logFirebaseEvent('Button_backend_call');
                                                                                                              _model.catproductlistCopy = await QuickartGroup.catproductCall.call(
                                                                                                                userid: FFAppState().userID,
                                                                                                                storeid: FFAppState().storeID,
                                                                                                                catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                                                byName: FFAppState().byName,
                                                                                                                minPrice: FFAppState().minPrice,
                                                                                                                maxPrice: FFAppState().maxPrice,
                                                                                                                stock: FFAppState().stock,
                                                                                                                minDiscount: FFAppState().minDiscount,
                                                                                                                maxDiscount: FFAppState().maxDiscount,
                                                                                                                sort: FFAppState().sort,
                                                                                                                sortName: FFAppState().sortName,
                                                                                                                sortPrice: FFAppState().sortPrice,
                                                                                                                subCatID: _model.selectedSubCatID,
                                                                                                                platform: isiOS ? 'ios' : 'android',
                                                                                                              );

                                                                                                              if ((_model.catproductlistCopy?.succeeded ?? true)) {
                                                                                                                logFirebaseEvent('Button_update_page_state');
                                                                                                                _model.productModelJson = getJsonField(
                                                                                                                  (_model.catproductlistCopy?.jsonBody ?? ''),
                                                                                                                  r'''$.data''',
                                                                                                                );
                                                                                                                safeSetState(() {});
                                                                                                                logFirebaseEvent('Button_update_app_state');
                                                                                                                FFAppState().isCartShow = false;
                                                                                                                FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                                  (_model.addtocartremoveCopy?.jsonBody ?? ''),
                                                                                                                )!;
                                                                                                                FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                    .savingPrice(
                                                                                                                      (_model.addtocartremoveCopy?.jsonBody ?? ''),
                                                                                                                    )!
                                                                                                                    .toString());
                                                                                                                FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                    .totalPrice(
                                                                                                                      (_model.addtocartremoveCopy?.jsonBody ?? ''),
                                                                                                                    )!
                                                                                                                    .toString());
                                                                                                                FFAppState().refreshTrigger = true;
                                                                                                                safeSetState(() {});
                                                                                                                logFirebaseEvent('Button_google_analytics_event');
                                                                                                                logFirebaseEvent(
                                                                                                                  'AddToCartButtonAnalytics',
                                                                                                                  parameters: {
                                                                                                                    'VarientId': getJsonField(
                                                                                                                      productModelItem,
                                                                                                                      r'''$.varient_id''',
                                                                                                                    ),
                                                                                                                    'Quantity': getJsonField(
                                                                                                                      productModelItem,
                                                                                                                      r'''$.cart_qty''',
                                                                                                                    ),
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
                                                                                                                        (_model.addtocartremoveCopy?.jsonBody ?? ''),
                                                                                                                        r'''$.message''',
                                                                                                                      ).toString(),
                                                                                                                      style: GoogleFonts.montserrat(
                                                                                                                        color: FFAppConstants.indigoColor,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        fontSize: 12.0,
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
                                                                                                                      (_model.addtocartremoveCopy?.jsonBody ?? ''),
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
                                                                                                        width: 25.0,
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
                                                                                                              fontSize: 18.0,
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
                                                                                                      width: 25.0,
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
                                                                                                                fontSize: 10.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 25.0,
                                                                                                    height: 30.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FFAppConstants.primaryYellowColor,
                                                                                                      borderRadius: BorderRadius.only(
                                                                                                        topRight: Radius.circular(5.0),
                                                                                                        bottomRight: Radius.circular(5.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Builder(
                                                                                                      builder: (context) => FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          logFirebaseEvent('SUB_CATEGORIES_SCREEN_PAGE__BTN_ON_TAP');
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
                                                                                                            ).then((value) => safeSetState(() => _model.returnJson10 = value));

                                                                                                            logFirebaseEvent('Button_update_page_state');
                                                                                                            _model.productModelJson = functions.updateSelectedIndexData(_model.productModelJson!, _model.returnJson10!, productModelIndex);
                                                                                                            safeSetState(() {});
                                                                                                          } else {
                                                                                                            logFirebaseEvent('Button_custom_action');
                                                                                                            _model.connectivityResult123 = await actions.checkInternetConnection();
                                                                                                            if (_model.connectivityResult123 == true) {
                                                                                                              logFirebaseEvent('Button_haptic_feedback');
                                                                                                              HapticFeedback.mediumImpact();
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
                                                                                                                          title: "",
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
                                                                                                                  logFirebaseEvent('Button_backend_call');
                                                                                                                  _model.apiResult0v0123 = await QuickartGroup.catproductCall.call(
                                                                                                                    userid: FFAppState().userID,
                                                                                                                    storeid: FFAppState().storeID,
                                                                                                                    catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                                                    byName: FFAppState().byName,
                                                                                                                    minPrice: FFAppState().minPrice,
                                                                                                                    maxPrice: FFAppState().maxPrice,
                                                                                                                    stock: FFAppState().stock,
                                                                                                                    minDiscount: FFAppState().minDiscount,
                                                                                                                    maxDiscount: FFAppState().maxDiscount,
                                                                                                                    sort: FFAppState().sort,
                                                                                                                    sortName: FFAppState().sortName,
                                                                                                                    sortPrice: FFAppState().sortPrice,
                                                                                                                    subCatID: _model.selectedSubCatID,
                                                                                                                    platform: isiOS ? 'ios' : 'android',
                                                                                                                  );

                                                                                                                  if ((_model.apiResult0v0123?.succeeded ?? true)) {
                                                                                                                    if (FFAppConstants.checkStatus ==
                                                                                                                        getJsonField(
                                                                                                                          (_model.apiResult0v0123?.jsonBody ?? ''),
                                                                                                                          r'''$.status''',
                                                                                                                        ).toString()) {
                                                                                                                      logFirebaseEvent('Button_update_page_state');
                                                                                                                      _model.productModelJson = getJsonField(
                                                                                                                        (_model.apiResult0v0123?.jsonBody ?? ''),
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
                                                                                                                          'Screen Name': 'Sub Categories Screen',
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
                                                                                                                              (_model.apiResultAddCart123?.jsonBody ?? ''),
                                                                                                                              r'''$.message''',
                                                                                                                            ).toString(),
                                                                                                                            style: GoogleFonts.montserrat(
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
                                                                                                                          style: GoogleFonts.montserrat(
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
                                                                                                                  duration: Duration(milliseconds: 2000),
                                                                                                                  backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                                ),
                                                                                                              );
                                                                                                            }
                                                                                                          }

                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        text: '+',
                                                                                                        options: FFButtonOptions(
                                                                                                          width: 24.0,
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
                                                                                                                fontSize: 18.0,
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
                                                                      if (functions
                                                                              .checkVariantsWithStock(getJsonField(
                                                                            productModelItem,
                                                                            r'''$.varients''',
                                                                          )) ==
                                                                          true)
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 33.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
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
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
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
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('SUB_CATEGORIES_SCREEN_Row_nju34ayg_ON_TA');
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
                                                                                        ).then((value) => safeSetState(() => _model.returnJson1 = value));

                                                                                        logFirebaseEvent('Row_update_page_state');
                                                                                        _model.productModelJson = functions.updateSelectedIndexData(_model.productModelJson!, _model.returnJson1!, productModelIndex);
                                                                                        safeSetState(() {});

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 0.0, 2.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
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
                                                                                                        ),
                                                                                                      );
                                                                                                    } else {
                                                                                                      return Container(
                                                                                                        width: 10.0,
                                                                                                        height: 10.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                      );
                                                                                                    }
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 2.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (((getJsonField(
                                                                                productModelItem,
                                                                                r'''$.varients''',
                                                                              ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
                                                                                  .withoutNulls
                                                                                  ?.length ==
                                                                              1) &&
                                                                          (FFAppConstants.stockNotify ==
                                                                              getJsonField(
                                                                                productModelItem,
                                                                                r'''$.varients[0].stock''',
                                                                              ).toString()))
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FFAppConstants.greyBgd6d2d3,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(8.0),
                                                                              bottomRight: Radius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                      height: 35.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 0.0),
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
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
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 0.0, 0.0),
                                                                                      child: Text(
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 0.0, 3.0),
                                                                                    child: Text(
                                                                                      FFAppConstants.notifyMe ==
                                                                                              getJsonField(
                                                                                                productModelItem,
                                                                                                r'''$.notify_me''',
                                                                                              ).toString()
                                                                                          ? FFAppConstants.notified
                                                                                          : 'You will be notified.',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                              if (FFAppConstants.stockNotify ==
                                                                                  getJsonField(
                                                                                    productModelItem,
                                                                                    r'''$.stock''',
                                                                                  ).toString())
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 2.0, 0.0),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        if (FFAppConstants.notifyMe ==
                                                                                            getJsonField(
                                                                                              productModelItem,
                                                                                              r'''$.notify_me''',
                                                                                            ).toString()) {
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('SUB_CATEGORIES_SCREEN_PAGE_Icon1_ON_TAP');
                                                                                                logFirebaseEvent('Icon1_custom_action');
                                                                                                _model.subcategoriesinternet = await actions.checkInternetConnection();
                                                                                                if (_model.subcategoriesinternet == true) {
                                                                                                  logFirebaseEvent('Icon1_haptic_feedback');
                                                                                                  HapticFeedback.heavyImpact();
                                                                                                  logFirebaseEvent('Icon1_backend_call');
                                                                                                  _model.subcategories = await QuickartGroup.addnotifymeCall.call(
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

                                                                                                  if ((_model.subcategories?.succeeded ?? true)) {
                                                                                                    logFirebaseEvent('Icon1_backend_call');
                                                                                                    _model.apiResultCartProduct11 = await QuickartGroup.catproductCall.call(
                                                                                                      userid: FFAppState().userID,
                                                                                                      storeid: FFAppState().storeID,
                                                                                                      catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                                      byName: FFAppState().byName,
                                                                                                      minPrice: FFAppState().minPrice,
                                                                                                      maxPrice: FFAppState().maxPrice,
                                                                                                      stock: FFAppState().stock,
                                                                                                      minDiscount: FFAppState().minPrice,
                                                                                                      maxDiscount: FFAppState().maxDiscount,
                                                                                                      sort: FFAppState().sort,
                                                                                                      sortName: FFAppState().sortName,
                                                                                                      sortPrice: FFAppState().sortPrice,
                                                                                                      subCatID: _model.selectedSubCatID,
                                                                                                    );

                                                                                                    if ((_model.apiResultCartProduct11?.succeeded ?? true)) {
                                                                                                      logFirebaseEvent('Icon1_update_page_state');
                                                                                                      _model.productModelJson = getJsonField(
                                                                                                        (_model.apiResultCartProduct11?.jsonBody ?? ''),
                                                                                                        r'''$.data''',
                                                                                                      );
                                                                                                      _model.isLoadingIndicator = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      logFirebaseEvent('Icon1_show_snack_bar');
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            getJsonField(
                                                                                                              (_model.apiResultCartProduct11?.jsonBody ?? ''),
                                                                                                              r'''$.message''',
                                                                                                            ).toString(),
                                                                                                            style: GoogleFonts.montserrat(
                                                                                                              color: FFAppConstants.indigoColor,
                                                                                                              fontSize: 12.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          duration: Duration(milliseconds: 1000),
                                                                                                          backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                  } else {
                                                                                                    logFirebaseEvent('Icon1_show_snack_bar');
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          getJsonField(
                                                                                                            (_model.subcategories?.jsonBody ?? ''),
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
                                                                                                  logFirebaseEvent('Icon1_show_snack_bar');
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
                                                                                              child: Icon(
                                                                                                Icons.notifications_none_sharp,
                                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('SUB_CATEGORIES_SCREEN_CircleImage_3ajpeq');
                                                                                                logFirebaseEvent('CircleImage_navigate_to');

                                                                                                context.pushNamed(NotifyProductsListScreenWidget.routeName);
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 28.0,
                                                                                                height: 28.0,
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
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (FFAppConstants.percentageCheck <
                                                                                getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.discountper''',
                                                                                )) {
                                                                              return Container(
                                                                                height: 20.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FFAppConstants.green44AC20,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 2.0, 0.0),
                                                                                    child: RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
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
                                                                                            text: '% ',
                                                                                            style: GoogleFonts.montserrat(
                                                                                              color: Colors.white,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 10.0,
                                                                                            ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: 'OFF',
                                                                                            style: GoogleFonts.montserrat(
                                                                                              color: FFAppConstants.whiteColor,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 8.0,
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
                                                                                height: 10.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  '\n',
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
                                                                            width:
                                                                                29.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFF4F6F4),
                                                                              borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(valueOrDefault<double>(
                                                                                  FFAppConstants.percentageCheck <
                                                                                          getJsonField(
                                                                                            productModelItem,
                                                                                            r'''$.discountper''',
                                                                                          )
                                                                                      ? 0.0
                                                                                      : 8.0,
                                                                                  0.0,
                                                                                )),
                                                                                bottomRight: Radius.circular(8.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: Color(0xFFDCE9D8),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: CachedNetworkImage(
                                                                                  fadeInDuration: Duration(milliseconds: 500),
                                                                                  fadeOutDuration: Duration(milliseconds: 500),
                                                                                  imageUrl: getJsonField(
                                                                                    productModelItem,
                                                                                    r'''$.country_icon''',
                                                                                  ).toString(),
                                                                                  width: 20.0,
                                                                                  height: 20.0,
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (getJsonField(
                                                                        productModelItem,
                                                                        r'''$.feature_tags''',
                                                                      ) !=
                                                                      null)
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            25.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if ((getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.feature_tags''',
                                                                                    ) !=
                                                                                    null) &&
                                                                                ((getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.feature_tags''',
                                                                                    ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
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
                                                                                      productModelItem,
                                                                                      r'''$.feature_tags''',
                                                                                    ).toList();

                                                                                    return ListView.builder(
                                                                                      padding: EdgeInsets.zero,
                                                                                      reverse: true,
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
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (FFAppConstants.isFavourite ==
                                                                            getJsonField(
                                                                              productModelItem,
                                                                              r'''$.isFavourite''',
                                                                            ).toString()) {
                                                                          return Container(
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFF4F6F4),
                                                                              borderRadius: BorderRadius.only(
                                                                                topRight: Radius.circular(8.0),
                                                                                bottomLeft: Radius.circular(8.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: Color(0xFFDCE9D8),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('SUB_CATEGORIES_SCREEN_PAGE_Icon1_ON_TAP');
                                                                                logFirebaseEvent('Icon1_custom_action');
                                                                                _model.connectivityResult = await actions.checkInternetConnection();
                                                                                if (_model.connectivityResult == true) {
                                                                                  logFirebaseEvent('Icon1_backend_call');
                                                                                  _model.addRemoveAPIResponse = await QuickartGroup.addremwishlistCall.call(
                                                                                    userid: FFAppState().userID,
                                                                                    storeID: FFAppState().storeID,
                                                                                    varientID: getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.varient_id''',
                                                                                    ).toString(),
                                                                                    deviceid: FFAppState().deviceID,
                                                                                    platform: isiOS ? 'ios' : 'android',
                                                                                  );

                                                                                  logFirebaseEvent('Icon1_haptic_feedback');
                                                                                  HapticFeedback.mediumImpact();
                                                                                  if ((_model.addRemoveAPIResponse?.succeeded ?? true)) {
                                                                                    logFirebaseEvent('Icon1_google_analytics_event');
                                                                                    logFirebaseEvent(
                                                                                      'Remove From Wishlist',
                                                                                      parameters: {
                                                                                        'API Name': 'Add Remove Wishlist',
                                                                                        'Screen Name': 'Sub Categories Screen',
                                                                                      },
                                                                                    );
                                                                                    logFirebaseEvent('Icon1_backend_call');
                                                                                    _model.apiResulttest = await QuickartGroup.catproductCall.call(
                                                                                      userid: FFAppState().userID,
                                                                                      storeid: FFAppState().storeID,
                                                                                      catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                      byName: FFAppState().byName,
                                                                                      minPrice: FFAppState().minPrice,
                                                                                      maxPrice: FFAppState().maxPrice,
                                                                                      stock: FFAppState().stock,
                                                                                      minDiscount: FFAppState().minPrice,
                                                                                      maxDiscount: FFAppState().maxDiscount,
                                                                                      sort: FFAppState().sort,
                                                                                      sortName: FFAppState().sortName,
                                                                                      sortPrice: FFAppState().sortPrice,
                                                                                      subCatID: _model.selectedSubCatID,
                                                                                      platform: isiOS ? 'ios' : 'android',
                                                                                    );

                                                                                    if ((_model.apiResulttest?.succeeded ?? true)) {
                                                                                      logFirebaseEvent('Icon1_update_page_state');
                                                                                      _model.productModelJson = getJsonField(
                                                                                        (_model.apiResulttest?.jsonBody ?? ''),
                                                                                        r'''$.data''',
                                                                                      );
                                                                                      _model.isLoadingIndicator = false;
                                                                                      safeSetState(() {});
                                                                                      logFirebaseEvent('Icon1_custom_action');
                                                                                      await actions.facebookEventClass(
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
                                                                                      logFirebaseEvent('Icon1_show_snack_bar');
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            getJsonField(
                                                                                              (_model.apiResultCartProduct?.jsonBody ?? ''),
                                                                                              r'''$.message''',
                                                                                            ).toString(),
                                                                                            style: GoogleFonts.montserrat(
                                                                                              color: FFAppConstants.indigoColor,
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 1000),
                                                                                          backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  } else {
                                                                                    logFirebaseEvent('Icon1_show_snack_bar');
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
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
                                                                                        duration: Duration(milliseconds: 4000),
                                                                                        backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
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

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.favorite_sharp,
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                size: 35.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFF4F6F4),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    topRight: Radius.circular(8.0),
                                                                                    bottomLeft: Radius.circular(8.0),
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
                                                                                    logFirebaseEvent('SUB_CATEGORIES_SCREEN_PAGE_Icon2_ON_TAP');
                                                                                    logFirebaseEvent('Icon2_custom_action');
                                                                                    _model.connectivityResult1 = await actions.checkInternetConnection();
                                                                                    if (_model.connectivityResult1 == true) {
                                                                                      logFirebaseEvent('Icon2_haptic_feedback');
                                                                                      HapticFeedback.mediumImpact();
                                                                                      logFirebaseEvent('Icon2_backend_call');
                                                                                      _model.addRemoveAPIResult = await QuickartGroup.addremwishlistCall.call(
                                                                                        userid: FFAppState().userID,
                                                                                        storeID: FFAppState().storeID,
                                                                                        varientID: getJsonField(
                                                                                          productModelItem,
                                                                                          r'''$.varient_id''',
                                                                                        ).toString(),
                                                                                        deviceid: FFAppState().deviceID,
                                                                                        platform: isiOS ? 'ios' : 'android',
                                                                                      );

                                                                                      if ((_model.addRemoveAPIResult?.succeeded ?? true)) {
                                                                                        logFirebaseEvent('Icon2_google_analytics_event');
                                                                                        logFirebaseEvent(
                                                                                          'Add To Wishlist',
                                                                                          parameters: {
                                                                                            'API Name': 'Add Remove Wishlist',
                                                                                            'Screen Name': 'Sub Categories Screen',
                                                                                          },
                                                                                        );
                                                                                        logFirebaseEvent('Icon2_backend_call');
                                                                                        _model.apiResultCartProduct2 = await QuickartGroup.catproductCall.call(
                                                                                          userid: FFAppState().userID,
                                                                                          storeid: FFAppState().storeID,
                                                                                          catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                          byName: FFAppState().byName,
                                                                                          minPrice: FFAppState().minPrice,
                                                                                          maxPrice: FFAppState().maxPrice,
                                                                                          stock: FFAppState().stock,
                                                                                          minDiscount: FFAppState().minPrice,
                                                                                          maxDiscount: FFAppState().maxDiscount,
                                                                                          sort: FFAppState().sort,
                                                                                          sortName: FFAppState().sortName,
                                                                                          sortPrice: FFAppState().sortPrice,
                                                                                          subCatID: _model.selectedSubCatID,
                                                                                          platform: isiOS ? 'ios' : 'android',
                                                                                        );

                                                                                        if ((_model.apiResultCartProduct2?.succeeded ?? true)) {
                                                                                          logFirebaseEvent('Icon2_update_page_state');
                                                                                          _model.productModelJson = getJsonField(
                                                                                            (_model.apiResultCartProduct2?.jsonBody ?? ''),
                                                                                            r'''$.data''',
                                                                                          );
                                                                                          _model.isLoadingIndicator = false;
                                                                                          safeSetState(() {});
                                                                                          logFirebaseEvent('Icon2_custom_action');
                                                                                          await actions.facebookEventClass(
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
                                                                                          logFirebaseEvent('Icon2_show_snack_bar');
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiResultCartProduct?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: GoogleFonts.montserrat(
                                                                                                  color: FFAppConstants.indigoColor,
                                                                                                  fontSize: 12.0,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 1000),
                                                                                              backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      } else {
                                                                                        logFirebaseEvent('Icon2_show_snack_bar');
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
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
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FFAppConstants.NeutralBlack50Color,
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

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.favorite_border,
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    size: 35.0,
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
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.98,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.83,
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final productModel = _model
                                                              .productModelJson
                                                              ?.toList() ??
                                                          [];
                                                      if (productModel
                                                          .isEmpty) {
                                                        return Center(
                                                          child: Image.asset(
                                                            'assets/images/new_loader.gif',
                                                            width: 70.0,
                                                            height: 70.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        );
                                                      }

                                                      return GridView.builder(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                          0,
                                                          0.0,
                                                          0,
                                                          0,
                                                        ),
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 5.0,
                                                          mainAxisSpacing: 5.0,
                                                          childAspectRatio:
                                                              0.69,
                                                        ),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            productModel.length,
                                                        itemBuilder: (context,
                                                            productModelIndex) {
                                                          final productModelItem =
                                                              productModel[
                                                                  productModelIndex];
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
                                                                  'SUB_CATEGORIES_SCREEN_Container_hxw7j9np');
                                                              logFirebaseEvent(
                                                                  'Container_navigate_to');

                                                              context.pushNamed(
                                                                  ProductDetailsScreenWidget
                                                                      .routeName);

                                                              logFirebaseEvent(
                                                                  'Container_update_app_state');
                                                              FFAppState()
                                                                      .productID =
                                                                  getJsonField(
                                                                productModelItem,
                                                                r'''$.product_id''',
                                                              ).toString();
                                                              FFAppState()
                                                                      .storeID =
                                                                  FFAppState()
                                                                      .storeID;
                                                              FFAppState()
                                                                      .userID =
                                                                  FFAppState()
                                                                      .userID;
                                                              FFAppState()
                                                                      .productName =
                                                                  getJsonField(
                                                                productModelItem,
                                                                r'''$.product_name''',
                                                              ).toString();
                                                              safeSetState(
                                                                  () {});
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
                                                                getJsonField(
                                                                  productModelItem,
                                                                  r'''$.mrp''',
                                                                ),
                                                                'productdetail',
                                                                FFAppState()
                                                                    .emptyJson,
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
                                                              width: 100.0,
                                                              height: 203.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(),
                                                                border:
                                                                    Border.all(
                                                                  color: FFAppConstants
                                                                      .whiteColor,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: valueOrDefault<double>(
                                                                                (MediaQuery.sizeOf(context).width / 2) - 10,
                                                                                140.0,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FFAppConstants.productBgClr,
                                                                                borderRadius: BorderRadius.only(
                                                                                  topLeft: Radius.circular(8.0),
                                                                                  topRight: Radius.circular(8.0),
                                                                                ),
                                                                                border: Border.all(
                                                                                  color: FFAppConstants.whiteColor,
                                                                                  width: 0.0,
                                                                                ),
                                                                              ),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.only(
                                                                                  topLeft: Radius.circular(8.0),
                                                                                  topRight: Radius.circular(8.0),
                                                                                ),
                                                                                child: Image.network(
                                                                                  getJsonField(
                                                                                    productModelItem,
                                                                                    r'''$.product_image''',
                                                                                  ).toString(),
                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                  height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                  fit: BoxFit.contain,
                                                                                  errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                    'assets/images/error_image.png',
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if ((FFAppConstants.quickAvailability ==
                                                                                    getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.availability''',
                                                                                    ).toString()) ||
                                                                                (FFAppConstants.allAvailability ==
                                                                                    getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.availability''',
                                                                                    ).toString()))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, 1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                                                      0.0,
                                                                                      valueOrDefault<double>(
                                                                                        (MediaQuery.sizeOf(context).width - 100) / 2,
                                                                                        0.0,
                                                                                      ),
                                                                                      0.0,
                                                                                      5.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
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
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                            child: Material(
                                                                                              color: Colors.transparent,
                                                                                              elevation: 0.0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              child: Container(
                                                                                                width: 40.0,
                                                                                                height: 25.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FFAppConstants.calculatorColor,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    logFirebaseEvent('SUB_CATEGORIES_SCREEN_ADD_BTN_ON_TAP');
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
                                                                                                      ).then((value) => safeSetState(() => _model.returnJson99 = value));

                                                                                                      logFirebaseEvent('Button_update_page_state');
                                                                                                      _model.productModelJson = functions.updateSelectedIndexData(_model.productModelJson!, _model.returnJson99!, productModelIndex);
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      logFirebaseEvent('Button_custom_action');
                                                                                                      _model.connectivityResultAddCart2 = await actions.checkInternetConnection();
                                                                                                      if (_model.connectivityResultAddCart2 == true) {
                                                                                                        logFirebaseEvent('Button_haptic_feedback');
                                                                                                        HapticFeedback.heavyImpact();
                                                                                                        logFirebaseEvent('Button_backend_call');
                                                                                                        _model.apiResultsmdcCopy22 = await QuickartGroup.addToCartCall.call(
                                                                                                          userid: FFAppState().userID,
                                                                                                          qty: '1',
                                                                                                          storeid: FFAppState().storeID,
                                                                                                          varientid: getJsonField(
                                                                                                            productModelItem,
                                                                                                            r'''$.varient_id''',
                                                                                                          ).toString(),
                                                                                                          deviceid: FFAppState().deviceID,
                                                                                                          platform: isiOS ? 'ios' : 'android',
                                                                                                        );

                                                                                                        if ((_model.apiResultsmdcCopy22?.succeeded ?? true)) {
                                                                                                          logFirebaseEvent('Button_backend_call');
                                                                                                          _model.apiResultbf51 = await QuickartGroup.catproductCall.call(
                                                                                                            userid: FFAppState().userID,
                                                                                                            storeid: FFAppState().storeID,
                                                                                                            catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                                            byName: FFAppState().byName,
                                                                                                            minPrice: FFAppState().minPrice,
                                                                                                            maxPrice: FFAppState().maxPrice,
                                                                                                            stock: FFAppState().stock,
                                                                                                            minDiscount: FFAppState().minDiscount,
                                                                                                            maxDiscount: FFAppState().maxDiscount,
                                                                                                            sort: FFAppState().sort,
                                                                                                            sortName: FFAppState().sortName,
                                                                                                            sortPrice: FFAppState().sortPrice,
                                                                                                            subCatID: _model.selectedSubCatID,
                                                                                                            platform: isiOS ? 'ios' : 'android',
                                                                                                          );

                                                                                                          if ((_model.apiResultbf51?.succeeded ?? true)) {
                                                                                                            if (FFAppConstants.checkStatus ==
                                                                                                                getJsonField(
                                                                                                                  (_model.apiResultbf51?.jsonBody ?? ''),
                                                                                                                  r'''$.status''',
                                                                                                                ).toString()) {
                                                                                                              logFirebaseEvent('Button_update_page_state');
                                                                                                              _model.productModelJson = getJsonField(
                                                                                                                (_model.apiResultbf51?.jsonBody ?? ''),
                                                                                                                r'''$.data''',
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                              logFirebaseEvent('Button_update_app_state');
                                                                                                              FFAppState().isCartShow = false;
                                                                                                              FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                                (_model.apiResultsmdcCopy22?.jsonBody ?? ''),
                                                                                                              )!;
                                                                                                              FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                  .savingPrice(
                                                                                                                    (_model.apiResultsmdcCopy22?.jsonBody ?? ''),
                                                                                                                  )!
                                                                                                                  .toString());
                                                                                                              FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                  .totalPrice(
                                                                                                                    (_model.apiResultsmdcCopy22?.jsonBody ?? ''),
                                                                                                                  )!
                                                                                                                  .toString());
                                                                                                              FFAppState().refreshTrigger = true;
                                                                                                              safeSetState(() {});
                                                                                                              logFirebaseEvent('Button_google_analytics_event');
                                                                                                              logFirebaseEvent('AddToCartButtonAnalytics');
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
                                                                                                                    'emptyjson',
                                                                                                                    ' ',
                                                                                                                    ' ',
                                                                                                                    ' ',
                                                                                                                    ' ',
                                                                                                                  );
                                                                                                                }(),
                                                                                                              );
                                                                                                            } else {
                                                                                                              logFirebaseEvent('Button_show_snack_bar');
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    QuickartGroup.catproductCall.message(
                                                                                                                      (_model.apiResultbf51?.jsonBody ?? ''),
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
                                                                                                                  QuickartGroup.catproductCall.message(
                                                                                                                    (_model.apiResultbf51?.jsonBody ?? ''),
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
                                                                                                                QuickartGroup.addToCartCall.message(
                                                                                                                  (_model.apiResultsmdcCopy22?.jsonBody ?? ''),
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
                                                                                                          fontSize: 10.0,
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
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 75.0,
                                                                                              height: 30.0,
                                                                                              decoration: BoxDecoration(
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
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: () async {
                                                                                                        logFirebaseEvent('SUB_CATEGORIES_SCREEN_PAGE__BTN_ON_TAP');
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
                                                                                                          ).then((value) => safeSetState(() => _model.returnJson111 = value));

                                                                                                          logFirebaseEvent('Button_update_page_state');
                                                                                                          _model.productModelJson = functions.updateSelectedIndexData(_model.productModelJson!, _model.returnJson111!, productModelIndex);
                                                                                                          safeSetState(() {});
                                                                                                        } else {
                                                                                                          logFirebaseEvent('Button_custom_action');
                                                                                                          _model.internetcheck122 = await actions.checkInternetConnection();
                                                                                                          if (_model.internetcheck122 == true) {
                                                                                                            logFirebaseEvent('Button_haptic_feedback');
                                                                                                            HapticFeedback.mediumImpact();
                                                                                                            logFirebaseEvent('Button_backend_call');
                                                                                                            _model.addtocartremove222 = await QuickartGroup.addToCartCall.call(
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

                                                                                                            if ((_model.addtocartremove222?.succeeded ?? true)) {
                                                                                                              logFirebaseEvent('Button_google_analytics_event');
                                                                                                              logFirebaseEvent(
                                                                                                                'Remove From Cart',
                                                                                                                parameters: {
                                                                                                                  'API Name': 'Add To Cart',
                                                                                                                  'Screen Name': 'Sub Categories Screen',
                                                                                                                },
                                                                                                              );
                                                                                                              logFirebaseEvent('Button_backend_call');
                                                                                                              _model.catproductlist222 = await QuickartGroup.catproductCall.call(
                                                                                                                userid: FFAppState().userID,
                                                                                                                storeid: FFAppState().storeID,
                                                                                                                catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                                                byName: FFAppState().byName,
                                                                                                                minPrice: FFAppState().minPrice,
                                                                                                                maxPrice: FFAppState().maxPrice,
                                                                                                                stock: FFAppState().stock,
                                                                                                                minDiscount: FFAppState().minDiscount,
                                                                                                                maxDiscount: FFAppState().maxDiscount,
                                                                                                                sort: FFAppState().sort,
                                                                                                                sortName: FFAppState().sortName,
                                                                                                                sortPrice: FFAppState().sortPrice,
                                                                                                                subCatID: _model.selectedSubCatID,
                                                                                                                platform: isiOS ? 'ios' : 'android',
                                                                                                              );

                                                                                                              if ((_model.catproductlist222?.succeeded ?? true)) {
                                                                                                                logFirebaseEvent('Button_update_page_state');
                                                                                                                _model.productModelJson = getJsonField(
                                                                                                                  (_model.catproductlist222?.jsonBody ?? ''),
                                                                                                                  r'''$.data''',
                                                                                                                );
                                                                                                                safeSetState(() {});
                                                                                                                logFirebaseEvent('Button_update_app_state');
                                                                                                                FFAppState().isCartShow = false;
                                                                                                                FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                                  (_model.addtocartremove222?.jsonBody ?? ''),
                                                                                                                )!;
                                                                                                                FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                    .savingPrice(
                                                                                                                      (_model.addtocartremove222?.jsonBody ?? ''),
                                                                                                                    )!
                                                                                                                    .toString());
                                                                                                                FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                    .totalPrice(
                                                                                                                      (_model.addtocartremove222?.jsonBody ?? ''),
                                                                                                                    )!
                                                                                                                    .toString());
                                                                                                                FFAppState().refreshTrigger = true;
                                                                                                                safeSetState(() {});
                                                                                                                logFirebaseEvent('Button_google_analytics_event');
                                                                                                                logFirebaseEvent(
                                                                                                                  'AddToCartButtonAnalytics',
                                                                                                                  parameters: {
                                                                                                                    'VarientId': getJsonField(
                                                                                                                      productModelItem,
                                                                                                                      r'''$.varient_id''',
                                                                                                                    ),
                                                                                                                    'Quantity': getJsonField(
                                                                                                                      productModelItem,
                                                                                                                      r'''$.cart_qty''',
                                                                                                                    ),
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
                                                                                                                      QuickartGroup.catproductCall.message(
                                                                                                                        (_model.catproductlist222?.jsonBody ?? ''),
                                                                                                                      )!,
                                                                                                                      style: GoogleFonts.montserrat(
                                                                                                                        color: FFAppConstants.indigoColor,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        fontSize: 12.0,
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
                                                                                                                      (_model.addtocartremove222?.jsonBody ?? ''),
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
                                                                                                        width: 25.0,
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
                                                                                                              fontSize: 18.0,
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
                                                                                                      width: 25.0,
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
                                                                                                                fontSize: 10.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 25.0,
                                                                                                    height: 30.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FFAppConstants.primaryYellowColor,
                                                                                                      borderRadius: BorderRadius.only(
                                                                                                        topRight: Radius.circular(5.0),
                                                                                                        bottomRight: Radius.circular(5.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Builder(
                                                                                                      builder: (context) => FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          logFirebaseEvent('SUB_CATEGORIES_SCREEN_PAGE__BTN_ON_TAP');
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
                                                                                                            ).then((value) => safeSetState(() => _model.returnJson101 = value));

                                                                                                            logFirebaseEvent('Button_update_page_state');
                                                                                                            _model.productModelJson = functions.updateSelectedIndexData(_model.productModelJson!, _model.returnJson101!, productModelIndex);
                                                                                                            safeSetState(() {});
                                                                                                          } else {
                                                                                                            logFirebaseEvent('Button_custom_action');
                                                                                                            _model.connectivityResult1234 = await actions.checkInternetConnection();
                                                                                                            if (_model.connectivityResult1234 == true) {
                                                                                                              logFirebaseEvent('Button_haptic_feedback');
                                                                                                              HapticFeedback.mediumImpact();
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
                                                                                                                          title: "",
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                );
                                                                                                              } else {
                                                                                                                logFirebaseEvent('Button_backend_call');
                                                                                                                _model.apiResultAddCart1234 = await QuickartGroup.addToCartCall.call(
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

                                                                                                                if ((_model.apiResultAddCart1234?.succeeded ?? true)) {
                                                                                                                  logFirebaseEvent('Button_backend_call');
                                                                                                                  _model.apiResult0v01234 = await QuickartGroup.catproductCall.call(
                                                                                                                    userid: FFAppState().userID,
                                                                                                                    storeid: FFAppState().storeID,
                                                                                                                    catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                                                    byName: FFAppState().byName,
                                                                                                                    minPrice: FFAppState().minPrice,
                                                                                                                    maxPrice: FFAppState().maxPrice,
                                                                                                                    stock: FFAppState().stock,
                                                                                                                    minDiscount: FFAppState().minDiscount,
                                                                                                                    maxDiscount: FFAppState().maxDiscount,
                                                                                                                    sort: FFAppState().sort,
                                                                                                                    sortName: FFAppState().sortName,
                                                                                                                    sortPrice: FFAppState().sortPrice,
                                                                                                                    subCatID: _model.selectedSubCatID,
                                                                                                                    platform: isiOS ? 'ios' : 'android',
                                                                                                                  );

                                                                                                                  if ((_model.apiResult0v01234?.succeeded ?? true)) {
                                                                                                                    if (FFAppConstants.checkStatus ==
                                                                                                                        getJsonField(
                                                                                                                          (_model.apiResult0v01234?.jsonBody ?? ''),
                                                                                                                          r'''$.status''',
                                                                                                                        ).toString()) {
                                                                                                                      logFirebaseEvent('Button_update_page_state');
                                                                                                                      _model.productModelJson = getJsonField(
                                                                                                                        (_model.apiResult0v01234?.jsonBody ?? ''),
                                                                                                                        r'''$.data''',
                                                                                                                      );
                                                                                                                      safeSetState(() {});
                                                                                                                      logFirebaseEvent('Button_update_app_state');
                                                                                                                      FFAppState().isCartShow = false;
                                                                                                                      FFAppState().cartTotalCount = QuickartGroup.addToCartCall.totalItems(
                                                                                                                        (_model.apiResultAddCart1234?.jsonBody ?? ''),
                                                                                                                      )!;
                                                                                                                      FFAppState().cartSavingPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                          .savingPrice(
                                                                                                                            (_model.apiResultAddCart1234?.jsonBody ?? ''),
                                                                                                                          )!
                                                                                                                          .toString());
                                                                                                                      FFAppState().cartTotalPrice = functions.stringToDouble(QuickartGroup.addToCartCall
                                                                                                                          .totalPrice(
                                                                                                                            (_model.apiResultAddCart1234?.jsonBody ?? ''),
                                                                                                                          )!
                                                                                                                          .toString());
                                                                                                                      FFAppState().refreshTrigger = true;
                                                                                                                      safeSetState(() {});
                                                                                                                      logFirebaseEvent('Button_google_analytics_event');
                                                                                                                      logFirebaseEvent(
                                                                                                                        'Add To Cart',
                                                                                                                        parameters: {
                                                                                                                          'API Name': 'Add To Cart',
                                                                                                                          'Screen Name': 'Sub Categories Screen',
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
                                                                                                                            QuickartGroup.catproductCall.message(
                                                                                                                              (_model.apiResult0v01234?.jsonBody ?? ''),
                                                                                                                            )!,
                                                                                                                            style: GoogleFonts.montserrat(
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
                                                                                                                          QuickartGroup.catproductCall.message(
                                                                                                                            (_model.apiResult0v01234?.jsonBody ?? ''),
                                                                                                                          )!,
                                                                                                                          style: GoogleFonts.montserrat(
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
                                                                                                                        QuickartGroup.addToCartCall.message(
                                                                                                                          (_model.apiResultAddCart1234?.jsonBody ?? ''),
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
                                                                                                        text: '+',
                                                                                                        options: FFButtonOptions(
                                                                                                          width: 24.0,
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
                                                                                                                fontSize: 18.0,
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
                                                                      if (functions
                                                                              .checkVariantsWithStock(getJsonField(
                                                                            productModelItem,
                                                                            r'''$.varients''',
                                                                          )) ==
                                                                          true)
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 33.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
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
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
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
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('SUB_CATEGORIES_SCREEN_Row_iwpak832_ON_TA');
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
                                                                                        ).then((value) => safeSetState(() => _model.returnJson12 = value));

                                                                                        logFirebaseEvent('Row_update_page_state');
                                                                                        _model.productModelJson = functions.updateSelectedIndexData(_model.productModelJson!, _model.returnJson12!, productModelIndex);
                                                                                        safeSetState(() {});

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 0.0, 2.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
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
                                                                                                        ),
                                                                                                      );
                                                                                                    } else {
                                                                                                      return Container(
                                                                                                        width: 10.0,
                                                                                                        height: 10.0,
                                                                                                        decoration: BoxDecoration(),
                                                                                                      );
                                                                                                    }
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 2.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (((getJsonField(
                                                                                productModelItem,
                                                                                r'''$.varients''',
                                                                              ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
                                                                                  .withoutNulls
                                                                                  ?.length ==
                                                                              1) &&
                                                                          (FFAppConstants.stockNotify ==
                                                                              getJsonField(
                                                                                productModelItem,
                                                                                r'''$.varients[0].stock''',
                                                                              ).toString()))
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FFAppConstants.greyBgd6d2d3,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(8.0),
                                                                              bottomRight: Radius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                      height: 35.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 0.0),
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
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
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 0.0, 0.0),
                                                                                      child: Text(
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 0.0, 3.0),
                                                                                    child: Text(
                                                                                      FFAppConstants.notifyMe ==
                                                                                              getJsonField(
                                                                                                productModelItem,
                                                                                                r'''$.notify_me''',
                                                                                              ).toString()
                                                                                          ? FFAppConstants.notified
                                                                                          : 'You will be notified.',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                              if (FFAppConstants.stockNotify ==
                                                                                  getJsonField(
                                                                                    productModelItem,
                                                                                    r'''$.stock''',
                                                                                  ).toString())
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 2.0, 0.0),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        if (FFAppConstants.notifyMe ==
                                                                                            getJsonField(
                                                                                              productModelItem,
                                                                                              r'''$.notify_me''',
                                                                                            ).toString()) {
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('SUB_CATEGORIES_SCREEN_PAGE_Icon1_ON_TAP');
                                                                                                logFirebaseEvent('Icon1_custom_action');
                                                                                                _model.subcategoriesinternet1 = await actions.checkInternetConnection();
                                                                                                if (_model.subcategoriesinternet1 == true) {
                                                                                                  logFirebaseEvent('Icon1_haptic_feedback');
                                                                                                  HapticFeedback.heavyImpact();
                                                                                                  logFirebaseEvent('Icon1_backend_call');
                                                                                                  _model.subcategories1 = await QuickartGroup.addnotifymeCall.call(
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

                                                                                                  if ((_model.subcategories1?.succeeded ?? true)) {
                                                                                                    logFirebaseEvent('Icon1_backend_call');
                                                                                                    _model.apiResultCartProduct111 = await QuickartGroup.catproductCall.call(
                                                                                                      userid: FFAppState().userID,
                                                                                                      storeid: FFAppState().storeID,
                                                                                                      catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                                      byName: FFAppState().byName,
                                                                                                      minPrice: FFAppState().minPrice,
                                                                                                      maxPrice: FFAppState().maxPrice,
                                                                                                      stock: FFAppState().stock,
                                                                                                      minDiscount: FFAppState().minPrice,
                                                                                                      maxDiscount: FFAppState().maxDiscount,
                                                                                                      sort: FFAppState().sort,
                                                                                                      sortName: FFAppState().sortName,
                                                                                                      sortPrice: FFAppState().sortPrice,
                                                                                                      subCatID: _model.selectedSubCatID,
                                                                                                    );

                                                                                                    if ((_model.apiResultCartProduct111?.succeeded ?? true)) {
                                                                                                      logFirebaseEvent('Icon1_update_page_state');
                                                                                                      _model.productModelJson = getJsonField(
                                                                                                        (_model.apiResultCartProduct111?.jsonBody ?? ''),
                                                                                                        r'''$.data''',
                                                                                                      );
                                                                                                      _model.isLoadingIndicator = false;
                                                                                                      safeSetState(() {});
                                                                                                    } else {
                                                                                                      logFirebaseEvent('Icon1_show_snack_bar');
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            getJsonField(
                                                                                                              (_model.apiResultCartProduct111?.jsonBody ?? ''),
                                                                                                              r'''$.message''',
                                                                                                            ).toString(),
                                                                                                            style: GoogleFonts.montserrat(
                                                                                                              color: FFAppConstants.indigoColor,
                                                                                                              fontSize: 12.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          duration: Duration(milliseconds: 1000),
                                                                                                          backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                  } else {
                                                                                                    logFirebaseEvent('Icon1_show_snack_bar');
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          getJsonField(
                                                                                                            (_model.subcategories1?.jsonBody ?? ''),
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
                                                                                                  logFirebaseEvent('Icon1_show_snack_bar');
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
                                                                                              child: Icon(
                                                                                                Icons.notifications_none_sharp,
                                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                                size: 25.0,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('SUB_CATEGORIES_SCREEN_CircleImage_isczfp');
                                                                                                logFirebaseEvent('CircleImage_navigate_to');

                                                                                                context.pushNamed(NotifyProductsListScreenWidget.routeName);
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 28.0,
                                                                                                height: 28.0,
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
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (FFAppConstants.percentageCheck <
                                                                                getJsonField(
                                                                                  productModelItem,
                                                                                  r'''$.discountper''',
                                                                                )) {
                                                                              return Container(
                                                                                height: 20.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FFAppConstants.green44AC20,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 2.0, 0.0),
                                                                                    child: RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
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
                                                                                            text: '% ',
                                                                                            style: GoogleFonts.montserrat(
                                                                                              color: Colors.white,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 10.0,
                                                                                            ),
                                                                                          ),
                                                                                          TextSpan(
                                                                                            text: 'OFF',
                                                                                            style: GoogleFonts.montserrat(
                                                                                              color: FFAppConstants.whiteColor,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 8.0,
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
                                                                                height: 10.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  '\n',
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
                                                                            width:
                                                                                29.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFF4F6F4),
                                                                              borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(valueOrDefault<double>(
                                                                                  FFAppConstants.percentageCheck <
                                                                                          getJsonField(
                                                                                            productModelItem,
                                                                                            r'''$.discountper''',
                                                                                          )
                                                                                      ? 0.0
                                                                                      : 8.0,
                                                                                  0.0,
                                                                                )),
                                                                                bottomRight: Radius.circular(8.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: Color(0xFFDCE9D8),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: CachedNetworkImage(
                                                                                  fadeInDuration: Duration(milliseconds: 500),
                                                                                  fadeOutDuration: Duration(milliseconds: 500),
                                                                                  imageUrl: getJsonField(
                                                                                    productModelItem,
                                                                                    r'''$.country_icon''',
                                                                                  ).toString(),
                                                                                  width: 20.0,
                                                                                  height: 20.0,
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (getJsonField(
                                                                        productModelItem,
                                                                        r'''$.feature_tags''',
                                                                      ) !=
                                                                      null)
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            25.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if ((getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.feature_tags''',
                                                                                    ) !=
                                                                                    null) &&
                                                                                ((getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.feature_tags''',
                                                                                    ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<ProductCountStruct?>)
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
                                                                                      productModelItem,
                                                                                      r'''$.feature_tags''',
                                                                                    ).toList();

                                                                                    return ListView.builder(
                                                                                      padding: EdgeInsets.zero,
                                                                                      reverse: true,
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
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (FFAppConstants.isFavourite ==
                                                                            getJsonField(
                                                                              productModelItem,
                                                                              r'''$.isFavourite''',
                                                                            ).toString()) {
                                                                          return Container(
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFF4F6F4),
                                                                              borderRadius: BorderRadius.only(
                                                                                topRight: Radius.circular(8.0),
                                                                                bottomLeft: Radius.circular(8.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: Color(0xFFDCE9D8),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('SUB_CATEGORIES_SCREEN_PAGE_Icon1_ON_TAP');
                                                                                logFirebaseEvent('Icon1_custom_action');
                                                                                _model.connectivityResult12 = await actions.checkInternetConnection();
                                                                                if (_model.connectivityResult12 == true) {
                                                                                  logFirebaseEvent('Icon1_haptic_feedback');
                                                                                  HapticFeedback.mediumImpact();
                                                                                  logFirebaseEvent('Icon1_backend_call');
                                                                                  _model.addRemoveAPIResponse11 = await QuickartGroup.addremwishlistCall.call(
                                                                                    userid: FFAppState().userID,
                                                                                    storeID: FFAppState().storeID,
                                                                                    varientID: getJsonField(
                                                                                      productModelItem,
                                                                                      r'''$.varient_id''',
                                                                                    ).toString(),
                                                                                    deviceid: FFAppState().deviceID,
                                                                                    platform: isiOS ? 'ios' : 'android',
                                                                                  );

                                                                                  if ((_model.addRemoveAPIResponse11?.succeeded ?? true)) {
                                                                                    logFirebaseEvent('Icon1_google_analytics_event');
                                                                                    logFirebaseEvent(
                                                                                      'Remove From Wishlist',
                                                                                      parameters: {
                                                                                        'API Name': 'Add Remove Wishlist',
                                                                                        'Screen Name': 'Sub Categories Screen',
                                                                                      },
                                                                                    );
                                                                                    logFirebaseEvent('Icon1_backend_call');
                                                                                    _model.apiResulttest11 = await QuickartGroup.catproductCall.call(
                                                                                      userid: FFAppState().userID,
                                                                                      storeid: FFAppState().storeID,
                                                                                      catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                      byName: FFAppState().byName,
                                                                                      minPrice: FFAppState().minPrice,
                                                                                      maxPrice: FFAppState().maxPrice,
                                                                                      stock: FFAppState().stock,
                                                                                      minDiscount: FFAppState().minPrice,
                                                                                      maxDiscount: FFAppState().maxDiscount,
                                                                                      sort: FFAppState().sort,
                                                                                      sortName: FFAppState().sortName,
                                                                                      sortPrice: FFAppState().sortPrice,
                                                                                      subCatID: _model.selectedSubCatID,
                                                                                      platform: isiOS ? 'ios' : 'android',
                                                                                    );

                                                                                    if ((_model.apiResulttest11?.succeeded ?? true)) {
                                                                                      logFirebaseEvent('Icon1_update_page_state');
                                                                                      _model.productModelJson = getJsonField(
                                                                                        (_model.apiResulttest11?.jsonBody ?? ''),
                                                                                        r'''$.data''',
                                                                                      );
                                                                                      _model.isLoadingIndicator = false;
                                                                                      safeSetState(() {});
                                                                                      logFirebaseEvent('Icon1_custom_action');
                                                                                      await actions.facebookEventClass(
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
                                                                                      logFirebaseEvent('Icon1_show_snack_bar');
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            getJsonField(
                                                                                              (_model.apiResultCartProduct?.jsonBody ?? ''),
                                                                                              r'''$.message''',
                                                                                            ).toString(),
                                                                                            style: GoogleFonts.montserrat(
                                                                                              color: FFAppConstants.indigoColor,
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 1000),
                                                                                          backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  } else {
                                                                                    logFirebaseEvent('Icon1_show_snack_bar');
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          getJsonField(
                                                                                            (_model.addRemoveAPIResponse11?.jsonBody ?? ''),
                                                                                            r'''$.message''',
                                                                                          ).toString(),
                                                                                          style: GoogleFonts.montserrat(
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
                                                                                  logFirebaseEvent('Icon1_show_snack_bar');
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        FFAppConstants.internetString,
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

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.favorite_sharp,
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                size: 35.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFF4F6F4),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    topRight: Radius.circular(8.0),
                                                                                    bottomLeft: Radius.circular(8.0),
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
                                                                                    logFirebaseEvent('SUB_CATEGORIES_SCREEN_PAGE_Icon2_ON_TAP');
                                                                                    logFirebaseEvent('Icon2_custom_action');
                                                                                    _model.connectivityResult11 = await actions.checkInternetConnection();
                                                                                    if (_model.connectivityResult11 == true) {
                                                                                      logFirebaseEvent('Icon2_haptic_feedback');
                                                                                      HapticFeedback.mediumImpact();
                                                                                      logFirebaseEvent('Icon2_backend_call');
                                                                                      _model.addRemoveAPIResult111 = await QuickartGroup.addremwishlistCall.call(
                                                                                        userid: FFAppState().userID,
                                                                                        storeID: FFAppState().storeID,
                                                                                        varientID: getJsonField(
                                                                                          productModelItem,
                                                                                          r'''$.varient_id''',
                                                                                        ).toString(),
                                                                                        deviceid: FFAppState().deviceID,
                                                                                        platform: isiOS ? 'ios' : 'android',
                                                                                      );

                                                                                      if ((_model.addRemoveAPIResult111?.succeeded ?? true)) {
                                                                                        logFirebaseEvent('Icon2_google_analytics_event');
                                                                                        logFirebaseEvent(
                                                                                          'Add To Wishlist',
                                                                                          parameters: {
                                                                                            'API Name': 'Add Remove Wishlist',
                                                                                            'Screen Name': 'Sub Categories Screen',
                                                                                          },
                                                                                        );
                                                                                        logFirebaseEvent('Icon2_backend_call');
                                                                                        _model.apiResultCartProduct22 = await QuickartGroup.catproductCall.call(
                                                                                          userid: FFAppState().userID,
                                                                                          storeid: FFAppState().storeID,
                                                                                          catid: widget!.catid == null || widget!.catid == '' ? FFAppState().catID : widget!.catid,
                                                                                          byName: FFAppState().byName,
                                                                                          minPrice: FFAppState().minPrice,
                                                                                          maxPrice: FFAppState().maxPrice,
                                                                                          stock: FFAppState().stock,
                                                                                          minDiscount: FFAppState().minPrice,
                                                                                          maxDiscount: FFAppState().maxDiscount,
                                                                                          sort: FFAppState().sort,
                                                                                          sortName: FFAppState().sortName,
                                                                                          sortPrice: FFAppState().sortPrice,
                                                                                          subCatID: _model.selectedSubCatID,
                                                                                          platform: isiOS ? 'ios' : 'android',
                                                                                        );

                                                                                        if ((_model.apiResultCartProduct22?.succeeded ?? true)) {
                                                                                          logFirebaseEvent('Icon2_update_page_state');
                                                                                          _model.productModelJson = getJsonField(
                                                                                            (_model.apiResultCartProduct22?.jsonBody ?? ''),
                                                                                            r'''$.data''',
                                                                                          );
                                                                                          _model.isLoadingIndicator = false;
                                                                                          safeSetState(() {});
                                                                                          logFirebaseEvent('Icon2_custom_action');
                                                                                          await actions.facebookEventClass(
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
                                                                                          logFirebaseEvent('Icon2_show_snack_bar');
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiResultCartProduct?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: GoogleFonts.montserrat(
                                                                                                  color: FFAppConstants.indigoColor,
                                                                                                  fontSize: 12.0,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 1000),
                                                                                              backgroundColor: FFAppConstants.primaryPurpleE4D8F5,
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      } else {
                                                                                        logFirebaseEvent('Icon2_show_snack_bar');
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              getJsonField(
                                                                                                (_model.addRemoveAPIResult111?.jsonBody ?? ''),
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
                                                                                      logFirebaseEvent('Icon2_show_snack_bar');
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            FFAppConstants.internetString,
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

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.favorite_border,
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    size: 35.0,
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
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Builder(
                                    builder: (context) {
                                      if ((getJsonField(
                                            (_model.apiResultSubcatID
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
                                              ?.length ==
                                          0) {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    50.0, 0.0, 0.0, 100.0),
                                            child: Container(
                                              width: 70.0,
                                              height: 70.0,
                                              decoration: BoxDecoration(),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/new_loader.gif',
                                                  width: 50.0,
                                                  height: 50.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 200.0, 0.0, 0.0),
                                          child: Text(
                                            'Loading....',
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
                                      }
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        );
                      } else {
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/new_loader.gif',
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  if (_model.isLoadingIndicator)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/new_loader.gif',
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
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
                                'SUB_CATEGORIES_SCREEN_cartbtnContainer_O');
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
                                    'SUB_CATEGORIES_SCREEN_Row_wjg1azek_ON_TA');
                                if (FFAppState().cartTotalCount < 1) {
                                  logFirebaseEvent('Row_navigate_to');

                                  context.pushNamed(
                                      CartSubscriptionScreenWidget.routeName);

                                  logFirebaseEvent('Row_update_app_state');
                                  FFAppState().isCartShow = false;
                                  FFAppState().screenName = 'subscriptionCart';
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
                                      'Navigate To': 'Subscription Cart Screen',
                                      'Screen Name': 'Sub Categories Screen',
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
                                      'Screen Name': 'Sub Categories Screen',
                                    },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Congratulations !  You\'ve got ',
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
                                                        .neutralWhiteF5F5F5,
                                                    fontSize: 8.0,
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
                                              textScaler: MediaQuery.of(context)
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
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: FFAppConstants
                                                          .yellowColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.0,
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
                                            SizedBox(
                                              height: 25.0,
                                              child: VerticalDivider(
                                                thickness: 1.0,
                                                color:
                                                    FFAppConstants.yellowColor,
                                              ),
                                            ),
                                            RichText(
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
                                                    text: functions
                                                        .setDecimalValue(functions
                                                            .additionFunction(
                                                                FFAppState()
                                                                    .cartTotalPrice,
                                                                FFAppState()
                                                                    .subCartTotalPrice)
                                                            .toString())!,
                                                    style:
                                                        GoogleFonts.montserrat(
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
                                                      font:
                                                          GoogleFonts.readexPro(
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
                                              (FFAppState()
                                                      .subCartSavingAmount >
                                                  0.00)) {
                                            return RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'You have saved ',
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
                                                    style:
                                                        GoogleFonts.montserrat(
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
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: FFAppConstants
                                                          .whiteColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13.0,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' on your order',
                                                    style:
                                                        GoogleFonts.montserrat(
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
                                                      font:
                                                          GoogleFonts.readexPro(
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
                                                        .whiteColor,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
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
        ),
      ),
    );
  }
}
