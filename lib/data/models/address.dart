import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'position.dart';

class RxAdress {
  final id = Rxn<int>();
  final name = Rxn<String>();
  final indicator = Rxn<String>();
  final positions = RxList<Position>();
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Address {
  Address({
    int? id,
    String? name,
    String? indicator,
    List<Position>? positions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.name = name;
    this.indicator = indicator;
    this.positions = positions ?? [];
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxAdress();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  String? get name => rx.name.value;
  set name(String? value) => rx.name.value = value;

  String? get indicator => rx.indicator.value;
  set indicator(String? value) => rx.indicator.value = value;

  List<Position> get positions => rx.positions;
  set positions(List<Position> value) => rx.positions.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  Address copyWith({
    int? id,
    String? name,
    String? indicator,
    List<Position>? positions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Address(
        id: id ?? this.id,
        name: name ?? this.name,
        indicator: indicator ?? this.indicator,
        positions: positions ?? this.positions,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        indicator: json["indicator"],
        positions: List<Position>.from(
          (json["positions"] ?? []).map((x) => Position.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  factory Address.fromAliasesMap(
    Map<String, dynamic> json, {
    List<Position>? positions,
  }) =>
      Address(
        id: json["a_id"],
        name: json["a_name"],
        indicator: json["indicator"],
        positions: positions,
        createdAt: DateTime.tryParse(json["a_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["a_updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "indicator": indicator,
        "positions": List<dynamic>.from(positions.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
