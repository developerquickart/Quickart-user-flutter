import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rating_bar_item_component_model.dart';
export 'rating_bar_item_component_model.dart';

class RatingBarItemComponentWidget extends StatefulWidget {
  const RatingBarItemComponentWidget({
    super.key,
    required this.productJson,
    required this.screenName,
    required this.cratid,
  });

  final dynamic productJson;
  final String? screenName;
  final String? cratid;

  @override
  State<RatingBarItemComponentWidget> createState() =>
      _RatingBarItemComponentWidgetState();
}

class _RatingBarItemComponentWidgetState
    extends State<RatingBarItemComponentWidget> {
  late RatingBarItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingBarItemComponentModel());

    _model.textController ??= TextEditingController(
        text: FFAppState().nullValue !=
                getJsonField(
                  widget!.productJson,
                  r'''$.review''',
                ).toString()
            ? getJsonField(
                widget!.productJson,
                r'''$.review''',
              ).toString()
            : '');
    _model.textFieldFocusNode ??= FocusNode();

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FFAppConstants.whiteColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Color(0xFFBABABA),
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget!.screenName == 'daily'
                          ? getJsonField(
                              widget!.productJson,
                              r'''$.varient_image''',
                            ).toString()
                          : getJsonField(
                              widget!.productJson,
                              r'''$.product_image''',
                            ).toString(),
                      width: 90.0,
                      height: 90.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width - 160,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 0.0),
                        child: Text(
                          getJsonField(
                            widget!.productJson,
                            r'''$.product_name''',
                          ).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppConstants.blackColor0A0A0A,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width - 160,
                        height: 40.0,
                        child: RatingBar.builder(
                          onRatingUpdate: (newValue) => safeSetState(
                              () => _model.ratingBarProductValue = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: FFAppConstants.yellowColor,
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBarProductValue ??=
                              getJsonField(
                                        widget!.productJson,
                                        r'''$.rating''',
                                      ) !=
                                      null
                                  ? functions
                                      .setIngeterValue(getJsonField(
                                        widget!.productJson,
                                        r'''$.rating''',
                                      ).toString())
                                      .toDouble()
                                  : 0.0,
                          unratedColor: Color(0xFFDBDADA),
                          itemCount: 5,
                          itemPadding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                          itemSize: 35.0,
                          glowColor: FFAppConstants.yellowColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FFAppConstants.neutralBlackE0E0E0,
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width - 150,
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: false,
                        readOnly: ((FFAppState().qtyZeroCheck ==
                                    getJsonField(
                                      widget!.productJson,
                                      r'''$.rating''',
                                    )) ||
                                (FFAppState().nullValue ==
                                    getJsonField(
                                      widget!.productJson,
                                      r'''$.review''',
                                    ).toString()) || (FFAppState().emptyString ==
                          getJsonField(
                            widget!.productJson,
                            r'''$.review''',
                          ).toString()) ) ==
                            false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FFAppConstants.blackColor0A0A0A,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          hintText: 'Add your review',
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FFAppConstants.blackColor0A0A0A,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                        maxLines: null,
                        keyboardType: TextInputType.name,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  if ((FFAppState().qtyZeroCheck ==
                          getJsonField(
                            widget!.productJson,
                            r'''$.rating''',
                          )) ||
                      (FFAppState().nullValue ==
                          getJsonField(
                            widget!.productJson,
                            r'''$.review''',
                          ).toString()) || (FFAppState().emptyString ==
                          getJsonField(
                            widget!.productJson,
                            r'''$.review''',
                          ).toString()) )
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'RATING_BAR_ITEM_COMPONENT_submitBtn_ON_T');
                          logFirebaseEvent('submitBtn_custom_action');
                          _model.connectivityResult1 =
                              await actions.checkInternetConnection();
                          if (_model.connectivityResult1 == true) {
                            if (_model.ratingBarProductValue! > 0.0) {
                              logFirebaseEvent('submitBtn_backend_call');
                              _model.apiResultmul1 =
                                  await QuickartGroup.addproductratingCall.call(
                                userID: FFAppState().userID,
                                storeid: FFAppState().storeID,
                                rating: _model.ratingBarProductValue?.round(),
                                description: _model.textController.text,
                                varientID: getJsonField(
                                  widget!.productJson,
                                  r'''$.varient_id''',
                                ).toString(),
                                cartID: widget!.screenName == 'daily'
                                    ? getJsonField(
                                        widget!.productJson,
                                        r'''$.order_cart_id''',
                                      ).toString()
                                    : getJsonField(
                                        widget!.productJson,
                                        r'''$.cart_id''',
                                      ).toString(),
                              );

                              if ((_model.apiResultmul1?.succeeded ?? true)) {
                                logFirebaseEvent('submitBtn_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiResultmul1?.jsonBody ?? ''),
                                        r'''$.message''',
                                      ).toString(),
                                      style: GoogleFonts.montserrat(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 850),
                                    backgroundColor:
                                        FFAppConstants.NeutralBlack50Color,
                                  ),
                                );
                              } else {
                                logFirebaseEvent('submitBtn_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      getJsonField(
                                        (_model.apiResultmul1?.jsonBody ?? ''),
                                        r'''$.message''',
                                      ).toString(),
                                      style: GoogleFonts.montserrat(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 850),
                                    backgroundColor:
                                        FFAppConstants.NeutralBlack50Color,
                                  ),
                                );
                              }
                            } else {
                              logFirebaseEvent('submitBtn_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Select product rating',
                                    style: GoogleFonts.montserrat(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 850),
                                  backgroundColor:
                                      FFAppConstants.NeutralBlack50Color,
                                ),
                              );
                            }
                          } else {
                            logFirebaseEvent('submitBtn_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  FFAppConstants.internetString,
                                  style: GoogleFonts.montserrat(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                  ),
                                ),
                                duration: Duration(milliseconds: 850),
                                backgroundColor:
                                    FFAppConstants.NeutralBlack50Color,
                              ),
                            );
                          }

                          safeSetState(() {});
                        },
                        text: 'Submit',
                        options: FFButtonOptions(
                          width: 80.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FFAppConstants.indigoColor,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FFAppConstants.indigoColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
