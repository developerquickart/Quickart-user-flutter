
import '/backend/api_requests/api_calls.dart';
import '/components/bottomnav_bar/bottomnav_bar_widget.dart';
import '/components/empty_data_two_line_component_copy/empty_data_two_line_component_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  static String routeName = 'profilePage';
  static String routePath = '/profilePage';

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'profilePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_profilePage_ON_INIT_STATE');
      logFirebaseEvent('profilePage_backend_call');
      _model.apiShowProfile = await QuickartGroup.profileDetailsCall.call(
        userId: FFAppState().userID,
        platform: isiOS ? 'ios' : 'android',
      );

      if ((_model.apiShowProfile?.succeeded ?? true)) {
        logFirebaseEvent('profilePage_update_app_state');
        FFAppState().userName = (FFAppState().usserType == 'guest') &&
                (FFAppConstants.zeroValue ==
                    getJsonField(
                      (_model.apiShowProfile?.jsonBody ?? ''),
                      r'''$.data.is_verified''',
                    ))
            ? 'Guest'
            : getJsonField(
                (_model.apiShowProfile?.jsonBody ?? ''),
                r'''$.data.name''',
              ).toString();
        FFAppState().userPhoneNo = getJsonField(
          (_model.apiShowProfile?.jsonBody ?? ''),
          r'''$.data.user_phone''',
        ).toString();
        FFAppState().profileImageBytes = getJsonField(
          (_model.apiShowProfile?.jsonBody ?? ''),
          r'''$.data.user_image''',
        ).toString();
        FFAppState().profileImage = getJsonField(
          (_model.apiShowProfile?.jsonBody ?? ''),
          r'''$.data.user_image''',
        ).toString();
        FFAppState().profileInfo = getJsonField(
          (_model.apiShowProfile?.jsonBody ?? ''),
          r'''$.data''',
        );
        FFAppState().userEmail = getJsonField(
          FFAppState().profileInfo,
          r'''$.email''',
        ).toString();
        FFAppState().userCountryCode = getJsonField(
          FFAppState().profileInfo,
          r'''$.country_code''',
        ).toString();
        FFAppState().update(() {});
        logFirebaseEvent('profilePage_custom_action');
        _model.deviceUUID = await actions.getDeviceID();
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
      future: QuickartGroup.userOrderListCall.call(
        userId: FFAppState().userID,
        storeId: FFAppState().storeID,
        deviceId: FFAppState().deviceID,
        platform: isiOS ? 'ios' : 'android',
      ),
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
        final profilePageUserOrderListResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              backgroundColor: FFAppConstants.whiteColor,
              appBar: AppBar(
                backgroundColor: FFAppConstants.appBarColor,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile ',
                      style: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .override(
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
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent('PROFILE_cartbtnContainer_ON_TAP');
                          if (FFAppState().cartTotalCount < 1) {
                            if (FFAppState().subCartTotalItem < 1) {
                              logFirebaseEvent('cartbtnContainer_navigate_to');

                              context
                                  .pushNamed(DailyCartScreenWidget.routeName);

                              logFirebaseEvent(
                                  'cartbtnContainer_custom_action');
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
                            } else {
                              logFirebaseEvent('cartbtnContainer_navigate_to');

                              context.pushNamed(
                                  CartSubscriptionScreenWidget.routeName);

                              logFirebaseEvent(
                                  'cartbtnContainer_custom_action');
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
                            }

                            logFirebaseEvent(
                                'cartbtnContainer_update_app_state');
                            FFAppState().isCartShow = false;
                            FFAppState().screenName = 'subscriptionCart';
                            safeSetState(() {});
                          } else {
                            logFirebaseEvent('cartbtnContainer_navigate_to');

                            context.pushNamed(DailyCartScreenWidget.routeName);

                            logFirebaseEvent(
                                'cartbtnContainer_update_app_state');
                            FFAppState().isCartShow = false;
                            FFAppState().screenName = 'dailyCart';
                            safeSetState(() {});
                            logFirebaseEvent('cartbtnContainer_custom_action');
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
                          }
                        },
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FFAppConstants.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.shopping_cart_sharp,
                                      color: FFAppConstants.blackColor0A0A0A,
                                      size: 25.0,
                                    ),
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
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: FFAppConstants
                                              .primaryPurpleE4D8F5,
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
                                                        .subCartTotalItem)!
                                                .toString(),
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
                                                  fontSize: 12.0,
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
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.88,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 90.0,
                              decoration: BoxDecoration(
                                color: FFAppConstants.whiteColor,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if ((FFAppState().usserType !=
                                                          'guest') ||
                                                      (FFAppState().userName !=
                                                          'Guest')) {
                                                    return Container(
                                                      width: 72.0,
                                                      height: 72.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        getJsonField(
                                                          (_model.apiShowProfile
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.user_image''',
                                                        ).toString(),
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: 72.0,
                                                      height: 72.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/PngItem_1300400.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Text(
                                                        (String var1) {
                                                          return var1[0]
                                                                  .toUpperCase() +
                                                              var1.substring(1);
                                                        }(functions.trimString((FFAppState()
                                                                            .usserType ==
                                                                        'guest') &&
                                                                    (FFAppConstants
                                                                            .zeroValue ==
                                                                        getJsonField(
                                                                          (_model.apiShowProfile?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.is_verified''',
                                                                        ))
                                                                ? 'Guest'
                                                                : FFAppState()
                                                                    .userName)!)
                                                            .maybeHandleOverflow(
                                                          maxChars: 20,
                                                          replacement: '…',
                                                        ),
                                                        maxLines: 2,
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
                                                              fontSize: 17.0,
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
                                                    ),
                                                    if ((FFAppState()
                                                                .usserType !=
                                                            'guest') ||
                                                        (FFAppState()
                                                                .userName !=
                                                            'Guest'))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        2.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                (_model.apiShowProfile
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.data.country_code''',
                                                              )
                                                                  .toString()
                                                                  .maybeHandleOverflow(
                                                                    maxChars:
                                                                        15,
                                                                    replacement:
                                                                        '…',
                                                                  ),
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
                                                                    fontSize:
                                                                        13.0,
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        2.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                (_model.apiShowProfile
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.data.user_phone''',
                                                              )
                                                                  .toString()
                                                                  .maybeHandleOverflow(
                                                                    maxChars:
                                                                        15,
                                                                    replacement:
                                                                        '…',
                                                                  ),
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
                                                                    fontSize:
                                                                        13.0,
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
                                                    if ((FFAppState()
                                                                .usserType !=
                                                            'guest') ||
                                                        (FFAppState()
                                                                .userName !=
                                                            'Guest'))
                                                      Text(
                                                        getJsonField(
                                                          (_model.apiShowProfile
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.email''',
                                                        ).toString(),
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
                                                              fontSize: 13.0,
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
                                                  ],
                                                ),
                                              ),
                                              if ((FFAppState().usserType ==
                                                      'sfdfd') &&
                                                  (FFAppState().userName !=
                                                      'Guest'))
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                15.0, 0.0),
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
                                                            'PROFILE_PAGE_PAGE_Icon_jtgij48p_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_navigate_to');

                                                        context.pushNamed(
                                                            EditProfileWidget
                                                                .routeName);

                                                        logFirebaseEvent(
                                                            'Icon_google_analytics_event');
                                                        logFirebaseEvent(
                                                          'Navigation',
                                                          parameters: {
                                                            'Screen Name':
                                                                'Profile',
                                                            'Navigate To':
                                                                'Edit Profile',
                                                          },
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .mode_edit_outlined,
                                                        color: FFAppConstants
                                                            .blackColor0A0A0A,
                                                        size: 24.0,
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 20.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FFAppConstants.primaryPurpleE4D8F5,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height - 300,
                                600.0,
                              ),
                              decoration: BoxDecoration(
                                color: FFAppConstants.primaryPurpleE4D8F5,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FFAppConstants.whiteColor,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PROFILE_PAGE_PAGE_Row_lraeirq2_ON_TAP');
                                            logFirebaseEvent('Row_navigate_to');

                                            context.pushNamed(
                                                AddressListScreenWidget
                                                    .routeName);

                                            logFirebaseEvent(
                                                'Row_google_analytics_event');
                                            logFirebaseEvent(
                                              'Navigation',
                                              parameters: {
                                                'Screen Name': 'Profile',
                                                'Navigate To':
                                                    'Address List Screen',
                                              },
                                            );
                                          },
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFILE_PAGE_PAGE_MY_ORDERS_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_update_app_state');
                                                    FFAppState()
                                                        .RatingScreenName = '';
                                                    FFAppState()
                                                        .cardScreenNavigation = '';
                                                    FFAppState().update(() {});
                                                    logFirebaseEvent(
                                                        'Button_update_app_state');
                                                    FFAppState().screenName =
                                                        'd';
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                        AllOrdersTABLISTWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'Button_google_analytics_event');
                                                    logFirebaseEvent(
                                                      'Navigation',
                                                      parameters: {
                                                        'Screen Name':
                                                            'Profile',
                                                        'Navigate To':
                                                            'Daily Orders Screen',
                                                      },
                                                    );
                                                  },
                                                  text: 'My Orders',
                                                  icon: Icon(
                                                    Icons.shopping_cart,
                                                    size: 22.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 150.0,
                                                    height: 35.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FFAppConstants
                                                        .whiteColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: FFAppConstants
                                                          .indigoColor,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                    hoverColor: FFAppConstants
                                                        .primaryPurpleE4D8F5,
                                                    hoverBorderSide: BorderSide(
                                                      color: FFAppConstants
                                                          .indigoColor,
                                                      width: 1.0,
                                                    ),
                                                    hoverTextColor:
                                                        FFAppConstants
                                                            .indigoColor,
                                                    hoverElevation: 0.0,
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFILE_PAGE_PAGE_MY_ADDRESS_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                        AddressListScreenWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'Button_update_app_state');
                                                    FFAppState().screenName =
                                                        'profile';
                                                    safeSetState(() {});
                                                  },
                                                  text: 'My Address',
                                                  icon: Icon(
                                                    Icons.location_pin,
                                                    size: 22.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 150.0,
                                                    height: 35.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: FFAppConstants
                                                          .indigoColor,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                ),
                                                if (FFAppState().usserType !=
                                                    'guest')
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'PROFILE_PAGE_PAGE_MY_ACCOUNT_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                          EditProfileWidget
                                                              .routeName);

                                                      logFirebaseEvent(
                                                          'Button_google_analytics_event');
                                                      logFirebaseEvent(
                                                        'Navigation',
                                                        parameters: {
                                                          'Screen Name':
                                                              'Profile',
                                                          'Navigate To':
                                                              'Edit Profile',
                                                        },
                                                      );
                                                    },
                                                    text: 'My Account',
                                                    icon: Icon(
                                                      Icons.person_rounded,
                                                      size: 22.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 150.0,
                                                      height: 35.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FFAppConstants
                                                          .whiteColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppConstants
                                                                    .indigoColor,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                  ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFILE_PAGE_PAGE_MY_OFFERS_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_update_app_state');
                                                    FFAppState().couponsScreen =
                                                        'profile';
                                                    FFAppState().update(() {});
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                        CouponsandOffersWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'Button_google_analytics_event');
                                                    logFirebaseEvent(
                                                      'Navigation',
                                                      parameters: {
                                                        'Screen Name':
                                                            'Profile',
                                                        'Navigate To':
                                                            'Favourites Screen',
                                                      },
                                                    );
                                                  },
                                                  text: 'My Offers',
                                                  icon: Icon(
                                                    FFIcons.kdiscount3704830,
                                                    size: 22.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 150.0,
                                                    height: 35.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: FFAppConstants
                                                          .indigoColor,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                ),
                                              ]
                                                  .divide(SizedBox(width: 10.0))
                                                  .addToEnd(
                                                      SizedBox(width: 5.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.shopping_bag_outlined,
                                                color: FFAppConstants
                                                    .blackColor0A0A0A,
                                                size: 24.0,
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Your Orders',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 170.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 130.0,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final orderList = getJsonField(
                                                  profilePageUserOrderListResponse
                                                      .jsonBody,
                                                  r'''$.data''',
                                                ).toList();
                                                if (orderList.isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      child:
                                                          EmptyDataTwoLineComponentCopyWidget(
                                                        title: 'No Orders !!',
                                                        isShop: 0,
                                                      ),
                                                    ),
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    0,
                                                    5.0,
                                                    0,
                                                  ),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: orderList.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(width: 10.0),
                                                  itemBuilder: (context,
                                                      orderListIndex) {
                                                    final orderListItem =
                                                        orderList[
                                                            orderListIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  15.0,
                                                                  0.0,
                                                                  15.0),
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
                                                              'PROFILE_Container_xt67nln9_ON_TAP');
                                                          if (_model
                                                                  .orderTypeQuick ==
                                                              getJsonField(
                                                                orderListItem,
                                                                r'''$.type''',
                                                              ).toString()) {
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState()
                                                                    .groupID =
                                                                getJsonField(
                                                              orderListItem,
                                                              r'''$.group_id''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .screenName =
                                                                'profile';
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Container_navigate_to');

                                                            context.pushNamed(
                                                                OrderTrackingPageWidget
                                                                    .routeName);

                                                            logFirebaseEvent(
                                                                'Container_google_analytics_event');
                                                            logFirebaseEvent(
                                                              'Navigation',
                                                              parameters: {
                                                                'Screen Name':
                                                                    'Dashboard Screen',
                                                                'Navigate To':
                                                                    'Order Tracking Screen',
                                                              },
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'Container_update_app_state');
                                                            FFAppState()
                                                                    .cartID =
                                                                getJsonField(
                                                              orderListItem,
                                                              r'''$.group_id''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .screenName =
                                                                'profile';
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Container_navigate_to');

                                                            context.pushNamed(
                                                              SubscriptionOrderProductsWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'orderDate':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    orderListItem,
                                                                    r'''$.order_date''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'orderPrice':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    orderListItem,
                                                                    r'''$.total_mrp''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            logFirebaseEvent(
                                                                'Container_google_analytics_event');
                                                            logFirebaseEvent(
                                                              'Navigation',
                                                              parameters: {
                                                                'Screen Name':
                                                                    'Dashboard Screen',
                                                                'Navigate To':
                                                                    'Subscription Order Info Screen',
                                                              },
                                                            );
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color: FFAppConstants
                                                                  .neutralWhiteF5F5F5,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FFAppConstants
                                                                            .productBgClr,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(8.0),
                                                                            topRight:
                                                                                Radius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            getJsonField(
                                                                              orderListItem,
                                                                              r'''$.prodList[0].varient_image''',
                                                                            ).toString(),
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            errorBuilder: (context, error, stackTrace) =>
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
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        35.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          orderListItem,
                                                                          r'''$.prodList[0].product_name''',
                                                                        )
                                                                            .toString()
                                                                            .maybeHandleOverflow(
                                                                              maxChars: 27,
                                                                              replacement: '…',
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.montserrat(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FFAppConstants.indigoColor,
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child:
                                                                    Container(
                                                                  width: 60.0,
                                                                  height: 15.0,
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
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FFAppConstants
                                                                          .green44AC20,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      _model.typeDaily ==
                                                                              getJsonField(
                                                                                orderListItem,
                                                                                r'''$.type''',
                                                                              ).toString()
                                                                          ? 'Daily'
                                                                          : 'Subscription',
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
                                                              ),
                                                            ],
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
                                    ),
                                    Container(
                                      height: 30.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.credit_card_rounded,
                                                color: FFAppConstants
                                                    .blackColor0A0A0A,
                                                size: 24.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Payment Details',
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            FFAppState().usserType != 'guest'
                                                ? 92.0
                                                : 43.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (FFAppState().usserType !=
                                                'guest')
                                              Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible:
                                                      FFAppState().usserType !=
                                                          'guest',
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
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
                                                            'PROFILE_PAGE_PAGE_Row_9mp5yq9j_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Row_navigate_to');

                                                        context.pushNamed(
                                                            WalletScreenWidget
                                                                .routeName);

                                                        logFirebaseEvent(
                                                            'Row_google_analytics_event');
                                                        logFirebaseEvent(
                                                          'Navigation',
                                                          parameters: {
                                                            'Screen Name':
                                                                'Profile',
                                                            'Navigate To':
                                                                'Wallet Screen',
                                                          },
                                                        );
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'My Wallet',
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
                                                                      .blackColor666666,
                                                                  fontSize:
                                                                      13.0,
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
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 28.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: FFAppConstants
                                                                  .blackColor0A0A0A,
                                                              size: 16.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'PROFILE_arrow_forward_ios_ICN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'IconButton_navigate_to');

                                                              context.pushNamed(
                                                                  WalletScreenWidget
                                                                      .routeName);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (FFAppState().usserType !=
                                                'guest')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 5.0, 20.0, 5.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 0.3,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFE0E0E0),
                                                  ),
                                                ),
                                              ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
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
                                                          'PROFILE_PAGE_PAGE_Row_b5wvqr3u_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');

                                                      context.pushNamed(
                                                          CardScreenWidget
                                                              .routeName);

                                                      logFirebaseEvent(
                                                          'Row_update_app_state');
                                                      FFAppState()
                                                              .categoryName =
                                                          'profile';
                                                      FFAppState()
                                                          .selectedCardID = '';
                                                      FFAppState()
                                                              .cardScreenNavigation =
                                                          'profile';
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Row_google_analytics_event');
                                                      logFirebaseEvent(
                                                        'Navigation',
                                                        parameters: {
                                                          'Screen Name':
                                                              'Profile',
                                                          'Navigate To':
                                                              'Card Screen',
                                                        },
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Card Details',
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
                                                                    .blackColor666666,
                                                                fontSize: 13.0,
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
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 28.0,
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            size: 16.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'PROFILE_arrow_forward_ios_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                                CardScreenWidget
                                                                    .routeName);

                                                            logFirebaseEvent(
                                                                'IconButton_update_app_state');
                                                            FFAppState()
                                                                    .categoryName =
                                                                'profile';
                                                            FFAppState()
                                                                .selectedCardID = '';
                                                            FFAppState()
                                                                    .cardScreenNavigation =
                                                                'profile';
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ],
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
                                      height: 30.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.shopping_cart_outlined,
                                                color: FFAppConstants
                                                    .blackColor0A0A0A,
                                                size: 24.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'My Shopping',
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 142.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
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
                                                        'PROFILE_PAGE_PAGE_Row_zw74e3cf_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Row_navigate_to');

                                                    context.pushNamed(
                                                        CategoriesScreenWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'Row_google_analytics_event');
                                                    logFirebaseEvent(
                                                      'Navigation',
                                                      parameters: {
                                                        'Screen Name':
                                                            'Profile',
                                                        'Navigate To':
                                                            'Categories Screen',
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'All Categories',
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
                                                                  .blackColor666666,
                                                              fontSize: 13.0,
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
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 28.0,
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: FFAppConstants
                                                              .blackColor0A0A0A,
                                                          size: 16.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_arrow_forward_ios_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_navigate_to');

                                                          context.pushNamed(
                                                              CategoriesScreenWidget
                                                                  .routeName);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 5.0, 20.0, 5.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 0.3,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE0E0E0),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
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
                                                        'PROFILE_PAGE_PAGE_Row_4h7c4w1z_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Row_navigate_to');

                                                    context.pushNamed(
                                                        FavouritesScreenWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'Row_google_analytics_event');
                                                    logFirebaseEvent(
                                                      'Navigation',
                                                      parameters: {
                                                        'Screen Name':
                                                            'Profile',
                                                        'Navigate To':
                                                            'Favourites Screen',
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'My Wishlist',
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
                                                                  .blackColor666666,
                                                              fontSize: 13.0,
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
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 28.0,
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: FFAppConstants
                                                              .blackColor0A0A0A,
                                                          size: 16.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_arrow_forward_ios_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_navigate_to');

                                                          context.pushNamed(
                                                              FavouritesScreenWidget
                                                                  .routeName);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 5.0, 20.0, 5.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 0.3,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE0E0E0),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
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
                                                        'PROFILE_PAGE_PAGE_Row_4n3jfkgm_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Row_navigate_to');

                                                    context.pushNamed(
                                                        NotifyProductsListScreenWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'Row_google_analytics_event');
                                                    logFirebaseEvent(
                                                      'Navigation',
                                                      parameters: {
                                                        'Screen Name':
                                                            'Profile',
                                                        'Navigate To':
                                                            'NotifyMe',
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Notifyme List',
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
                                                                  .blackColor666666,
                                                              fontSize: 13.0,
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
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 28.0,
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: FFAppConstants
                                                              .blackColor0A0A0A,
                                                          size: 16.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'PROFILE_arrow_forward_ios_ICN_ON_TAP');
                                                          logFirebaseEvent(
                                                              'IconButton_navigate_to');

                                                          context.pushNamed(
                                                              NotifyProductsListScreenWidget
                                                                  .routeName);
                                                        },
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
                                    if (FFAppState().usserType != 'guest')
                                      Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(),
                                        child: Visibility(
                                          visible:
                                              FFAppState().usserType != 'guest',
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.share,
                                                    color: FFAppConstants
                                                        .blackColor0A0A0A,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Share App',
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().usserType != 'guest')
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PROFILE_PAGE_PAGE_Column_bt6ictxa_ON_TAP');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Builder(
                                                builder: (context) => Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
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
                                                          'PROFILE_PAGE_PAGE_Row_l90g3oxk_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_custom_action');
                                                      _model.refCodeN =
                                                          await actions
                                                              .generateReferralLink(
                                                        getJsonField(
                                                          FFAppState().appInfo,
                                                          r'''$.referral_code''',
                                                        ).toString(),
                                                      );
                                                      logFirebaseEvent(
                                                          'Row_wait__delay');
                                                      await Future.delayed(
                                                        Duration(
                                                          milliseconds: 1000,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Row_share');
                                                      await Share.share(
                                                        '${getJsonField(
                                                          (_model.apiShowProfile
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.data.referral_message''',
                                                        ).toString()}  ${_model.refCodeN}',
                                                        sharePositionOrigin:
                                                            getWidgetBoundingBox(
                                                                context),
                                                      );
                                                      logFirebaseEvent(
                                                          'Row_google_analytics_event');
                                                      logFirebaseEvent(
                                                        'Share',
                                                        parameters: {
                                                          'Screen Name':
                                                              'Profile',
                                                          'Share To':
                                                              'Refer a Friend',
                                                        },
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Refer with friends',
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
                                                                    .blackColor666666,
                                                                fontSize: 13.0,
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
                                                        Builder(
                                                          builder: (context) =>
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 28.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: FFAppConstants
                                                                  .blackColor0A0A0A,
                                                              size: 16.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'PROFILE_arrow_forward_ios_ICN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'IconButton_custom_action');
                                                              _model.refCodep =
                                                                  await actions
                                                                      .generateReferralLink(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .appInfo,
                                                                  r'''$.referral_code''',
                                                                ).toString(),
                                                              );
                                                              logFirebaseEvent(
                                                                  'IconButton_share');
                                                              await Share.share(
                                                                '${getJsonField(
                                                                  (_model.apiShowProfile
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.data.referral_message''',
                                                                ).toString()}  ${_model.refCodep}',
                                                                sharePositionOrigin:
                                                                    getWidgetBoundingBox(
                                                                        context),
                                                              );
                                                              logFirebaseEvent(
                                                                  'IconButton_google_analytics_event');
                                                              logFirebaseEvent(
                                                                'Share',
                                                                parameters: {
                                                                  'Screen Name':
                                                                      'Profile',
                                                                  'Share To':
                                                                      'Refer a Friend',
                                                                },
                                                              );

                                                              safeSetState(
                                                                  () {});
                                                            },
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
                                    Container(
                                      height: 30.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.phone,
                                                color: FFAppConstants
                                                    .blackColor0A0A0A,
                                                size: 24.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Get Help',
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PROFILE_PAGE_PAGE_Row_wkbz4lmu_ON_TAP');
                                                logFirebaseEvent(
                                                    'Row_navigate_to');

                                                context.pushNamed(
                                                    ContactUsScreenWidget
                                                        .routeName);

                                                logFirebaseEvent(
                                                    'Row_google_analytics_event');
                                                logFirebaseEvent(
                                                  'Navigation',
                                                  parameters: {
                                                    'Screen Name': 'Profile',
                                                    'Navigate To':
                                                        'Contact Us Screen',
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Contact Us',
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
                                                              .blackColor666666,
                                                          fontSize: 13.0,
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
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 28.0,
                                                    icon: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: FFAppConstants
                                                          .blackColor0A0A0A,
                                                      size: 16.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'PROFILE_arrow_forward_ios_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_navigate_to');

                                                      context.pushNamed(
                                                          ContactUsScreenWidget
                                                              .routeName);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.content_paste_outlined,
                                                color: FFAppConstants
                                                    .blackColor0A0A0A,
                                                size: 24.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Terms & Conditions & FAQs',
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 92.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PROFILE_PAGE_PAGE_Column_pjfssv4y_ON_TAP');
                                            logFirebaseEvent(
                                                'Column_navigate_to');

                                            context.pushNamed(
                                                TermsandConditionWidget
                                                    .routeName);
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
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
                                                          'PROFILE_PAGE_PAGE_Row_7sppofoj_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');

                                                      context.pushNamed(
                                                          TermsandConditionWidget
                                                              .routeName);

                                                      logFirebaseEvent(
                                                          'Row_google_analytics_event');
                                                      logFirebaseEvent(
                                                        'Navigation',
                                                        parameters: {
                                                          'Screen Name':
                                                              'Profile',
                                                          'Navigate To':
                                                              'Terms and Condition Screen',
                                                        },
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Terms of Use',
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
                                                                    .blackColor666666,
                                                                fontSize: 13.0,
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
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 28.0,
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            size: 16.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'PROFILE_arrow_forward_ios_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                                TermsandConditionWidget
                                                                    .routeName);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 5.0, 20.0, 5.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 0.3,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFE0E0E0),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
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
                                                          'PROFILE_PAGE_PAGE_Row_4v8pk8ye_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Row_navigate_to');

                                                      context.pushNamed(
                                                          FaqWidget.routeName);

                                                      logFirebaseEvent(
                                                          'Row_google_analytics_event');
                                                      logFirebaseEvent(
                                                        'Navigation',
                                                        parameters: {
                                                          'Screen Name':
                                                              'Profile',
                                                          'Navigate To':
                                                              'FAQ\'s Screen',
                                                        },
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'FAQs',
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
                                                                    .blackColor666666,
                                                                fontSize: 13.0,
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
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 28.0,
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            size: 16.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'PROFILE_arrow_forward_ios_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                                FaqWidget
                                                                    .routeName);
                                                          },
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
                                    Builder(
                                      builder: (context) {
                                        if (FFAppState().usserType != 'guest') {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: 30.0,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    22.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.logout,
                                                          color: FFAppConstants
                                                              .blackColor0A0A0A,
                                                          size: 24.0,
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
                                                          'Logout',
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
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
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
                                                              'PROFILE_PAGE_PAGE_logoutRow_ON_TAP');
                                                          logFirebaseEvent(
                                                              'logoutRow_alert_dialog');
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            FFAppState().AppName),
                                                                        content:
                                                                            Text(FFAppState().logoutMsg),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Logout'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            logFirebaseEvent(
                                                                'logoutRow_custom_action');
                                                            await actions
                                                                .clearSharePrefeData();
                                                            logFirebaseEvent(
                                                                'logoutRow_navigate_to');

                                                            context.goNamed(
                                                                LoginOnBoardScreenWidget
                                                                    .routeName);

                                                            logFirebaseEvent(
                                                                'logoutRow_wait__delay');
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    300,
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'logoutRow_update_app_state');
                                                            FFAppState()
                                                                    .isUserLogin =
                                                                false;
                                                            FFAppState()
                                                                .deletePhoneNo();
                                                            FFAppState()
                                                                .phoneNo = '';

                                                            FFAppState()
                                                                .deleteUserID();
                                                            FFAppState()
                                                                .userID = '';

                                                            FFAppState()
                                                                .deleteUserEmail();
                                                            FFAppState()
                                                                .userEmail = '';

                                                            FFAppState()
                                                                .deleteUserName();
                                                            FFAppState()
                                                                .userName = '';

                                                            FFAppState()
                                                                .deleteIsverified();
                                                            FFAppState()
                                                                .isverified = 1;

                                                            FFAppState()
                                                                    .countryCode =
                                                                '971';
                                                            FFAppState()
                                                                .categoryName = '';
                                                            FFAppState()
                                                                .deleteProfileImage();
                                                            FFAppState()
                                                                .profileImage = '';

                                                            FFAppState()
                                                                .deleteProfileImageBytes();
                                                            FFAppState()
                                                                    .profileImageBytes =
                                                                'https://media.istockphoto.com/id/1916685823/photo/businesswoman-using-laptop-with-banking-applications-via-internet-network.jpg?s=612x612&w=0&k=20&c=L9wQekG3TJ-6fSFlUCUelo5xOCYkm9SVE5ER5J8QiK0=';

                                                            FFAppState()
                                                                .deleteUserPhoneNo();
                                                            FFAppState()
                                                                .userPhoneNo = '';

                                                            FFAppState()
                                                                .deleteUserCountryCode();
                                                            FFAppState()
                                                                .userCountryCode = '';

                                                            FFAppState()
                                                                .deleteUserPhoneEP();
                                                            FFAppState()
                                                                .userPhoneEP = '';

                                                            FFAppState()
                                                                .deleteUserPhoneProfile();
                                                            FFAppState()
                                                                .userPhoneProfile = '';

                                                            FFAppState()
                                                                .deleteUserCountryCodeEP();
                                                            FFAppState()
                                                                .userCountryCodeEP = '';

                                                            FFAppState()
                                                                .deleteUsserType();
                                                            FFAppState()
                                                                .usserType = '';

                                                            FFAppState()
                                                                    .subCartSavingAmount =
                                                                0.0;
                                                            FFAppState()
                                                                    .subCartTotalPrice =
                                                                0.0;
                                                            FFAppState()
                                                                .subCartTotalItem = 0;
                                                            FFAppState()
                                                                .cartTotalCount = 0;
                                                            FFAppState()
                                                                    .cartTotalPrice =
                                                                0.0;
                                                            FFAppState()
                                                                .cartAmount = '';
                                                            FFAppState()
                                                                .cartTotal = '';
                                                            FFAppState()
                                                                    .userWallet =
                                                                0.0;
                                                            FFAppState()
                                                                .userWalletstr = '';
                                                            FFAppState()
                                                                    .cartSavingPrice =
                                                                0.0;
                                                            FFAppState()
                                                                .selectedCardNumber = '';
                                                            FFAppState()
                                                                .selectedCardID = '';
                                                            FFAppState()
                                                                .deleteSelectedAddresID();
                                                            FFAppState()
                                                                .selectedAddresID = '';

                                                            FFAppState()
                                                                .selectedAddress1 = '';
                                                            FFAppState()
                                                                    .selectedAddress =
                                                                'Dubai';
                                                            FFAppState()
                                                                .selectedAddressType = '';
                                                            FFAppState()
                                                                .selectedCartAddress = '';
                                                            FFAppState()
                                                                .deleteDialCode();
                                                            FFAppState()
                                                                    .dialCode =
                                                                'AE';

                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'logoutRow_google_analytics_event');
                                                            logFirebaseEvent(
                                                              'Navigation',
                                                              parameters: {
                                                                'Screen Name':
                                                                    'Profile',
                                                                'Navigate To':
                                                                    'Login Onboard Screen',
                                                              },
                                                            );
                                                          }
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Logout from Quickart',
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
                                                                        .blackColor666666,
                                                                    fontSize:
                                                                        13.0,
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
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 28.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                color: FFAppConstants
                                                                    .blackColor0A0A0A,
                                                                size: 16.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'PROFILE_arrow_forward_ios_ICN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'IconButton_alert_dialog');
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text(FFAppState().AppName),
                                                                              content: Text(FFAppState().logoutMsg),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('Cancel'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('Logout'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  logFirebaseEvent(
                                                                      'IconButton_navigate_to');

                                                                  context.pushNamed(
                                                                      LoginOnBoardScreenWidget
                                                                          .routeName);

                                                                  logFirebaseEvent(
                                                                      'IconButton_update_app_state');
                                                                  FFAppState()
                                                                          .isUserLogin =
                                                                      false;
                                                                  FFAppState()
                                                                      .deletePhoneNo();
                                                                  FFAppState()
                                                                      .phoneNo = '';

                                                                  FFAppState()
                                                                      .deleteUserID();
                                                                  FFAppState()
                                                                      .userID = '';

                                                                  FFAppState()
                                                                      .deleteUserEmail();
                                                                  FFAppState()
                                                                      .userEmail = '';

                                                                  FFAppState()
                                                                      .deleteUserName();
                                                                  FFAppState()
                                                                      .userName = '';

                                                                  FFAppState()
                                                                      .deleteIsverified();
                                                                  FFAppState()
                                                                      .isverified = 1;

                                                                  FFAppState()
                                                                          .countryCode =
                                                                      '971';
                                                                  FFAppState()
                                                                      .categoryName = '';
                                                                  FFAppState()
                                                                      .deleteProfileImage();
                                                                  FFAppState()
                                                                      .profileImage = '';

                                                                  FFAppState()
                                                                      .deleteProfileImageBytes();
                                                                  FFAppState()
                                                                          .profileImageBytes =
                                                                      'https://media.istockphoto.com/id/1916685823/photo/businesswoman-using-laptop-with-banking-applications-via-internet-network.jpg?s=612x612&w=0&k=20&c=L9wQekG3TJ-6fSFlUCUelo5xOCYkm9SVE5ER5J8QiK0=';

                                                                  FFAppState()
                                                                      .deleteUserPhoneNo();
                                                                  FFAppState()
                                                                      .userPhoneNo = '';

                                                                  FFAppState()
                                                                      .deleteUserCountryCode();
                                                                  FFAppState()
                                                                      .userCountryCode = '';

                                                                  FFAppState()
                                                                      .deleteUserPhoneEP();
                                                                  FFAppState()
                                                                      .userPhoneEP = '';

                                                                  FFAppState()
                                                                      .deleteUserPhoneProfile();
                                                                  FFAppState()
                                                                      .userPhoneProfile = '';

                                                                  FFAppState()
                                                                      .deleteUserCountryCodeEP();
                                                                  FFAppState()
                                                                      .userCountryCodeEP = '';

                                                                  FFAppState()
                                                                      .deleteUsserType();
                                                                  FFAppState()
                                                                      .usserType = '';

                                                                  FFAppState()
                                                                          .subCartSavingAmount =
                                                                      0.0;
                                                                  FFAppState()
                                                                          .subCartTotalPrice =
                                                                      0.0;
                                                                  FFAppState()
                                                                      .subCartTotalItem = 0;
                                                                  FFAppState()
                                                                      .cartTotalCount = 0;
                                                                  FFAppState()
                                                                          .cartTotalPrice =
                                                                      0.0;
                                                                  FFAppState()
                                                                      .cartAmount = '';
                                                                  FFAppState()
                                                                      .cartTotal = '';
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container(
                                            height: 30.0,
                                            decoration: BoxDecoration(),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PROFILE_PAGE_PAGE_Row_3psh7f3n_ON_TAP');
                                                logFirebaseEvent(
                                                    'Row_navigate_to');

                                                context.goNamed(
                                                    LoginOnBoardScreenWidget
                                                        .routeName);

                                                logFirebaseEvent(
                                                    'Row_wait__delay');
                                                await Future.delayed(
                                                  Duration(
                                                    milliseconds: 300,
                                                  ),
                                                );
                                                logFirebaseEvent(
                                                    'Row_update_app_state');
                                                FFAppState().isUserLogin =
                                                    false;
                                                FFAppState().deletePhoneNo();
                                                FFAppState().phoneNo = '';

                                                FFAppState().deleteUserID();
                                                FFAppState().userID = '';

                                                FFAppState().deleteUserEmail();
                                                FFAppState().userEmail = '';

                                                FFAppState().deleteUserName();
                                                FFAppState().userName = '';

                                                FFAppState().deleteIsverified();
                                                FFAppState().isverified = 1;

                                                FFAppState().countryCode =
                                                    '971';
                                                FFAppState().categoryName = '';
                                                FFAppState()
                                                    .deleteProfileImage();
                                                FFAppState().profileImage = '';

                                                FFAppState()
                                                    .deleteProfileImageBytes();
                                                FFAppState().profileImageBytes =
                                                    'https://media.istockphoto.com/id/1916685823/photo/businesswoman-using-laptop-with-banking-applications-via-internet-network.jpg?s=612x612&w=0&k=20&c=L9wQekG3TJ-6fSFlUCUelo5xOCYkm9SVE5ER5J8QiK0=';

                                                FFAppState()
                                                    .deleteUserPhoneNo();
                                                FFAppState().userPhoneNo = '';

                                                FFAppState()
                                                    .deleteUserCountryCode();
                                                FFAppState().userCountryCode =
                                                    '';

                                                FFAppState()
                                                    .deleteUserPhoneEP();
                                                FFAppState().userPhoneEP = '';

                                                FFAppState()
                                                    .deleteUserPhoneProfile();
                                                FFAppState().userPhoneProfile =
                                                    '';

                                                FFAppState()
                                                    .deleteUserCountryCodeEP();
                                                FFAppState().userCountryCodeEP =
                                                    '';

                                                FFAppState().deleteUsserType();
                                                FFAppState().usserType = '';

                                                FFAppState()
                                                    .subCartSavingAmount = 0.0;
                                                FFAppState().subCartTotalPrice =
                                                    0.0;
                                                FFAppState().subCartTotalItem =
                                                    0;
                                                FFAppState().cartTotalCount = 0;
                                                FFAppState().cartTotalPrice =
                                                    0.0;
                                                FFAppState().cartAmount = '';
                                                FFAppState().cartTotal = '';
                                                FFAppState().userWallet = 0.0;
                                                FFAppState().userWalletstr = '';
                                                FFAppState().cartSavingPrice =
                                                    0.0;
                                                FFAppState()
                                                    .selectedCardNumber = '';
                                                FFAppState().selectedCardID =
                                                    '';
                                                FFAppState()
                                                    .deleteSelectedAddresID();
                                                FFAppState().selectedAddresID =
                                                    '';

                                                FFAppState().selectedAddress1 =
                                                    '';
                                                FFAppState().selectedAddress =
                                                    'Dubai';
                                                FFAppState()
                                                    .selectedAddressType = '';
                                                FFAppState()
                                                    .selectedCartAddress = '';
                                                FFAppState().deleteDialCode();
                                                FFAppState().dialCode = 'AE';

                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Row_google_analytics_event');
                                                logFirebaseEvent(
                                                  'Navigation',
                                                  parameters: {
                                                    'Screen Name': 'Profile',
                                                    'Navigate To':
                                                        'Login Onboard Screen',
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Icon(
                                                      Icons.login,
                                                      color: FFAppConstants
                                                          .indigoColor,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Login',
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
                                                                0xFF3B2868),
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
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 10.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Follow us on',
                                                textAlign: TextAlign.start,
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
                                                          fontSize: 18.0,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
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
                                                          'PROFILE_PAGE_PAGE_Image_l2gobxnh_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_launch_u_r_l');
                                                      await launchURL(
                                                          'https://www.instagram.com/quickartuae/');
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/instagram_(1).png',
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
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
                                                          'PROFILE_PAGE_PAGE_Image_8r4s8jfc_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_launch_u_r_l');
                                                      await launchURL(
                                                          'https://www.facebook.com/share/1BQzhxXGFn/?mibextid=wwXIfr');
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/facebook_(1).png',
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
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
                                                          'PROFILE_PAGE_PAGE_Image_a79k5mj7_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_launch_u_r_l');
                                                      await launchURL(
                                                          'https://www.linkedin.com/company/quickart-general-trading-llc/');
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/linkedin_(1).png',
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
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
                                                          'PROFILE_PAGE_PAGE_Image_er6l4yp1_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Image_launch_u_r_l');
                                                      await launchURL(
                                                          'https://www.tiktok.com/@quickartuae?_t=8p59LunNyCH&_r=1');
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/tiktok.png',
                                                        width: 30.0,
                                                        height: 30.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 15.0)),
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
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.bottomnavBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: BottomnavBarWidget(
                            pageName: 'profile',
                          ),
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
  }
}
