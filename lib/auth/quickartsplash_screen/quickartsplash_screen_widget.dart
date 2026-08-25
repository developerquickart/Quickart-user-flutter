import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:quic_kart/custom_code/actions/initialize_push_notification.dart';
import 'package:quic_kart/custom_code/appsflyer_service.dart';

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
    print("G1---->splash load----->${DateTime.now()}");
    _model = createModel(context, () => QuickartsplashScreenModel());
    imageVersion = DateTime.now().millisecondsSinceEpoch.toString();

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'QuickartsplashScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 300));
      // print("G1---->splash load---111-->${DateTime.now()}");
      if (!mounted) return;

      _initializeBackgroundServices();
      await _initializeApp();
    });
  }

  Future<void> _initializeBackgroundServices() async {
    try {
      print("Background Init Start : ${DateTime.now()}");
      final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      print("APNS Token = $apnsToken");

      final fcmToken = await FirebaseMessaging.instance.getToken();
      print("FCM Token = $fcmToken");

      await Future.wait([
        actions.lockOrientation(),
        actions.initializeAppsflyer(),
        actions.setFBEvent(),
        actions.initReferrerDetails(),
      ]);

      print("Background Init Complete : ${DateTime.now()}");
    } catch (e, s) {
      debugPrint("Background Init Error : $e");
      debugPrint("$s");
    }
  }

  Future<void> _initializeApp() async {
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
    print("G1---->splash load-1---->${DateTime.now()}");
    await Future.wait([
      actions.getFcmToken(),
      actions.getDeviceID(),
    ]);
    logFirebaseEvent('QuickartsplashScreen_custom_action');
    //   print("G1---->splash load-2---->${DateTime.now()}");
    // _model.fcmTokenNew = await actions.getFcmToken();
    print("G1---->splash load-3---->${DateTime.now()}");
    if (_model.connectivityResultCopy == true) {
      // logFirebaseEvent('QuickartsplashScreen_custom_action');
      // await actions.getDeviceID();
      // logFirebaseEvent('QuickartsplashScreen_custom_action');

      // await actions.requestAppTracking();
      unawaited(actions.requestAppTracking());
      print("G1---->splash load-5---->${DateTime.now()}");
      if (isiOS) {
        logFirebaseEvent('QuickartsplashScreen_update_app_state');
        FFAppState().platform = 'ios';
        // FFAppState().fcmToken =
        //     _model.fcmTokenNew != null && _model.fcmTokenNew != ''
        //         ? _model.fcmTokenNew!
        //         : ' ';
        safeSetState(() {});
        print("G1---->splash load-6---->${DateTime.now()}");
        if (FFAppState().isUserLogin == true) {
          logFirebaseEvent('QuickartsplashScreen_backend_call');
          print("G1---->splash load-61---->${DateTime.now()}");
          _model.apiResultzwxIOS = await QuickartGroup.appinfoCall.call(
            userid: FFAppState().userID,
            stroreid: FFAppState().storeID,
            platform: 'ios',
            fcmToken: FFAppState().fcmToken,
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
              print("G1---->splash load-8---->${DateTime.now()}");
              await Future.delayed(
                Duration(
                  milliseconds: 2000,
                ),
              );
              logFirebaseEvent('QuickartsplashScreen_navigate_to');
              print("G1---->splash load-9---->${DateTime.now()}");

              final data =
                  await NotificationService.instance.initialNotification;

              if (data != null) {
                NotificationService.instance.clear();

                AppsflyerService().navigateFromNotification(
                  data["deep_link_value"],
                  data,
                );
                return;
              }
              // print("G1---->splash load-62---->${DateTime.now()}");
              context.goNamed(DashboardScreenWidget.routeName);
            } else {
              // print("G1---->splash load-10---->${DateTime.now()}");
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
              // print("G1---->splash load-11---->${DateTime.now()}");
              await Future.delayed(
                Duration(
                  milliseconds: 2000,
                ),
              );
              logFirebaseEvent('QuickartsplashScreen_navigate_to');
              // if (NotificationManager.pendingNotification != null) {
              //     final data = NotificationManager.pendingNotification!;

              //     NotificationManager.pendingNotification = null;

              //     AppsflyerService().navigateFromNotification(
              //       data["deep_link_value"],
              //       data,
              //     );

              //     return;
              //   }
              final data =
                  await NotificationService.instance.initialNotification;

              if (data != null) {
                NotificationService.instance.clear();

                AppsflyerService().navigateFromNotification(
                  data["deep_link_value"],
                  data,
                );
                return;
              }
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
          // print("G1---->splash load-12---->${DateTime.now()}");
          logFirebaseEvent('QuickartsplashScreen_backend_call');
          _model.apiResultso1IOS = await QuickartGroup.appinfoCall.call(
            userid: FFAppState().userID,
            stroreid: FFAppState().storeID,
            platform: 'ios',
            fcmToken: FFAppState().fcmToken,
            deviceid: FFAppState().deviceID,
          );

          if ((_model.apiResultso1IOS?.succeeded ?? true)) {
            // print("G1---->splash load-13---->${DateTime.now()}");
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
              // print("G1---->splash load-14---->${DateTime.now()}");
              await Future.delayed(
                Duration(
                  milliseconds: 2000,
                ),
              );
              logFirebaseEvent('QuickartsplashScreen_navigate_to');

              context.goNamed(IntroScreenWidget.routeName);
            } else {
              // print("G1---->splash load-15---->${DateTime.now()}");
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
                  milliseconds: 2000,
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
        print("G1---->splash load-51---->${DateTime.now()}");
        if (isAndroid) {
          print("G1---->splash load-52---->${DateTime.now()}");
          logFirebaseEvent('QuickartsplashScreen_update_app_state');
          FFAppState().platform = 'android';
          // FFAppState().fcmToken = _model.fcmTokenNew!;
          safeSetState(() {});
        } else {
          logFirebaseEvent('QuickartsplashScreen_update_app_state');
          FFAppState().platform = 'web';
          // FFAppState().fcmToken = _model.fcmTokenNew!;
          safeSetState(() {});
        }
        print("G1---->splash load-53---->${DateTime.now()}");
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
                  milliseconds: 2000,
                ),
              );
              logFirebaseEvent('QuickartsplashScreen_navigate_to');
              // if (NotificationManager.pendingNotification != null) {
              //     final data = NotificationManager.pendingNotification!;

              //     NotificationManager.pendingNotification = null;

              //     AppsflyerService().navigateFromNotification(
              //       data["deep_link_value"],
              //       data,
              //     );

              //     return;
              //   }
              final data =
                  await NotificationService.instance.initialNotification;

              if (data != null) {
                NotificationService.instance.clear();

                AppsflyerService().navigateFromNotification(
                  data["deep_link_value"],
                  data,
                );
                return;
              }

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
                  milliseconds: 2000,
                ),
              );
              logFirebaseEvent('QuickartsplashScreen_navigate_to');
              // if (NotificationManager.pendingNotification != null) {
              //     final data = NotificationManager.pendingNotification!;

              //     NotificationManager.pendingNotification = null;

              //     AppsflyerService().navigateFromNotification(
              //       data["deep_link_value"],
              //       data,
              //     );

              //     return;
              //   }
              final data =
                  await NotificationService.instance.initialNotification;

              if (data != null) {
                NotificationService.instance.clear();

                AppsflyerService().navigateFromNotification(
                  data["deep_link_value"],
                  data,
                );
                return;
              }
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
                  milliseconds: 2000,
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
                  milliseconds: 2000,
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
          backgroundColor: FFAppConstants.indigoColor,
          body: Stack(
            children: [
              // Align(
              //   alignment: AlignmentDirectional(0.0, 0.0),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Align(
              //         alignment: AlignmentDirectional(0.0, 0.0),
              //         child: Padding(
              //           padding: EdgeInsetsDirectional.fromSTEB(
              //               0.0, 200.0, 0.0, 0.0),
              //           child: AnimatedContainer(
              //             duration: Duration(milliseconds: 270),
              //             curve: Curves.easeOut,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //             ),
              //             child: Align(
              //               alignment: AlignmentDirectional(0.0, 0.0),
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(8.0),
              //                 child: Image.asset(
              //                   'assets/images/QuicKart_New_Final.png',
              //                   width: 0.0,
              //                   height: 0.0,
              //                   fit: BoxFit.contain,
              //                   alignment: Alignment(0.0, 0.0),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
                   
              //       Container(
              //         width: MediaQuery.sizeOf(context).width * 1.0,
              //         height: 100.0,
              //         child: custom_widgets.LifecycleWrapper(
              //           width: MediaQuery.sizeOf(context).width * 1.0,
              //           height: 100.0,
              //           child: Icon(
              //             FFIcons.khome1,
              //             color: FFAppConstants.whiteColor,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8.0),
              //   child: Image.network(
              //     'https://quickart.b-cdn.net/images/app-home-loadernew.gif?v=$imageVersion',
              //     // 'https://quickart.b-cdn.net/images/app-home-splash-screeneid.gif?v=$imageVersion',
              //     width: MediaQuery.sizeOf(context).width,
              //     height: MediaQuery.sizeOf(context).height,
              //     fit: BoxFit.fill,
              //     errorBuilder: (context, error, stackTrace) {
              //       return Image.network(
              //         'https://quickart.b-cdn.net/images/app-home-loaderne.gif?v=$imageVersion',
              //         //  'https://quickart.b-cdn.net/images/app-home-splash-screeneid.gif?v=$imageVersion',
              //         width: MediaQuery.sizeOf(context).width,
              //         height: MediaQuery.sizeOf(context).height,
              //         fit: BoxFit.fill,
              //       );
              //     },
              //     loadingBuilder: (context, child, loadingProgress) {
              //       if (loadingProgress == null) return child;
              //       return child; // removes loader delay
              //     },
              //   ),
              // )
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: custom_widgets.SplashGifWidget(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  imageUrl:
                      // 'https://quickart.b-cdn.net/images/app-home-splash-screeneid1.gif',
                      "https://quickart.b-cdn.net/images/app-home-loadernew.gif",
                  version: '$imageVersion',
                ),
              ),
            ],
          ),
        ), 
      ),
    );
  }
}
