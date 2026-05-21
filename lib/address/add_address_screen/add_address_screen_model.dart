import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'add_address_screen_widget.dart' show AddAddressScreenWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddAddressScreenModel extends FlutterFlowModel<AddAddressScreenWidget> {
  ///  Local state fields for this page.

  String? nullValueAddress;

  String? nullValue = '';

  bool doorImageAdd = false;

  bool imageUploadedAdd = false;

  bool doorImageEdit = false;

  bool imgUploadNewEdit = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please Enter Your Name';
    }

    return null;
  }

  // State field(s) for TextEmail widget.
  FocusNode? textEmailFocusNode;
  TextEditingController? textEmailTextController;
  String? Function(BuildContext, String?)? textEmailTextControllerValidator;
  String? _textEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please Enter Your Email Address';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return '\'Enter a valid email address\'';
    }
    return null;
  }

  bool isDataUploading_uploadDataK0h = false;
  FFUploadedFile uploadedLocalFile_uploadDataK0h =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataLtn = false;
  FFUploadedFile uploadedLocalFile_uploadDataLtn =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? connectivityResult;
  // Stores action output result for [Backend Call - API (addaddress)] action in Button widget.
  ApiCallResponse? apiResultAddAddress;
  // Stores action output result for [Backend Call - API (editaddress)] action in Button widget.
  ApiCallResponse? apiResultEditAddress;
  bool isDataUploading_uploadData63y1 = false;
  FFUploadedFile uploadedLocalFile_uploadData63y1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadData63y = false;
  FFUploadedFile uploadedLocalFile_uploadData63y =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {
    textController3Validator = _textController3Validator;
    textEmailTextControllerValidator = _textEmailTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textEmailFocusNode?.dispose();
    textEmailTextController?.dispose();
  }
}
