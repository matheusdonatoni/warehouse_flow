import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'product.dart';

class RxOperation {
  final id = Rxn<int>();
  final amount = Rxn<double>();
  final type = Rxn<OperationType>();
  final product = Rxn<Product>();
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Operation {
  Operation({
    int? id,
    double? amount,
    OperationType? type,
    Product? product,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.amount = amount;
    this.type = type;
    this.product = product;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxOperation();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  double? get amount => rx.amount.value;
  set amount(double? value) => rx.amount.value = value;

  OperationType? get type => rx.type.value;
  set type(OperationType? value) => rx.type.value = value;

  Product? get product => rx.product.value;
  set product(Product? value) => rx.product.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  bool get isNotEmpty => (amount ?? -1) > 0;

  bool get isInsertion => type == OperationType.insert;

  Operation copyWith({
    int? id,
    double? amount,
    OperationType? type,
    Product? product,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Operation(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        product: product ?? this.product,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Operation.fromJson(String str) => Operation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Operation.fromMap(Map<String, dynamic> json) => Operation(
        id: json["id"],
        amount: json["amount"],
        product: Product.fromMap(json["product"]),
        type: Operation.parseOperation(json["type"]),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "type": type?.valueToString(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() => toMap().toString();

  static OperationType parseOperation(String formattedOperation) {
    if (formattedOperation == 'insert') {
      return OperationType.insert;
    } else if (formattedOperation == 'remove') {
      return OperationType.remove;
    }

    return OperationType.none;
  }
}

enum OperationType { insert, remove, none }

extension OperationExt on OperationType {
  String valueToString() {
    return this.toString().split('.').last;
  }
}
