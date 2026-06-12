import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottomnav_bar_model.dart';
export 'bottomnav_bar_model.dart';

class BottomnavBarWidget extends StatefulWidget {
  const BottomnavBarWidget({
    super.key,
    String? pageName,
  }) : this.pageName = pageName ?? '';

  final String pageName;

  @override
  State<BottomnavBarWidget> createState() => _BottomnavBarWidgetState();
}

class _BottomnavBarWidgetState extends State<BottomnavBarWidget> {
  late BottomnavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomnavBarModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 84.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.5,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  3.5,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            border: Border.all(
              color: Color(0x33000000),
              width: 0.2,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Color(0x0FFFFFFF),
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: Colors.white,
                                hoverColor: Color(0xFFFBF3E0),
                                hoverIconColor: FFAppConstants.indigoColor,
                                icon: Icon(
                                  Icons.home,
                                  color: valueOrDefault<Color>(
                                    widget!.pageName == 'home'
                                        ? FFAppConstants.indigoColor
                                        : FFAppConstants.navBarColor,
                                    Color(0xFFB8B8B8),
                                  ),
                                  size: 28.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'BOTTOMNAV_BAR_COMP_home_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_haptic_feedback');
                                  HapticFeedback.selectionClick();
                                  if (FFAppState().isUserLogin == true) {
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(
                                        DashboardScreenWidget.routeName);
                                  } else {
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed(
                                        LoginOnBoardScreenWidget.routeName);
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Home',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: valueOrDefault<Color>(
                                        widget!.pageName == 'home'
                                            ? FFAppConstants.indigoColor
                                            : FFAppConstants.navBarColor,
                                        Color(0xFFB8B8B8),
                                      ),
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.mouseRegionHovered1 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionHovered1 = false);
                        }),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.white,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Colors.white,
                            hoverColor: Color(0xFFFBF3E0),
                            hoverIconColor: FFAppConstants.indigoColor,
                            icon: Icon(
                              FFIcons.kvector,
                              color: valueOrDefault<Color>(
                                widget!.pageName == 'categories'
                                    ? FFAppConstants.indigoColor
                                    : FFAppConstants.navBarColor,
                                Color(0xFFB8B8B8),
                              ),
                              size: 24.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BOTTOMNAV_BAR_COMP_vector_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_haptic_feedback');
                              HapticFeedback.selectionClick();
                              logFirebaseEvent('IconButton_navigate_to');

                              context
                                  .pushNamed(CategoriesScreenWidget.routeName);

                              logFirebaseEvent(
                                  'IconButton_google_analytics_event');
                              logFirebaseEvent(
                                'Bottom Navigation Bar',
                                parameters: {
                                  'Screen Name': 'Dashboard Screen',
                                  'Navigate To': 'Categories Screen',
                                },
                              );
                            },
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.mouseRegionHovered2 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionHovered2 = false);
                        }),
                      ),
                    ),
                    Text(
                      'Categories',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: valueOrDefault<Color>(
                              widget!.pageName == 'categories'
                                  ? FFAppConstants.indigoColor
                                  : FFAppConstants.navBarColor,
                              Color(0xFFB8B8B8),
                            ),
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.white,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Colors.white,
                            hoverColor: Color(0xFFFBF3E0),
                            hoverIconColor: FFAppConstants.indigoColor,
                            icon: Icon(
                              FFIcons.kasset54x,
                              color: valueOrDefault<Color>(
                                widget!.pageName == 'FreshFood'
                                    ? FFAppConstants.indigoColor
                                    : FFAppConstants.navBarColor,
                                Color(0xFFB8B8B8),
                              ),
                              size: 24.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BOTTOMNAV_BAR_COMP_asset54x_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_haptic_feedback');
                              HapticFeedback.selectionClick();
                              logFirebaseEvent('IconButton_navigate_to');

                              context
                                  .pushNamed(FreshFoodScreenWidget.routeName);

                              logFirebaseEvent(
                                  'IconButton_google_analytics_event');
                              logFirebaseEvent(
                                'Bottom Navigation Bar',
                                parameters: {
                                  'Screen Name': 'Dashboard Screen',
                                  'Navigate To': 'Fresh Food Screen',
                                },
                              );
                            },
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.mouseRegionHovered3 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionHovered3 = false);
                        }),
                      ),
                    ),
                    Text(
                      'Subscription',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: valueOrDefault<Color>(
                              widget!.pageName == 'FreshFood'
                                  ? FFAppConstants.indigoColor
                                  : FFAppConstants.navBarColor,
                              Color(0xFFB8B8B8),
                            ),
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.white,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Colors.white,
                            hoverColor: Color(0xFFFBF3E0),
                            hoverIconColor: FFAppConstants.indigoColor,
                            icon: Icon(
                              Icons.repeat_rounded,
                              color: valueOrDefault<Color>(
                                widget!.pageName == 'repeat'
                                    ? FFAppConstants.indigoColor
                                    : FFAppConstants.navBarColor,
                                Color(0xFFB8B8B8),
                              ),
                              size: 24.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BOTTOMNAV_BAR_repeat_rounded_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_haptic_feedback');
                              HapticFeedback.selectionClick();
                              logFirebaseEvent('IconButton_navigate_to');

                              context.pushNamed(
                                RepeatOrdersWidget.routeName,
                                queryParameters: {
                                  'repeat': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              logFirebaseEvent(
                                  'IconButton_google_analytics_event');
                              logFirebaseEvent(
                                'Bottom Navigation Bar',
                                parameters: {
                                  'Screen Name': 'Dashboard Screen',
                                  'Navigate To': 'Repeat Orders Screen',
                                },
                              );
                            },
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.mouseRegionHovered4 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionHovered4 = false);
                        }),
                      ),
                    ),
                    Text(
                      'Repeat',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: valueOrDefault<Color>(
                              widget!.pageName == 'repeat'
                                  ? FFAppConstants.indigoColor
                                  : FFAppConstants.navBarColor,
                              Color(0xFFB8B8B8),
                            ),
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.white,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Colors.white,
                            hoverColor: Color(0xFFFBF3E0),
                            hoverIconColor: FFAppConstants.indigoColor,
                            icon: Icon(
                              Icons.person_2,
                              color: valueOrDefault<Color>(
                                widget!.pageName == 'profile'
                                    ? FFAppConstants.indigoColor
                                    : FFAppConstants.navBarColor,
                                Color(0xFFB8B8B8),
                              ),
                              size: 24.0,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BOTTOMNAV_BAR_COMP_person_2_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_haptic_feedback');
                              HapticFeedback.selectionClick();
                              logFirebaseEvent(
                                  'IconButton_google_analytics_event');
                              logFirebaseEvent(
                                'Bottom Navigation Bar',
                                parameters: {
                                  'Screen Name': 'Dashboard Screen',
                                  'Navigate To': 'Profile Screen',
                                },
                              );
                              if (FFAppState().isUserLogin == true) {
                                logFirebaseEvent('IconButton_navigate_to');

                                context.pushNamed(ProfilePageWidget.routeName);
                              } else {
                                logFirebaseEvent('IconButton_navigate_to');

                                context.pushNamed(
                                    LoginOnBoardScreenWidget.routeName);
                              }
                            },
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.mouseRegionHovered5 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionHovered5 = false);
                        }),
                      ),
                    ),
                    Text(
                      'Profile',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: valueOrDefault<Color>(
                              widget!.pageName == 'profile'
                                  ? FFAppConstants.indigoColor
                                  : FFAppConstants.navBarColor,
                              Color(0xFFB8B8B8),
                            ),
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ]
                  .divide(SizedBox(width: 20.0))
                  .addToStart(SizedBox(width: 5.0))
                  .addToEnd(SizedBox(width: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
