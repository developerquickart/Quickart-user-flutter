import 'package:firebase_analytics/firebase_analytics.dart';

import '/custom_code/actions/index.dart' as actions;
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

late FirebaseAnalytics analytics;
void main() async {
  print("G1---->splash load-0---->${DateTime.now()}");

  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  final environmentValues = FFDevEnvironmentValues();
  await environmentValues.initialize();

  await initFirebase();

  // Start initial custom actions code
  await actions.lockOrientation();
  await actions.initializeAppsflyer();
  await actions.setFBEvent();

  await actions.initReferrerDetails();
  await actions.initializeAmplitude();
  // End initial custom actions code
  // analytics = FirebaseAnalytics.instance;
  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }
  await actions.initializePushNotification();
  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

Future<void> _initializeBackgroundServices() async {
  try {
    print("Background Init Start : ${DateTime.now()}");

    await Future.wait([
      actions.lockOrientation(),
      actions.initializeAppsflyer(),
      actions.setFBEvent(),
      actions.initializePushNotification(),
      actions.initReferrerDetails(),
    ]);

    print("Background Init Complete : ${DateTime.now()}");
  } catch (e, s) {
    debugPrint("Background Init Error : $e");
    debugPrint("$s");
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.path;
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen(
    (_) {},
    // Registering a token can fail for reasons outside the app's control (a
    // browser without the Notification API, a revoked permission, a blocked
    // cloud call). Swallow it here so it can't surface as an unhandled zone
    // error and take down the app on login.
    onError: (e) => print('Error registering FCM token: $e'),
  );

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = quicKartFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    // Future.delayed(
    //   Duration(milliseconds: 100),
    //   () => _appStateNotifier.stopShowingSplashImage(),
    // );
    _appStateNotifier.stopShowingSplashImage();
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'QuicKart',
      scrollBehavior: MyAppScrollBehavior(),
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);

        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaleFactor: 1.0,
          ),
          child: child!,
        );
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
