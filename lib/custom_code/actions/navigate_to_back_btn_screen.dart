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

// navigateToBackBtnScreen custom action name and add build context, routeName and action that name is onBackBtnClicked generte custom action to reload page use that code for more info navigateToBackBtnScreen
import 'package:go_router/go_router.dart';

Future navigateToBackBtnScreen(
  BuildContext context,
  String rauteName,
  Future Function() onBackBtnClicked,
) async {
  // print('Route name = $rauteName');

  context
      .pushNamed(
        '$rauteName',
      )
      .then((value) => onBackBtnClicked());
  // print('Returned from $rauteName');
}
