import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'address_list_screen_model.dart';
export 'address_list_screen_model.dart';

class AddressListScreenWidget extends StatefulWidget {
  const AddressListScreenWidget({super.key});

  static String routeName = 'AddressListScreen';
  static String routePath = '/addressListScreen';

  @override
  State<AddressListScreenWidget> createState() =>
      _AddressListScreenWidgetState();
}

class _AddressListScreenWidgetState extends State<AddressListScreenWidget> {
  late AddressListScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressListScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddressListScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADDRESS_LIST_SCREEN_AddressListScreen_ON');
      logFirebaseEvent('AddressListScreen_update_app_state');
      FFAppState().isAddressChange = true;
      FFAppState().update(() {});
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
            fillColor: Colors.white,
            icon: Icon(
              Icons.chevron_left,
              color: FFAppConstants.appBarIconandTitleColor,
              size: FFAppConstants.appBarIconFont.toDouble(),
            ),
            onPressed: () async {
              logFirebaseEvent('ADDRESS_LIST_SCREEN_chevron_left_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
              logFirebaseEvent('IconButton_google_analytics_event');
              logFirebaseEvent('BackButtonAnalytics');
            },
          ),
          title: Text(
            'Select Address',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
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
                            'ADDRESS_LIST_SCREEN_Row_u862upre_ON_TAP');
                        logFirebaseEvent('Row_navigate_to');

                        context.pushNamed(AddAddressScreenWidget.routeName);

