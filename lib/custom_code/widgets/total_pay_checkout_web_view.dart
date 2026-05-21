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

class TotalPayCheckoutWebView extends StatefulWidget {
  const TotalPayCheckoutWebView({
    super.key,
    this.width,
    this.height,
    required this.checkoutUrl,
    required this.cookies,
    this.reloadPage,
  });

  final double? width;
  final double? height;
  final String checkoutUrl;
  final String cookies;
  final Future Function()? reloadPage;

  @override
  State<TotalPayCheckoutWebView> createState() =>
      _TotalPayCheckoutWebViewState();
}

class _TotalPayCheckoutWebViewState extends State<TotalPayCheckoutWebView> {
  late final WebViewController controller;
  var loadingPercentage = 0;
  var currentUrl = '';
  bool _load = false;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          if (!mounted) return;
          setState(() {
            loadingPercentage = 0;
            currentUrl = url;
          });
          debugPrint('url: $url');
          if (url.contains("api/success")) {
            FFAppState().isPaymentSuccess = true;
            // Consider implementing a more reliable mechanism instead of a fixed delay
            // Future.delayed(const Duration(milliseconds: 1000), () {
            //   if (!mounted) return;
            widget.reloadPage!();
            // });
            debugPrint('Payment success detected, reloading page.');
          } else if (url.contains("api/savesuccess")) {
            FFAppState().isPaymentSuccess = true;
            widget.reloadPage!();
            debugPrint('Save success detected, reloading page.');
          } else if (url.contains("api/failure")) {
            FFAppState().isPaymentSuccess = false;
            widget.reloadPage!();
            debugPrint('Payment failure detected, reloading page.');
          }
        },
        onProgress: (progress) {
          if (!mounted) return;
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          if (!mounted) return;
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.checkoutUrl), headers: {
        if (widget.cookies.isNotEmpty) 'Cookie': widget.cookies,
      });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Stack(children: [
        WebViewWidget(controller: controller),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
        //  Text('Current URL: $currentUrl'),
        new Align(
          child: loadingIndicator,
          alignment: FractionalOffset.center,
        ),
      ]),
    );
  }
}
