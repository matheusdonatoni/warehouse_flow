import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

class RxProdcut {
  final id = Rxn<int>();
  final code = Rxn<int>();
  final description = Rxn<String>();
  final unit = Rxn<String>();
  final type = Rxn<String>();
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Product {
  Product({
    int? id,
    int? code,
    String? description,
    String? unit,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.code = code;
    this.description = description;
    this.unit = unit;
    this.type = type;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxProdcut();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  int? get code => rx.code.value;
  set code(int? value) => rx.code.value = value;

  String? get description => rx.description.value;
  set description(String? value) => rx.description.value = value;

  String? get unit => rx.unit.value;
  set unit(String? value) => rx.unit.value = value;

  String? get type => rx.type.value;
  set type(String? value) => rx.type.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  String get parsedCode => NumberFormat("#,##0", 'pt-br').format(code);

  Product copyWith({
    int? id,
    int? code,
    String? description,
    String? unit,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Product(
        id: id ?? this.id,
        code: code ?? this.code,
        description: description ?? this.description,
        unit: unit ?? this.unit,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        unit: json["unit"],
        type: json["type"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  factory Product.fromAlisesMap(Map<String, dynamic> json) => Product(
        id: json["pr_id"],
        code: json["code"],
        description: json["description"],
        unit: json["unit"],
        type: json["pr_type"],
        createdAt: DateTime.tryParse(json["pr_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["pr_updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "description": description,
        "unit": unit,
        "type": type,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  Map<String, dynamic> toDataTable() => {
        "Produto": code,
        "Descri????o": description,
        "Unidade": unit,
        "Tipo": type,
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
