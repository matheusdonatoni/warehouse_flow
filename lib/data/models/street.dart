import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'position.dart';

class RxStreet {
  final id = Rxn<int>();
  final name = Rxn<String>();
  final number = Rxn<int>();
  final positions = RxList<Position>();
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Street {
  Street({
    int? id,
    String? name,
    int? number,
    List<Position> positions = const [],
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.name = name;
    this.number = number;
    this.positions = positions;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxStreet();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  String? get name => rx.name.value;
  set name(String? value) => rx.name.value = value;

  int? get number => rx.number.value;
  set number(int? value) => rx.number.value = value;

  List<Position> get positions => rx.positions;
  set positions(List<Position> value) => rx.positions.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  Street copyWith({
    int? id,
    String? name,
    int? number,
    List<Position>? positions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Street(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
        positions: positions ?? this.positions,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Street.fromJson(String str) => Street.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Street.fromMap(Map<String, dynamic> json) => Street(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        positions: List<Position>.from(
          (json["positions"] ?? []).map((x) => Position.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "number": number,
        "positions": List<dynamic>.from(positions.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
