import '/backend/api_requests/api_calls.dart';
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
import 'cancel_order_screen_model.dart';
export 'cancel_order_screen_model.dart';

class CancelOrderScreenWidget extends StatefulWidget {
  const CancelOrderScreenWidget({super.key});

  static String routeName = 'cancelOrderScreen';
  static String routePath = '/cancelOrderScreen';

  @override
  State<CancelOrderScreenWidget> createState() =>
      _CancelOrderScreenWidgetState();
}

class _CancelOrderScreenWidgetState extends State<CancelOrderScreenWidget> {
  late CancelOrderScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CancelOrderScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'cancelOrderScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CANCEL_ORDER_SCREEN_cancelOrderScreen_ON');
      logFirebaseEvent('cancelOrderScreen_update_app_state');
      FFAppState().isCancelReason = 0;
      safeSetState(() {});
    });

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

    return FutureBuilder<ApiCallResponse>(
      future: QuickartGroup.cancelorderreasonCall.call(),
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
        final cancelOrderScreenCancelorderreasonResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FFAppConstants.whiteColor,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
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
                    logFirebaseEvent(
                        'CANCEL_ORDER_SCREEN_chevron_left_ICN_ON_');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
                title: Text(
                  'Cancel Order',
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
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Reasons for Cancellation',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 15.0),
                          child: Text(
                            'Please tell us the correct reason for cancellation. This information is only used to improve our service.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Text(
                          'Select Reasons *',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 19.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Builder(
                          builder: (context) {
                            final cancelModel = getJsonField(
                              cancelOrderScreenCancelorderreasonResponse
                                  .jsonBody,
                              r'''$.data''',
                            ).toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: cancelModel.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, cancelModelIndex) {
                                final cancelModelItem =
                                    cancelModel[cancelModelIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CANCEL_ORDER_SCREEN_Row_8qm9v290_ON_TAP');
                                      logFirebaseEvent('Row_update_app_state');
                                      FFAppState().isCancelReason =
                                          getJsonField(
                                        cancelModelItem,
                                        r'''$.res_id''',
                                      );
                                      FFAppState().cancelReason = getJsonField(
                                        cancelModelItem,
                                        r'''$.reason''',
                                      ).toString();
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Row_google_analytics_event');
                                      logFirebaseEvent(
                                        'Selection',
                                        parameters: {
                                          'Screen Name': 'Cancel Order Screen',
                                          'Selection': 'Cancel Reason Selected',
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color(0xFFE0E0E0),
                                              ),
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                if (FFAppState()
                                                        .isCancelReason ==
                                                    getJsonField(
                                                      cancelModelItem,
                                                      r'''$.res_id''',
                                                    )) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 2.0,
                                                                2.0, 2.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                        shape: BoxShape.circle,
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
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              cancelModelItem,
                                              r'''$.reason''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FFAppConstants
                                                      .blackColor0A0A0A,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
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
                              },
                            );
                          },
                        ),
                        if (FFAppState().isCancelReason == 5)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFE0E0E0),
                                  width: 0.2,
                                ),
                              ),
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onFieldSubmitted: (_) async {
                                    logFirebaseEvent(
                                        'CANCEL_ORDER_SCREEN_TextField_oh1zpogm_O');
                                    logFirebaseEvent(
                                        'TextField_update_app_state');
                                    FFAppState().userName =
                                        FFAppState().userName;
                                    FFAppState().update(() {});
                                    logFirebaseEvent(
                                        'TextField_google_analytics_event');
                                    logFirebaseEvent(
                                        'EnterReasonClickAnalytics');
                                  },
                                  autofocus: true,
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
                                    hintText: 'Enter Reasons',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 12.0,
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FFAppConstants.blackColor0A0A0A,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  maxLines: null,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Builder(
                            builder: (context) {
                              if (FFAppState().screenName == 'subscription') {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: 150.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CANCEL_ORDER_SCREEN_CANCEL_ORDER_BTN_ON_');
                                        logFirebaseEvent(
                                            'Button_custom_action');
                                        _model.connectivityResult =
                                            await actions
                                                .checkInternetConnection();
                                        if (FFAppState().isCardSelected !=
                                            '0') {
                                          if (_model.connectivityResult ==
                                              true) {
                                            if (FFAppState().isCancelReason ==
                                                5) {
                                              logFirebaseEvent(
                                                  'Button_validate_form');
                                              _model.validation = true;
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                _model.validation = false;
                                              }
                                              if (_model.validation!) {
                                                if (functions.trimString(_model
                                                            .textController
                                                            .text) !=
                                                        null &&
                                                    functions.trimString(_model
                                                            .textController
                                                            .text) !=
                                                        '') {
                                                  if (functions.trimString(
                                                              FFAppState()
                                                                  .cancelReason) ==
                                                          null ||
                                                      functions.trimString(
                                                              FFAppState()
                                                                  .cancelReason) ==
                                                          '') {
                                                    logFirebaseEvent(
                                                        'Button_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Please select any reason.',
                                                          style: TextStyle(
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FFAppConstants
                                                                .primaryPurpleE4D8F5,
                                                      ),
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_update_app_state');
                                                    FFAppState().cancelReason =
                                                        _model.textController
                                                            .text;
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'Button_backend_call');
                                                    _model.apiResultln5 =
                                                        await QuickartGroup
                                                            .cancelledproductorderCall
                                                            .call(
                                                      userid:
                                                          FFAppState().userID,
                                                      storeOrderid: FFAppState()
                                                          .orderStatusID,
                                                      cartID:
                                                          FFAppState().cartID,
                                                      cancelReason: FFAppState()
                                                          .cancelReason,
                                                      platform: isiOS
                                                          ? 'ios'
                                                          : 'android',
                                                    );

                                                    if ((_model.apiResultln5
                                                            ?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.goNamed(
                                                          OrderCancelScreenWidget
                                                              .routeName);

                                                      logFirebaseEvent(
                                                          'Button_custom_action');
                                                      await actions
                                                          .facebookEventClass(
                                                        FFAppState().userID,
                                                        FFAppState()
                                                            .cancelReason,
                                                        FFAppState().cartID,
                                                        0.0,
                                                        0,
                                                        double.parse(
                                                            FFAppState()
                                                                .afPrice),
                                                        'orderCancel',
                                                        FFAppState().emptyJson,
                                                        ' subscription order cancel ',
                                                        FFAppState()
                                                            .orderStatusID,
                                                        ' ',
                                                        ' ',
                                                        ' ',
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_update_app_state');
                                                      FFAppState()
                                                          .isCancelReason = 0;
                                                      FFAppState()
                                                          .cancelReason = '';
                                                      FFAppState()
                                                          .update(() {});
                                                      logFirebaseEvent(
                                                          'Button_google_analytics_event');
                                                      logFirebaseEvent(
                                                        'Cancel Order',
                                                        parameters: {
                                                          'Screen Name':
                                                              'Cancel Order Screen',
                                                          'Navigate To':
                                                              'Order Cancel Screen',
                                                          'API Name':
                                                              'Cancelled Product Order',
                                                        },
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            getJsonField(
                                                              (_model.apiResultln5
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.message''',
                                                            ).toString(),
                                                            style: TextStyle(
                                                              color: FFAppConstants
                                                                  .indigoColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12.0,
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
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Please enter any reason',
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2150),
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
                                                      'Please enter any reason',
                                                      style: TextStyle(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 2150),
                                                    backgroundColor:
                                                        FFAppConstants
                                                            .primaryPurpleE4D8F5,
                                                  ),
                                                );
                                              }
                                            } else {
                                              if (FFAppState().cancelReason ==
                                                      null ||
                                                  FFAppState().cancelReason ==
                                                      '') {
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please select any reason.',
                                                      style: TextStyle(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 2000),
                                                    backgroundColor:
                                                        FFAppConstants
                                                            .primaryPurpleE4D8F5,
                                                  ),
                                                );
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_backend_call');
                                                _model.apiResult210 =
                                                    await QuickartGroup
                                                        .cancelledproductorderCall
                                                        .call(
                                                  userid: FFAppState().userID,
                                                  storeOrderid: FFAppState()
                                                      .orderStatusID,
                                                  cartID: FFAppState().cartID,
                                                  cancelReason:
                                                      FFAppState().cancelReason,
                                                  platform:
                                                      isiOS ? 'ios' : 'android',
                                                );

                                                if ((_model.apiResult210
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.goNamed(
                                                      OrderCancelScreenWidget
                                                          .routeName);

                                                  logFirebaseEvent(
                                                      'Button_custom_action');
                                                  await actions
                                                      .facebookEventClass(
                                                    FFAppState().userID,
                                                    FFAppState().cancelReason,
                                                    FFAppState().cartID,
                                                    0.0,
                                                    0,
                                                    double.parse(
                                                        FFAppState().afPrice),
                                                    'orderCancel',
                                                    FFAppState().emptyJson,
                                                    ' subscription order cancel ',
                                                    FFAppState().orderStatusID,
                                                    ' ',
                                                    ' ',
                                                    ' ',
                                                  );
                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  FFAppState().isCancelReason =
                                                      0;
                                                  FFAppState().cancelReason =
                                                      '';
                                                  FFAppState().update(() {});
                                                  logFirebaseEvent(
                                                      'Button_google_analytics_event');
                                                  logFirebaseEvent(
                                                    'Cancel Order',
                                                    parameters: {
                                                      'Screen Name':
                                                          'Cancel Order Screen',
                                                      'Navigate To':
                                                          'Order Cancel Screen',
                                                      'API Name':
                                                          'Cancelled Product Order',
                                                    },
                                                  );
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.apiResult210
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.message''',
                                                        ).toString(),
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .primaryPurpleE4D8F5,
                                                    ),
                                                  );
                                                }
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
                                                  style: TextStyle(
                                                    color: FFAppConstants
                                                        .blackColor0A0A0A,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor: FFAppConstants
                                                    .NeutralBlack50Color,
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
                                                'Please select cancel reason',
                                                style: TextStyle(
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
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Cancel Order',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
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
                                              color: FFAppConstants.whiteColor,
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
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                                );
                              } else if (FFAppState().screenName ==
                                  'dailyGroup') {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: 150.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CANCEL_ORDER_SCREEN_CANCEL_ORDER_BTN_ON_');
                                        logFirebaseEvent(
                                            'Button_custom_action');
                                        _model.connectivityResult2 =
                                            await actions
                                                .checkInternetConnection();
                                        if (FFAppState().isCardSelected !=
                                            '0') {
                                          if (_model.connectivityResult2 ==
                                              true) {
                                            if (FFAppState().isCancelReason ==
                                                5) {
                                              if (functions.trimString(_model
                                                          .textController
                                                          .text) !=
                                                      null &&
                                                  functions.trimString(_model
                                                          .textController
                                                          .text) !=
                                                      '') {
                                                if (functions.trimString(
                                                            FFAppState()
                                                                .cancelReason) ==
                                                        null ||
                                                    functions.trimString(
                                                            FFAppState()
                                                                .cancelReason) ==
                                                        '') {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Please select any reason',
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .primaryPurpleE4D8F5,
                                                    ),
                                                  );
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_backend_call');
                                                  _model.apiResultlg0 =
                                                      await QuickartGroup
                                                          .cancelledquickorderprodCall
                                                          .call(
                                                    cartid: FFAppState().cartID,
                                                    userid: FFAppState().userID,
                                                    cancelReason: _model
                                                        .textController.text,
                                                    platform: isiOS
                                                        ? 'ios'
                                                        : 'android',
                                                  );

                                                  if ((_model.apiResultlg0
                                                          ?.succeeded ??
                                                      true)) {
                                                    logFirebaseEvent(
                                                        'Button_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          getJsonField(
                                                            (_model.apiResultlg0
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString(),
                                                          style: TextStyle(
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 1500),
                                                        backgroundColor:
                                                            FFAppConstants
                                                                .NeutralBlack50Color,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                        OrderCancelScreenWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'Button_custom_action');
                                                    await actions
                                                        .facebookEventClass(
                                                      FFAppState().userID,
                                                      _model
                                                          .textController.text,
                                                      FFAppState()
                                                          .afProductName,
                                                      double.parse(
                                                          FFAppState().afPrice),
                                                      int.parse(
                                                          FFAppState().afQty),
                                                      0.0,
                                                      'cancelProduct',
                                                      FFAppState().emptyJson,
                                                      ' daily order cancel product',
                                                      FFAppState().cartID,
                                                      FFAppState().groupID,
                                                      ' ',
                                                      ' ',
                                                    );
                                                    logFirebaseEvent(
                                                        'Button_update_app_state');
                                                    FFAppState()
                                                        .isCancelReason = 0;
                                                    FFAppState().cancelReason =
                                                        '';
                                                    FFAppState().update(() {});
                                                    logFirebaseEvent(
                                                        'Button_google_analytics_event');
                                                    logFirebaseEvent(
                                                        'CancelOrderClickAnalytics');
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          getJsonField(
                                                            (_model.apiResultlg0
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString(),
                                                          style: TextStyle(
                                                            color: FFAppConstants
                                                                .blackColor0A0A0A,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FFAppConstants
                                                                .NeutralBlack50Color,
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
                                                      'Please enter any reason',
                                                      style: TextStyle(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 2150),
                                                    backgroundColor:
                                                        FFAppConstants
                                                            .primaryPurpleE4D8F5,
                                                  ),
                                                );
                                              }
                                            } else {
                                              if (FFAppState().cancelReason ==
                                                      null ||
                                                  FFAppState().cancelReason ==
                                                      '') {
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please select any reason',
                                                      style: TextStyle(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 2000),
                                                    backgroundColor:
                                                        FFAppConstants
                                                            .primaryPurpleE4D8F5,
                                                  ),
                                                );
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_backend_call');
                                                _model.apiResults5h =
                                                    await QuickartGroup
                                                        .cancelledquickorderprodCall
                                                        .call(
                                                  cartid: FFAppState().cartID,
                                                  userid: FFAppState().userID,
                                                  cancelReason:
                                                      FFAppState().cancelReason,
                                                  platform:
                                                      isiOS ? 'ios' : 'android',
                                                );

                                                if ((_model.apiResults5h
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.apiResults5h
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.message''',
                                                        ).toString(),
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .blackColor0A0A0A,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .NeutralBlack50Color,
                                                    ),
                                                  );
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.goNamed(
                                                      OrderCancelScreenWidget
                                                          .routeName);

                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  FFAppState().isCancelReason =
                                                      0;
                                                  FFAppState().cancelReason =
                                                      '';
                                                  FFAppState().update(() {});
                                                  logFirebaseEvent(
                                                      'Button_custom_action');
                                                  await actions
                                                      .facebookEventClass(
                                                    FFAppState().userID,
                                                    FFAppState().cancelReason,
                                                    FFAppState().afProductName,
                                                    double.parse(
                                                        FFAppState().afPrice),
                                                    int.parse(
                                                        FFAppState().afQty),
                                                    0.0,
                                                    'cancelProduct',
                                                    FFAppState().emptyJson,
                                                    ' daily order cancel product',
                                                    FFAppState().cartID,
                                                    FFAppState().groupID,
                                                    ' ',
                                                    ' ',
                                                  );
                                                  logFirebaseEvent(
                                                      'Button_google_analytics_event');
                                                  logFirebaseEvent(
                                                      'CancelOrderClickAnalytics');
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.apiResults5h
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.message''',
                                                        ).toString(),
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .blackColor0A0A0A,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .NeutralBlack50Color,
                                                    ),
                                                  );
                                                }
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
                                                  style: TextStyle(
                                                    color: FFAppConstants
                                                        .blackColor0A0A0A,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor: FFAppConstants
                                                    .NeutralBlack50Color,
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
                                                'Please select cancel reason',
                                                style: TextStyle(
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
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Cancel Order',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
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
                                              color: FFAppConstants.whiteColor,
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
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: 150.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'CANCEL_ORDER_SCREEN_CANCEL_ORDER_BTN_ON_');
                                        logFirebaseEvent(
                                            'Button_custom_action');
                                        _model.connectivityResult22 =
                                            await actions
                                                .checkInternetConnection();
                                        if (FFAppState().isCardSelected !=
                                            '0') {
                                          if (_model.connectivityResult22 ==
                                              true) {
                                            if (FFAppState().isCancelReason ==
                                                5) {
                                              if (functions.trimString(_model
                                                          .textController
                                                          .text) !=
                                                      null &&
                                                  functions.trimString(_model
                                                          .textController
                                                          .text) !=
                                                      '') {
                                                if (functions.trimString(
                                                            FFAppState()
                                                                .cancelReason) ==
                                                        null ||
                                                    functions.trimString(
                                                            FFAppState()
                                                                .cancelReason) ==
                                                        '') {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Please select any reason.',
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .primaryPurpleE4D8F5,
                                                    ),
                                                  );
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_backend_call');
                                                  _model.apiResultlg02 =
                                                      await QuickartGroup
                                                          .cancelledquickorderCall
                                                          .call(
                                                    cartID:
                                                        FFAppState().groupID,
                                                    userID: FFAppState().userID,
                                                    cancelResoan: _model
                                                        .textController.text,
                                                    platform: isiOS
                                                        ? 'ios'
                                                        : 'android',
                                                  );

                                                  if ((_model.apiResultlg02
                                                          ?.succeeded ??
                                                      true)) {
                                                    logFirebaseEvent(
                                                        'Button_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          getJsonField(
                                                            (_model.apiResultlg02
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString(),
                                                          style: TextStyle(
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FFAppConstants
                                                                .primaryPurpleE4D8F5,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                        OrderCancelScreenWidget
                                                            .routeName);

                                                    logFirebaseEvent(
                                                        'Button_custom_action');
                                                    await actions
                                                        .facebookEventClass(
                                                      FFAppState().userID,
                                                      _model
                                                          .textController.text,
                                                      FFAppState().groupID,
                                                      0.0,
                                                      0,
                                                      double.parse(
                                                          FFAppState().afPrice),
                                                      'orderCancel',
                                                      FFAppState().emptyJson,
                                                      ' daily order cancel ',
                                                      ' ',
                                                      ' ',
                                                      ' ',
                                                      ' ',
                                                    );
                                                    logFirebaseEvent(
                                                        'Button_update_app_state');
                                                    FFAppState()
                                                        .isCancelReason = 0;
                                                    FFAppState().cancelReason =
                                                        '';
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'Button_google_analytics_event');
                                                    logFirebaseEvent(
                                                      'Cancel Order',
                                                      parameters: {
                                                        'Screen Name':
                                                            'Cancel Order Screen',
                                                        'Navigate To':
                                                            'Order Cancel Screen',
                                                        'API Name':
                                                            'Cancelled Quick Order',
                                                      },
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          getJsonField(
                                                            (_model.apiResultlg02
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString(),
                                                          style: TextStyle(
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FFAppConstants
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
                                                      'Please enter any reason',
                                                      style: TextStyle(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 2150),
                                                    backgroundColor:
                                                        FFAppConstants
                                                            .primaryPurpleE4D8F5,
                                                  ),
                                                );
                                              }
                                            } else {
                                              if (FFAppState().cancelReason ==
                                                      null ||
                                                  FFAppState().cancelReason ==
                                                      '') {
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please select any reason.',
                                                      style: TextStyle(
                                                        color: FFAppConstants
                                                            .indigoColor,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 2000),
                                                    backgroundColor:
                                                        FFAppConstants
                                                            .primaryPurpleE4D8F5,
                                                  ),
                                                );
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_backend_call');
                                                _model.apiResults5h2 =
                                                    await QuickartGroup
                                                        .cancelledquickorderCall
                                                        .call(
                                                  cartID: FFAppState().groupID,
                                                  userID: FFAppState().userID,
                                                  cancelResoan:
                                                      FFAppState().cancelReason,
                                                  platform:
                                                      isiOS ? 'ios' : 'android',
                                                );

                                                if ((_model.apiResults5h2
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.apiResults5h2
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.message''',
                                                        ).toString(),
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .primaryPurpleE4D8F5,
                                                    ),
                                                  );
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.pushNamed(
                                                      OrderCancelScreenWidget
                                                          .routeName);

                                                  logFirebaseEvent(
                                                      'Button_custom_action');
                                                  await actions
                                                      .facebookEventClass(
                                                    FFAppState().userID,
                                                    FFAppState().cancelReason,
                                                    FFAppState().groupID,
                                                    0.0,
                                                    0,
                                                    double.parse(
                                                        FFAppState().afPrice),
                                                    'orderCancel',
                                                    FFAppState().emptyJson,
                                                    ' daily order cancel ',
                                                    ' ',
                                                    ' ',
                                                    ' ',
                                                    ' ',
                                                  );
                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  FFAppState().isCancelReason =
                                                      0;
                                                  FFAppState().cancelReason =
                                                      '';
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'Button_google_analytics_event');
                                                  logFirebaseEvent(
                                                    'Cancel Order',
                                                    parameters: {
                                                      'Screen Name':
                                                          'Cancel Order Screen',
                                                      'Navigate To':
                                                          'Order Cancel Screen',
                                                      'API Name':
                                                          'Cancelled Quick Order',
                                                    },
                                                  );
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        getJsonField(
                                                          (_model.apiResults5h2
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.message''',
                                                        ).toString(),
                                                        style: TextStyle(
                                                          color: FFAppConstants
                                                              .indigoColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          FFAppConstants
                                                              .primaryPurpleE4D8F5,
                                                    ),
                                                  );
                                                }
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
                                                  style: TextStyle(
                                                    color: FFAppConstants
                                                        .blackColor0A0A0A,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor: FFAppConstants
                                                    .NeutralBlack50Color,
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
                                                'Please select cancel reason',
                                                style: TextStyle(
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
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Cancel Order',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
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
                                              color: FFAppConstants.whiteColor,
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
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
