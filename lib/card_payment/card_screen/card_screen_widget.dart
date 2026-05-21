import '/backend/api_requests/api_calls.dart';
import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_screen_model.dart';
export 'card_screen_model.dart';

class CardScreenWidget extends StatefulWidget {
  const CardScreenWidget({super.key});

  static String routeName = 'cardScreen';
  static String routePath = '/cardScreen';

  @override
  State<CardScreenWidget> createState() => _CardScreenWidgetState();
}

class _CardScreenWidgetState extends State<CardScreenWidget> {
  late CardScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardScreenModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'cardScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CARD_SCREEN_cardScreen_ON_INIT_STATE');
      logFirebaseEvent('cardScreen_refresh_database_request');
      safeSetState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted(minWait: 1000, maxWait: 4000);
      logFirebaseEvent('cardScreen_update_app_state');

      safeSetState(() {});
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
              logFirebaseEvent('CARD_SCREEN_PAGE_chevron_left_ICN_ON_TAP');
              if (FFAppState().cardScreenNavigation == null ||
                  FFAppState().cardScreenNavigation == '') {
                logFirebaseEvent('IconButton_navigate_to');

                context.pushNamed(ProfilePageWidget.routeName);

                logFirebaseEvent('IconButton_update_app_state');
                FFAppState().isCardChange = false;
                safeSetState(() {});
              } else {
                if (FFAppState().cardScreenNavigation == 'dailyCart') {
                  logFirebaseEvent('IconButton_navigate_to');

                  context.goNamed(DailyCartScreenWidget.routeName);

                  logFirebaseEvent('IconButton_update_app_state');
                  FFAppState().cardScreenNavigation = '';
                  safeSetState(() {});
                } else {
                  if (FFAppState().cardScreenNavigation == 'subscriptionCart') {
                    logFirebaseEvent('IconButton_navigate_to');

                    context.goNamed(CartSubscriptionScreenWidget.routeName);

                    logFirebaseEvent('IconButton_update_app_state');
                    FFAppState().isCardChange = false;
                    FFAppState().cardScreenNavigation = '';
                    safeSetState(() {});
                  } else {
                    if (FFAppState().cardScreenNavigation == 'ProfileScreen') {
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(ProfilePageWidget.routeName);

                      logFirebaseEvent('IconButton_update_app_state');
                      FFAppState().isCardChange = false;
                      FFAppState().cardScreenNavigation = '';
                      safeSetState(() {});
                    } else {
                      if (FFAppState().cardScreenNavigation == 'subscription') {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed(AllOrdersTABLISTWidget.routeName);

                        logFirebaseEvent('IconButton_update_app_state');
                        FFAppState().isCardChange = false;
                        safeSetState(() {});
                      } else {
                        if (FFAppState().cardScreenNavigation == 'trialCart') {
                          logFirebaseEvent('IconButton_navigate_to');

                          context.pushNamed(
                              TrialProductCartScreenWidget.routeName);

                          logFirebaseEvent('IconButton_update_app_state');
                          FFAppState().isCardChange = false;
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent('IconButton_navigate_back');
                          context.safePop();
                          logFirebaseEvent('IconButton_update_app_state');
                          FFAppState().isCardChange = false;
                          safeSetState(() {});
                        }
                      }
                    }
                  }
                }
              }
            },
          ),
          title: Text(
            'Card Details',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
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
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 9.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FFAppConstants.indigoColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'CARD_SCREEN_PAGE_ADD_NEW_CARD_BTN_ON_TAP');
                        logFirebaseEvent('Button_custom_action');
                        _model.checkInternet =
                            await actions.checkInternetConnection();
                        if (_model.checkInternet == true) {
                          logFirebaseEvent('Button_backend_call');
                          _model.apiResultb7b =
                              await QuickartGroup.savecardCall.call(
                            userid: FFAppState().userID,
                          );

                          if ((_model.apiResultb7b?.succeeded ?? true)) {
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              PaymentScreenWidget.routeName,
                              queryParameters: {
                                'redirectURl': serializeParam(
                                  QuickartGroup.savecardCall.refirectURL(
                                    (_model.apiResultb7b?.jsonBody ?? ''),
                                  ),
                                  ParamType.String,
                                ),
                                'screenPName': serializeParam(
                                  'addCard',
                                  ParamType.String,
                                ),
                                'mrp': serializeParam(
                                  0.0,
                                  ParamType.double,
                                ),
                                'orderType': serializeParam(
                                  'add card',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );

                            logFirebaseEvent('Button_update_app_state');

                            FFAppState().update(() {});
                            logFirebaseEvent('Button_google_analytics_event');
                            logFirebaseEvent(
                              'Save Card',
                              parameters: {
                                'Screen Name': 'Card Screen',
                                'Navigating To': 'Payment Screen',
                              },
                            );
                          } else {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  getJsonField(
                                    (_model.apiResultb7b?.jsonBody ?? ''),
                                    r'''$.message''',
                                  ).toString(),
                                  style: GoogleFonts.montserrat(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                ),
                                duration: Duration(milliseconds: 1200),
                                backgroundColor:
                                    FFAppConstants.NeutralBlack50Color,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 1200),
                              backgroundColor:
                                  FFAppConstants.NeutralBlack50Color,
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'Add New Card',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FFAppConstants.indigoColor,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FFAppConstants.whiteColor,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.75,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??=
                            Completer<ApiCallResponse>()
                              ..complete(QuickartGroup.userbankdetailsCall.call(
                                userid: FFAppState().userID,
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
                            height: MediaQuery.sizeOf(context).height * 0.25,
                          ),
                        );
                      }
                      final listViewUserbankdetailsResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final cardModel = getJsonField(
                            listViewUserbankdetailsResponse.jsonBody,
                            r'''$.data''',
                          ).toList();
                          if (cardModel.isEmpty) {
                            return Image.asset(
                              'assets/images/No_data_available.png',
                            );
                          }

                          return RefreshIndicator(
                            onRefresh: () async {
                              logFirebaseEvent(
                                  'CARD_SCREEN_ListView_vkun7dj5_ON_PULL_TO');
                              logFirebaseEvent(
                                  'ListView_refresh_database_request');
                              safeSetState(
                                  () => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted(
                                  minWait: 50, maxWait: 5000);
                            },
                            child: ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                20.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: cardModel.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, cardModelIndex) {
                                final cardModelItem = cardModel[cardModelIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CARD_SCREEN_Container_145pi9v5_ON_TAP');
                                      if (FFAppState().isSiNoSelected == true) {
                                        logFirebaseEvent(
                                            'Container_backend_call');
                                        _model.apiResultnc8 =
                                            await QuickartGroup
                                                .ordercardchangesCall
                                                .call(
                                          userid: FFAppState().userID,
                                          deviceid: FFAppState().deviceID,
                                          siNo: getJsonField(
                                            cardModelItem,
                                            r'''$.si_sub_ref_no''',
                                          ).toString(),
                                          cartid: FFAppState().cartID,
                                        );

                                        if ((_model.apiResultnc8?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'Container_refresh_database_request');
                                          safeSetState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted(
                                                  maxWait: 5000);
                                          logFirebaseEvent(
                                              'Container_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.apiResultnc8
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                                style: GoogleFonts.montserrat(
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              backgroundColor: FFAppConstants
                                                  .primaryPurpleE4D8F5,
                                            ),
                                          );
                                          logFirebaseEvent(
                                              'Container_update_app_state');
                                          FFAppState().isSiNoSelected = false;
                                          logFirebaseEvent(
                                              'Container_wait__delay');
                                          await Future.delayed(
                                            Duration(
                                              milliseconds: 500,
                                            ),
                                          );
                                          logFirebaseEvent(
                                              'Container_update_app_state');
                                          FFAppState().cardScreenNavigation =
                                              'subscriptionCart';
                                          FFAppState().update(() {});
                                          logFirebaseEvent(
                                              'Container_custom_action');
                                          await actions.navigateToAlltabs(
                                            context,
                                            () async {
                                              logFirebaseEvent('_navigate_to');

                                              context.goNamed(
                                                  AllOrdersTABLISTWidget
                                                      .routeName);
                                            },
                                          );
                                          logFirebaseEvent(
                                              'Container_google_analytics_event');
                                          logFirebaseEvent(
                                            'Change Card',
                                            parameters: {
                                              'API Name': 'order_card_changes',
                                            },
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'Container_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.apiResultnc8
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                                style: GoogleFonts.montserrat(
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              duration:
                                                  Duration(milliseconds: 1500),
                                              backgroundColor: FFAppConstants
                                                  .primaryPurpleE4D8F5,
                                            ),
                                          );
                                        }
                                      } else {
                                        if (FFAppState().cardScreenNavigation !=
                                            'profile') {
                                          logFirebaseEvent(
                                              'Container_update_app_state');
                                          FFAppState().selectedCardID =
                                              getJsonField(
                                            cardModelItem,
                                            r'''$.si_sub_ref_no''',
                                          ).toString();
                                          FFAppState().isCardChange = true;
                                          FFAppState().selectedCardNumber =
                                              getJsonField(
                                            cardModelItem,
                                            r'''$.card_no''',
                                          ).toString();
                                          FFAppState().paymentMethod = 'Card';
                                          FFAppState().selectedSINumber =
                                              getJsonField(
                                            cardModelItem,
                                            r'''$.si_sub_ref_no''',
                                          ).toString();
                                          FFAppState().cardnodemo =
                                              getJsonField(
                                            cardModelItem,
                                            r'''$.si_sub_ref_no''',
                                          ).toString();
                                          FFAppState().update(() {});
                                          if (FFAppState()
                                                      .cardScreenNavigation ==
                                                  null ||
                                              FFAppState()
                                                      .cardScreenNavigation ==
                                                  '') {
                                            logFirebaseEvent(
                                                'Container_update_app_state');
                                            FFAppState().isCardChange = false;
                                            safeSetState(() {});
                                          } else {
                                            if (FFAppState()
                                                    .cardScreenNavigation ==
                                                'dailyCart') {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                  DailyCartScreenWidget
                                                      .routeName);

                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState()
                                                  .cardScreenNavigation = '';
                                              safeSetState(() {});
                                            } else {
                                              if (FFAppState()
                                                      .cardScreenNavigation ==
                                                  'subscriptionCart') {
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                    CartSubscriptionScreenWidget
                                                        .routeName);

                                                logFirebaseEvent(
                                                    'Container_update_app_state');
                                                FFAppState().isCardChange =
                                                    true;
                                                FFAppState()
                                                    .cardScreenNavigation = '';
                                                safeSetState(() {});
                                              } else {
                                                if (FFAppState()
                                                        .cardScreenNavigation ==
                                                    'trialCart') {
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                      TrialProductCartScreenWidget
                                                          .routeName);

                                                  logFirebaseEvent(
                                                      'Container_update_app_state');
                                                  FFAppState().isCardChange =
                                                      true;
                                                  FFAppState()
                                                      .cardScreenNavigation = '';
                                                  safeSetState(() {});
                                                } else {
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                      ProfilePageWidget
                                                          .routeName);
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: FFAppState().selectedCardID ==
                                                getJsonField(
                                                  cardModelItem,
                                                  r'''$.si_sub_ref_no''',
                                                ).toString()
                                            ? FFAppConstants.primaryPurpleE4D8F5
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0xFFE0E0E0),
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width: 66.0,
                                                      height: 36.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFE0E0E0),
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons.credit_card,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          cardModelItem,
                                                          r'''$.card_no''',
                                                        ).toString(),
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
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (FFAppState()
                                                            .categoryName ==
                                                        'cart')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE0E0E0),
                                                            ),
                                                          ),
                                                          child: Builder(
                                                            builder: (context) {
                                                              if (FFAppState()
                                                                      .selectedCardID ==
                                                                  getJsonField(
                                                                    cardModelItem,
                                                                    r'''$.si_sub_ref_no''',
                                                                  ).toString()) {
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FFAppConstants
                                                                          .indigoColor,
                                                                      shape: BoxShape
                                                                          .circle,
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
                                                    if (FFAppState()
                                                            .categoryName !=
                                                        'cart')
                                                      Builder(
                                                        builder: (context) =>
                                                            Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      5.0,
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
                                                                  'CARD_SCREEN_PAGE_Text_g4sempnf_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Text_custom_action');
                                                              _model.connectivityResultCopy1 =
                                                                  await actions
                                                                      .checkInternetConnection();
                                                              logFirebaseEvent(
                                                                  'Text_alert_dialog');
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            content:
                                                                                Text('Are you sure you want to remove the card?'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: Text('Cancel'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: Text('Confirm'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ) ??
                                                                      false;
                                                              if (confirmDialogResponse) {
                                                                if (_model
                                                                        .connectivityResultCopy1 ==
                                                                    true) {
                                                                  logFirebaseEvent(
                                                                      'Text_backend_call');
                                                                  _model.apiResulttj7 =
                                                                      await QuickartGroup
                                                                          .deleteCardCall
                                                                          .call(
                                                                    userId: FFAppState()
                                                                        .userID,
                                                                    bankId:
                                                                        getJsonField(
                                                                      cardModelItem,
                                                                      r'''$.id''',
                                                                    ).toString(),
                                                                    platform: isiOS
                                                                        ? 'ios'
                                                                        : 'android',
                                                                  );

                                                                  if ((_model
                                                                          .apiResulttj7
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    if (FFAppConstants
                                                                            .zeroValue ==
                                                                        getJsonField(
                                                                          (_model.apiResulttj7?.jsonBody ??
                                                                              ''),
                                                                          r'''$.status''',
                                                                        )) {
                                                                      logFirebaseEvent(
                                                                          'Text_alert_dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: CustomAlertDailogWidget(
                                                                                des: getJsonField(
                                                                                  (_model.apiResulttj7?.jsonBody ?? ''),
                                                                                  r'''$.message''',
                                                                                ).toString(),
                                                                                height: 150.0,
                                                                                title: "",
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
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
                                                                              (_model.apiResulttj7?.jsonBody ?? ''),
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
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FFAppConstants.primaryPurpleE4D8F5,
                                                                        ),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Text_update_app_state');
                                                                      FFAppState()
                                                                          .selectedCardID = '';
                                                                      FFAppState()
                                                                          .selectedCardNumber = '';
                                                                      FFAppState()
                                                                              .isCardChange =
                                                                          false;
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      logFirebaseEvent(
                                                                          'Text_refresh_database_request');
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter =
                                                                              null);
                                                                      await _model.waitForApiRequestCompleted(
                                                                          maxWait:
                                                                              2000);
                                                                      logFirebaseEvent(
                                                                          'Text_google_analytics_event');
                                                                      logFirebaseEvent(
                                                                        'Delete Card',
                                                                        parameters: {
                                                                          'Screen Name':
                                                                              'Card Screen',
                                                                          'API Name':
                                                                              'Delete Card',
                                                                        },
                                                                      );
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Text_alert_dialog');
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                CustomAlertDailogWidget(
                                                                              des: getJsonField(
                                                                                (_model.apiResulttj7?.jsonBody ?? ''),
                                                                                r'''$.message''',
                                                                              ).toString(),
                                                                              height: 150.0,
                                                                              title:"",
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
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
                                                                        style: GoogleFonts
                                                                            .montserrat(
                                                                          color:
                                                                              FFAppConstants.indigoColor,
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

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Text(
                                                              'Remove Card',
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
                                                                        .redDF3F56,
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
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
