// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductCountStruct extends FFFirebaseStruct {
  ProductCountStruct({
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _count = count,
        super(firestoreUtilData);

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static ProductCountStruct fromMap(Map<String, dynamic> data) =>
      ProductCountStruct(
        count: castToType<int>(data['count']),
      );

  static ProductCountStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductCountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProductCountStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductCountStruct(
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProductCountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductCountStruct && count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([count]);
}

ProductCountStruct createProductCountStruct({
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductCountStruct(
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductCountStruct? updateProductCountStruct(
  ProductCountStruct? productCount, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productCount
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductCountStructData(
  Map<String, dynamic> firestoreData,
  ProductCountStruct? productCount,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productCount == null) {
    return;
  }
  if (productCount.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productCount.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productCountData =
      getProductCountFirestoreData(productCount, forFieldValue);
  final nestedData =
      productCountData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productCount.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductCountFirestoreData(
  ProductCountStruct? productCount, [
  bool forFieldValue = false,
]) {
  if (productCount == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productCount.toMap());

  // Add any Firestore field values
  productCount.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductCountListFirestoreData(
  List<ProductCountStruct>? productCounts,
) =>
    productCounts?.map((e) => getProductCountFirestoreData(e, true)).toList() ??
    [];