                        logFirebaseEvent('Row_update_app_state');
                        FFAppState().categoryName = 'addAddress';
                        FFAppState().selectedAddressType = '';
                        FFAppState().dialCode = FFAppState().userDialCode;
                        FFAppState().phoneNo = FFAppState().userPhoneNo;
                        FFAppState().selectedAddress = 'Dubai';
                        FFAppState().selectedMapAddress = '';
                        FFAppState().addressLatitude = 0.0;
                        FFAppState().addressLongitude = 0.0;
                        safeSetState(() {});
                        logFirebaseEvent('Row_google_analytics_event');
                        logFirebaseEvent(
                          'Navigation',
                          parameters: {
                            'Screen Name': 'Address List Screen',
                            'Navigating To': 'Add Address Screen',
                          },
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.add,
                              color: Color(0xFF0A0A0A),
                              size: 30.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Add New Address',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF0A0A0A),
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 30.0, 0.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF0A0A0A),
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'Saved Addresses',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Color(0xFF7A7A7A),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: QuickartGroup.showaddressCall.call(
                      userid: FFAppState().userID,
                      storeid: FFAppState().storeID,
                      deviceId: FFAppState().deviceID,
                      platform: isiOS ? 'ios' : 'android',
                    ),
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
                      final listViewShowaddressResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final addressList = getJsonField(
                            listViewShowaddressResponse.jsonBody,
                            r'''$.data''',
                          ).toList();
                          if (addressList.isEmpty) {
                            return Center(
                              child: Image.asset(
                                'assets/images/No_data_available.png',
                              ),
                            );
                          }

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: addressList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, addressListIndex) {
                              final addressListItem =
                                  addressList[addressListIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ADDRESS_LIST_SCREEN_Container_d6wu3kwk_O');
                                  if (FFAppState().screenName != 'profile') {
                                    logFirebaseEvent(
                                        'Container_update_app_state');
                                    FFAppState().isAddressChange = true;
                                    safeSetState(() {});
                                    if (_model.checkAddressExits !=
                                        getJsonField(
                                          addressListItem,
                                          r'''$.cityExists''',
                                        )) {
                                      if (FFAppState().isAddressChange ==
                                          true) {
                                        logFirebaseEvent(
                                            'Container_update_app_state');
                                        FFAppState().selectedAddresID =
                                            getJsonField(
                                          addressListItem,
                                          r'''$.address_id''',
                                        ).toString();
                                        FFAppState().selectedAddressType =
                                            getJsonField(
                                          addressListItem,
                                          r'''$.type''',
                                        ).toString();
                                        FFAppState().kmAway = getJsonField(
                                          addressListItem,
                                          r'''$.away''',
                                        ).toString();
                                        FFAppState().selectedAddress1 =
                                            getJsonField(
                                          addressListItem,
                                          r'''$.house_no''',
                                        ).toString();
                                        FFAppState().isAddressChange = false;
                                        FFAppState().selectedAddress =
                                            getJsonField(
                                          addressListItem,
                                          r'''$.house_no''',
                                        ).toString();
                                        FFAppState().socityName = getJsonField(
                                          addressListItem,
                                          r'''$.society_name''',
                                        ).toString();
                                        FFAppState().doorImageAddress =
                                            getJsonField(
                                          addressListItem,
                                          r'''$.doorimage''',
                                        ).toString();
                                        FFAppState().isDoorImageSelected =
                                            FFAppState().nullValue !=
                                                    getJsonField(
                                                      addressListItem,
                                                      r'''$.doorimage''',
                                                    ).toString()
                                                ? true
                                                : false;
                                        FFAppState().selectedDoorImage =
                                            getJsonField(
                                          addressListItem,
                                          r'''$.doorimage''',
                                        );
                                        FFAppState().selectedAddressJson =
                                            getJsonField(
                                          addressListItem,
                                          r'''$.data''',
                                        );
                                        FFAppState().update(() {});
                                        logFirebaseEvent(
                                            'Container_navigate_back');
                                        context.pop();
                                        logFirebaseEvent(
                                            'Container_google_analytics_event');
                                        logFirebaseEvent(
                                            'IsAddressChangeAnalytics');
                                      }
                                    }
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: (FFAppState().isAddressChange ==
                                                true) &&
                                            (FFAppState().selectedAddresID ==
                                                getJsonField(
                                                  addressListItem,
                                                  r'''$.address_id''',
                                                ).toString())
                                        ? Color(0xFFF6F2FC)
                                        : Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    border: Border.all(
                                      color: (FFAppState().isAddressChange ==
                                                  true) &&
                                              (FFAppState().selectedAddresID ==
                                                  getJsonField(
                                                    addressListItem,
                                                    r'''$.address_id''',
                                                  ).toString())
                                          ? FFAppConstants.indigoColor
                                          : Color(0xFFF5F5F5),
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF6F2FC),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(6.0),
                                                  bottomRight:
                                                      Radius.circular(6.0),
                                                  topLeft: Radius.circular(6.0),
                                                  topRight:
                                                      Radius.circular(6.0),
                                                ),
                                                border: Border.all(
                                                  color: Color(0xFFE4D8F5),
                                                  width: 0.5,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (FFAppState().homeType ==
                                                        getJsonField(
                                                          addressListItem,
                                                          r'''$.type''',
                                                        ).toString())
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.cottage_sharp,
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                            size: 35.0,
                                                          ),
                                                        ),
                                                      ),
                                                    if (FFAppState().workType ==
                                                        getJsonField(
                                                          addressListItem,
                                                          r'''$.type''',
                                                        ).toString())
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.work,
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                            size: 35.0,
                                                          ),
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .otherType ==
                                                        getJsonField(
                                                          addressListItem,
                                                          r'''$.type''',
                                                        ).toString())
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.location_pin,
                                                            color: FFAppConstants
                                                                .indigoColor,
                                                            size: 35.0,
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 0.0, 0.0, 5.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: getJsonField(
                                                            addressListItem,
                                                            r'''$.type''',
                                                          ).toString(),
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
                                                        )
                                                      ],
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
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.67,
                                                  decoration: BoxDecoration(),
                                                  child: Text(
                                                    getJsonField(
                                                      addressListItem,
                                                      r'''$.house_no''',
                                                    ).toString(),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 3,
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
                                                              Color(0xFF3D3D3D),
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
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.63,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: '',
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
                                                                        color: Color(
                                                                            0xFF7E65AC),
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
                                                                TextSpan(
                                                                  text:
                                                                      '${getJsonField(
                                                                    addressListItem,
                                                                    r'''$.country_code''',
                                                                  ).toString()} ${getJsonField(
                                                                    addressListItem,
                                                                    r'''$.receiver_phone''',
                                                                  ).toString()}',
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    color: Color(
                                                                        0xFF3D3D3D),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12.0,
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
                                                                    color: Color(
                                                                        0xFF3D3D3D),
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons.edit,
                                                                color: FFAppConstants
                                                                    .indigoColor,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'ADDRESS_LIST_SCREEN_PAGE_edit_ICN_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'IconButton_navigate_to');

                                                                context.pushNamed(
                                                                    AddAddressScreenWidget
                                                                        .routeName);

                                                                logFirebaseEvent(
                                                                    'IconButton_update_app_state');
                                                                FFAppState()
                                                                        .categoryName =
                                                                    'editAddress';
                                                                FFAppState()
                                                                        .addressModel =
                                                                    addressListItem;
                                                                FFAppState()
                                                                        .selectedAddressType =
                                                                    getJsonField(
                                                                  addressListItem,
                                                                  r'''$.type''',
                                                                ).toString();
                                                                FFAppState()
                                                                        .phoneNo =
                                                                    getJsonField(
                                                                  addressListItem,
                                                                  r'''$.receiver_phone''',
                                                                ).toString();
                                                                FFAppState()
                                                                        .countryCode =
                                                                    getJsonField(
                                                                  addressListItem,
                                                                  r'''$.country_code''',
                                                                ).toString();
                                                                FFAppState()
                                                                        .selectedAddress =
                                                                    getJsonField(
                                                                  addressListItem,
                                                                  r'''$.society_name''',
                                                                ).toString();
                                                                FFAppState()
                                                                    .dialCode = _model
                                                                            .nullValue ==
                                                                        getJsonField(
                                                                          addressListItem,
                                                                          r'''$.dial_code''',
                                                                        ).toString()
                                                                    ? 'AE'
                                                                    : getJsonField(
                                                                        addressListItem,
                                                                        r'''$.dial_code''',
                                                                      ).toString();
                                                                FFAppState()
                                                                        .latLang =
                                                                    functions.convertStringToLatLng(
                                                                        getJsonField(
                                                                          addressListItem,
                                                                          r'''$.lat''',
                                                                        ).toString(),
                                                                        getJsonField(
                                                                          addressListItem,
                                                                          r'''$.lng''',
                                                                        ).toString());
                                                                FFAppState()
                                                                        .selectedMapAddress =
                                                                    getJsonField(
                                                                  addressListItem,
                                                                  r'''$.society_name''',
                                                                ).toString();
                                                                FFAppState()
                                                                        .addressLatitude =
                                                                    functions
                                                                        .stringToDouble(
                                                                            getJsonField(
                                                                  addressListItem,
                                                                  r'''$.lat''',
                                                                ).toString());
                                                                FFAppState()
                                                                        .addressLongitude =
                                                                    functions
                                                                        .stringToDouble(
                                                                            getJsonField(
                                                                  FFAppState()
                                                                      .addressModel,
                                                                  r'''$.lng''',
                                                                ).toString());
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'IconButton_google_analytics_event');
                                                                logFirebaseEvent(
                                                                  'Navigation',
                                                                  parameters: {
                                                                    'Screen Name':
                                                                        'Address List Screen',
                                                                    'Navigating To':
                                                                        'Add Address Screen',
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons.delete,
                                                                color: FFAppConstants
                                                                    .indigoColor,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'ADDRESS_LIST_SCREEN_delete_ICN_ON_TAP');
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
                                                                              content: Text('Do you want to delete address?'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('Cancel'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('OK'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  logFirebaseEvent(
                                                                      'IconButton_custom_action');
                                                                  _model.connectivityResult =
                                                                      await actions
                                                                          .checkInternetConnection();
                                                                  if (_model
                                                                          .connectivityResult ==
                                                                      true) {
                                                                    logFirebaseEvent(
                                                                        'IconButton_backend_call');
                                                                    _model.apiResultDeleteAddress =
                                                                        await QuickartGroup
                                                                            .removeaddressCall
                                                                            .call(
                                                                      userid: FFAppState()
                                                                          .userID,
                                                                      addressID:
                                                                          getJsonField(
                                                                        addressListItem,
                                                                        r'''$.address_id''',
                                                                      ).toString(),
                                                                      deviceId:
                                                                          FFAppState()
                                                                              .deviceID,
                                                                      platform: isiOS
                                                                          ? 'ios'
                                                                          : 'android',
                                                                    );

                                                                    if ((_model
                                                                            .apiResultDeleteAddress
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      logFirebaseEvent(
                                                                          'IconButton_show_snack_bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            getJsonField(
                                                                              (_model.apiResultDeleteAddress?.jsonBody ?? ''),
                                                                              r'''$.message''',
                                                                            ).toString(),
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FFAppConstants.NeutralBlack50Color,
                                                                        ),
                                                                      );
                                                                      if ((FFAppState().selectedAddresID ==
                                                                              getJsonField(
                                                                                addressListItem,
                                                                                r'''$.address_id''',
                                                                              ).toString()) &&
                                                                          (FFAppState().selectedAddress1 ==
                                                                              getJsonField(
                                                                                addressListItem,
                                                                                r'''$.house_no''',
                                                                              ).toString())) {
                                                                        logFirebaseEvent(
                                                                            'IconButton_update_app_state');
                                                                        FFAppState()
                                                                            .deleteSelectedAddresID();
                                                                        FFAppState().selectedAddresID =
                                                                            '';

                                                                        FFAppState().selectedAddress1 =
                                                                            '';
                                                                        FFAppState().selectedAddress =
                                                                            'Dubai';
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        logFirebaseEvent(
                                                                            'IconButton_google_analytics_event');
                                                                        logFirebaseEvent(
                                                                          'Remove Address',
                                                                          parameters: {
                                                                            'Screen Name':
                                                                                'Address List Screen',
                                                                            'API Name':
                                                                                'Remove Address',
                                                                          },
                                                                        );
                                                                      }
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'IconButton_show_snack_bar');
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            getJsonField(
                                                                              (_model.apiResultDeleteAddress?.jsonBody ?? ''),
                                                                              r'''$.message''',
                                                                            ).toString(),
                                                                            style:
                                                                                GoogleFonts.montserrat(
                                                                              color: FFAppConstants.blackColor0A0A0A,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 24.0,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FFAppConstants.NeutralBlack50Color,
                                                                        ),
                                                                      );
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'IconButton_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          FFAppConstants
                                                                              .internetString,
                                                                          style:
                                                                              GoogleFonts.montserrat(
                                                                            color:
                                                                                FFAppConstants.blackColor0A0A0A,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FFAppConstants.NeutralBlack50Color,
                                                                      ),
                                                                    );
                                                                  }
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (_model.checkAddressExits ==
                                          getJsonField(
                                            addressListItem,
                                            r'''$.cityExists''',
                                          ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            'This address is not serviceable in these areas.',
                                            textAlign: TextAlign.start,
                                            maxLines: 3,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color:
                                                      FFAppConstants.redDF3F56,
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
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
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
