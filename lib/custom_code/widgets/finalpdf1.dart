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

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class Finalpdf1 extends StatefulWidget {
  const Finalpdf1({
    Key? key,
    this.width,
    this.height,
    this.pdfURL,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? pdfURL;

  @override
  _Finalpdf1State createState() => _Finalpdf1State();
}

class _Finalpdf1State extends State<Finalpdf1> {
  String? filePath;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: (filePath == null && widget.pdfURL == null)
                    ? Center(child: Text('No PDF selected'))
                    : widget.pdfURL != null
                        ? SfPdfViewer.network(
                            widget.pdfURL!,
                            onDocumentLoaded: (_) {
                              setState(() {
                                isLoading = false;
                              });
                            },
                            onDocumentLoadFailed: (_) {
                              setState(() {
                                isLoading = false;
                              });
                            },
                          )
                        : SfPdfViewer.file(
                            File(filePath!),
                            onDocumentLoaded: (_) {
                              setState(() {
                                isLoading = false;
                              });
                            },
                            onDocumentLoadFailed: (_) {
                              setState(() {
                                isLoading = false;
                              });
                            },
                          ),
              ),
              SizedBox(height: 5),
            ],
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
