import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'chamber.dart';
import 'product.dart';
import 'product_resume.dart';

class RxWarehouse {
  final id = Rxn<int>();
  final name = Rxn<String>();
  final chambers = RxList<Chamber>();
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Warehouse {
  Warehouse({
    int? id,
    String? name,
    List<Chamber>? chambers,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.name = name;
    this.chambers = chambers ?? [];
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxWarehouse();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  String? get name => rx.name.value;
  set name(String? value) => rx.name.value = value;

  List<Chamber> get chambers => rx.chambers;
  set chambers(List<Chamber> value) => rx.chambers.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  List<Product> get products => resumes.map((e) => e.product).toList();

  List<ProductResume> get resumes {
    final _resumes = <ProductResume>[];

    for (final chamber in chambers) {
      if (_resumes.isEmpty) {
        _resumes.assignAll(chamber.resumes);
      } else {
        for (final resume in chamber.resumes) {
          final _isNew = !_resumes.any(
            (e) => e.id == resume.id,
          );

          if (_isNew) {
            _resumes.add(resume);
          } else {
            _resumes.singleWhere(
              (e) => e.id == resume.id,
            )..amount += resume.amount;
          }
        }
      }
    }

    return _resumes;
  }

  Warehouse copyWith({
    int? id,
    String? name,
    List<Chamber>? chambers,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Warehouse(
        id: id ?? this.id,
        name: name ?? this.name,
        chambers: chambers ?? this.chambers,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Warehouse.fromJson(String str) => Warehouse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Warehouse.fromMap(Map<String, dynamic> json) => Warehouse(
        id: json["id"],
        name: json["name"],
        chambers: List<Chamber>.from(
          (json["chambers"] ?? []).map((x) => Chamber.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  factory Warehouse.fromAliasesMap(
    Map<String, dynamic> json, {
    List<Chamber>? chambers,
  }) =>
      Warehouse(
        id: json["w_id"],
        name: json["w_name"],
        chambers: chambers,
        createdAt: DateTime.tryParse(json["w_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["w_updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "chambers": List.from(chambers.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
