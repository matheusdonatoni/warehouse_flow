import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

class RxPosition {
  final id = Rxn<int>();
  final height = Rxn<int>();
  final depth = Rxn<int>();
  final type = Rxn<String>();
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Position {
  Position({
    int? id,
    int? height,
    int? depth,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.height = height;
    this.depth = depth;
    this.type = type;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxPosition();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  int? get height => rx.height.value;
  set height(int? value) => rx.height.value = value;

  int? get depth => rx.depth.value;
  set depth(int? value) => rx.depth.value = value;

  String? get type => rx.type.value;
  set type(String? value) => rx.type.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  Position copyWith({
    int? id,
    int? height,
    int? depth,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Position(
        id: id ?? this.id,
        height: height ?? this.height,
        depth: depth ?? this.depth,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Position.fromJson(String str) => Position.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Position.fromMap(Map<String, dynamic> json) => Position(
        id: json["id"],
        height: json["height"],
        depth: json["depth"],
        type: json["type"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  factory Position.fromAliasesMap(Map<String, dynamic> json) => Position(
        id: json["p_id"],
        height: json["height"],
        depth: json["depth"],
        type: json["p_type"],
        createdAt: DateTime.tryParse(json["p_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["p_updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "height": height,
        "depth": depth,
        "type": type,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
