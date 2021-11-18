import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'register.dart';

class RxPosition {
  final id = Rxn<int>();
  final height = Rxn<int>();
  final depth = Rxn<int>();
  final type = Rxn<String>();
  final register = Rxn<Register>();
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Position {
  Position({
    int? id,
    int? height,
    int? depth,
    String? type,
    Register? register,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.height = height;
    this.depth = depth;
    this.type = type;
    this.register = register;
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

  Register? get register => rx.register.value;
  set register(Register? value) => rx.register.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  Position copyWith({
    int? id,
    int? height,
    int? depth,
    String? type,
    Register? register,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Position(
        id: id ?? this.id,
        height: height ?? this.height,
        depth: depth ?? this.depth,
        type: type ?? this.type,
        register: register ?? this.register,
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
        register:  Register.fromMap(json["register"] ?? {}),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "height": height,
        "depth": depth,
        "type": type,
        "register": register?.toMap(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
