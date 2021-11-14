import 'dart:convert';

import 'package:warehouse_flow/data/models/product.dart';

class Operation {
  Operation({
    this.id,
    required this.amount,
    required this.type,
    required this.product,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  double amount;
  OperationType type;
  Product product;
  DateTime? createdAt;
  DateTime? updatedAt;

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
        amount: json["amount"] ?? -1,
        product: Product.fromMap(json["product"] ?? Product()),
        type: Operation.parseOperation(json["type"] ?? ''),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "type": type.valueToString(),
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