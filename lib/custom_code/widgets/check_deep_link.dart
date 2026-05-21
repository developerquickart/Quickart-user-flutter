// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CheckDeepLink extends StatefulWidget {
  const CheckDeepLink({
    super.key,
    this.width,
    this.height,
    required this.catId,
    required this.callApi,
    this.text,
  });

  final double? width;
  final double? height;
  final String catId;
  final Future Function() callApi;
  final String? text;

  @override
  State<CheckDeepLink> createState() => _CheckDeepLinkState();
}

class _CheckDeepLinkState extends State<CheckDeepLink>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();

    // On page load action.
    //  _updatePageLoadAction();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //do your stuff
      print("Jivan-----------------1");
/*
      if (widget!.catId != null && widget!.catId != '') {
        _updatePageLoadAction();
      } */
      //  _updatePageLoadAction();
    } else if (state == AppLifecycleState.paused) {
      print("Jivan-----------------3");
      if (widget!.catId != null && widget!.catId != '') {
        print("Jivan-----------------4");
        _updatePageLoadAction();
      }
    }
  }

  _updatePageLoadAction() {
    setState(() {
      // Here you can write your code for open new view
      print("Jivan-----------------2");
      widget.callApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Text(
          widget!.catId,
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Montserrat',
                color: FFAppConstants.appBarIconandTitleColor,
                fontSize: FFAppConstants.appBartitleFont.toDouble(),
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ));
  }
}
