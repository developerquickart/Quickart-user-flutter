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

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HTMLViweWidget extends StatefulWidget {
  const HTMLViweWidget({
    super.key,
    this.width,
    this.height,
    this.htmlString,
  });

  final double? width;
  final double? height;
  final String? htmlString;

  @override
  State<HTMLViweWidget> createState() => _HTMLViweWidgetState();
}

class _HTMLViweWidgetState extends State<HTMLViweWidget> {
  Future<String?> _fetchHtmlString() async {
    await Future.delayed(Duration(seconds: 0));
    return widget.htmlString;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _fetchHtmlString(),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2E317E)),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading HTML'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No HTML data available'));
        } else {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              child: HtmlWidget(snapshot.data!),
            ),
          );
        }
      },
    );
  }
}
