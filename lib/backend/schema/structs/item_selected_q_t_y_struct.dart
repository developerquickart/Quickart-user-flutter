// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemSelectedQTYStruct extends FFFirebaseStruct {
  ItemSelectedQTYStruct({
    int? cartSelectedQTY,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cartSelectedQTY = cartSelectedQTY,
        super(firestoreUtilData);

  // "cartSelectedQTY" field.
  int? _cartSelectedQTY;
  int get cartSelectedQTY => _cartSelectedQTY ?? 0;
  set cartSelectedQTY(int? val) => _cartSelectedQTY = val;

  void incrementCartSelectedQTY(int amount) =>
      cartSelectedQTY = cartSelectedQTY + amount;

  bool hasCartSelectedQTY() => _cartSelectedQTY != null;

  static ItemSelectedQTYStruct fromMap(Map<String, dynamic> data) =>
      ItemSelectedQTYStruct(
        cartSelectedQTY: castToType<int>(data['cartSelectedQTY']),
      );

  static ItemSelectedQTYStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemSelectedQTYStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cartSelectedQTY': _cartSelectedQTY,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cartSelectedQTY': serializeParam(
          _cartSelectedQTY,
          ParamType.int,
        ),
      }.withoutNulls;

  static ItemSelectedQTYStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemSelectedQTYStruct(
        cartSelectedQTY: deserializeParam(
          data['cartSelectedQTY'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ItemSelectedQTYStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemSelectedQTYStruct &&
        cartSelectedQTY == other.cartSelectedQTY;
  }

  @override
  int get hashCode => const ListEquality().hash([cartSelectedQTY]);
}

ItemSelectedQTYStruct createItemSelectedQTYStruct({
  int? cartSelectedQTY,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemSelectedQTYStruct(
      cartSelectedQTY: cartSelectedQTY,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemSelectedQTYStruct? updateItemSelectedQTYStruct(
  ItemSelectedQTYStruct? itemSelectedQTY, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemSelectedQTY
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemSelectedQTYStructData(
  Map<String, dynamic> firestoreData,
  ItemSelectedQTYStruct? itemSelectedQTY,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemSelectedQTY == null) {
    return;
  }
  if (itemSelectedQTY.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemSelectedQTY.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemSelectedQTYData =
      getItemSelectedQTYFirestoreData(itemSelectedQTY, forFieldValue);
  final nestedData =
      itemSelectedQTYData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemSelectedQTY.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemSelectedQTYFirestoreData(
  ItemSelectedQTYStruct? itemSelectedQTY, [
  bool forFieldValue = false,
]) {
  if (itemSelectedQTY == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemSelectedQTY.toMap());

  // Add any Firestore field values
  itemSelectedQTY.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemSelectedQTYListFirestoreData(
  List<ItemSelectedQTYStruct>? itemSelectedQTYs,
) =>
    itemSelectedQTYs
        ?.map((e) => getItemSelectedQTYFirestoreData(e, true))
        .toList() ??
    [];
