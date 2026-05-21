import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'termsand_condition_model.dart';
export 'termsand_condition_model.dart';

class TermsandConditionWidget extends StatefulWidget {
  const TermsandConditionWidget({super.key});

  static String routeName = 'termsandCondition';
  static String routePath = '/termsandCondition';

  @override
  State<TermsandConditionWidget> createState() =>
      _TermsandConditionWidgetState();
}

class _TermsandConditionWidgetState extends State<TermsandConditionWidget> {
  late TermsandConditionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsandConditionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'termsandCondition'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TERMSAND_CONDITION_termsandCondition_ON_');
      logFirebaseEvent('termsandCondition_custom_action');
      _model.connectivityResult = await actions.checkInternetConnection();
      if (_model.connectivityResult == true) {
        logFirebaseEvent('termsandCondition_backend_call');
        _model.termsofUseResponse =
            await QuickartGroup.termsConditionCall.call();

        if ((_model.termsofUseResponse?.succeeded ?? true)) {
          logFirebaseEvent('termsandCondition_update_app_state');
          FFAppState().termsOfUse = getJsonField(
            (_model.termsofUseResponse?.jsonBody ?? ''),
            r'''$.data.description''',
          ).toString();
          safeSetState(() {});
        } else {
          logFirebaseEvent('termsandCondition_show_snack_bar');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                getJsonField(
                  (_model.termsofUseResponse?.jsonBody ?? ''),
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
        logFirebaseEvent('termsandCondition_show_snack_bar');
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
            backgroundColor: FFAppConstants.blackColor666666,
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
              logFirebaseEvent('TERMSAND_CONDITION_chevron_left_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Terms & Condition',
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
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 5.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Builder(
                      builder: (context) {
                        if (FFAppState().nullValue ==
                            getJsonField(
                              (_model.termsofUseResponse?.jsonBody ?? ''),
                              r'''$.data.description''',
                            ).toString()) {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Loading....',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 150.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              child: custom_widgets.HTMLViweWidget(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                htmlString: getJsonField(
                                  (_model.termsofUseResponse?.jsonBody ?? ''),
                                  r'''$.data.description''',
                                ).toString(),
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
          ),
        ),
      ),
    );
  }
}
