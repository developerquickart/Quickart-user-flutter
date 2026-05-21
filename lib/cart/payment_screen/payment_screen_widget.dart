import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_screen_model.dart';
export 'payment_screen_model.dart';

class PaymentScreenWidget extends StatefulWidget {
  const PaymentScreenWidget({
    super.key,
    required this.redirectURl,
    required this.screenPName,
    required this.mrp,
    required this.orderType,
  });

  final String? redirectURl;
  final String? screenPName;
  final double? mrp;
  final String? orderType;

  static String routeName = 'PaymentScreen';
  static String routePath = '/paymentScreen';

  @override
  State<PaymentScreenWidget> createState() => _PaymentScreenWidgetState();
}

class _PaymentScreenWidgetState extends State<PaymentScreenWidget> {
  late PaymentScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PaymentScreen'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('PAYMENT_SCREEN_arrow_back_ios_new_ICN_ON');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
            ),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          color: FFAppConstants.appBarIconandTitleColor,
                          fontSize: 19.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                  Text(
                    'Your request is being processed. Please wait and avoid closing this screen.',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          color: FFAppConstants.redDF3F56,
                          fontSize: 11.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                ],
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.WebViewWithUrlChangeHandler(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    initialUrl: widget!.redirectURl!,
                    reloadPage: () async {
                      logFirebaseEvent(
                          'PAYMENT_SCREEN_Container_1u92jr6z_CALLBA');
                      if (widget!.screenPName == 'addCard') {
                        logFirebaseEvent(
                            'WebViewWithUrlChangeHandler_wait__delay');
                        await Future.delayed(
                          Duration(
                            milliseconds: 5000,
                          ),
                        );
                        if (FFAppState().cardScreenNavigation == 'dailyCart') {
                          logFirebaseEvent(
                              'WebViewWithUrlChangeHandler_navigate_to');

                          context.goNamed(DailyCartScreenWidget.routeName);

                          logFirebaseEvent(
                              'WebViewWithUrlChangeHandler_update_app_s');
                          FFAppState().cardScreenNavigation = '';
                          FFAppState().screenName = 'addCard';
                          safeSetState(() {});
                        } else {
                          if (FFAppState().cardScreenNavigation ==
                              'subscriptionCart') {
                            logFirebaseEvent(
                                'WebViewWithUrlChangeHandler_navigate_to');

                            context.goNamed(
                                CartSubscriptionScreenWidget.routeName);

                            logFirebaseEvent(
                                'WebViewWithUrlChangeHandler_update_app_s');
                            FFAppState().isCardChange = true;
                            FFAppState().cardScreenNavigation = '';
                            FFAppState().screenName = 'addCard';
                            safeSetState(() {});
                          } else {
                            logFirebaseEvent(
                                'WebViewWithUrlChangeHandler_wait__delay');
                            await Future.delayed(
                              Duration(
                                milliseconds: 1000,
                              ),
                            );
                            logFirebaseEvent(
                                'WebViewWithUrlChangeHandler_navigate_to');

                            context.goNamed(CardScreenWidget.routeName);
                          }
                        }
                      } else {
                        if (FFAppState().isPaymentSuccess == true) {
                          logFirebaseEvent(
                              'WebViewWithUrlChangeHandler_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                              OrderSuccessFailScreenWidget.routeName);

                          logFirebaseEvent(
                              'WebViewWithUrlChangeHandler_custom_actio');
                          await actions.facebookEventClass(
                            '0',
                            '0',
                            'product',
                            0.0,
                            0,
                            widget!.mrp!,
                            'purchase',
                            FFAppState().emptyJson,
                            '',
                            ' ',
                            ' ',
                            ' ',
                            ' ',
                          );
                          logFirebaseEvent(
                              'WebViewWithUrlChangeHandler_update_app_s');
                          FFAppState().deliveryPartnerInstructionAvoid = '';
                          FFAppState().cartTotalCount = 0;
                          FFAppState().cartTotalPrice = 0.0;
                          FFAppState().cartSavingPrice = 0.0;
                          FFAppState().isCouponApplied = false;
                          FFAppState().screenName = widget!.screenPName!;
                          FFAppState().selectedCardID = '';
                          FFAppState().deleteSelectedAddresID();
                          FFAppState().couponDiscount = 0.0;
                          FFAppState().selectedCardID = '';
                          FFAppState().selectedCardNumber = '';
                          FFAppState().selectedAddress1 = '';
                          FFAppState().update(() {});
                        } else {
                          logFirebaseEvent(
                              'WebViewWithUrlChangeHandler_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text(FFAppState().AppName),
                                content: Text(
                                    'Your payment could not be processed. Please try again or use a different payment method.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          logFirebaseEvent(
                              'WebViewWithUrlChangeHandler_navigate_bac');
                          context.safePop();
                        }
                      }
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
