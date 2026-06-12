import '/backend/api_requests/api_calls.dart';
import '/components/empty_data_two_line_component/empty_data_two_line_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trial_product_cart_screen_model.dart';
export 'trial_product_cart_screen_model.dart';

class TrialProductCartScreenWidget extends StatefulWidget {
  const TrialProductCartScreenWidget({super.key});

  static String routeName = 'TrialProductCartScreen';
  static String routePath = '/trialProductCartScreen';

  @override
  State<TrialProductCartScreenWidget> createState() =>
      _TrialProductCartScreenWidgetState();
}

class _TrialProductCartScreenWidgetState
    extends State<TrialProductCartScreenWidget> {
  late TrialProductCartScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrialProductCartScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TrialProductCartScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TRIAL_PRODUCT_CART_SCREEN_TrialProductCa');
      logFirebaseEvent('TrialProductCartScreen_update_app_state');
      FFAppState().isDeliveryPartnerTipSelected = '0';
      FFAppState().selectedDeliveryDate = '';
      FFAppState().selectedDeliveryTimeSlot = '';
      safeSetState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(QuickartGroup.showtrailpackCall.call(
              userid: FFAppState().userID,
              deviceid: FFAppState().deviceID,
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
        final trialProductCartScreenShowtrailpackResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('TRIAL_PRODUCT_CART_SCREEN_arrow_back_ios');
                  logFirebaseEvent('IconButton_navigate_to');
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
                  context.pushNamed(TrialProductListingWidget.routeName);
                },
              ),
              title: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('TRIAL_PRODUCT_CART_SCREEN_Text_j7w42ut6_');
                },
                child: Text(
                  'Trial Pack Cart',
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
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      if (QuickartGroup.showtrailpackCall.productList(
                                trialProductCartScreenShowtrailpackResponse
                                    .jsonBody,
                              ) !=
                              null &&
                          (QuickartGroup.showtrailpackCall.productList(
                            trialProductCartScreenShowtrailpackResponse
                                .jsonBody,
                          ))!
                              .isNotEmpty) {
                        return Container(
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.695,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FFAppConstants.lightGreen,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12.0),
                                            bottomRight: Radius.circular(12.0),
                                          ),
                                          border: Border.all(
                                            color:
                                                FFAppConstants.GreenColorBorder,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25.0, 0.0, 25.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    width: 35.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: FFAppConstants
                                                          .yellowColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Icon(
                                                      FFIcons.kfreeDelivery,
                                                      color: FFAppConstants
                                                          .indigoColor,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'FREE Delivery - Shop now & Save!',
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
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final productlist =
                                                QuickartGroup.showtrailpackCall
                                                        .productList(
                                                          trialProductCartScreenShowtrailpackResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: productlist.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 2.0),
                                              itemBuilder:
                                                  (context, productlistIndex) {
                                                final productlistItem =
                                                    productlist[
                                                        productlistIndex];
                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 120.0,
                                                  decoration: BoxDecoration(
                                                    color: FFAppConstants
                                                        .whiteColor,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            getJsonField(
                                                              productlistItem,
                                                              r'''$.product_image''',
                                                            ).toString(),
                                                            width: 100.0,
                                                            height: 100.0,
                                                            fit: BoxFit.contain,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: 100.0,
                                                              height: 100.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width -
                                                                  135,
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
                                                                            3.0,
                                                                            0.0,
                                                                            3.0,
                                                                            10.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    productlistItem,
                                                                    r'''$.title''',
                                                                  ).toString(),
                                                                  maxLines: 2,
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
                                                                            .blackColor0A0A0A,
                                                                        fontSize:
                                                                            14.0,
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
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
                                                                            text:
                                                                                'AED ',
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
                                                                            text:
                                                                                valueOrDefault<String>(
                                                                              functions.setDecimalValue(getJsonField(
                                                                                productlistItem,
                                                                                r'''$.discount_ord_price''',
                                                                              ).toString()),
                                                                              '0',
                                                                            ),
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 13.0,
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderRadius:
                                                                          8.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .delete,
                                                                        color: FFAppConstants
                                                                            .redDF3F56,
                                                                        size:
                                                                            28.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'TRIAL_PRODUCT_CART_SCREEN_delete_ICN_ON_');
                                                                        logFirebaseEvent(
                                                                            'IconButton_custom_action');
                                                                        _model.internet =
                                                                            await actions.checkInternetConnection();
                                                                        if (_model.internet ==
                                                                            true) {
                                                                          logFirebaseEvent(
                                                                              'IconButton_haptic_feedback');
                                                                          HapticFeedback
                                                                              .mediumImpact();
                                                                          logFirebaseEvent(
                                                                              'IconButton_backend_call');
                                                                          _model.apiResultRemoveTrialP = await QuickartGroup
                                                                              .addtrailpackCall
                                                                              .call(
                                                                            trialid:
                                                                                getJsonField(
                                                                              productlistItem,
                                                                              r'''$.trail_id''',
                                                                            ).toString(),
                                                                            userid:
                                                                                FFAppState().userID,
                                                                            qty:
                                                                                '0',
                                                                          );

                                                                          if ((_model.apiResultRemoveTrialP?.succeeded ??
                                                                              true)) {
                                                                            logFirebaseEvent('IconButton_refresh_database_request');
                                                                            safeSetState(() =>
                                                                                _model.apiRequestCompleter = null);
                                                                            await _model.waitForApiRequestCompleted();
                                                                            logFirebaseEvent('IconButton_google_analytics_event');
                                                                            logFirebaseEvent(
                                                                              'Add To Sub Cart',
                                                                              parameters: {
                                                                                'Screen Name': 'Trial Cart Screen',
                                                                                'API Name': 'Add To trial cart',
                                                                              },
                                                                            );
                                                                          } else {
                                                                            logFirebaseEvent('IconButton_show_snack_bar');
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  getJsonField(
                                                                                    (_model.apiResultRemoveTrialP?.jsonBody ?? ''),
                                                                                    r'''$.message''',
                                                                                  ).toString(),
                                                                                  style: GoogleFonts.montserrat(
                                                                                    color: FFAppConstants.blackColor0A0A0A,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontSize: 12.0,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 3350),
                                                                                backgroundColor: FFAppConstants.NeutralBlack50Color,
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
                                                                                FFAppConstants.internetString,
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

                                                                        safeSetState(
                                                                            () {});
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
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                'Schedule Delivery Date',
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
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 10.0, 15.0, 0.0),
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FFAppConstants.whiteColor,
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
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  width: 0.5,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(40.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFAppState().selectedDeliveryDate !=
                                                                  null &&
                                                              FFAppState()
                                                                      .selectedDeliveryDate !=
                                                                  ''
                                                          ? valueOrDefault<
                                                              String>(
                                                              functions.setDateFormatter(
                                                                  FFAppState()
                                                                      .selectedDeliveryDate,
                                                                  'EEE',
                                                                  'yyyy-MM-dd'),
                                                              'No Date',
                                                            )
                                                          : valueOrDefault<
                                                              String>(
                                                              functions.setDateFormatter(
                                                                  getJsonField(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                    r'''$.data.timeslotsdata[0].date''',
                                                                  ).toString(),
                                                                  'EEE',
                                                                  'yyyy-MM-dd'),
                                                              'No Date',
                                                            ),
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
                                                                fontSize: 12.0,
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
                                                    height: 100.0,
                                                    child: VerticalDivider(
                                                      width: 0.5,
                                                      thickness: 1.0,
                                                      color: FFAppConstants
                                                          .indigoColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    FFAppState().selectedDeliveryTimeSlot !=
                                                                null &&
                                                            FFAppState()
                                                                    .selectedDeliveryTimeSlot !=
                                                                ''
                                                        ? FFAppState()
                                                            .selectedDeliveryTimeSlot
                                                        : getJsonField(
                                                            trialProductCartScreenShowtrailpackResponse
                                                                .jsonBody,
                                                            r'''$.data.timeslotsdata[0].timeslots[0].time_slots''',
                                                          ).toString(),
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
                                                          'TRIAL_PRODUCT_CART_SCREEN_Container_vfbc');
                                                      if (_model
                                                              .isDateTimeOpen ==
                                                          'true') {
                                                        logFirebaseEvent(
                                                            'Container_update_page_state');
                                                        _model.isDateTimeOpen =
                                                            'false';
                                                        safeSetState(() {});
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Container_update_page_state');
                                                        _model.isDateTimeOpen =
                                                            'true';
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Container_update_app_state');
                                                        FFAppState()
                                                                .selectedDeliveryDate =
                                                            FFAppState().selectedDeliveryDate !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedDeliveryDate !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .selectedDeliveryDate
                                                                : getJsonField(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                    r'''$.data.timeslotsdata[0].date''',
                                                                  ).toString();
                                                        FFAppState()
                                                                .selectedDeliveryTimeSlot =
                                                            FFAppState().selectedDeliveryTimeSlot !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedDeliveryTimeSlot !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .selectedDeliveryTimeSlot
                                                                : getJsonField(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                    r'''$.data.timeslotsdata[0].timeslots[0].time_slots''',
                                                                  ).toString();
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 50.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (_model
                                                                  .isDateTimeOpen ==
                                                              'false') {
                                                            return Icon(
                                                              Icons
                                                                  .arrow_drop_down_sharp,
                                                              color:
                                                                  FFAppConstants
                                                                      .whiteColor,
                                                              size: 24.0,
                                                            );
                                                          } else {
                                                            return Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              color:
                                                                  FFAppConstants
                                                                      .whiteColor,
                                                              size: 24.0,
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
                                          Builder(
                                            builder: (context) {
                                              if (_model.isDateTimeOpen ==
                                                  'true') {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FFAppConstants
                                                          .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                8.0),
                                                      ),
                                                      border: Border.all(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                        width: 0.5,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Text(
                                                              'Choose a date',
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      5.0,
                                                                      15.0,
                                                                      0.0),
                                                          child: Container(
                                                            height: 65.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final dateList =
                                                                    QuickartGroup
                                                                            .showtrailpackCall
                                                                            .timeSlotsData(
                                                                              trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                            )
                                                                            ?.toList() ??
                                                                        [];

                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  itemCount:
                                                                      dateList
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          width:
                                                                              8.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          dateListIndex) {
                                                                    final dateListItem =
                                                                        dateList[
                                                                            dateListIndex];
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
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
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('TRIAL_PRODUCT_CART_SCREEN_Container_8c0b');
                                                                            logFirebaseEvent('Container_update_page_state');
                                                                            _model.selectedDate =
                                                                                getJsonField(
                                                                              dateListItem,
                                                                              r'''$.date''',
                                                                            ).toString();
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Container_update_app_state');
                                                                            FFAppState().selectedDeliveryDate =
                                                                                getJsonField(
                                                                              dateListItem,
                                                                              r'''$.date''',
                                                                            ).toString();
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: functions.setbackgroundColor(
                                                                                  getJsonField(
                                                                                    dateListItem,
                                                                                    r'''$.date''',
                                                                                  ).toString(),
                                                                                  FFAppState().selectedDeliveryDate,
                                                                                  0,
                                                                                  0),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              border: Border.all(
                                                                                color: FFAppConstants.indigoColor,
                                                                                width: 0.5,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  functions.setDateFormatter(
                                                                                      getJsonField(
                                                                                        dateListItem,
                                                                                        r'''$.date''',
                                                                                      ).toString(),
                                                                                      'dd',
                                                                                      'yyyy-MM-dd'),
                                                                                  'No date',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.montserrat(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              functions.setDateFormatter(
                                                                                  getJsonField(
                                                                                    dateListItem,
                                                                                    r'''$.date''',
                                                                                  ).toString(),
                                                                                  'EEE',
                                                                                  'yyyy-MM-dd')!,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.montserrat(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Choose a time',
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      5.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  FFAppConstants
                                                                      .whiteColor,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final timeList = functions
                                                                          .getSelectedTimeSlotList(
                                                                              FFAppState().selectedDeliveryDate,
                                                                              getJsonField(
                                                                                trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                r'''$.data.timeslotsdata''',
                                                                              ))
                                                                          ?.toList() ??
                                                                      [];

                                                                  return GridView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    gridDelegate:
                                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                                      crossAxisCount:
                                                                          2,
                                                                      crossAxisSpacing:
                                                                          10.0,
                                                                      mainAxisSpacing:
                                                                          5.0,
                                                                      childAspectRatio:
                                                                          3.8,
                                                                    ),
                                                                    primary:
                                                                        false,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        timeList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            timeListIndex) {
                                                                      final timeListItem =
                                                                          timeList[
                                                                              timeListIndex];
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
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
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('TRIAL_PRODUCT_CART_SCREEN_Container_209u');
                                                                              logFirebaseEvent('Container_update_app_state');
                                                                              FFAppState().selectedDeliveryTimeSlot = getJsonField(
                                                                                timeListItem,
                                                                                r'''$.time_slots''',
                                                                              ).toString();
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Container_update_page_state');
                                                                              _model.isDateTimeOpen = 'false';
                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: 38.0,
                                                                              decoration: BoxDecoration(
                                                                                color: functions.setbackgroundColor(
                                                                                    getJsonField(
                                                                                      timeListItem,
                                                                                      r'''$.time_slots''',
                                                                                    ).toString(),
                                                                                    FFAppState().selectedDeliveryTimeSlot,
                                                                                    0,
                                                                                    0),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FFAppConstants.indigoColor,
                                                                                  width: 0.5,
                                                                                ),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      timeListItem,
                                                                                      r'''$.time_slots''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 11.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
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
                                        ],
                                      ),
                                      if (FFAppState().cartTotalCount > 0)
                                        Container(
                                          decoration: BoxDecoration(),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: FFAppConstants.whiteColor,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  'Delivery Partner Tip',
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
                                                            .blackColor0A0A0A,
                                                        fontSize: 16.0,
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 26.0,
                                                  decoration: BoxDecoration(),
                                                  child: ListView(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      10.0,
                                                      0,
                                                      10.0,
                                                      0,
                                                    ),
                                                    scrollDirection:
                                                        Axis.horizontal,
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
                                                              'TRIAL_PRODUCT_CART_SCREEN_Container_nt5p');
                                                          if (FFAppState()
                                                                  .isDeliveryPartnerTipSelected ==
                                                              '3') {
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState()
                                                                    .isDeliveryPartnerTipSelected =
                                                                '0';
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Container_google_analytics_event');
                                                            logFirebaseEvent(
                                                                'DeliveryPartnerTipSelectedClickedAnalytics');
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState()
                                                                    .isDeliveryPartnerTipSelected =
                                                                '3';
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 80.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppState()
                                                                        .isDeliveryPartnerTipSelected ==
                                                                    '3'
                                                                ? FFAppConstants
                                                                    .primaryPurpleE4D8F5
                                                                : FFAppConstants
                                                                    .neutralWhiteF5F5F5,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FFAppConstants
                                                                  .primaryPurple7E65AC,
                                                              width: 0.5,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: Text(
                                                                  'AED ',
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: Text(
                                                                  '3',
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/image3.png',
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
                                                      ),
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
                                                              'TRIAL_PRODUCT_CART_SCREEN_Container_k6ck');
                                                          if (FFAppState()
                                                                  .isDeliveryPartnerTipSelected ==
                                                              '5') {
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState()
                                                                    .isDeliveryPartnerTipSelected =
                                                                '0';
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Container_google_analytics_event');
                                                            logFirebaseEvent(
                                                                'DeliveryPartnerTipSelectedClickedAnalytics');
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState()
                                                                    .isDeliveryPartnerTipSelected =
                                                                '5';
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 80.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppState()
                                                                        .isDeliveryPartnerTipSelected ==
                                                                    '5'
                                                                ? FFAppConstants
                                                                    .primaryPurpleE4D8F5
                                                                : FFAppConstants
                                                                    .neutralWhiteF5F5F5,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FFAppConstants
                                                                  .primaryPurple7E65AC,
                                                              width: 0.5,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: Text(
                                                                  'AED ',
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: Text(
                                                                  '5',
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/images2.png',
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
                                                      ),
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
                                                              'TRIAL_PRODUCT_CART_SCREEN_Container_2ai4');
                                                          if (FFAppState()
                                                                  .isDeliveryPartnerTipSelected ==
                                                              '10') {
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState()
                                                                    .isDeliveryPartnerTipSelected =
                                                                '0';
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Container_google_analytics_event');
                                                            logFirebaseEvent(
                                                                'DeliveryPartnerTipSelectedClickedAnalytics');
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState()
                                                                    .isDeliveryPartnerTipSelected =
                                                                '10';
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 80.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppState()
                                                                        .isDeliveryPartnerTipSelected ==
                                                                    '10'
                                                                ? FFAppConstants
                                                                    .primaryPurpleE4D8F5
                                                                : FFAppConstants
                                                                    .neutralWhiteF5F5F5,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FFAppConstants
                                                                  .primaryPurple7E65AC,
                                                              width: 0.5,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: Text(
                                                                  'AED ',
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: Text(
                                                                  '10',
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/image7.png',
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
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
                                                              'TRIAL_PRODUCT_CART_SCREEN_Container_3tav');
                                                          if (FFAppState()
                                                                  .isDeliveryPartnerTipSelected ==
                                                              '15') {
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState()
                                                                    .isDeliveryPartnerTipSelected =
                                                                '0';
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Container_google_analytics_event');
                                                            logFirebaseEvent(
                                                                'DeliveryPartnerTipSelectedClickedAnalytics');
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState()
                                                                    .isDeliveryPartnerTipSelected =
                                                                '15';
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 80.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppState()
                                                                        .isDeliveryPartnerTipSelected ==
                                                                    '15'
                                                                ? FFAppConstants
                                                                    .primaryPurpleE4D8F5
                                                                : FFAppConstants
                                                                    .neutralWhiteF5F5F5,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FFAppConstants
                                                                  .primaryPurple7E65AC,
                                                              width: 0.0,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: Text(
                                                                  'AED ',
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            2.0,
                                                                            2.0,
                                                                            2.0),
                                                                child: Text(
                                                                  '15',
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/image6.png',
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 15.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: valueOrDefault<double>(
                                            _model.trialCartPaymentRadioButtonValue ==
                                                    'COD'
                                                ? 165.0
                                                : 120.0,
                                            280.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FFAppConstants.whiteColor,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 5.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Order Summary',
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
                                                                .blackColor0A0A0A,
                                                            fontSize: 16.0,
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
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Item Total',
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
                                                                  color: FFAppConstants
                                                                      .blackColor0A0A0A,
                                                                  fontSize:
                                                                      13.0,
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
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (functions
                                                                  .setDecimalValue(
                                                                      getJsonField(
                                                                QuickartGroup
                                                                    .showtrailpackCall
                                                                    .mainData(
                                                                  trialProductCartScreenShowtrailpackResponse
                                                                      .jsonBody,
                                                                ),
                                                                r'''$.total_mrp''',
                                                              ).toString()) !=
                                                              functions
                                                                  .setDecimalValue(
                                                                      getJsonField(
                                                                QuickartGroup
                                                                    .showtrailpackCall
                                                                    .mainData(
                                                                  trialProductCartScreenShowtrailpackResponse
                                                                      .jsonBody,
                                                                ),
                                                                r'''$.total_price''',
                                                              ).toString()))
                                                            Text(
                                                              'AED ',
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
                                                                    color: FFAppConstants
                                                                        .neutralBlack8F8F8F,
                                                                    fontSize:
                                                                        13.0,
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
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                  ),
                                                            ),
                                                          if (functions
                                                                  .setDecimalValue(
                                                                      getJsonField(
                                                                QuickartGroup
                                                                    .showtrailpackCall
                                                                    .mainData(
                                                                  trialProductCartScreenShowtrailpackResponse
                                                                      .jsonBody,
                                                                ),
                                                                r'''$.total_mrp''',
                                                              ).toString()) !=
                                                              functions
                                                                  .setDecimalValue(
                                                                      getJsonField(
                                                                QuickartGroup
                                                                    .showtrailpackCall
                                                                    .mainData(
                                                                  trialProductCartScreenShowtrailpackResponse
                                                                      .jsonBody,
                                                                ),
                                                                r'''$.discount_total_price''',
                                                              ).toString()))
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions
                                                                    .setDecimalValue(
                                                                        getJsonField(
                                                                  QuickartGroup
                                                                      .showtrailpackCall
                                                                      .mainData(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  r'''$.total_mrp''',
                                                                ).toString()),
                                                                '0.00',
                                                              ),
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
                                                                    color: FFAppConstants
                                                                        .neutralBlack8F8F8F,
                                                                    fontSize:
                                                                        13.0,
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
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                  ),
                                                            ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              ' AED',
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
                                                                    color: FFAppConstants
                                                                        .blackColor0A0A0A,
                                                                    fontSize:
                                                                        13.0,
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions
                                                                    .setDecimalValue(
                                                                        getJsonField(
                                                                  QuickartGroup
                                                                      .showtrailpackCall
                                                                      .mainData(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  r'''$.discount_total_price''',
                                                                ).toString()),
                                                                '0.00',
                                                              ),
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
                                                                    color: FFAppConstants
                                                                        .blackColor0A0A0A,
                                                                    fontSize:
                                                                        13.0,
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
                                                    ],
                                                  ),
                                                ),
                                                if (_model
                                                        .trialCartPaymentRadioButtonValue ==
                                                    'COD')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Delivery Charges',
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
                                                                    color: FFAppConstants
                                                                        .blackColor0A0A0A,
                                                                    fontSize:
                                                                        13.0,
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
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'AED ',
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
                                                                      color: FFAppConstants
                                                                          .primaryPurple2,
                                                                      fontSize:
                                                                          12.0,
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
                                                            Text(
                                                              functions
                                                                  .setDecimalValue(
                                                                      getJsonField(
                                                                trialProductCartScreenShowtrailpackResponse
                                                                    .jsonBody,
                                                                r'''$.data.delivery_charge''',
                                                              ).toString())!,
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
                                                                    color: FFAppConstants
                                                                        .primaryPurple2,
                                                                    fontSize:
                                                                        12.0,
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
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (_model
                                                        .trialCartPaymentRadioButtonValue ==
                                                    'COD')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'COD Extra Charges',
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
                                                                    color: FFAppConstants
                                                                        .blackColor0A0A0A,
                                                                    fontSize:
                                                                        13.0,
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
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'AED ',
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
                                                                      color: FFAppConstants
                                                                          .primaryPurple2,
                                                                      fontSize:
                                                                          12.0,
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
                                                            Text(
                                                              functions
                                                                  .setDecimalValue(
                                                                      getJsonField(
                                                                FFAppState()
                                                                    .appInfo,
                                                                r'''$.codcharges''',
                                                              ).toString())!,
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
                                                                    color: FFAppConstants
                                                                        .primaryPurple2,
                                                                    fontSize:
                                                                        12.0,
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
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Delivery Partner Tip',
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
                                                                  color: FFAppConstants
                                                                      .blackColor0A0A0A,
                                                                  fontSize:
                                                                      13.0,
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
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'AED ',
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
                                                                    color: FFAppConstants
                                                                        .primaryPurple2,
                                                                    fontSize:
                                                                        12.0,
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
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.setDecimalValue(
                                                                  FFAppState()
                                                                      .isDeliveryPartnerTipSelected),
                                                              '0.00',
                                                            ),
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
                                                                  color: FFAppConstants
                                                                      .primaryPurple2,
                                                                  fontSize:
                                                                      12.0,
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
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'VAT',
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
                                                                  color: FFAppConstants
                                                                      .blackColor0A0A0A,
                                                                  fontSize:
                                                                      13.0,
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
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'AED ',
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
                                                                    color: FFAppConstants
                                                                        .primaryPurple2,
                                                                    fontSize:
                                                                        12.0,
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
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .setDecimalValue(
                                                                      getJsonField(
                                                                QuickartGroup
                                                                    .showtrailpackCall
                                                                    .mainData(
                                                                  trialProductCartScreenShowtrailpackResponse
                                                                      .jsonBody,
                                                                ),
                                                                r'''$.vat''',
                                                              ).toString()),
                                                              '0.00',
                                                            ),
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
                                                                  color: FFAppConstants
                                                                      .primaryPurple2,
                                                                  fontSize:
                                                                      12.0,
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
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 1.0,
                                                    decoration: BoxDecoration(
                                                      color: FFAppConstants
                                                          .neutralWhiteF5F5F5,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Total to pay',
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
                                                              fontSize: 13.0,
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
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FFAppConstants
                                                                        .blackColor0A0A0A,
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
                                                              text: functions
                                                                  .updateTotalAmount(
                                                                      FFAppState()
                                                                          .isDeliveryPartnerTipSelected,
                                                                      '0',
                                                                      getJsonField(
                                                                        QuickartGroup
                                                                            .showtrailpackCall
                                                                            .mainData(
                                                                          trialProductCartScreenShowtrailpackResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        r'''$.discount_total_price''',
                                                                      )
                                                                          .toString(),
                                                                      '0',
                                                                      FFAppState()
                                                                          .isCardSelected,
                                                                      _model
                                                                          .trialCartPaymentRadioButtonValue,
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .appInfo,
                                                                        r'''$.codcharges''',
                                                                      ).toString(),
                                                                      '',
                                                                      '')
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                color: FFAppConstants
                                                                    .blackColor0A0A0A,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 13.0,
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
                                                                color: FFAppConstants
                                                                    .blackColor0A0A0A,
                                                                fontSize: 13.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 10.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            color: FFAppConstants.whiteColor,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Delivery Instructions',
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
                                                              .blackColor0A0A0A,
                                                          fontSize: 16.0,
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 35.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: ListView(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'TRIAL_PRODUCT_CART_SCREEN_Container_hs5d');
                                                            if (FFAppState()
                                                                    .deliveryPartnerInstructionAvoid ==
                                                                'Avoid calling customer') {
                                                              logFirebaseEvent(
                                                                  'Container_update_app_state');
                                                              FFAppState()
                                                                  .deliveryPartnerInstructionAvoid = '';
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'Container_google_analytics_event');
                                                              logFirebaseEvent(
                                                                  'DeliveryPartnerInstructionsAnalytics');
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Container_update_app_state');
                                                              FFAppState()
                                                                      .deliveryPartnerInstructionAvoid =
                                                                  'Avoid calling customer';
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FFAppState()
                                                                          .deliveryPartnerInstructionAvoid ==
                                                                      'Avoid calling customer'
                                                                  ? FFAppConstants
                                                                      .primaryPurpleE4D8F5
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFF6F2FC),
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .mic_off,
                                                                    color: FFAppConstants
                                                                        .neutralBlack3D3D3D,
                                                                    size: 13.0,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Avoid calling customer',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    maxLines: 2,
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
                                                                              FFAppConstants.neutralBlack3D3D3D,
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'TRIAL_PRODUCT_CART_SCREEN_Container_tiff');
                                                              if (FFAppState()
                                                                      .deliveryPartnerInstructionBell ==
                                                                  'Don’t ring the bell') {
                                                                logFirebaseEvent(
                                                                    'Container_update_app_state');
                                                                FFAppState()
                                                                    .deliveryPartnerInstructionBell = '';
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'Container_google_analytics_event');
                                                                logFirebaseEvent(
                                                                    'DeliveryPartnerInstructionsAnalytics');
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Container_update_app_state');
                                                                FFAppState()
                                                                        .deliveryPartnerInstructionBell =
                                                                    'Don’t ring the bell';
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FFAppState()
                                                                            .deliveryPartnerInstructionBell ==
                                                                        'Don’t ring the bell'
                                                                    ? FFAppConstants
                                                                        .primaryPurpleE4D8F5
                                                                    : Colors
                                                                        .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFFF6F2FC),
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .notifications_off_sharp,
                                                                      color: FFAppConstants
                                                                          .neutralBlack3D3D3D,
                                                                      size:
                                                                          13.0,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Don’t ring the bell',
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
                                                                                FFAppConstants.neutralBlack3D3D3D,
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
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
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'TRIAL_PRODUCT_CART_SCREEN_Container_ca2l');
                                                              if (FFAppState()
                                                                      .deliveryPartnerInstructionDoor ==
                                                                  ' Leave it at my door') {
                                                                logFirebaseEvent(
                                                                    'Container_update_app_state');
                                                                FFAppState()
                                                                    .deliveryPartnerInstructionDoor = '';
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'Container_google_analytics_event');
                                                                logFirebaseEvent(
                                                                    'DeliveryPartnerInstructionsAnalytics');
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Container_update_app_state');
                                                                FFAppState()
                                                                        .deliveryPartnerInstructionDoor =
                                                                    ' Leave it at my door';
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FFAppState()
                                                                            .deliveryPartnerInstructionDoor ==
                                                                        ' Leave it at my door'
                                                                    ? FFAppConstants
                                                                        .primaryPurpleE4D8F5
                                                                    : Colors
                                                                        .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFFF6F2FC),
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .door_sliding,
                                                                      color: FFAppConstants
                                                                          .neutralBlack3D3D3D,
                                                                      size:
                                                                          13.0,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Leave it at my door',
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
                                                                                FFAppConstants.neutralBlack3D3D3D,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 20.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FFAppConstants.whiteColor,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Order Instructions',
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
                                                              .blackColor0A0A0A,
                                                          fontSize: 16.0,
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Container(
                                                      width: 200.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FFAppConstants
                                                                        .blackColor0A0A0A,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                          hintText:
                                                              'Order related Instruction',
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FFAppConstants
                                                                  .neutralBlackE0E0E0,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FFAppConstants
                                                                  .neutralBlackE0E0E0,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
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
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: null,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
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
                              if ((isWeb
                                      ? MediaQuery.viewInsetsOf(context)
                                              .bottom >
                                          0
                                      : _isKeyboardVisible) ==
                                  false)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: valueOrDefault<double>(
                                      _model.trialCartPaymentRadioButtonValue ==
                                              'COD'
                                          ? 140.0
                                          : 160.0,
                                      160.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                      border: Border.all(
                                        color: FFAppConstants.indigoColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FlutterFlowRadioButton(
                                                    options: ['COD', 'Pay Now']
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'TRIAL_PRODUCT_CART_SCREEN_TrialCartPayme');
                                                      logFirebaseEvent(
                                                          'TrialCartPaymentRadioButton_update_page_');
                                                      _model.selectedPaymentMethod =
                                                          _model
                                                              .trialCartPaymentRadioButtonValue;
                                                      safeSetState(() {});
                                                    },
                                                    controller: _model
                                                            .trialCartPaymentRadioButtonValueController ??=
                                                        FormFieldController<
                                                            String>('Pay Now'),
                                                    optionHeight: 32.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FFAppConstants
                                                              .blackColor0A0A0A,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    selectedTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                                              fontSize: 13.0,
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
                                                    textPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                2.0, 0.0),
                                                    buttonPosition:
                                                        RadioButtonPosition
                                                            .left,
                                                    direction: Axis.horizontal,
                                                    radioButtonColor:
                                                        FFAppConstants
                                                            .indigoColor,
                                                    inactiveRadioButtonColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    toggleable: false,
                                                    horizontalAlignment:
                                                        WrapAlignment.start,
                                                    verticalAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                  ),
                                                  if ((_model.selectedPaymentMethod ==
                                                          'Pay Now') &&
                                                      (isiOS == true))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context).width >
                                                                            410.0
                                                                        ? 10.0
                                                                        : 5.0,
                                                                    0.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
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
                                                              'TRIAL_PRODUCT_CART_SCREEN_ApplePayContai');
                                                          if (_model
                                                                  .isPaymentDone ==
                                                              true) {
                                                            logFirebaseEvent(
                                                                'ApplePayContainer_wait__delay');
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    200,
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'ApplePayContainer_update_page_state');
                                                            _model.isPaymentDone =
                                                                false;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'ApplePayContainer_update_app_state');
                                                            FFAppState()
                                                                    .paymentMethod =
                                                                _model.trialCartPaymentRadioButtonValue ==
                                                                        'COD'
                                                                    ? 'COD'
                                                                    : 'card';
                                                            FFAppState()
                                                                .selectedAddresID = FFAppState()
                                                                            .selectedAddress1 ==
                                                                        null ||
                                                                    FFAppState()
                                                                            .selectedAddress1 ==
                                                                        ''
                                                                ? (QuickartGroup
                                                                            .showtrailpackCall
                                                                            .lastAddress(
                                                                              trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                            )!
                                                                            .length >
                                                                        0
                                                                    ? (_model
                                                                                .checkAddressExits !=
                                                                            getJsonField(
                                                                              trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                              r'''$.data.lastadd[0].cityExists''',
                                                                            )
                                                                        ? getJsonField(
                                                                            trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                            r'''$.data.lastadd[0].address_id''',
                                                                          )
                                                                            .toString()
                                                                        : 'null')
                                                                    : FFAppState()
                                                                        .selectedAddresID)
                                                                : FFAppState()
                                                                    .selectedAddresID;
                                                            FFAppState()
                                                                .selectedDeliveryDate = FFAppState()
                                                                            .selectedDeliveryDate !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedDeliveryDate !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .selectedDeliveryDate
                                                                : getJsonField(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                    r'''$.data.timeslotsdata[0].date''',
                                                                  ).toString();
                                                            FFAppState()
                                                                .selectedDeliveryTimeSlot = FFAppState()
                                                                            .selectedDeliveryTimeSlot !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedDeliveryTimeSlot !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .selectedDeliveryTimeSlot
                                                                : getJsonField(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                    r'''$.data.timeslotsdata[0].timeslots[0].time_slots''',
                                                                  ).toString();
                                                            FFAppState()
                                                                .selectedCardID = FFAppState()
                                                                        .isCardChange ==
                                                                    true
                                                                ? FFAppState()
                                                                    .selectedCardID
                                                                : getJsonField(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                    r'''$.data.lastcarddetails.si_sub_ref_no''',
                                                                  ).toString();
                                                            FFAppState()
                                                                .selectedAddress1 = QuickartGroup
                                                                        .showtrailpackCall
                                                                        .lastAddress(
                                                                          trialProductCartScreenShowtrailpackResponse
                                                                              .jsonBody,
                                                                        )!
                                                                        .length >
                                                                    0
                                                                ? getJsonField(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                    r'''$.data.lastadd[0].house_no''',
                                                                  ).toString()
                                                                : FFAppState()
                                                                    .selectedAddress1;
                                                            logFirebaseEvent(
                                                                'ApplePayContainer_custom_action');
                                                            _model.connectivityResult4 =
                                                                await actions
                                                                    .checkInternetConnection();
                                                            if (_model
                                                                    .connectivityResult4 ==
                                                                true) {
                                                              if (FFAppState()
                                                                          .selectedDeliveryDate !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .selectedDeliveryDate !=
                                                                      '') {
                                                                if (FFAppState()
                                                                            .selectedDeliveryTimeSlot !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedDeliveryTimeSlot !=
                                                                        '') {
                                                                  if (FFAppState()
                                                                              .selectedAddresID !=
                                                                          null &&
                                                                      FFAppState()
                                                                              .selectedAddresID !=
                                                                          '') {
                                                                    logFirebaseEvent(
                                                                        'ApplePayContainer_update_page_state');
                                                                    _model.isPaymentDone =
                                                                        false;
                                                                    _model.isLoaderIndicator =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'ApplePayContainer_backend_call');
                                                                    _model.apiResultTrialPackPayment1 =
                                                                        await QuickartGroup
                                                                            .trailpaymentCall
                                                                            .call(
                                                                      userid: FFAppState()
                                                                          .userID,
                                                                      addressid:
                                                                          FFAppState()
                                                                              .selectedAddresID,
                                                                      storeid:
                                                                          FFAppState()
                                                                              .storeID,
                                                                      paymentMethod:
                                                                          'applepay',
                                                                      deliveryDate:
                                                                          FFAppState()
                                                                              .selectedDeliveryDate,
                                                                      timeSlot:
                                                                          FFAppState()
                                                                              .selectedDeliveryTimeSlot,
                                                                      delPartnerTip:
                                                                          FFAppState()
                                                                              .isDeliveryPartnerTipSelected,
                                                                      delPartnerInstruction: functions.combineInstructions(
                                                                          FFAppState()
                                                                              .deliveryPartnerInstructionAvoid,
                                                                          FFAppState()
                                                                              .deliveryPartnerInstructionBell,
                                                                          FFAppState()
                                                                              .deliveryPartnerInstructionDoor),
                                                                      deviceid:
                                                                          FFAppState()
                                                                              .deviceID,
                                                                      orderInstruction: (String
                                                                          var1) {
                                                                        return var1.trim() ??
                                                                            '';
                                                                      }(_model
                                                                          .textController
                                                                          .text),
                                                                      platform: isiOS
                                                                          ? 'ios'
                                                                          : 'android',
                                                                    );

                                                                    if ((_model
                                                                            .apiResultTrialPackPayment1
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'ApplePayContainer_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        PaymentScreenWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'redirectURl':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              (_model.apiResultTrialPackPayment1?.jsonBody ?? ''),
                                                                              r'''$.data.redirect_url''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'screenPName':
                                                                              serializeParam(
                                                                            'daily',
                                                                            ParamType.String,
                                                                          ),
                                                                          'mrp':
                                                                              serializeParam(
                                                                            functions.updateTotalAmount(
                                                                                FFAppState().isDeliveryPartnerTipSelected,
                                                                                '0',
                                                                                getJsonField(
                                                                                  QuickartGroup.showtrailpackCall.mainData(
                                                                                    trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                  ),
                                                                                  r'''$.discount_total_price''',
                                                                                ).toString(),
                                                                                '0',
                                                                                FFAppState().isCardSelected,
                                                                                _model.trialCartPaymentRadioButtonValue,
                                                                                getJsonField(
                                                                                  FFAppState().appInfo,
                                                                                  r'''$.codcharges''',
                                                                                ).toString(),
                                                                                '',
                                                                                ''),
                                                                            ParamType.double,
                                                                          ),
                                                                          'orderType':
                                                                              serializeParam(
                                                                            'trail packk order apple pay',
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      logFirebaseEvent(
                                                                          'ApplePayContainer_update_page_state');
                                                                      _model.isPaymentDone =
                                                                          true;
                                                                      _model.isLoaderIndicator =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'ApplePayContainer_update_app_state');
                                                                      FFAppState()
                                                                          .selectedDeliveryDate = '';
                                                                      FFAppState()
                                                                          .selectedDeliveryTimeSlot = '';
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'ApplePayContainer_custom_action');
                                                                      await actions
                                                                          .facebookEventClass(
                                                                        'User id - ${FFAppState().userID}',
                                                                        '0',
                                                                        'trail order',
                                                                        0.0,
                                                                        0,
                                                                        functions.updateTotalAmount(
                                                                            FFAppState().isDeliveryPartnerTipSelected,
                                                                            '0',
                                                                            getJsonField(
                                                                              trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                              r'''$.data.total_price''',
                                                                            ).toString(),
                                                                            '0',
                                                                            'no',
                                                                            _model.trialCartPaymentRadioButtonValue,
                                                                            getJsonField(
                                                                              FFAppState().appInfo,
                                                                              r'''$.codcharges''',
                                                                            ).toString(),
                                                                            '',
                                                                            '')!,
                                                                        'checkout',
                                                                        FFAppState()
                                                                            .emptyJson,
                                                                        'trail pack order apple pay',
                                                                        ' ',
                                                                        ' ',
                                                                        ' ',
                                                                        ' ',
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'ApplePayContainer_alert_dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text(FFAppState().AppName),
                                                                            content:
                                                                                Text(getJsonField(
                                                                              (_model.apiResultTrialPackPayment1?.jsonBody ?? ''),
                                                                              r'''$.message''',
                                                                            ).toString()),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'ApplePayContainer_wait__delay');
                                                                      await Future
                                                                          .delayed(
                                                                        Duration(
                                                                          milliseconds:
                                                                              200,
                                                                        ),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'ApplePayContainer_update_page_state');
                                                                      _model.isPaymentDone =
                                                                          true;
                                                                      _model.isLoaderIndicator =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'ApplePayContainer_alert_dialog');
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text(FFAppState().AppName),
                                                                          content:
                                                                              Text('Please add delivery address'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'ApplePayContainer_wait__delay');
                                                                    await Future
                                                                        .delayed(
                                                                      Duration(
                                                                        milliseconds:
                                                                            200,
                                                                      ),
                                                                    );
                                                                    logFirebaseEvent(
                                                                        'ApplePayContainer_update_page_state');
                                                                    _model.isPaymentDone =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'ApplePayContainer_alert_dialog');
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            FFAppState().AppName),
                                                                        content:
                                                                            Text('Please select delivery time slot'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'ApplePayContainer_wait__delay');
                                                                  await Future
                                                                      .delayed(
                                                                    Duration(
                                                                      milliseconds:
                                                                          200,
                                                                    ),
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'ApplePayContainer_update_page_state');
                                                                  _model.isPaymentDone =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'ApplePayContainer_alert_dialog');
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          FFAppState()
                                                                              .AppName),
                                                                      content: Text(
                                                                          'Please select delivery date'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                logFirebaseEvent(
                                                                    'ApplePayContainer_wait__delay');
                                                                await Future
                                                                    .delayed(
                                                                  Duration(
                                                                    milliseconds:
                                                                        200,
                                                                  ),
                                                                );
                                                                logFirebaseEvent(
                                                                    'ApplePayContainer_update_page_state');
                                                                _model.isPaymentDone =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'ApplePayContainer_show_snack_bar');
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
                                                              logFirebaseEvent(
                                                                  'ApplePayContainer_wait__delay');
                                                              await Future
                                                                  .delayed(
                                                                Duration(
                                                                  milliseconds:
                                                                      200,
                                                                ),
                                                              );
                                                              logFirebaseEvent(
                                                                  'ApplePayContainer_update_page_state');
                                                              _model.isPaymentDone =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.45,
                                                          height: 35.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.apple,
                                                                color: FFAppConstants
                                                                    .whiteColor,
                                                                size: 30.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Apple Pay',
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
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            12.0,
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ].divide(SizedBox(width: 3.0)),
                                              ),
                                            ),
                                          ),
                                          if (_model
                                                  .trialCartPaymentRadioButtonValue ==
                                              'COD')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.add_card,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'An additional charge of AED ',
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
                                                            color: Color(
                                                                0xFFDF3F56),
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
                                                  Text(
                                                    getJsonField(
                                                      FFAppState().appInfo,
                                                      r'''$.codcharges''',
                                                    ).toString(),
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
                                                              Color(0xFFDF3F56),
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
                                                    ' is applicable',
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
                                                              Color(0xFFDF3F56),
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
                                                ],
                                              ),
                                            ),
                                          if (_model
                                                  .trialCartPaymentRadioButtonValue ==
                                              'Pay Now')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 5.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (_model
                                                              .selectedPaymentMethod ==
                                                          'Pay Now')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
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
                                                                    .spaceBetween,
                                                            children: [
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
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .kcreditCardsPayment,
                                                                      color: FFAppConstants
                                                                          .darkGreen,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (functions.checkPayCardAvailable(
                                                                              FFAppState().isCardChange,
                                                                              getJsonField(
                                                                                trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                r'''$.data.lastcarddetails''',
                                                                              )) ==
                                                                          true) {
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                    child: RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: 'Pay with card ',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.montserrat(
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  color: FFAppConstants.blackColor0A0A0A,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 0.0, 0.0),
                                                                                    child: RichText(
                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                      text: TextSpan(
                                                                                        children: [
                                                                                          TextSpan(
                                                                                            text: FFAppState().isCardChange == true
                                                                                                ? FFAppState().selectedCardNumber
                                                                                                : (getJsonField(
                                                                                                          QuickartGroup.showtrailpackCall.lastCardDetails(
                                                                                                            trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                                          ),
                                                                                                          r'''$.card_no''',
                                                                                                        ) !=
                                                                                                        null
                                                                                                    ? getJsonField(
                                                                                                        QuickartGroup.showtrailpackCall.lastCardDetails(
                                                                                                          trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                                        ),
                                                                                                        r'''$.card_no''',
                                                                                                      ).toString()
                                                                                                    : ' '),
                                                                                            style: GoogleFonts.montserrat(
                                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.montserrat(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      } else {
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
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
                                                                              logFirebaseEvent('TRIAL_PRODUCT_CART_SCREEN_Text_gjk9p9bp_');
                                                                              logFirebaseEvent('Text_navigate_to');

                                                                              context.pushNamed(CardScreenWidget.routeName);

                                                                              logFirebaseEvent('Text_update_app_state');
                                                                              FFAppState().categoryName = 'cart';
                                                                              FFAppState().selectedCardID = '';
                                                                              FFAppState().isSiNoSelected = false;
                                                                              FFAppState().cardScreenNavigation = 'trialCart';
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Text_google_analytics_event');
                                                                              logFirebaseEvent('AddressListButtonClickedAnalytics');
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Add Card',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.montserrat(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FFAppConstants.blackColor0A0A0A,
                                                                                    fontSize: 11.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
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
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (functions
                                                                .checkPayCardAvailable(
                                                                    FFAppState()
                                                                        .isCardChange,
                                                                    getJsonField(
                                                                      trialProductCartScreenShowtrailpackResponse
                                                                          .jsonBody,
                                                                      r'''$.data.lastcarddetails''',
                                                                    )) ==
                                                            true) {
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
                                                                  'TRIAL_PRODUCT_CART_SCREEN_Text_tp9kqq1k_');
                                                              logFirebaseEvent(
                                                                  'Text_update_app_state');
                                                              FFAppState()
                                                                      .selectedCardID =
                                                                  'CARDID';
                                                              FFAppState()
                                                                      .categoryName =
                                                                  'cart';
                                                              FFAppState()
                                                                      .cardBoolean =
                                                                  false;
                                                              FFAppState()
                                                                      .isSiNoSelected =
                                                                  false;
                                                              FFAppState()
                                                                      .cardScreenNavigation =
                                                                  'trialCart';
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'Text_navigate_to');

                                                              context.pushNamed(
                                                                  CardScreenWidget
                                                                      .routeName);
                                                            },
                                                            child: Text(
                                                              'Change',
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
                                                                        .green86DF67,
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
                                                                  'TRIAL_PRODUCT_CART_SCREEN_Text_hyu0wl3j_');
                                                              logFirebaseEvent(
                                                                  'Text_navigate_to');

                                                              context.pushNamed(
                                                                  CardScreenWidget
                                                                      .routeName);

                                                              logFirebaseEvent(
                                                                  'Text_update_app_state');
                                                              FFAppState()
                                                                      .categoryName =
                                                                  'cart';
                                                              FFAppState()
                                                                  .selectedCardID = '';
                                                              FFAppState()
                                                                      .cardScreenNavigation =
                                                                  'dailyCart';
                                                              FFAppState()
                                                                      .isSiNoSelected =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'Text_google_analytics_event');
                                                              logFirebaseEvent(
                                                                  'AddressListButtonClickedAnalytics');
                                                            },
                                                            child: Text(
                                                              '',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FFAppConstants
                                                                        .green86DF67,
                                                                    fontSize:
                                                                        9.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  if (FFAppState().nullValue ==
                                                      'fhgfhgf')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.45,
                                                        height: 35.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FFAppConstants
                                                              .blackColor0A0A0A,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Visibility(
                                                          visible: (_model
                                                                      .selectedPaymentMethod ==
                                                                  'Pay Now') &&
                                                              (isiOS == false),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.apple,
                                                                color: FFAppConstants
                                                                    .whiteColor,
                                                                size: 30.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'TRIAL_PRODUCT_CART_SCREEN_APPLE_PAY_BTN_');
                                                                  },
                                                                  text:
                                                                      'Apple Pay',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        25.0,
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
                                                                    iconColor:
                                                                        FFAppConstants
                                                                            .blackColor0A0A0A,
                                                                    color: FFAppConstants
                                                                        .blackColor0A0A0A,
                                                                    textStyle: FlutterFlowTheme.of(
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
                                                                              FFAppConstants.whiteColor,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
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
                                                          'TRIAL_PRODUCT_CART_SCREEN_Container_7bwd');
                                                      if (_model
                                                              .isPaymentDone ==
                                                          true) {
                                                        logFirebaseEvent(
                                                            'Container_wait__delay');
                                                        await Future.delayed(
                                                          Duration(
                                                            milliseconds: 200,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Container_update_page_state');
                                                        _model.isPaymentDone =
                                                            false;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Container_update_app_state');
                                                        FFAppState()
                                                                .paymentMethod =
                                                            _model.trialCartPaymentRadioButtonValue ==
                                                                    'COD'
                                                                ? 'COD'
                                                                : 'card';
                                                        FFAppState()
                                                            .selectedAddresID = FFAppState()
                                                                        .selectedAddress1 ==
                                                                    null ||
                                                                FFAppState()
                                                                        .selectedAddress1 ==
                                                                    ''
                                                            ? (QuickartGroup
                                                                        .showtrailpackCall
                                                                        .lastAddress(
                                                                          trialProductCartScreenShowtrailpackResponse
                                                                              .jsonBody,
                                                                        )!
                                                                        .length >
                                                                    0
                                                                ? (_model
                                                                            .checkAddressExits !=
                                                                        getJsonField(
                                                                          trialProductCartScreenShowtrailpackResponse
                                                                              .jsonBody,
                                                                          r'''$.data.lastadd[0].cityExists''',
                                                                        )
                                                                    ? getJsonField(
                                                                        trialProductCartScreenShowtrailpackResponse
                                                                            .jsonBody,
                                                                        r'''$.data.lastadd[0].address_id''',
                                                                      )
                                                                        .toString()
                                                                    : 'null')
                                                                : FFAppState()
                                                                    .selectedAddresID)
                                                            : FFAppState()
                                                                .selectedAddresID;
                                                        FFAppState()
                                                                .selectedDeliveryDate =
                                                            FFAppState().selectedDeliveryDate !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedDeliveryDate !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .selectedDeliveryDate
                                                                : getJsonField(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                    r'''$.data.timeslotsdata[0].date''',
                                                                  ).toString();
                                                        FFAppState()
                                                                .selectedDeliveryTimeSlot =
                                                            FFAppState().selectedDeliveryTimeSlot !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedDeliveryTimeSlot !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .selectedDeliveryTimeSlot
                                                                : getJsonField(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                    r'''$.data.timeslotsdata[0].timeslots[0].time_slots''',
                                                                  ).toString();
                                                        FFAppState()
                                                                .selectedCardID =
                                                            FFAppState().isCardChange ==
                                                                    true
                                                                ? FFAppState()
                                                                    .selectedCardID
                                                                : getJsonField(
                                                                    trialProductCartScreenShowtrailpackResponse
                                                                        .jsonBody,
                                                                    r'''$.data.lastcarddetails.si_sub_ref_no''',
                                                                  ).toString();
                                                        FFAppState()
                                                            .selectedAddress1 = QuickartGroup
                                                                    .showtrailpackCall
                                                                    .lastAddress(
                                                                      trialProductCartScreenShowtrailpackResponse
                                                                          .jsonBody,
                                                                    )!
                                                                    .length >
                                                                0
                                                            ? getJsonField(
                                                                trialProductCartScreenShowtrailpackResponse
                                                                    .jsonBody,
                                                                r'''$.data.lastadd[0].house_no''',
                                                              ).toString()
                                                            : FFAppState()
                                                                .selectedAddress1;
                                                        logFirebaseEvent(
                                                            'Container_custom_action');
                                                        _model.connectivityResult3 =
                                                            await actions
                                                                .checkInternetConnection();
                                                        if (_model
                                                                .connectivityResult3 ==
                                                            true) {
                                                          if (FFAppState()
                                                                      .selectedDeliveryDate !=
                                                                  null &&
                                                              FFAppState()
                                                                      .selectedDeliveryDate !=
                                                                  '') {
                                                            if (FFAppState()
                                                                        .selectedDeliveryTimeSlot !=
                                                                    null &&
                                                                FFAppState()
                                                                        .selectedDeliveryTimeSlot !=
                                                                    '') {
                                                              if (FFAppState()
                                                                          .selectedAddresID !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .selectedAddresID !=
                                                                      '') {
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.isPaymentDone =
                                                                    false;
                                                                _model.isLoaderIndicator =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'Container_backend_call');
                                                                _model.apiResultTrialPackPayment =
                                                                    await QuickartGroup
                                                                        .trailpaymentCall
                                                                        .call(
                                                                  userid:
                                                                      FFAppState()
                                                                          .userID,
                                                                  addressid:
                                                                      FFAppState()
                                                                          .selectedAddresID,
                                                                  storeid:
                                                                      FFAppState()
                                                                          .storeID,
                                                                  paymentMethod:
                                                                      'Card',
                                                                  deliveryDate:
                                                                      FFAppState()
                                                                          .selectedDeliveryDate,
                                                                  timeSlot:
                                                                      FFAppState()
                                                                          .selectedDeliveryTimeSlot,
                                                                  delPartnerTip:
                                                                      FFAppState()
                                                                          .isDeliveryPartnerTipSelected,
                                                                  delPartnerInstruction: functions.combineInstructions(
                                                                      FFAppState()
                                                                          .deliveryPartnerInstructionAvoid,
                                                                      FFAppState()
                                                                          .deliveryPartnerInstructionBell,
                                                                      FFAppState()
                                                                          .deliveryPartnerInstructionDoor),
                                                                  deviceid:
                                                                      FFAppState()
                                                                          .deviceID,
                                                                  orderInstruction:
                                                                      (String
                                                                          var1) {
                                                                    return var1
                                                                            .trim() ??
                                                                        '';
                                                                  }(_model.textController
                                                                          .text),
                                                                  platform: isiOS
                                                                      ? 'ios'
                                                                      : 'android',
                                                                );

                                                                if ((_model
                                                                        .apiResultTrialPackPayment
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  logFirebaseEvent(
                                                                      'Container_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    PaymentScreenWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'redirectURl':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          (_model.apiResultTrialPackPayment?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.redirect_url''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'screenPName':
                                                                          serializeParam(
                                                                        'daily',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'mrp':
                                                                          serializeParam(
                                                                        functions.updateTotalAmount(
                                                                            FFAppState().isDeliveryPartnerTipSelected,
                                                                            '0',
                                                                            getJsonField(
                                                                              QuickartGroup.showtrailpackCall.mainData(
                                                                                trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                              ),
                                                                              r'''$.discount_total_price''',
                                                                            ).toString(),
                                                                            '0',
                                                                            FFAppState().isCardSelected,
                                                                            _model.trialCartPaymentRadioButtonValue,
                                                                            getJsonField(
                                                                              FFAppState().appInfo,
                                                                              r'''$.codcharges''',
                                                                            ).toString(),
                                                                            '',
                                                                            ''),
                                                                        ParamType
                                                                            .double,
                                                                      ),
                                                                      'orderType':
                                                                          serializeParam(
                                                                        'trail pack order card',
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );

                                                                  logFirebaseEvent(
                                                                      'Container_update_app_state');
                                                                  FFAppState()
                                                                      .selectedDeliveryDate = '';
                                                                  FFAppState()
                                                                      .selectedDeliveryTimeSlot = '';
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.isPaymentDone =
                                                                      true;
                                                                  _model.isLoaderIndicator =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Container_custom_action');
                                                                  await actions
                                                                      .facebookEventClass(
                                                                    'User id - ${FFAppState().userID}',
                                                                    '0',
                                                                    'trail order',
                                                                    0.0,
                                                                    0,
                                                                    functions.updateTotalAmount(
                                                                        FFAppState().isDeliveryPartnerTipSelected,
                                                                        '0',
                                                                        getJsonField(
                                                                          trialProductCartScreenShowtrailpackResponse
                                                                              .jsonBody,
                                                                          r'''$.data.total_price''',
                                                                        ).toString(),
                                                                        '0',
                                                                        'no',
                                                                        _model.trialCartPaymentRadioButtonValue,
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .appInfo,
                                                                          r'''$.codcharges''',
                                                                        ).toString(),
                                                                        '',
                                                                        '')!,
                                                                    'checkout',
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
                                                                      'Container_alert_dialog');
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            FFAppState().AppName),
                                                                        content:
                                                                            Text(getJsonField(
                                                                          (_model.apiResultTrialPackPayment?.jsonBody ??
                                                                              ''),
                                                                          r'''$.message''',
                                                                        ).toString()),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'Container_wait__delay');
                                                                  await Future
                                                                      .delayed(
                                                                    Duration(
                                                                      milliseconds:
                                                                          500,
                                                                    ),
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.isPaymentDone =
                                                                      true;
                                                                  _model.isLoaderIndicator =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Container_alert_dialog');
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          FFAppState()
                                                                              .AppName),
                                                                      content: Text(
                                                                          'Please add delivery address'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                logFirebaseEvent(
                                                                    'Container_wait__delay');
                                                                await Future
                                                                    .delayed(
                                                                  Duration(
                                                                    milliseconds:
                                                                        200,
                                                                  ),
                                                                );
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.isPaymentDone =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Container_alert_dialog');
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        FFAppState()
                                                                            .AppName),
                                                                    content: Text(
                                                                        'Please select delivery time slot'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              logFirebaseEvent(
                                                                  'Container_wait__delay');
                                                              await Future
                                                                  .delayed(
                                                                Duration(
                                                                  milliseconds:
                                                                      200,
                                                                ),
                                                              );
                                                              logFirebaseEvent(
                                                                  'Container_update_page_state');
                                                              _model.isPaymentDone =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_alert_dialog');
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      FFAppState()
                                                                          .AppName),
                                                                  content: Text(
                                                                      'Please select delivery date'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            logFirebaseEvent(
                                                                'Container_wait__delay');
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    200,
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.isPaymentDone =
                                                                true;
                                                            safeSetState(() {});
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
                                                          logFirebaseEvent(
                                                              'Container_wait__delay');
                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds: 200,
                                                            ),
                                                          );
                                                          logFirebaseEvent(
                                                              'Container_update_page_state');
                                                          _model.isPaymentDone =
                                                              true;
                                                          safeSetState(() {});
                                                        }
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.45,
                                                      height: 35.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF3F3F7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFDADADA),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Icon(
                                                              FFIcons
                                                                  .kclipPathGroup,
                                                              color:
                                                                  FFAppConstants
                                                                      .darkGreen,
                                                              size: 26.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        9.0,
                                                                        3.0,
                                                                        0.0,
                                                                        3.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Quick Pay',
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
                                                                            .blackColor0A0A0A,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '(Without saving card)',
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
                                                                        color: FFAppConstants
                                                                            .blackColor0A0A0A,
                                                                        fontSize:
                                                                            7.0,
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
                                          if (_model.selectedPaymentMethod ==
                                              'Pay Now1')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 5.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    1.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.add_card,
                                                          color: FFAppConstants
                                                              .darkGreen,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          if (functions.checkPayCardAvailable(
                                                                  FFAppState()
                                                                      .isCardChange,
                                                                  FFAppState()
                                                                      .appInfo) ==
                                                              true) {
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          17.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                          text:
                                                                              'Pay with card ',
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
                                                                        )
                                                                      ],
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          17.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                          text: FFAppState().isCardChange == true
                                                                              ? FFAppState().selectedCardNumber
                                                                              : (FFAppState().nullValue != null && FFAppState().nullValue != '' ? FFAppState().catID : ' '),
                                                                          style:
                                                                              GoogleFonts.montserrat(
                                                                            color:
                                                                                FFAppConstants.blackColor0A0A0A,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                13.0,
                                                                          ),
                                                                        )
                                                                      ],
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
                                                              ],
                                                            );
                                                          } else {
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            18.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Add Card',
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
                                                                            .blackColor0A0A0A,
                                                                        fontSize:
                                                                            13.0,
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
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (functions.checkPayCardAvailable(
                                                              FFAppState()
                                                                  .isCardChange,
                                                              FFAppState()
                                                                  .appInfo) ==
                                                          true) {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'TRIAL_PRODUCT_CART_SCREEN_Text_fc82j35e_');
                                                            logFirebaseEvent(
                                                                'Text_update_app_state');
                                                            FFAppState()
                                                                .selectedCardID = FFAppState()
                                                                            .selectedCardID !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedCardID !=
                                                                        ''
                                                                ? FFAppState()
                                                                    .selectedCardID
                                                                : FFAppState()
                                                                    .selectedCardID;
                                                            FFAppState()
                                                                    .categoryName =
                                                                'cart';
                                                            FFAppState()
                                                                    .cardBoolean =
                                                                false;
                                                            FFAppState()
                                                                    .cardScreenNavigation =
                                                                'dailyCart';
                                                            FFAppState()
                                                                    .isSiNoSelected =
                                                                false;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Text_navigate_to');

                                                            context.pushNamed(
                                                                CardScreenWidget
                                                                    .routeName);
                                                          },
                                                          child: Text(
                                                            'Change',
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
                                                                      .green86DF67,
                                                                  fontSize:
                                                                      13.0,
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
                                                        );
                                                      } else {
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'TRIAL_PRODUCT_CART_SCREEN_Text_6wdds3un_');
                                                            logFirebaseEvent(
                                                                'Text_navigate_to');

                                                            context.pushNamed(
                                                                CardScreenWidget
                                                                    .routeName);

                                                            logFirebaseEvent(
                                                                'Text_update_app_state');
                                                            FFAppState()
                                                                    .categoryName =
                                                                'cart';
                                                            FFAppState()
                                                                .selectedCardID = '';
                                                            FFAppState()
                                                                    .cardScreenNavigation =
                                                                'dailyCart';
                                                            FFAppState()
                                                                    .isSiNoSelected =
                                                                false;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Text_google_analytics_event');
                                                            logFirebaseEvent(
                                                                'AddressListButtonClickedAnalytics');
                                                          },
                                                          child: Text(
                                                            'Add',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FFAppConstants
                                                                      .green86DF67,
                                                                  fontSize:
                                                                      13.0,
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
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            FFIcons.khome,
                                                            color:
                                                                FFAppConstants
                                                                    .darkGreen,
                                                            size: 18.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              if ((((getJsonField(
                                                                            trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                            r'''$.data.lastadd''',
                                                                          ).toList().map<ProductCountStruct?>(ProductCountStruct.maybeFromMap).toList() as Iterable<
                                                                                  ProductCountStruct?>)
                                                                              .withoutNulls
                                                                              .length >
                                                                          0) &&
                                                                      (_model
                                                                              .checkAddressExits !=
                                                                          getJsonField(
                                                                            trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                            r'''$.data.lastadd[0].cityExists''',
                                                                          ))) ||
                                                                  (FFAppState()
                                                                              .selectedAddress1 !=
                                                                          null &&
                                                                      FFAppState()
                                                                              .selectedAddress1 !=
                                                                          '')) {
                                                                return InkWell(
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
                                                                        'TRIAL_PRODUCT_CART_SCREEN_Column_obgxobv');
                                                                    logFirebaseEvent(
                                                                        'Column_navigate_to');

                                                                    context.pushNamed(
                                                                        AddressListScreenWidget
                                                                            .routeName);

                                                                    logFirebaseEvent(
                                                                        'Column_update_app_state');
                                                                    FFAppState()
                                                                        .selectedAddresID = FFAppState().selectedAddress1 ==
                                                                                null ||
                                                                            FFAppState().selectedAddress1 ==
                                                                                ''
                                                                        ? (QuickartGroup.showtrailpackCall
                                                                                    .lastAddress(
                                                                                      trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                    )!
                                                                                    .length >
                                                                                0
                                                                            ? (_model.checkAddressExits !=
                                                                                    getJsonField(
                                                                                      trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                      r'''$.data.lastadd[0].cityExists''',
                                                                                    )
                                                                                ? getJsonField(
                                                                                    trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                    r'''$.data.lastadd[0].address_id''',
                                                                                  ).toString()
                                                                                : FFAppState().selectedAddresID)
                                                                            : FFAppState().selectedAddresID)
                                                                        : FFAppState().selectedAddresID;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Column_google_analytics_event');
                                                                    logFirebaseEvent(
                                                                        'AddressListButtonClickedAnalytics');
                                                                  },
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: 'Delivering to ',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.montserrat(
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
                                                                                  TextSpan(
                                                                                    text: FFAppState().selectedAddresID != null && FFAppState().selectedAddresID != ''
                                                                                        ? FFAppState().selectedAddressType
                                                                                        : getJsonField(
                                                                                            trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                            r'''$.data.lastadd[0].type''',
                                                                                          ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.montserrat(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FFAppConstants.blackColor0A0A0A,
                                                                                          fontSize: 11.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.arrow_drop_down,
                                                                                color: FFAppConstants.blackColor0A0A0A,
                                                                                size: 12.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.3,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          FFAppState().selectedAddress1 != null && FFAppState().selectedAddress1 != ''
                                                                              ? FFAppState().selectedAddress1
                                                                              : getJsonField(
                                                                                  trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                  r'''$.data.lastadd[0].house_no''',
                                                                                ).toString().maybeHandleOverflow(
                                                                                    maxChars: 20,
                                                                                    replacement: '…',
                                                                                  ),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.montserrat(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FFAppConstants.lightBlack7a7a7a,
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              } else {
                                                                return InkWell(
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
                                                                        'TRIAL_PRODUCT_CART_SCREEN_Text_s9s4ep2l_');
                                                                    logFirebaseEvent(
                                                                        'Text_navigate_to');

                                                                    context.pushNamed(
                                                                        AddressListScreenWidget
                                                                            .routeName);

                                                                    logFirebaseEvent(
                                                                        'Text_update_app_state');
                                                                    FFAppState()
                                                                            .isAddressChange =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Text(
                                                                    'Add Address',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FFAppConstants.blackColor0A0A0A,
                                                                          fontSize:
                                                                              11.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
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
                                                            'TRIAL_PRODUCT_CART_SCREEN_Container_w34m');
                                                        if (_model
                                                                .isPaymentDone ==
                                                            true) {
                                                          logFirebaseEvent(
                                                              'Container_wait__delay');
                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds: 200,
                                                            ),
                                                          );
                                                          logFirebaseEvent(
                                                              'Container_update_page_state');
                                                          _model.isPaymentDone =
                                                              false;
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'Container_update_app_state');
                                                          FFAppState()
                                                                  .paymentMethod =
                                                              _model.trialCartPaymentRadioButtonValue ==
                                                                      'COD'
                                                                  ? 'COD'
                                                                  : 'card';
                                                          FFAppState()
                                                              .selectedAddresID = FFAppState()
                                                                          .selectedAddress1 ==
                                                                      null ||
                                                                  FFAppState()
                                                                          .selectedAddress1 ==
                                                                      ''
                                                              ? (QuickartGroup
                                                                          .showtrailpackCall
                                                                          .lastAddress(
                                                                            trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                          )!
                                                                          .length >
                                                                      0
                                                                  ? (_model
                                                                              .checkAddressExits !=
                                                                          getJsonField(
                                                                            trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                            r'''$.data.lastadd[0].cityExists''',
                                                                          )
                                                                      ? getJsonField(
                                                                          trialProductCartScreenShowtrailpackResponse
                                                                              .jsonBody,
                                                                          r'''$.data.lastadd[0].address_id''',
                                                                        )
                                                                          .toString()
                                                                      : 'null')
                                                                  : FFAppState()
                                                                      .selectedAddresID)
                                                              : FFAppState()
                                                                  .selectedAddresID;
                                                          FFAppState()
                                                              .selectedDeliveryDate = FFAppState()
                                                                          .selectedDeliveryDate !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .selectedDeliveryDate !=
                                                                      ''
                                                              ? FFAppState()
                                                                  .selectedDeliveryDate
                                                              : getJsonField(
                                                                  trialProductCartScreenShowtrailpackResponse
                                                                      .jsonBody,
                                                                  r'''$.data.timeslotsdata[0].date''',
                                                                ).toString();
                                                          FFAppState()
                                                              .selectedDeliveryTimeSlot = FFAppState()
                                                                          .selectedDeliveryTimeSlot !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .selectedDeliveryTimeSlot !=
                                                                      ''
                                                              ? FFAppState()
                                                                  .selectedDeliveryTimeSlot
                                                              : getJsonField(
                                                                  trialProductCartScreenShowtrailpackResponse
                                                                      .jsonBody,
                                                                  r'''$.data.timeslotsdata[0].timeslots[0].time_slots''',
                                                                ).toString();
                                                          FFAppState()
                                                              .selectedCardID = FFAppState()
                                                                      .isCardChange ==
                                                                  true
                                                              ? FFAppState()
                                                                  .selectedCardID
                                                              : getJsonField(
                                                                  trialProductCartScreenShowtrailpackResponse
                                                                      .jsonBody,
                                                                  r'''$.data.lastcarddetails.si_sub_ref_no''',
                                                                ).toString();
                                                          FFAppState()
                                                              .selectedAddress1 = FFAppState()
                                                                          .selectedAddress1 !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .selectedAddress1 !=
                                                                      ''
                                                              ? getJsonField(
                                                                  trialProductCartScreenShowtrailpackResponse
                                                                      .jsonBody,
                                                                  r'''$.data.lastadd[0].house_no''',
                                                                ).toString()
                                                              : FFAppState()
                                                                  .selectedAddress1;
                                                          logFirebaseEvent(
                                                              'Container_custom_action');
                                                          _model.connectivityResult2 =
                                                              await actions
                                                                  .checkInternetConnection();
                                                          if (_model
                                                                  .connectivityResult2 ==
                                                              true) {
                                                            if (FFAppState()
                                                                        .selectedDeliveryDate !=
                                                                    null &&
                                                                FFAppState()
                                                                        .selectedDeliveryDate !=
                                                                    '') {
                                                              if (FFAppState()
                                                                          .selectedDeliveryTimeSlot !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .selectedDeliveryTimeSlot !=
                                                                      '') {
                                                                if (FFAppState()
                                                                            .selectedAddresID !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .selectedAddresID !=
                                                                        '') {
                                                                  if (_model
                                                                          .trialCartPaymentRadioButtonValue ==
                                                                      'COD') {
                                                                    logFirebaseEvent(
                                                                        'Container_update_page_state');
                                                                    _model.isPaymentDone =
                                                                        false;
                                                                    _model.isLoaderIndicator =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Container_backend_call');
                                                                    _model.apiResultTrialpack =
                                                                        await QuickartGroup
                                                                            .checkouttrailpackCall
                                                                            .call(
                                                                      userid: FFAppState()
                                                                          .userID,
                                                                      addressid:
                                                                          FFAppState()
                                                                              .selectedAddresID,
                                                                      storeid:
                                                                          FFAppState()
                                                                              .storeID,
                                                                      paymentMethod:
                                                                          FFAppState()
                                                                              .paymentMethod,
                                                                      deliveryDate:
                                                                          FFAppState()
                                                                              .selectedDeliveryDate,
                                                                      timeSlot:
                                                                          FFAppState()
                                                                              .selectedDeliveryTimeSlot,
                                                                      deviceid:
                                                                          FFAppState()
                                                                              .deviceID,
                                                                      deliverypartnerTip:
                                                                          FFAppState()
                                                                              .isDeliveryPartnerTipSelected,
                                                                      deliveryInstruction: functions.combineInstructions(
                                                                          FFAppState()
                                                                              .deliveryPartnerInstructionAvoid,
                                                                          FFAppState()
                                                                              .deliveryPartnerInstructionBell,
                                                                          FFAppState()
                                                                              .deliveryPartnerInstructionDoor),
                                                                      orderInstruction: (String
                                                                          var1) {
                                                                        return var1.trim() ??
                                                                            '';
                                                                      }(_model
                                                                          .textController
                                                                          .text),
                                                                      platform: isiOS
                                                                          ? 'ios'
                                                                          : 'android',
                                                                    );

                                                                    if ((_model
                                                                            .apiResultTrialpack
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'Container_navigate_to');

                                                                      context.pushNamed(
                                                                          OrderSuccessFailScreenWidget
                                                                              .routeName);

                                                                      logFirebaseEvent(
                                                                          'Container_update_app_state');
                                                                      FFAppState()
                                                                              .screenName =
                                                                          'daily';
                                                                      FFAppState()
                                                                          .deliveryPartnerInstructionAvoid = '';
                                                                      FFAppState()
                                                                          .cartTotal = '';
                                                                      FFAppState()
                                                                          .cartTotalCount = 0;
                                                                      FFAppState()
                                                                              .cartTotalPrice =
                                                                          0.0;
                                                                      FFAppState()
                                                                              .cartSavingPrice =
                                                                          0.0;
                                                                      FFAppState()
                                                                              .isCouponApplied =
                                                                          false;
                                                                      FFAppState()
                                                                              .userWallet =
                                                                          0.0;
                                                                      FFAppState()
                                                                              .couponDiscount =
                                                                          0.0;
                                                                      FFAppState()
                                                                              .countryCode =
                                                                          '971';
                                                                      FFAppState()
                                                                          .selectedAddress1 = '';
                                                                      FFAppState()
                                                                          .deleteSelectedAddresID();
                                                                      FFAppState()
                                                                          .selectedAddresID = '';

                                                                      FFAppState()
                                                                          .selectedCardID = '';
                                                                      FFAppState()
                                                                          .selectedDeliveryDate = '';
                                                                      FFAppState()
                                                                          .selectedDeliveryTimeSlot = '';
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.isPaymentDone =
                                                                          true;
                                                                      _model.isLoaderIndicator =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Container_custom_action');
                                                                      await actions
                                                                          .facebookEventClass(
                                                                        'User id - ${FFAppState().userID}',
                                                                        '0',
                                                                        'trail order',
                                                                        0.0,
                                                                        0,
                                                                        functions.updateTotalAmount(
                                                                            FFAppState().isDeliveryPartnerTipSelected,
                                                                            '0',
                                                                            getJsonField(
                                                                              trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                              r'''$.data.total_price''',
                                                                            ).toString(),
                                                                            '0',
                                                                            'no',
                                                                            _model.trialCartPaymentRadioButtonValue,
                                                                            getJsonField(
                                                                              FFAppState().appInfo,
                                                                              r'''$.codcharges''',
                                                                            ).toString(),
                                                                            '',
                                                                            '')!,
                                                                        'purchase',
                                                                        FFAppState()
                                                                            .emptyJson,
                                                                        'Trail pack COD order',
                                                                        ' ',
                                                                        ' ',
                                                                        ' ',
                                                                        ' ',
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Container_alert_dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text(FFAppState().AppName),
                                                                            content:
                                                                                Text(getJsonField(
                                                                              (_model.apiResultTrialpack?.jsonBody ?? ''),
                                                                              r'''$.message''',
                                                                            ).toString()),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.isPaymentDone =
                                                                          true;
                                                                      _model.isLoaderIndicator =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  } else {
                                                                    if ((FFAppState().selectedCardID !=
                                                                                null &&
                                                                            FFAppState().selectedCardID !=
                                                                                '') &&
                                                                        (FFAppState().selectedCardID !=
                                                                            'null')) {
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.isPaymentDone =
                                                                          false;
                                                                      _model.isLoaderIndicator =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');
                                                                      _model.apiResultTrialpack1 = await QuickartGroup
                                                                          .checkouttrailpackCall
                                                                          .call(
                                                                        userid:
                                                                            FFAppState().userID,
                                                                        addressid:
                                                                            FFAppState().selectedAddresID,
                                                                        storeid:
                                                                            FFAppState().storeID,
                                                                        paymentMethod:
                                                                            FFAppState().paymentMethod,
                                                                        deliveryDate:
                                                                            FFAppState().selectedDeliveryDate,
                                                                        timeSlot:
                                                                            FFAppState().selectedDeliveryTimeSlot,
                                                                        deviceid:
                                                                            FFAppState().deviceID,
                                                                        deliverypartnerTip:
                                                                            FFAppState().isDeliveryPartnerTipSelected,
                                                                        deliveryInstruction: functions.combineInstructions(
                                                                            FFAppState().deliveryPartnerInstructionAvoid,
                                                                            FFAppState().deliveryPartnerInstructionBell,
                                                                            FFAppState().deliveryPartnerInstructionDoor),
                                                                        orderInstruction: (String
                                                                            var1) {
                                                                          return var1.trim() ??
                                                                              '';
                                                                        }(_model
                                                                            .textController
                                                                            .text),
                                                                        sino: FFAppState()
                                                                            .selectedCardID,
                                                                        platform: isiOS
                                                                            ? 'ios'
                                                                            : 'android',
                                                                      );

                                                                      if ((_model
                                                                              .apiResultTrialpack1
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        logFirebaseEvent(
                                                                            'Container_navigate_to');

                                                                        context.pushNamed(
                                                                            OrderSuccessFailScreenWidget.routeName);

                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState().screenName =
                                                                            'daily';
                                                                        FFAppState().deliveryPartnerInstructionAvoid =
                                                                            '';
                                                                        FFAppState().cartTotal =
                                                                            '';
                                                                        FFAppState()
                                                                            .cartTotalCount = 0;
                                                                        FFAppState().cartTotalPrice =
                                                                            0.0;
                                                                        FFAppState().cartSavingPrice =
                                                                            0.0;
                                                                        FFAppState().isCouponApplied =
                                                                            false;
                                                                        FFAppState().userWallet =
                                                                            0.0;
                                                                        FFAppState().couponDiscount =
                                                                            0.0;
                                                                        FFAppState().countryCode =
                                                                            '971';
                                                                        FFAppState().selectedAddress1 =
                                                                            '';
                                                                        FFAppState()
                                                                            .deleteSelectedAddresID();
                                                                        FFAppState().selectedAddresID =
                                                                            '';

                                                                        FFAppState().selectedCardID =
                                                                            '';
                                                                        FFAppState().selectedDeliveryDate =
                                                                            '';
                                                                        FFAppState().selectedDeliveryTimeSlot =
                                                                            '';
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_update_page_state');
                                                                        _model.isPaymentDone =
                                                                            true;
                                                                        _model.isLoaderIndicator =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_custom_action');
                                                                        await actions
                                                                            .facebookEventClass(
                                                                          'User id - ${FFAppState().userID}',
                                                                          '0',
                                                                          'trail order',
                                                                          0.0,
                                                                          0,
                                                                          functions.updateTotalAmount(
                                                                              FFAppState().isDeliveryPartnerTipSelected,
                                                                              '0',
                                                                              getJsonField(
                                                                                trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                r'''$.data.total_price''',
                                                                              ).toString(),
                                                                              '0',
                                                                              'no',
                                                                              _model.trialCartPaymentRadioButtonValue,
                                                                              getJsonField(
                                                                                FFAppState().appInfo,
                                                                                r'''$.codcharges''',
                                                                              ).toString(),
                                                                              '',
                                                                              '')!,
                                                                          'purchase',
                                                                          FFAppState()
                                                                              .emptyJson,
                                                                          'Trail pack card order',
                                                                          ' ',
                                                                          ' ',
                                                                          ' ',
                                                                          ' ',
                                                                        );
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Container_alert_dialog');
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text(FFAppState().AppName),
                                                                              content: Text(getJsonField(
                                                                                (_model.apiResultTrialpack1?.jsonBody ?? ''),
                                                                                r'''$.message''',
                                                                              ).toString()),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Container_update_page_state');
                                                                        _model.isPaymentDone =
                                                                            true;
                                                                        _model.isLoaderIndicator =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Container_alert_dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text(FFAppState().AppName),
                                                                            content:
                                                                                Text('Please select a bank card to place your order.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Container_wait__delay');
                                                                      await Future
                                                                          .delayed(
                                                                        Duration(
                                                                          milliseconds:
                                                                              200,
                                                                        ),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.isPaymentDone =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Container_alert_dialog');
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            FFAppState().AppName),
                                                                        content:
                                                                            Text('Please add delivery address'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'Container_wait__delay');
                                                                  await Future
                                                                      .delayed(
                                                                    Duration(
                                                                      milliseconds:
                                                                          200,
                                                                    ),
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.isPaymentDone =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Container_alert_dialog');
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          FFAppState()
                                                                              .AppName),
                                                                      content: Text(
                                                                          'Please select delivery time slot'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                logFirebaseEvent(
                                                                    'Container_wait__delay');
                                                                await Future
                                                                    .delayed(
                                                                  Duration(
                                                                    milliseconds:
                                                                        200,
                                                                  ),
                                                                );
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.isPaymentDone =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Container_alert_dialog');
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        FFAppState()
                                                                            .AppName),
                                                                    content: Text(
                                                                        'Please select delivery date'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              logFirebaseEvent(
                                                                  'Container_wait__delay');
                                                              await Future
                                                                  .delayed(
                                                                Duration(
                                                                  milliseconds:
                                                                      200,
                                                                ),
                                                              );
                                                              logFirebaseEvent(
                                                                  'Container_update_page_state');
                                                              _model.isPaymentDone =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_show_snack_bar');
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
                                                            logFirebaseEvent(
                                                                'Container_wait__delay');
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    200,
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.isPaymentDone =
                                                                true;
                                                            safeSetState(() {});
                                                          }
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.55,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF228B46),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFF228B46),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
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
                                                                RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            'AED ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.readexPro(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FFAppConstants.whiteColor,
                                                                              fontSize: 11.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: functions
                                                                            .updateTotalAmount(
                                                                                FFAppState().isDeliveryPartnerTipSelected,
                                                                                '0',
                                                                                getJsonField(
                                                                                  QuickartGroup.showtrailpackCall.mainData(
                                                                                    trialProductCartScreenShowtrailpackResponse.jsonBody,
                                                                                  ),
                                                                                  r'''$.discount_total_price''',
                                                                                ).toString(),
                                                                                '0',
                                                                                FFAppState().isCardSelected,
                                                                                _model.trialCartPaymentRadioButtonValue,
                                                                                getJsonField(
                                                                                  FFAppState().appInfo,
                                                                                  r'''$.codcharges''',
                                                                                ).toString(),
                                                                                '',
                                                                                '')
                                                                            .toString(),
                                                                        style: GoogleFonts
                                                                            .montserrat(
                                                                          color:
                                                                              FFAppConstants.whiteColor,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              11.0,
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
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                Text(
                                                                  'TOTAL',
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
                                                                        color: FFAppConstants
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            10.0,
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
                                                              ],
                                                            ),
                                                            Text(
                                                              'Place Order',
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
                                                                        .whiteColor,
                                                                    fontSize:
                                                                        15.0,
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
                                                          ],
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
                            ],
                          ),
                        );
                      } else {
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.emptyDataTwoLineComponentModel,
                            updateCallback: () => safeSetState(() {}),
                            child: EmptyDataTwoLineComponentWidget(
                              title: FFAppState().productMsg,
                              msg: FFAppConstants.cartEmptyString,
                              isShop: 1,
                            ),
                          ),
                        );
                      }
                    },
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
                  if (_model.doorImage == true)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'TRIAL_PRODUCT_CART_SCREEN_doorimageConta');
                        logFirebaseEvent(
                            'doorimageContainer_update_page_state');
                        _model.doorImage = false;
                        safeSetState(() {});
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: Color(0x5114181B),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TRIAL_PRODUCT_CART_SCREEN_Image_p79588q7');
                              logFirebaseEvent('Image_update_page_state');
                              _model.doorImage = false;
                              safeSetState(() {});
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                FFAppState().selectedDoorImage != null
                                    ? FFAppState().selectedDoorImage.toString()
                                    : getJsonField(
                                        QuickartGroup.showtrailpackCall
                                            .lastAddress(
                                              trialProductCartScreenShowtrailpackResponse
                                                  .jsonBody,
                                            )!
                                            .firstOrNull,
                                        r'''$.doorimage''',
                                      ).toString(),
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height: MediaQuery.sizeOf(context).height * 0.5,
                                fit: BoxFit.contain,
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
        );
      },
    );
  }
}
