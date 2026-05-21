import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'date_time_slot_bottom_sheet_widget.dart'
    show DateTimeSlotBottomSheetWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DateTimeSlotBottomSheetModel
    extends FlutterFlowModel<DateTimeSlotBottomSheetWidget> {
  ///  Local state fields for this component.

  dynamic productJson;

  List<DailyDateTimeSlotsStruct> selectedArrayJson = [];
  void addToSelectedArrayJson(DailyDateTimeSlotsStruct item) =>
      selectedArrayJson.add(item);
  void removeFromSelectedArrayJson(DailyDateTimeSlotsStruct item) =>
      selectedArrayJson.remove(item);
  void removeAtIndexFromSelectedArrayJson(int index) =>
      selectedArrayJson.removeAt(index);
  void insertAtIndexInSelectedArrayJson(
          int index, DailyDateTimeSlotsStruct item) =>
      selectedArrayJson.insert(index, item);
  void updateSelectedArrayJsonAtIndex(
          int index, Function(DailyDateTimeSlotsStruct) updateFn) =>
      selectedArrayJson[index] = updateFn(selectedArrayJson[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - checkInternetConnection] action in Container widget.
  bool? internetCheck1;
  // Stores action output result for [Backend Call - API (upquickordertimeslot)] action in Container widget.
  ApiCallResponse? apiResultsqz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
