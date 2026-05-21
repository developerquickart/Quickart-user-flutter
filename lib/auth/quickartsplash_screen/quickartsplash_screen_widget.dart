import '/backend/api_requests/api_calls.dart';
import '/components/custom_retry_alert/custom_retry_alert_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quickartsplash_screen_model.dart';
export 'quickartsplash_screen_model.dart';

///
class QuickartsplashScreenWidget extends StatefulWidget {
  const QuickartsplashScreenWidget({super.key});

  static String routeName = 'QuickartsplashScreen';
  static String routePath = '/quickartsplashScreen';

  @override
  State<QuickartsplashScreenWidget> createState() =>
      _QuickartsplashScreenWidgetState();
}

class _QuickartsplashScreenWidgetState
    extends State<QuickartsplashScreenWidget> {
  late QuickartsplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late String imageVersion;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuickartsplashScreenModel());
    imageVersion = DateTime.now().millisecondsSinceEpoch.toString();

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'QuickartsplashScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      logFirebaseEvent('QUICKARTSPLASH_SCREEN_QuickartsplashScre');
      logFirebaseEvent('QuickartsplashScreen_custom_action');
      _model.connectivityResultCopy = await actions.checkInternetConnection();
      logFirebaseEvent('QuickartsplashScreen_custom_action');
      await actions.saveLoginData(
        '0',
        false,
        'no',
        '7',
        FFAppState().appInfo,
        ' ',
        ' ',
        ' ',
        ' ',
      );
      logFirebaseEvent('QuickartsplashScreen_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      logFirebaseEvent('QuickartsplashScreen_custom_action');
      _model.fcmTokenNew = await actions.getFcmToken();
      if (_model.connectivityResultCopy == true) {
        logFirebaseEvent('QuickartsplashScreen_custom_action');
        await actions.getDeviceID();
        logFirebaseEvent('QuickartsplashScreen_custom_action');
        await actions.requestAppTracking();
        if (isiOS) {
          logFirebaseEvent('QuickartsplashScreen_update_app_state');
          FFAppState().platform = 'ios';
          FFAppState().fcmToken =
              _model.fcmTokenNew != null && _model.fcmTokenNew != ''
                  ? _model.fcmTokenNew!
                  : ' ';
          safeSetState(() {});
          if (FFAppState().isUserLogin == true) {
            logFirebaseEvent('QuickartsplashScreen_backend_call');
            _model.apiResultzwxIOS = await QuickartGroup.appinfoCall.call(
              userid: FFAppState().userID,
              stroreid: FFAppState().storeID,
              platform: 'ios',
              fcmToken: _model.fcmTokenNew,
              deviceid: FFAppState().deviceID,
            );

            if ((_model.apiResultzwxIOS?.succeeded ?? true)) {
              if (FFAppConstants.appVersioniOS !=
                  getJsonField(
                    (_model.apiResultzwxIOS?.jsonBody ?? ''),
                    r'''$.data.version''',
                  ).toString()) {
                logFirebaseEvent('QuickartsplashScreen_update_app_state');
                FFAppState().appInfo = getJsonField(
                  (_model.apiResultzwxIOS?.jsonBody ?? ''),
                  r'''$.data''',
                );
                FFAppState().updateContainer = true;
                FFAppState().userWalletstr = getJsonField(
                  (_model.apiResultzwxIOS?.jsonBody ?? ''),
                  r'''$.data.userwallet''',
                ).toString();
                FFAppState().dashboardBanner = getJsonField(
                  (_model.apiResultzwxIOS?.jsonBody ?? ''),
                  r'''$.oneapi_bg_first_image''',
                ).toString();
                FFAppState().trialPackBannerImage = getJsonField(
                  (_model.apiResultzwxIOS?.jsonBody ?? ''),
                  r'''$.trailpackimage''',
                ).toString();
                FFAppState().isPopUpShow = true;
                FFAppState().update(() {});
                logFirebaseEvent('QuickartsplashScreen_custom_action');
                await actions.saveLoginData(
                  '0',
                  true,
                  'yes',
                  '7',
                  getJsonField(
                    (_model.apiResultzwxIOS?.jsonBody ?? ''),
                    r'''$.data''',
                  ),
                  getJsonField(
                    (_model.apiResultzwxIOS?.jsonBody ?? ''),
                    r'''$.data.userwallet''',
                  ).toString(),
                  getJsonField(
                    (_model.apiResultzwxIOS?.jsonBody ?? ''),
                    r'''$.oneapi_bg_first_image.home_bg_image''',
                  ).toString(),
                  '0',
                  '0',
                );
                logFirebaseEvent('QuickartsplashScreen_wait__delay');
                await Future.delayed(
                  Duration(
                    milliseconds: 4000,
                  ),
                );
                logFirebaseEvent('QuickartsplashScreen_navigate_to');

                context.goNamed(DashboardScreenWidget.routeName);
              } else {
                logFirebaseEvent('QuickartsplashScreen_update_app_state');
                FFAppState().appInfo = getJsonField(
                  (_model.apiResultzwxIOS?.jsonBody ?? ''),
                  r'''$.data''',
                );
                FFAppState().updateContainer = false;
                FFAppState().userWalletstr = getJsonField(
                  (_model.apiResultzwxIOS?.jsonBody ?? ''),
                  r'''$.data.userwallet''',
                ).toString();
                FFAppState().dashboardBanner = getJsonField(
                  (_model.apiResultzwxIOS?.jsonBody ?? ''),
                  r'''$.oneapi_bg_first_image''',
                ).toString();
                FFAppState().trialPackBannerImage = '';
                FFAppState().isPopUpShow = true;
                FFAppState().update(() {});
                logFirebaseEvent('QuickartsplashScreen_custom_action');
                await actions.saveLoginData(
                  '0',
                  true,
                  'yes',
                  '7',
                  getJsonField(
                    (_model.apiResultzwxIOS?.jsonBody ?? ''),
                    r'''$.data''',
                  ),
                  getJsonField(
                    (_model.apiResultzwxIOS?.jsonBody ?? ''),
                    r'''$.data.userwallet''',
                  ).toString(),
                  getJsonField(
                    (_model.apiResultzwxIOS?.jsonBody ?? ''),
                    r'''$.oneapi_bg_first_image.home_bg_image''',
                  ).toString(),
                  '0',
                  '0',
                );
                logFirebaseEvent('QuickartsplashScreen_wait__delay');
                await Future.delayed(
                  Duration(
                    milliseconds: 4000,
                  ),
                );
                logFirebaseEvent('QuickartsplashScreen_navigate_to');

                context.goNamed(DashboardScreenWidget.routeName);
              }
            } else {
              logFirebaseEvent('QuickartsplashScreen_alert_dialog');
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
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: CustomRetryAlertWidget(
                        height: 200.0,
                        des: 'Something went wrong. Please try again',
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            logFirebaseEvent('QuickartsplashScreen_backend_call');
            _model.apiResultso1IOS = await QuickartGroup.appinfoCall.call(
              userid: FFAppState().userID,
              stroreid: FFAppState().storeID,
              platform: 'ios',
              fcmToken: _model.fcmTokenNew,
              deviceid: FFAppState().deviceID,
            );

            if ((_model.apiResultso1IOS?.succeeded ?? true)) {
              if (FFAppConstants.appVersioniOS !=
                  getJsonField(
                    (_model.apiResultso1IOS?.jsonBody ?? ''),
                    r'''$.data.version''',
                  ).toString()) {
                logFirebaseEvent('QuickartsplashScreen_update_app_state');
                FFAppState().appInfo = getJsonField(
                  (_model.apiResultso1IOS?.jsonBody ?? ''),
                  r'''$.data''',
                );
                FFAppState().updateContainer = true;
                FFAppState().userWalletstr = getJsonField(
                  (_model.apiResultso1IOS?.jsonBody ?? ''),
                  r'''$.data.userwallet''',
                ).toString();
                FFAppState().dashboardBanner = getJsonField(
                  (_model.apiResultso1IOS?.jsonBody ?? ''),
                  r'''$.oneapi_bg_first_image''',
                ).toString();
                FFAppState().trialPackBannerImage = getJsonField(
                  (_model.apiResultso1IOS?.jsonBody ?? ''),
                  r'''$.trailpackimage''',
                ).toString();
                FFAppState().isPopUpShow = true;
                FFAppState().update(() {});
                logFirebaseEvent('QuickartsplashScreen_wait__delay');
                await Future.delayed(
                  Duration(
                    milliseconds: 4000,
                  ),
                );
                logFirebaseEvent('QuickartsplashScreen_navigate_to');

                context.goNamed(IntroScreenWidget.routeName);
              } else {
                logFirebaseEvent('QuickartsplashScreen_update_app_state');
                FFAppState().appInfo = getJsonField(
                  (_model.apiResultso1IOS?.jsonBody ?? ''),
                  r'''$.data''',
                );
                FFAppState().updateContainer = false;
                FFAppState().userWalletstr = getJsonField(
                  (_model.apiResultso1IOS?.jsonBody ?? ''),
                  r'''$.data.userwallet''',
                ).toString();
                FFAppState().dashboardBanner = getJsonField(
                  (_model.apiResultso1IOS?.jsonBody ?? ''),
                  r'''$.oneapi_bg_first_image''',
                ).toString();
                FFAppState().trialPackBannerImage = getJsonField(
                  (_model.apiResultso1IOS?.jsonBody ?? ''),
                  r'''$.trailpackimage''',
                ).toString();
                FFAppState().isPopUpShow = true;
                FFAppState().update(() {});
                logFirebaseEvent('QuickartsplashScreen_wait__delay');
                await Future.delayed(
                  Duration(
                    milliseconds: 4000,
                  ),
                );
                logFirebaseEvent('QuickartsplashScreen_navigate_to');

                context.goNamed(IntroScreenWidget.routeName);
              }
            } else {
              logFirebaseEvent('QuickartsplashScreen_alert_dialog');
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
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: CustomRetryAlertWidget(
                        height: 200.0,
                        des: 'Something went wrong. Please try again',
                      ),
                    ),
                  );
                },
              );
            }
          }
        } else {
          if (isAndroid) {
            logFirebaseEvent('QuickartsplashScreen_update_app_state');
            FFAppState().platform = 'android';
            FFAppState().fcmToken = _model.fcmTokenNew!;
            safeSetState(() {});
          } else {
            logFirebaseEvent('QuickartsplashScreen_update_app_state');
            FFAppState().platform = 'web';
            FFAppState().fcmToken = _model.fcmTokenNew!;
            safeSetState(() {});
          }

          if ((FFAppState().isUserLogin == true) &&
              (FFAppState().userID != null && FFAppState().userID != '')) {
            logFirebaseEvent('QuickartsplashScreen_backend_call');
            _model.apiResultAppInfo3 = await QuickartGroup.appinfoCall.call(
              userid: FFAppState().userID,
              stroreid: FFAppState().storeID,
              platform: FFAppState().platform,
              deviceid: FFAppState().deviceID,
              fcmToken: FFAppState().fcmToken,
            );

            if ((_model.apiResultAppInfo3?.succeeded ?? true)) {
              if (FFAppConstants.appVersionAndroid !=
                  getJsonField(
                    (_model.apiResultAppInfo3?.jsonBody ?? ''),
                    r'''$.data.version''',
                  ).toString()) {
                logFirebaseEvent('QuickartsplashScreen_update_app_state');
                FFAppState().appInfo = getJsonField(
                  (_model.apiResultAppInfo3?.jsonBody ?? ''),
                  r'''$.data''',
                );
                FFAppState().updateContainer = true;
                FFAppState().userWalletstr = getJsonField(
                  (_model.apiResultAppInfo3?.jsonBody ?? ''),
                  r'''$.data.userwallet''',
                ).toString();
                FFAppState().dashboardBanner = getJsonField(
                  (_model.apiResultAppInfo3?.jsonBody ?? ''),
                  r'''$.oneapi_bg_first_image.home_bg_image''',
                ).toString();
                FFAppState().trialPackBannerImage = getJsonField(
                  (_model.apiResultAppInfo3?.jsonBody ?? ''),
                  r'''$.trailpackimage''',
                ).toString();
                FFAppState().isPopUpShow = true;
                FFAppState().update(() {});
                logFirebaseEvent('QuickartsplashScreen_custom_action');
                await actions.saveLoginData(
                  '0',
                  true,
                  'yes',
                  '7',
                  getJsonField(
                    (_model.apiResultAppInfo3?.jsonBody ?? ''),
                    r'''$.data''',
                  ),
                  getJsonField(
                    (_model.apiResultAppInfo3?.jsonBody ?? ''),
                    r'''$.data.userwallet''',
                  ).toString(),
                  getJsonField(
                    (_model.apiResultAppInfo3?.jsonBody ?? ''),
                    r'''$.oneapi_bg_first_image.home_bg_image''',
                  ).toString(),
                  getJsonField(
                    (_model.apiResultAppInfo3?.jsonBody ?? ''),
                    r'''$.trailpackimage''',
                  ).toString(),
                  '0',
                );
                logFirebaseEvent('QuickartsplashScreen_wait__delay');
                await Future.delayed(
                  Duration(
                    milliseconds: 4000,
                  ),
                );
                logFirebaseEvent('QuickartsplashScreen_navigate_to');

                context.goNamed(DashboardScreenWidget.routeName);
              } else {
                logFirebaseEvent('QuickartsplashScreen_update_app_state');
                FFAppState().appInfo = QuickartGroup.appinfoCall.data(
                  (_model.apiResultAppInfo3?.jsonBody ?? ''),
                );
                FFAppState().updateContainer = false;
                FFAppState().userWalletstr = getJsonField(
                  (_model.apiResultAppInfo3?.jsonBody ?? ''),
                  r'''$.data.userwallet''',
                ).toString();
                FFAppState().dashboardBanner = getJsonField(
                  (_model.apiResultAppInfo3?.jsonBody ?? ''),
                  r'''$.oneapi_bg_first_image''',
                ).toString();
                FFAppState().trialPackBannerImage = getJsonField(
                  (_model.apiResultAppInfo3?.jsonBody ?? ''),
                  r'''$.trailpackimage''',
                ).toString();
                FFAppState().isPopUpShow = true;
                FFAppState().update(() {});
                logFirebaseEvent('QuickartsplashScreen_custom_action');
                await actions.saveLoginData(
                  '0',
                  true,
                  'yes',
                  '7',
                  getJsonField(
                    (_model.apiResultAppInfo3?.jsonBody ?? ''),
                    r'''$.data''',
                  ),
                  getJsonField(
                    (_model.apiResultAppInfo3?.jsonBody ?? ''),
                    r'''$.data.userwallet''',
                  ).toString(),
                  getJsonField(
                    (_model.apiResultAppInfo3?.jsonBody ?? ''),
                    r'''$.oneapi_bg_first_image.home_bg_image''',
                  ).toString(),
                  getJsonField(
                    (_model.apiResultAppInfo3?.jsonBody ?? ''),
                    r'''$.trailpackimage''',
                  ).toString(),
                  '0',
                );
                logFirebaseEvent('QuickartsplashScreen_wait__delay');
                await Future.delayed(
                  Duration(
                    milliseconds: 4000,
                  ),
                );
                logFirebaseEvent('QuickartsplashScreen_navigate_to');

                context.goNamed(DashboardScreenWidget.routeName);
              }
            } else {
              logFirebaseEvent('QuickartsplashScreen_alert_dialog');
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
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: CustomRetryAlertWidget(
                        height: 200.0,
                        des: 'Something went wrong. Please try again',
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            logFirebaseEvent('QuickartsplashScreen_backend_call');
            _model.apiResultAppInfo4 = await QuickartGroup.appinfoCall.call(
              userid: FFAppState().userID,
              stroreid: FFAppState().storeID,
              platform: FFAppState().platform,
              deviceid: FFAppState().deviceID,
              fcmToken: FFAppState().fcmToken,
            );

            if ((_model.apiResultAppInfo4?.succeeded ?? true)) {
              if (FFAppConstants.appVersionAndroid !=
                  getJsonField(
                    (_model.apiResultAppInfo4?.jsonBody ?? ''),
                    r'''$.data.version''',
                  ).toString()) {
                logFirebaseEvent('QuickartsplashScreen_update_app_state');
                FFAppState().appInfo = getJsonField(
                  (_model.apiResultAppInfo4?.jsonBody ?? ''),
                  r'''$.data''',
                );
                FFAppState().updateContainer = true;
                FFAppState().userWalletstr = getJsonField(
                  (_model.apiResultAppInfo4?.jsonBody ?? ''),
                  r'''$.data.userwallet''',
                ).toString();
                FFAppState().dashboardBanner = getJsonField(
                  (_model.apiResultAppInfo4?.jsonBody ?? ''),
                  r'''$.oneapi_bg_first_image''',
                ).toString();
                FFAppState().trialPackBannerImage = getJsonField(
                  (_model.apiResultAppInfo4?.jsonBody ?? ''),
                  r'''$.trailpackimage''',
                ).toString();
                FFAppState().isPopUpShow = true;
                FFAppState().update(() {});
                logFirebaseEvent('QuickartsplashScreen_wait__delay');
                await Future.delayed(
                  Duration(
                    milliseconds: 4000,
                  ),
                );
                logFirebaseEvent('QuickartsplashScreen_navigate_to');

                context.goNamed(IntroScreenWidget.routeName);
              } else {
                logFirebaseEvent('QuickartsplashScreen_update_app_state');
                FFAppState().appInfo = getJsonField(
                  (_model.apiResultAppInfo4?.jsonBody ?? ''),
                  r'''$.data''',
                );
                FFAppState().updateContainer = false;
                FFAppState().userWalletstr = getJsonField(
                  (_model.apiResultAppInfo4?.jsonBody ?? ''),
                  r'''$.data.userwallet''',
                ).toString();
                FFAppState().dashboardBanner = getJsonField(
                  (_model.apiResultAppInfo4?.jsonBody ?? ''),
                  r'''$.oneapi_bg_first_image''',
                ).toString();
                FFAppState().trialPackBannerImage = getJsonField(
                  (_model.apiResultAppInfo4?.jsonBody ?? ''),
                  r'''$.trailpackimage''',
                ).toString();
                FFAppState().isPopUpShow = true;
                FFAppState().update(() {});
                logFirebaseEvent('QuickartsplashScreen_wait__delay');
                await Future.delayed(
                  Duration(
                    milliseconds: 4000,
                  ),
                );
                logFirebaseEvent('QuickartsplashScreen_navigate_to');

                context.goNamed(IntroScreenWidget.routeName);
              }
            } else {
              logFirebaseEvent('QuickartsplashScreen_alert_dialog');
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
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: CustomRetryAlertWidget(
                        height: 200.0,
                        des: 'Something went wrong. Please try again',
                      ),
                    ),
                  );
                },
              );
            }
          }
        }
      } else {
        logFirebaseEvent('QuickartsplashScreen_alert_dialog');
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
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: CustomRetryAlertWidget(
                  height: 210.0,
                  des: FFAppConstants.internetString,
                ),
              ),
            );
          },
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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 200.0, 0.0, 0.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 270),
                          curve: Curves.easeOut,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/QuicKart_New_Final.png',
                                width: 0.0,
                                height: 0.0,
                                fit: BoxFit.contain,
                                alignment: Alignment(0.0, 0.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 100.0,
                      child: custom_widgets.LifecycleWrapper(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 100.0,
                        child: Icon(
                          FFIcons.khome1,
                          color: FFAppConstants.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://quickart.b-cdn.net/images/app-home-loadernew.gif?v=$imageVersion',
                  // 'https://quickart.b-cdn.net/images/app-home-splash-screeneid.gif?v=$imageVersion',
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://quickart.b-cdn.net/images/app-home-loaderne.gif?v=$imageVersion',
                      //  'https://quickart.b-cdn.net/images/app-home-splash-screen.gif?v=$imageVersion',
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      fit: BoxFit.fill,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return child; // removes loader delay
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
