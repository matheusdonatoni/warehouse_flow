import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'spot.dart';
import 'product.dart';
import 'product_resume.dart';
import 'register.dart';

class RxWarehouse {
  final id = Rxn<int>();
  final name = Rxn<String>();
  final spots = RxList<Spot>();
  final register = Rx<Register>(Register());
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Warehouse {
  Warehouse({
    int? id,
    String? name,
    List<Spot>? spots,
    Register? register,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.name = name;
    this.spots = spots ?? [];
    this.register = register ?? Register();
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxWarehouse();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  String? get name => rx.name.value;
  set name(String? value) => rx.name.value = value;

  List<Spot> get spots => rx.spots;
  set spots(List<Spot> value) => rx.spots.value = value;

  Register get register => rx.register.value;
  set register(Register value) => rx.register.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  List<Product> get products => register.products;

  List<ProductResume> get resumes => register.resumes;

  Warehouse copyWith({
    int? id,
    String? name,
    List<Spot>? spots,
    Register? register,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Warehouse(
        id: id ?? this.id,
        name: name ?? this.name,
        spots: spots ?? this.spots,
        register: register ?? this.register,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Warehouse.fromJson(String str) => Warehouse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Warehouse.fromMap(Map<String, dynamic> json) => Warehouse(
        id: json["id"],
        name: json["name"],
        spots: List<Spot>.from(
          (json["spots"] ?? []).map((x) => Spot.fromMap(x)),
        ),
        register: Register.fromMap(json['register'] ?? {}),
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  factory Warehouse.fromAliasesMap(
    Map<String, dynamic> json, {
    List<Spot>? spots,
    Register? register,
  }) =>
      Warehouse(
        id: json["w_id"],
        name: json["w_name"],
        spots: spots,
        register: register,
        createdAt: DateTime.tryParse(json["w_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["w_updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "spots": List.from(spots.map((x) => x.toMap())),
        "register": register.toMap(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
