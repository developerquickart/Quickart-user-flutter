import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trial_packcategories_model.dart';
export 'trial_packcategories_model.dart';

class TrialPackcategoriesWidget extends StatefulWidget {
  const TrialPackcategoriesWidget({
    super.key,
    this.utmSource,
    this.utmCampaign,
    this.utmNetwork,
    this.utmMedium,
    this.utmKeyword,
    this.utmPlacement,
  });

  final String? utmSource;
  final String? utmCampaign;
  final String? utmNetwork;
  final String? utmMedium;
  final String? utmKeyword;
  final String? utmPlacement;

  static String routeName = 'TrialPackcategories';
  static String routePath = '/TrialPackcategories';

  @override
  State<TrialPackcategoriesWidget> createState() =>
      _TrialPackcategoriesWidgetState();
}

class _TrialPackcategoriesWidgetState extends State<TrialPackcategoriesWidget> {
  late TrialPackcategoriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrialPackcategoriesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TrialPackcategories'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TRIAL_PACKCATEGORIES_TrialPackcategories');
      if (widget!.utmSource != null && widget!.utmSource != '') {
        logFirebaseEvent('TrialPackcategories_backend_call');
        _model.apiResultSeoSource = await QuickartGroup.seosourceCall.call(
          utmSource: widget!.utmSource,
          utmcampaign: widget!.utmCampaign,
          utmnetwork: widget!.utmNetwork,
          utmmedium: widget!.utmMedium,
          utmkeyword: widget!.utmNetwork,
          placement: widget!.utmPlacement,
          userid: FFAppState().userID,
          deviceid: FFAppState().deviceID,
          fcmtoken: FFAppState().fcmToken,
          platform: FFAppState().platform,
        );

        if (!(_model.apiResultSeoSource?.succeeded ?? true)) {
          logFirebaseEvent('TrialPackcategories_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'seo api failed',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
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
        resizeToAvoidBottomInset: false,
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
              logFirebaseEvent('TRIAL_PACKCATEGORIES_chevron_left_ICN_ON');
              logFirebaseEvent('IconButton_navigate_to');

              context.goNamed(DashboardScreenWidget.routeName);
            },
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('TRIAL_PACKCATEGORIES_Text_qkg6ihke_ON_TA');
              logFirebaseEvent('Text_update_app_state');
              FFAppState().isSelectedSchedule =
                  !(FFAppState().isSelectedSchedule ?? true);
              safeSetState(() {});
            },
            child: Text(
              'Trial Pack Categories',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.outfit(
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
          ),
          actions: [],
          centerTitle: false,
        ),
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('TRIAL_PACKCATEGORIES_Stack_9tsta4aa_ON_T');
              logFirebaseEvent('Stack_update_app_state');
              FFAppState().isCartShow = false;
              safeSetState(() {});
            },
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.95,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 2.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: (_model.apiRequestCompleter ??= Completer<
                              ApiCallResponse>()
                            ..complete(QuickartGroup.trialproductlistCall.call(
                              userId: FFAppState().userID,
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
                        final listViewTrialproductlistResponse = snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final catteeData = getJsonField(
                              listViewTrialproductlistResponse.jsonBody,
                              r'''$.data''',
                            ).toList();
                            if (catteeData.isEmpty) {
                              return Center(
                                child: Image.asset(
                                  'assets/images/No_data_available.png',
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.4,
                                ),
                              );
                            }

                            return RefreshIndicator(
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'TRIAL_PACKCATEGORIES_GridView_325gvyiw_O');
                                logFirebaseEvent(
                                    'ListView_refresh_database_request');
                                safeSetState(
                                    () => _model.apiRequestCompleter = null);
                                await _model.waitForApiRequestCompleted();
                              },
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: catteeData.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 20.0),
                                itemBuilder: (context, catteeDataIndex) {
                                  final catteeDataItem =
                                      catteeData[catteeDataIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'TRIAL_PACKCATEGORIES_Container_kk2gl169_');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                          TrialProductListingWidget.routeName);

                                      logFirebaseEvent(
                                          'Container_update_app_state');
                                      FFAppState().trialId = getJsonField(
                                        catteeDataItem,
                                        r'''$.id''',
                                      ).toString();
                                      FFAppState().trialPackBannerImage =
                                          getJsonField(
                                        catteeDataItem,
                                        r'''$.image''',
                                      ).toString();
                                      FFAppState().trialPackCategoryName =
                                          getJsonField(
                                        catteeDataItem,
                                        r'''$.title''',
                                      ).toString();
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Container_google_analytics_event');
                                      logFirebaseEvent(
                                          'SubCatCardClickAnalytics');
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).width - 10,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF63639F),
                                            Color(0xFFF3F3F3)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Image.network(
                                              getJsonField(
                                                catteeDataItem,
                                                r'''$.image''',
                                              ).toString(),
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              fit: BoxFit.contain,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x9B14181B),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    catteeDataItem,
                                                    r'''$.title''',
                                                  ).toString(),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
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
                                                        fontSize: 15.0,
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
      ),
    );
  }
}
