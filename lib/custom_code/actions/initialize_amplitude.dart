// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// create a custom action to initializeAmplitude for name and use that code Future initializeAmplitude() async {  const apiKey = 'YOUR_AMPLITUDE_API_KEY';  final amplitude = Amplitude(apiKey);  await amplitude.isBuilt();} not add log event
// import 'package:amplitude_flutter/amplitude.dart';
// import 'package:amplitude_flutter/configuration.dart';

// late Amplitude amplitude;

Future initializeAmplitude() async {
  const apiKey = '5bab9ae8180662bd0a11b398f95af646';
  // amplitude = Amplitude(Configuration(apiKey: apiKey));
  // await amplitude.isBuilt;
}
