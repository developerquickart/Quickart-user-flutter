import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_again_list_view_model.dart';
export 'order_again_list_view_model.dart';

class OrderAgainListViewWidget extends StatefulWidget {
  const OrderAgainListViewWidget({
    super.key,
    required this.orderList,
  });

  final dynamic orderList;

  @override
  State<OrderAgainListViewWidget> createState() =>
      _OrderAgainListViewWidgetState();
}

class _OrderAgainListViewWidgetState extends State<OrderAgainListViewWidget> {
  late OrderAgainListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderAgainListViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final orderList = widget!.orderList!.toList();

        return ListView.separated(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: orderList.length,
          separatorBuilder: (_, __) => SizedBox(width: 5.0),
          itemBuilder: (context, orderListIndex) {
            final orderListItem = orderList[orderListIndex];
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('ORDER_AGAIN_LIST_VIEW_Container_1tqcm1mc');
                if (_model.orderSType ==
                    getJsonField(
                      orderListItem,
                      r'''$.type''',
                    ).toString()) {
                  logFirebaseEvent('Container_navigate_to');

                  context.pushNamed(OrderTrackingPageWidget.routeName);

                  logFirebaseEvent('Container_update_app_state');
                  FFAppState().groupID = getJsonField(
                    orderListItem,
                    r'''$.group_id''',
                  ).toString();
                  FFAppState().screenName = 'dashboard';
                  safeSetState(() {});
                  logFirebaseEvent('Container_google_analytics_event');
                  logFirebaseEvent(
                    'Navigation',
                    parameters: {
                      'Screen Name': 'Dashboard Screen',
                      'Navigate To': 'Order Tracking Screen',
                    },
                  );
                } else {
                  logFirebaseEvent('Container_update_app_state');
                  FFAppState().cartID = getJsonField(
                    orderListItem,
                    r'''$.group_id''',
                  ).toString();
                  logFirebaseEvent('Container_navigate_to');

                  context.pushNamed(
                    SubscriptionOrderProductsWidget.routeName,
                    queryParameters: {
                      'orderDate': serializeParam(
                        '2025-03-04T18:30:00.000Z',
                        ParamType.String,
                      ),
                      'orderPrice': serializeParam(
                        '54.34',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );

                  logFirebaseEvent('Container_google_analytics_event');
                  logFirebaseEvent(
                    'Navigation',
                    parameters: {
                      'Screen Name': 'Dashboard Screen',
                      'Navigate To': 'Subscription Order Info Screen',
                    },
                  );
                }
              },
              child: Container(
                width: 70.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: FFAppConstants.primaryPurpleE4D8F5,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            getJsonField(
                              orderListItem,
                              r'''$.prodList[0].varient_image''',
                            ).toString(),
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.png',
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: MediaQuery.sizeOf(context).height * 0.8,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (functions.getArrayCount(getJsonField(
                          orderListItem,
                          r'''$.prodList''',
                        )) !=
                        '0')
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: double.infinity,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: Color(0x7314181B),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  functions.getArrayCount(getJsonField(
                                    orderListItem,
                                    r'''$.prodList''',
                                  ))!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FFAppConstants.whiteColor,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  functions.getArrayCount(getJsonField(
                                            orderListItem,
                                            r'''$.prodList''',
                                          )) ==
                                          '1'
                                      ? ' Product'
                                      : ' Products',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FFAppConstants.whiteColor,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
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
            );
          },
        );
      },
    );
  }
}
