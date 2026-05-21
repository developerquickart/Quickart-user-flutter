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

import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({
    super.key,
    this.width,
    this.height,
    required this.urlString,
  });

  final double? width;
  final double? height;
  final String urlString;

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController controller;
  var loadingPercentage = 0;
  var currentUrl = '';
  bool _load = false;
  BuildContext? ncontext;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
            currentUrl = url;
          });
          debugPrint('url: $url');
          //   if (url.toString().contains("api/success")) {
          debugPrint('Jivan----------->${url.contains("api/success")} ');
          if (url.contains("api/success")) {
            Navigator.pushNamed(ncontext!, '/orderSuccessFailScreen');
            FFAppState().isPaymentSuccess = true;
            debugPrint('Jivan-----------> ');
            debugPrint('Jivan-----------> ${FFAppState().isPaymentSuccess}');
            //Navigator.of(ncontext!).pushNamed('OrderSuccessFailScreen');
          }
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.urlString),
      );
  }

  @override
  Widget build(BuildContext context) {
    ncontext = context;
    Widget loadingIndicator = _load
        ? new Container(
            color: Colors.grey[300],
            width: 100.0,
            height: 100.0,
            child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Center(child: new CircularProgressIndicator()),
                    SizedBox(
                      height: 10,
                    ),
                    new Center(child: Text('Loading...')),
                  ],
                )),
          )
        : new Container();

    return Scaffold(
        body: Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
        //  Text('Current URL: $currentUrl'),
        new Align(
          child: loadingIndicator,
          alignment: FractionalOffset.center,
        ),
      ],
    ));
  }
}
