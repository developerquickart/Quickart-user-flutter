import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'brand_list_screen_model.dart';
export 'brand_list_screen_model.dart';

class BrandListScreenWidget extends StatefulWidget {
  const BrandListScreenWidget({super.key});

  static String routeName = 'BrandListScreen';
  static String routePath = '/brandListScreen';

  @override
  State<BrandListScreenWidget> createState() => _BrandListScreenWidgetState();
}

class _BrandListScreenWidgetState extends State<BrandListScreenWidget> {
  late BrandListScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrandListScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BrandListScreen'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              logFirebaseEvent('BRAND_LIST_SCREEN_chevron_left_ICN_ON_TA');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Brands',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??=
                            Completer<ApiCallResponse>()
                              ..complete(QuickartGroup.brandlistCall.call()))
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
                      final gridViewBrandlistResponse = snapshot.data!;

                      return Builder(
                        builder: (context) {
                          final brandList = getJsonField(
                            gridViewBrandlistResponse.jsonBody,
                            r'''$.data''',
                          ).toList();
                          if (brandList.isEmpty) {
                            return Center(
                              child: Image.asset(
                                'assets/images/No_data_available.png',
                              ),
                            );
                          }

                          return RefreshIndicator(
                            onRefresh: () async {
                              logFirebaseEvent(
                                  'BRAND_LIST_SCREEN_GridView_w6d1219q_ON_P');
                              logFirebaseEvent(
                                  'GridView_refresh_database_request');
                              safeSetState(
                                  () => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            },
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 15.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.1,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: brandList.length,
                              itemBuilder: (context, brandListIndex) {
                                final brandListItem = brandList[brandListIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'BRAND_LIST_SCREEN_Container_xdqjj1or_ON_');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                        BrandProductListScreenWidget.routeName);

                                    logFirebaseEvent(
                                        'Container_update_app_state');
                                    FFAppState().searchText = getJsonField(
                                      brandListItem,
                                      r'''$.title''',
                                    ).toString();
                                    FFAppState().brandID = getJsonField(
                                      brandListItem,
                                      r'''$.cat_id''',
                                    ).toString();
                                    FFAppState().searchScreenNaviagtion = '';
                                    FFAppState().update(() {});
                                    logFirebaseEvent(
                                        'Container_google_analytics_event');
                                    logFirebaseEvent(
                                        'SearchResultScreenAnalytics');
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 130.0,
                                    decoration: BoxDecoration(
                                      color: FFAppConstants.whiteColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color:
                                            FFAppConstants.neutralWhiteF5F5F5,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              brandListItem,
                                              r'''$.image''',
                                            )?.toString(),
                                            'https://tenor.com/en-GB/view/free-loader-gif-25681495',
                                          ),
                                          width: 100.0,
                                          height: 130.0,
                                          fit: BoxFit.contain,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
