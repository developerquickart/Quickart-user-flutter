import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'address_list_screen_widget.dart' show AddressListScreenWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressListScreenModel extends FlutterFlowModel<AddressListScreenWidget> {
  ///  Local state fields for this page.

  bool checkAddressExits = false;

  String nullValue = 'Null';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternetConnection] action in IconButton widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (removeaddress)] action in IconButton widget.
  ApiCallResponse? apiResultDeleteAddress;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
