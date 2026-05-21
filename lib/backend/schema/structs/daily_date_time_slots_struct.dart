// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyDateTimeSlotsStruct extends FFFirebaseStruct {
  DailyDateTimeSlotsStruct({
    String? catId,
    String? selectedDate,
    String? timeslots,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _catId = catId,
        _selectedDate = selectedDate,
        _timeslots = timeslots,
        super(firestoreUtilData);

  // "cat_id" field.
  String? _catId;
  String get catId => _catId ?? '';
  set catId(String? val) => _catId = val;

  bool hasCatId() => _catId != null;

  // "selected_date" field.
  String? _selectedDate;
  String get selectedDate => _selectedDate ?? '';
  set selectedDate(String? val) => _selectedDate = val;

  bool hasSelectedDate() => _selectedDate != null;

  // "timeslots" field.
  String? _timeslots;
  String get timeslots => _timeslots ?? '';
  set timeslots(String? val) => _timeslots = val;

  bool hasTimeslots() => _timeslots != null;

  static DailyDateTimeSlotsStruct fromMap(Map<String, dynamic> data) =>
      DailyDateTimeSlotsStruct(
        catId: data['cat_id'] as String?,
        selectedDate: data['selected_date'] as String?,
        timeslots: data['timeslots'] as String?,
      );

  static DailyDateTimeSlotsStruct? maybeFromMap(dynamic data) => data is Map
      ? DailyDateTimeSlotsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cat_id': _catId,
        'selected_date': _selectedDate,
        'timeslots': _timeslots,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cat_id': serializeParam(
          _catId,
          ParamType.String,
        ),
        'selected_date': serializeParam(
          _selectedDate,
          ParamType.String,
        ),
        'timeslots': serializeParam(
          _timeslots,
          ParamType.String,
        ),
      }.withoutNulls;

  static DailyDateTimeSlotsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DailyDateTimeSlotsStruct(
        catId: deserializeParam(
          data['cat_id'],
          ParamType.String,
          false,
        ),
        selectedDate: deserializeParam(
          data['selected_date'],
          ParamType.String,
          false,
        ),
        timeslots: deserializeParam(
          data['timeslots'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DailyDateTimeSlotsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DailyDateTimeSlotsStruct &&
        catId == other.catId &&
        selectedDate == other.selectedDate &&
        timeslots == other.timeslots;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([catId, selectedDate, timeslots]);
}

DailyDateTimeSlotsStruct createDailyDateTimeSlotsStruct({
  String? catId,
  String? selectedDate,
  String? timeslots,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DailyDateTimeSlotsStruct(
      catId: catId,
      selectedDate: selectedDate,
      timeslots: timeslots,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DailyDateTimeSlotsStruct? updateDailyDateTimeSlotsStruct(
  DailyDateTimeSlotsStruct? dailyDateTimeSlots, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dailyDateTimeSlots
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDailyDateTimeSlotsStructData(
  Map<String, dynamic> firestoreData,
  DailyDateTimeSlotsStruct? dailyDateTimeSlots,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dailyDateTimeSlots == null) {
    return;
  }
  if (dailyDateTimeSlots.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dailyDateTimeSlots.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dailyDateTimeSlotsData =
      getDailyDateTimeSlotsFirestoreData(dailyDateTimeSlots, forFieldValue);
  final nestedData =
      dailyDateTimeSlotsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dailyDateTimeSlots.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDailyDateTimeSlotsFirestoreData(
  DailyDateTimeSlotsStruct? dailyDateTimeSlots, [
  bool forFieldValue = false,
]) {
  if (dailyDateTimeSlots == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dailyDateTimeSlots.toMap());

  // Add any Firestore field values
  dailyDateTimeSlots.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDailyDateTimeSlotsListFirestoreData(
  List<DailyDateTimeSlotsStruct>? dailyDateTimeSlotss,
) =>
    dailyDateTimeSlotss
        ?.map((e) => getDailyDateTimeSlotsFirestoreData(e, true))
        .toList() ??
    [];
