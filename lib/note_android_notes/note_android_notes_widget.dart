import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'note_android_notes_model.dart';
export 'note_android_notes_model.dart';

class NoteAndroidNotesWidget extends StatefulWidget {
  const NoteAndroidNotesWidget({super.key});

  static String routeName = 'note_AndroidNotes';
  static String routePath = '/noteAndroidNotes';

  @override
  State<NoteAndroidNotesWidget> createState() => _NoteAndroidNotesWidgetState();
}

class _NoteAndroidNotesWidgetState extends State<NoteAndroidNotesWidget> {
  late NoteAndroidNotesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteAndroidNotesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'note_AndroidNotes'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ALWAYS CHANGE IOS AND ANDROID VERSION BEFORE LIVE\nios : 2.16\nandroid : 2.16',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FontWeight.w800,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Color(0xFFF40412),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'always check asset folders before live & replace app logo and mitmap',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w800,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'always add .yaml file',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w800,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Base URL demo:\nhttps://quickart2.democheck.in/nodejsapp/\nBase url live\nhttps://quickart5.quickart.ae/nodejsapp/\nhttps://quickart6.quickart.ae/nodejsapp/\n\n',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).tertiary,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'check safearea in  dashboard screen \nSafeArea(\n        top: false,\n        bottom: Platform.isAndroid ? true : false,\nIntroScreenWidget,\nDashboardScreenWidget, VarientBotttomSheetWidget\nProfilePageWidget\nCategoriesScreenWidget\nFreshFoodScreenWidget\nRepeatOrdersWidget\n',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF04620A),
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Font change Code',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).success,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Add codein bellow of   title: \'QuicKart\', \n// 🔑 TEXT SCALE HANDLING (ADD THIS)\n\n    builder: (context, child) {\n\n      final mediaQuery = MediaQuery.of(context);\n\n\n\n      return MediaQuery(\n\n        data: mediaQuery.copyWith(\n\n          // iOS text size restriction\n\n          textScaleFactor: Platform.isIOS\n\n              ? mediaQuery.textScaleFactor.clamp(1.0, 1.2) // ✅ recommended\n\n              : mediaQuery.textScaleFactor,\n\n        ),\n\n        child: child!,\n\n      );\n\n    },',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).success,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      ' Push Notification code',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).tertiary,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Text(
                    '\nadd Package inb .yaml file   flutter_local_notifications: ^17.2.2',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    '\nadd code .main file in  main()\n FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);\n  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(\n      alert: true, badge: true, sound: true);\n\nAdd code in bottom of  main() clase\n\nFuture<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {\n  // Handle background messages\n  await Firebase.initializeApp();\n  print(\'Handling a background message: \${message.messageId}\');\n}\n',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    'add code  initState\n    setPushNotification();\n\nadd code bellow of \n  setPushNotification() {\n    // Initialize Firebase Messaging\n    FirebaseMessaging.instance\n        .getInitialMessage()\n        .then((RemoteMessage? message) {\n      if (message != null) {\n        print(\'Notification on App Start: \${message.notification?.title}\');\n      }\n    });\n\n    FirebaseMessaging.onMessage.listen((RemoteMessage message) {\n      print(\'Notification clicked! Message data: \${message.data}\');\n\n      RemoteNotification? notification = message.notification;\n      if (notification != null) {\n        _showNotification(notification.title!, notification.body!);\n      }\n    });\n\n    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {\n      print(\'Notification clicked!111 Message data: \${message.data}\');\n    });\n\n    _requestNotificationPermission();\n    _initializeLocalNotificationPlugin();\n  }\n\n// Request permission for iOS\n  void _requestNotificationPermission() async {\n    NotificationSettings settings =\n        await FirebaseMessaging.instance.requestPermission(\n      alert: true,\n      badge: true,\n      sound: true,\n    );\n\n    if (settings.authorizationStatus == AuthorizationStatus.authorized) {\n      print(\'User granted permission\');\n    } else {\n      print(\'User declined or has not accepted permission\');\n    }\n  }\n\n  // Initialize Local Notifications\n  void _initializeLocalNotificationPlugin() {\n    DarwinInitializationSettings initializationSettingsIOS =\n        DarwinInitializationSettings(\n      requestAlertPermission: true,\n      requestBadgePermission: true,\n      requestSoundPermission: true,\n      onDidReceiveLocalNotification: (id, title, body, payload) async {\n        // Handle notification tapped event for iOS < 10.\n      },\n    );\n    const AndroidInitializationSettings initializationSettingsAndroid =\n        AndroidInitializationSettings(\'@mipmap/ic_launcher\');\n\n    final InitializationSettings initializationSettings =\n        InitializationSettings(\n      android: initializationSettingsAndroid,\n      iOS: initializationSettingsIOS,\n    );\n\n    flutterLocalNotificationsPlugin.initialize(\n      initializationSettings,\n    );\n  }\n\n  AndroidNotificationChannel channel = const AndroidNotificationChannel(\n      \'high_importance_channel\', \'High Importance Notifications\',\n      importance: Importance.high,\n      description: \'Channel Description\',\n      playSound: true);\n  // Show Notification\n  Future<void> _showNotification(String title, String body) async {\n    AndroidNotificationDetails androidPlatformChannelSpecifics =\n        AndroidNotificationDetails(\n      channel.id,\n      channel.name,\n      importance: Importance.max,\n      priority: Priority.high,\n    );\n\n    NotificationDetails platformChannelSpecifics =\n        NotificationDetails(android: androidPlatformChannelSpecifics);\n\n    await flutterLocalNotificationsPlugin.show(\n      0,\n      title,\n      body,\n      platformChannelSpecifics,\n      //   payload: \'Default_Sound\',\n    );\n  }\n\n\n   ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).tertiary,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    '1}Always Remove debug banner  add line main.dart in  material app\ndebugShowCheckedModeBanner: false,\n\n2}change android:launchMode=\"singleTop\" to \"singleTask\"\n\n3}deeplinking changes for subcategories screen\n\n\n',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
