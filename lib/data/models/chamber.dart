import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'street.dart';

class RxChamber {
  final id = Rxn<int>();
  final name = Rxn<String>();
  final streets = RxList<Street>();
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Chamber {
  Chamber({
    int? id,
    String? name,
    List<Street> streets = const [],
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.name = name;
    this.streets = streets;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxChamber();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  String? get name => rx.name.value;
  set name(String? value) => rx.name.value = value;

  List<Street> get streets => rx.streets;
  set streets(List<Street> value) => rx.streets.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  Chamber copyWith({
    int? id,
    String? name,
    List<Street>? streets,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Chamber(
        id: id ?? this.id,
        name: name ?? this.name,
        streets: streets ?? this.streets,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Chamber.fromJson(String str) => Chamber.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Chamber.fromMap(Map<String, dynamic> json) => Chamber(
        id: json["id"],
        name: json["name"] ?? '',
        streets: List<Street>.from(
          (json["streets"] ?? []).map((x) => Street.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "streets": List<dynamic>.from(streets.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
