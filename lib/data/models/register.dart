import 'dart:convert';

import 'package:get/get_rx/get_rx.dart';

import 'operation.dart';
import 'product.dart';
import 'product_resume.dart';

class RxRegister {
  final id = Rxn<int>();
  final opreations = RxList<Operation>();
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Register {
  Register({
    int? id,
    List<Operation>? operations,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this._operations = operations ?? [];
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxRegister();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  List<Operation> get operations => rx.opreations;
  set _operations(List<Operation> value) => rx.opreations.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  List<Product> get products => resumes.map((e) => e.product).toList();

  List<ProductResume> get resumes {
    final _resumes = <ProductResume>[];

    for (final operation in operations) {
      if (operation.isNotEmpty) {
        final product = operation.product;

        var _isNew = !_resumes.any(
          (e) => e.id == product.id,
        );

        var amount = operation.isRemoval ? -operation.amount : operation.amount;

        if (_isNew) {
          _resumes.add(
            ProductResume(
              product: product,
              amount: amount,
            ),
          );
        } else {
          _resumes.singleWhere(
            (e) => e.id == product.id,
          )..amount += amount;
        }
      }
    }

    _resumes.removeWhere((e) => e.amount == 0);

    return _resumes;
  }

  Register copyWith({
    int? id,
    List<Operation>? operations,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Register(
        id: id ?? this.id,
        operations: operations ?? this.operations,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Register.fromJson(String str) => Register.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Register.fromMap(Map<String, dynamic> json) => Register(
        id: json["id"],
        operations: List<Operation>.from(
          (json["operations"] ?? []).map((x) => Operation.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  factory Register.fromAliasesMap(
    Map<String, dynamic> json, {
    List<Operation>? operations,
  }) =>
      Register(
        id: json["r_id"],
        operations: operations,
        createdAt: DateTime.tryParse(json["r_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["r_updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "operations": List.from(operations.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
