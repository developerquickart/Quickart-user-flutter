import '/components/custom_alert_dailog/custom_alert_dailog_widget.dart';
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
import 'total_pay_s_d_k_payment_screen_model.dart';
export 'total_pay_s_d_k_payment_screen_model.dart';

class TotalPaySDKPaymentScreenWidget extends StatefulWidget {
  const TotalPaySDKPaymentScreenWidget({
    super.key,
    required this.checkoutUrl,
    required this.cookies,
    required this.successUrl,
    required this.cancelUrl,
    required this.mrp,
  });

  final String? checkoutUrl;
  final String? cookies;
  final String? successUrl;
  final String? cancelUrl;
  final String? mrp;

  static String routeName = 'TotalPaySDKPaymentScreen';
  static String routePath = '/totalPaySDKPaymentScreen';

  @override
  State<TotalPaySDKPaymentScreenWidget> createState() =>
      _TotalPaySDKPaymentScreenWidgetState();
}

class _TotalPaySDKPaymentScreenWidgetState
    extends State<TotalPaySDKPaymentScreenWidget> {
  late TotalPaySDKPaymentScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TotalPaySDKPaymentScreenModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TotalPaySDKPaymentScreen'});
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
                  logFirebaseEvent('TOTAL_PAY_S_D_K_PAYMENT_SCREEN_arrow_bac');
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
                Builder(
                  builder: (context) => Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: custom_widgets.TotalPayCheckoutWebView(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      checkoutUrl: widget!.checkoutUrl!,
                      cookies: widget!.cookies!,
                      reloadPage: () async {
                        logFirebaseEvent(
                            'TOTAL_PAY_S_D_K_PAYMENT_SCREEN_Container');
                        if (widget!.cookies == 'addCard') {
                          logFirebaseEvent(
                              'TotalPayCheckoutWebView_wait__delay');
                          await Future.delayed(
                            Duration(
                              milliseconds: 5000,
                            ),
                          );
                          if (FFAppState().cardScreenNavigation ==
                              'dailyCart') {
                            logFirebaseEvent(
                                'TotalPayCheckoutWebView_navigate_to');

                            context.goNamed(DailyCartScreenWidget.routeName);

                            logFirebaseEvent(
                                'TotalPayCheckoutWebView_update_app_state');
                            FFAppState().cardScreenNavigation = '';
                            FFAppState().screenName = 'addCard';
                            safeSetState(() {});
                          } else {
                            if (FFAppState().cardScreenNavigation ==
                                'subscriptionCart') {
                              logFirebaseEvent(
                                  'TotalPayCheckoutWebView_navigate_to');

                              context.goNamed(
                                  CartSubscriptionScreenWidget.routeName);

                              logFirebaseEvent(
                                  'TotalPayCheckoutWebView_update_app_state');
                              FFAppState().isCardChange = true;
                              FFAppState().cardScreenNavigation = '';
                              FFAppState().screenName = 'addCard';
                              safeSetState(() {});
                            } else {
                              logFirebaseEvent(
                                  'TotalPayCheckoutWebView_wait__delay');
                              await Future.delayed(
                                Duration(
                                  milliseconds: 1000,
                                ),
                              );
                              logFirebaseEvent(
                                  'TotalPayCheckoutWebView_navigate_to');

                              context.goNamed(CardScreenWidget.routeName);
                            }
                          }
                        } else {
                          if (FFAppState().isPaymentSuccess == true) {
                            logFirebaseEvent(
                                'TotalPayCheckoutWebView_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                                OrderSuccessFailScreenWidget.routeName);

                            logFirebaseEvent(
                                'TotalPayCheckoutWebView_custom_action');
                            await actions.facebookEventClass(
                              '0',
                              '0',
                              'product',
                              0.0,
                              0,
                              double.parse((widget!.mrp!)),
                              'purchase',
                              FFAppState().emptyJson,
                              '',
                              ' ',
                              ' ',
                              ' ',
                              ' ',
                            );
                            logFirebaseEvent(
                                'TotalPayCheckoutWebView_update_app_state');
                            FFAppState().deliveryPartnerInstructionAvoid = '';
                            FFAppState().cartTotalCount = 0;
                            FFAppState().cartTotalPrice = 0.0;
                            FFAppState().cartSavingPrice = 0.0;
                            FFAppState().isCouponApplied = false;
                            FFAppState().screenName = widget!.cookies!;
                            FFAppState().selectedCardID = '';
                            FFAppState().deleteSelectedAddresID();
                            FFAppState().selectedAddresID = '';

                            FFAppState().selectedCardNumber = '';
                            FFAppState().selectedAddress1 = '';
                            FFAppState().update(() {});
                          } else {
                            logFirebaseEvent(
                                'TotalPayCheckoutWebView_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(dialogContext).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: CustomAlertDailogWidget(
                                      des:
                                          'Your payment could not be processed. Please try again or use a different payment method.',
                                      height: 120.0,
                                      title: ' ',
                                    ),
                                  ),
                                );
                              },
                            );

                            logFirebaseEvent(
                                'TotalPayCheckoutWebView_navigate_back');
                            context.safePop();
                          }
                        }
                      },
                    ),
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
