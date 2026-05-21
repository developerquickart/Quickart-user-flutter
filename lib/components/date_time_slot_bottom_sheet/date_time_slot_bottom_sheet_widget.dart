import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'date_time_slot_bottom_sheet_model.dart';
export 'date_time_slot_bottom_sheet_model.dart';

class DateTimeSlotBottomSheetWidget extends StatefulWidget {
  const DateTimeSlotBottomSheetWidget({
    super.key,
    required this.productModel,
  });

  final dynamic productModel;

  @override
  State<DateTimeSlotBottomSheetWidget> createState() =>
      _DateTimeSlotBottomSheetWidgetState();
}

class _DateTimeSlotBottomSheetWidgetState
    extends State<DateTimeSlotBottomSheetWidget> {
  late DateTimeSlotBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DateTimeSlotBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DATE_TIME_SLOT_BOTTOM_SHEET_DateTimeSlot');
      logFirebaseEvent('DateTimeSlotBottomSheet_update_component');
      _model.productJson = widget!.productModel;
      safeSetState(() {});
    });

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0x8514181B),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('DATE_TIME_SLOT_BOTTOM_SHEET_Icon_sfdzacd');
                logFirebaseEvent('Icon_bottom_sheet');
                Navigator.pop(context, _model.productJson);
                logFirebaseEvent('Icon_update_component_state');

                _model.updatePage(() {});
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: SafeArea(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 285.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if ((FFAppState().qtyZeroCheck ==
                              getJsonField(
                                _model.productJson,
                                r'''$.cat_id''',
                              )) ||
                          (FFAppState().qtyZeroCheck !=
                              getJsonField(
                                widget!.productModel,
                                r'''$.cat_id''',
                              )))
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Text(
                              'Pick Preferred Date & Time Slot',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppConstants.blackColor0A0A0A,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      if (((FFAppState().qtyZeroCheck ==
                                  getJsonField(
                                    _model.productJson,
                                    r'''$.cat_id''',
                                  )) &&
                              ((getJsonField(
                                    _model.productJson,
                                    r'''$.timeslotsdata''',
                                  )
                                              .toList()
                                              .map<ProductCountStruct?>(
                                                  ProductCountStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<ProductCountStruct?>)
                                      .withoutNulls
                                      .length >
                                  0)) ||
                          (FFAppState().qtyZeroCheck !=
                              getJsonField(
                                _model.productJson,
                                r'''$.cat_id''',
                              )))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            height: 55.0,
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final timeDate = getJsonField(
                                  _model.productJson,
                                  r'''$.timeslotsdata''',
                                ).toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: timeDate.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(width: 12.0),
                                  itemBuilder: (context, timeDateIndex) {
                                    final timeDateItem =
                                        timeDate[timeDateIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DATE_TIME_SLOT_BOTTOM_SHEET_Container_ns');
                                            logFirebaseEvent(
                                                'Container_update_app_state');
                                            FFAppState().selectedDeliveryDate =
                                                getJsonField(
                                              timeDateItem,
                                              r'''$.date''',
                                            ).toString();
                                            FFAppState()
                                                .selectedDeliveryTimeSlot = '';
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  functions.setbackgroundColor(
                                                      getJsonField(
                                                        timeDateItem,
                                                        r'''$.date''',
                                                      ).toString(),
                                                      FFAppState()
                                                          .selectedDeliveryDate,
                                                      0,
                                                      0),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FFAppConstants.indigoColor,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                functions.setDateFormatter(
                                                    getJsonField(
                                                      timeDateItem,
                                                      r'''$.date''',
                                                    ).toString(),
                                                    'dd',
                                                    'yyyy-MM-dd')!,
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
                                                          fontSize: 12.0,
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
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              functions.setDateFormatter(
                                                  getJsonField(
                                                    timeDateItem,
                                                    r'''$.date''',
                                                  ).toString(),
                                                  'EEEE',
                                                  'yyyy-MM-dd')!,
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
                                                    color: FFAppState()
                                                                .selectedDeliveryDate ==
                                                            getJsonField(
                                                              timeDateItem,
                                                              r'''$.date''',
                                                            ).toString()
                                                        ? FFAppConstants
                                                            .indigoColor
                                                        : FFAppConstants
                                                            .blackColor0A0A0A,
                                                    fontSize: 12.0,
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                        child: Text(
                          'Choose a time',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 10.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final timeSlotModel = functions
                                          .getSelectedTimeSlotList(
                                              FFAppState().selectedDeliveryDate,
                                              getJsonField(
                                                widget!.productModel,
                                                r'''$.timeslotsdata''',
                                              ))
                                          ?.toList() ??
                                      [];

                                  return Wrap(
                                    spacing: 10.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children:
                                        List.generate(timeSlotModel.length,
                                            (timeSlotModelIndex) {
                                      final timeSlotModelItem =
                                          timeSlotModel[timeSlotModelIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 9.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DATE_TIME_SLOT_BOTTOM_SHEET_Container_bp');
                                            logFirebaseEvent(
                                                'Container_update_app_state');
                                            FFAppState()
                                                    .selectedDeliveryTimeSlot =
                                                getJsonField(
                                              timeSlotModelItem,
                                              r'''$.time_slots''',
                                            ).toString();
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Container_update_component_state');
                                            _model.addToSelectedArrayJson(
                                                DailyDateTimeSlotsStruct(
                                              catId: getJsonField(
                                                _model.productJson,
                                                r'''$.cat_id''',
                                              ).toString(),
                                              selectedDate: FFAppState()
                                                  .selectedDeliveryDate,
                                              timeslots: getJsonField(
                                                timeSlotModelItem,
                                                r'''$.time_slots''',
                                              ).toString(),
                                            ));
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Container_custom_action');
                                            _model.internetCheck1 =
                                                await actions
                                                    .checkInternetConnection();
                                            if (_model.internetCheck1 == true) {
                                              logFirebaseEvent(
                                                  'Container_backend_call');
                                              _model.apiResultsqz =
                                                  await QuickartGroup
                                                      .upquickordertimeslotCall
                                                      .call(
                                                userid: FFAppState().userID,
                                                datetimeArrayJson: _model
                                                    .selectedArrayJson
                                                    .map((e) => e.toMap())
                                                    .toList(),
                                                platform:
                                                    isiOS ? 'ios' : 'android',
                                              );

                                              if ((_model.apiResultsqz
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'Container_bottom_sheet');
                                                Navigator.pop(context,
                                                    _model.productJson);
                                                logFirebaseEvent(
                                                    'Container_update_component_state');

                                                _model.updatePage(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      QuickartGroup
                                                          .upquickordertimeslotCall
                                                          .message(
                                                        (_model.apiResultsqz
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        color:
                                                            Color(0x00000000),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FFAppConstants
                                                            .blackColor0A0A0A,
                                                  ),
                                                );
                                                logFirebaseEvent(
                                                    'Container_update_component_state');

                                                safeSetState(() {});
                                              }
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFAppConstants
                                                        .internetString,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: Color(0x00000000),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FFAppConstants
                                                          .blackColor0A0A0A,
                                                ),
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  functions.setbackgroundColor(
                                                      getJsonField(
                                                        timeSlotModelItem,
                                                        r'''$.time_slots''',
                                                      ).toString(),
                                                      FFAppState()
                                                          .selectedDeliveryTimeSlot,
                                                      0,
                                                      0),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color: Color(0xFFBBBCD7),
                                                width: 0.7,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        if (functions
                                                                .isDiscountEmpty(
                                                                    getJsonField(
                                                              timeSlotModelItem,
                                                              r'''$.discount''',
                                                            ).toString()) ==
                                                            false) {
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (functions
                                                                      .isDiscountEmpty(
                                                                          getJsonField(
                                                                    timeSlotModelItem,
                                                                    r'''$.discount''',
                                                                  ).toString()) ==
                                                                  false)
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                7.0,
                                                                                0.0,
                                                                                7.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              functions.formatTimeRange(getJsonField(
                                                                                timeSlotModelItem,
                                                                                r'''$.time_slots''',
                                                                              ).toString()),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.montserrat(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (functions
                                                                            .isDiscountEmpty(getJsonField(
                                                                          timeSlotModelItem,
                                                                          r'''$.discount''',
                                                                        ).toString()) ==
                                                                        false)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              30.5,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FFAppConstants.darkGreen,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(15.0),
                                                                              topLeft: Radius.circular(0.0),
                                                                              topRight: Radius.circular(15.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                  child: RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: '',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FFAppConstants.whiteColor,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: '${getJsonField(
                                                                                            timeSlotModelItem,
                                                                                            r'''$.discount''',
                                                                                          ).toString()}%  ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: 'cashback',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.montserrat(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: Colors.white,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 7.0, 5.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFFFDE34),
                                                                                      borderRadius: BorderRadius.circular(24.0),
                                                                                    ),
                                                                                    child: Visibility(
                                                                                      visible: FFAppConstants.zeroValue !=
                                                                                          getJsonField(
                                                                                            timeSlotModelItem,
                                                                                            r'''$.min_amount''',
                                                                                          ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                          child: RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                TextSpan(
                                                                                                  text: 'above ',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FFAppConstants.blackColor0A0A0A,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: '${FFAppConstants.zeroValue == getJsonField(
                                                                                                        timeSlotModelItem,
                                                                                                        r'''$.min_amount''',
                                                                                                      ) ? '' : ' AED'}${FFAppConstants.zeroValue == getJsonField(
                                                                                                        timeSlotModelItem,
                                                                                                        r'''$.min_amount''',
                                                                                                      ) ? '' : getJsonField(
                                                                                                      timeSlotModelItem,
                                                                                                      r'''$.min_amount''',
                                                                                                    ).toString()}',
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
                                                                                                TextSpan(
                                                                                                  text: '',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.montserrat(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: FFAppConstants.blackColor0A0A0A,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                            ],
                                                          );
                                                        } else {
                                                          return Visibility(
                                                            visible: functions
                                                                    .isDiscountEmpty(
                                                                        getJsonField(
                                                                  timeSlotModelItem,
                                                                  r'''$.discount''',
                                                                ).toString()) ==
                                                                true,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          7.0,
                                                                          10.0,
                                                                          7.0),
                                                              child: Text(
                                                                (String var1) {
                                                                  return var1
                                                                      .replaceAll(
                                                                          ":00",
                                                                          "");
                                                                }(getJsonField(
                                                                  timeSlotModelItem,
                                                                  r'''$.time_slots''',
                                                                ).toString()),
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
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
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
    );
  }
}
