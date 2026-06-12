import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'google_maps_redirect_model.dart';
export 'google_maps_redirect_model.dart';

class GoogleMapsRedirectWidget extends StatefulWidget {
  const GoogleMapsRedirectWidget({super.key});

  static String routeName = 'GoogleMapsRedirect';
  static String routePath = '/googleMapsRedirect';

  @override
  State<GoogleMapsRedirectWidget> createState() =>
      _GoogleMapsRedirectWidgetState();
}

class _GoogleMapsRedirectWidgetState extends State<GoogleMapsRedirectWidget> {
  late GoogleMapsRedirectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoogleMapsRedirectModel());
print("G1---latLang----->${ FFAppState().latLang!}");
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'GoogleMapsRedirect'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GOOGLE_MAPS_REDIRECT_GoogleMapsRedirect_');
      logFirebaseEvent('GoogleMapsRedirect_update_app_state');

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
        resizeToAvoidBottomInset: false,
        backgroundColor: FFAppConstants.whiteColor,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(builder: (context) {
                          final _googleMapMarker =
                              _model.placePickerValue.latLng;
                          return FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) => safeSetState(
                                () => _model.googleMapsCenter = latLng),
                            initialLocation:FFAppState().categoryName != 'addAddress' ?  FFAppState().latLang! : _model.googleMapsCenter ??=
                                FFAppState().latLang!,
                            markers: [
                              if (_googleMapMarker != null)
                                FlutterFlowMarker(
                                  _googleMapMarker.serialize(),
                                  _googleMapMarker,
                                  () async {
                                    logFirebaseEvent(
                                        'GOOGLE_MAPS_REDIRECT_GoogleMap_vex49f7g_');
                                    logFirebaseEvent('GoogleMap_custom_action');
                                    await actions.getAddressformMap(
                                      _model.googleMapsCenter!,
                                      false,
                                      getJsonField(
                                        FFAppState().appInfo,
                                        r'''$.country_list''',
                                      ).toString(),
                                    );
                                    logFirebaseEvent(
                                        'GoogleMap_google_analytics_event');
                                    logFirebaseEvent('BackButtonAnalytics');
                                  },
                                ),
                            ],
                            markerColor: GoogleMarkerColor.red,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 19.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: true,
                            centerMapOnMarkerTap: true,
                          );
                        }),
                      ),
                      PointerInterceptor(
                        intercepting: isWeb,
                        child: Container(
                          width: double.infinity,
                          height: 70.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 13.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: FFAppConstants.indigoColor,
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    fillColor: FFAppConstants.indigoColor,
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color: FFAppConstants.whiteColor,
                                      size: 25.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'GOOGLE_MAPS_REDIRECT_chevron_left_ICN_ON');
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
                                      context.safePop();
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: AutocompleteCall.call(
                                      input: FFAppState().inputAddress,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 60.0,
                                            height: 60.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0xFF2E317E),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final placePickerAutocompleteResponse =
                                          snapshot.data!;

                                      return FlutterFlowPlacePicker(
                                        iOSGoogleMapsApiKey:
                                            'AIzaSyDjGU6WbSwLK9d7_CAVYQ1Br0DpFhx3Rt0',
                                        androidGoogleMapsApiKey:
                                            'AIzaSyDjGU6WbSwLK9d7_CAVYQ1Br0DpFhx3Rt0',
                                        webGoogleMapsApiKey:
                                            'AIzaSyDjGU6WbSwLK9d7_CAVYQ1Br0DpFhx3Rt0',
                                        onSelect: (place) async {
                                          safeSetState(() =>
                                              _model.placePickerValue = place);
                                          (await _model
                                                  .googleMapsController.future)
                                              .animateCamera(
                                                  CameraUpdate.newLatLng(place
                                                      .latLng
                                                      .toGoogleMaps()));
                                        },
                                        defaultText: 'Search Location',
                                        icon: Icon(
                                          Icons.place,
                                          color: FFAppConstants.indigoColor,
                                          size: 16.0,
                                        ),
                                        buttonOptions: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: 40.0,
                                          color: FFAppConstants.whiteColor,
                                          textAlign: TextAlign.start,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FFAppConstants.indigoColor,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              if (FFAppState().nullValue == 'hjghugu')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 10.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'GOOGLE_MAPS_REDIRECT_SHOW_ON_MAP_BTN_ON_');
                                      logFirebaseEvent('Button_google_map');
                                      await _model.googleMapsController.future
                                          .then(
                                        (c) => c.animateCamera(
                                          CameraUpdate.newLatLng(_model
                                              .placePickerValue.latLng
                                              .toGoogleMaps()),
                                        ),
                                      );
                                    },
                                    text: 'Show on Map',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FFAppConstants.indigoColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: PointerInterceptor(
                          intercepting: isWeb,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/q2.png',
                              width: 30.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: PointerInterceptor(
                          intercepting: isWeb,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'GOOGLE_MAPS_REDIRECT_CONFIRM_LOCATION_BT');
                                logFirebaseEvent('Button_custom_action');
                                _model.getAddressfromMap =
                                    await actions.getAddressformMap(
                                  _model.googleMapsCenter!,
                                  true,
                                  getJsonField(
                                    FFAppState().appInfo,
                                    r'''$.country_list''',
                                  ).toString(),
                                );
                                if (FFAppState().isEmiratesSelected == true) {
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().isLocationVisible = true;
                                  FFAppState().latLang =
                                      _model.googleMapsCenter;
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(FFAppState().AppName),
                                        content: Text(
                                            'We are not serviceable for this location'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  logFirebaseEvent('Button_update_app_state');
                                  FFAppState().selectedMapAddress = '';
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              text: 'Confirm Location',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FFAppConstants.indigoColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 3.0,
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
                      if (FFAppState().isLocationVisible == true)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: PointerInterceptor(
                            intercepting: isWeb,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0x1CFFFFFF),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      color: FFAppConstants.whiteColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                      border: Border.all(
                                        color: FFAppConstants.indigoColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  'Confirm Delivery Location',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                buttonSize: 30.0,
                                                icon: Icon(
                                                  Icons.close,
                                                  color: FFAppConstants
                                                      .indigoColor,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'GOOGLE_MAPS_REDIRECT_close_ICN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'IconButton_update_app_state');
                                                  FFAppState()
                                                          .isLocationVisible =
                                                      false;
                                                  FFAppState()
                                                      .selectedMapAddress = '';
                                                  FFAppState().update(() {});
                                                  logFirebaseEvent(
                                                      'IconButton_google_analytics_event');
                                                  logFirebaseEvent(
                                                      'HideLocationSheetAnalytics');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color:
                                                    FFAppConstants.indigoColor,
                                                size: 34.0,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  FFAppState()
                                                      .selectedMapAddress,
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
                                                            .indigoColor,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 30.0, 0.0, 20.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'GOOGLE_MAPS_REDIRECT_CHANGE_LOCATION_BTN');
                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  FFAppState()
                                                          .isLocationVisible =
                                                      false;
                                                  FFAppState()
                                                      .selectedMapAddress = '';
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'Button_google_analytics_event');
                                                  logFirebaseEvent(
                                                      'HideLocationSheetAnalytics');
                                                },
                                                text: 'Change Location',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FFAppConstants
                                                      .indigoColor,
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
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 30.0, 0.0, 20.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'GOOGLE_MAPS_REDIRECT_NEXT_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_navigate_back');
                                                  context.pop();
                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  FFAppState()
                                                          .isLocationVisible =
                                                      false;
                                                  FFAppState().latLang =
                                                      _model.googleMapsCenter;
                                                  safeSetState(() {});
                                                },
                                                text: 'Next',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FFAppConstants
                                                      .indigoColor,
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
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
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
                        ),
                    ],
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
