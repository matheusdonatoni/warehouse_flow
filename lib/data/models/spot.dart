import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'address.dart';

class RxSpot {
  final id = Rxn<int>();
  final name = Rxn<String>();
  final addresses = RxList<Address>();
  final createdAt = Rxn<DateTime>();
  final updatedAt = Rxn<DateTime>();
}

class Spot {
  Spot({
    int? id,
    String? name,
    List<Address>? addresses,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.name = name;
    this.addresses = addresses ?? [];
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  final rx = RxSpot();

  int? get id => rx.id.value;
  set id(int? value) => rx.id.value = value;

  String? get name => rx.name.value;
  set name(String? value) => rx.name.value = value;

  List<Address> get addresses => rx.addresses;
  set addresses(List<Address> value) => rx.addresses.value = value;

  DateTime? get createdAt => rx.createdAt.value;
  set createdAt(DateTime? value) => rx.createdAt.value = value;

  DateTime? get updatedAt => rx.updatedAt.value;
  set updatedAt(DateTime? value) => rx.updatedAt.value = value;

  Spot copyWith({
    int? id,
    String? name,
    List<Address>? addresses,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Spot(
        id: id ?? this.id,
        name: name ?? this.name,
        addresses: addresses ?? this.addresses,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Spot.fromJson(String str) => Spot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Spot.fromMap(Map<String, dynamic> json) => Spot(
        id: json["id"],
        name: json["name"],
        addresses: List<Address>.from(
          (json["addresses"] ?? []).map((x) => Address.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  factory Spot.fromAliasesMap(
    Map<String, dynamic> json, {
    List<Address>? addresses,
  }) =>
      Spot(
        id: json["s_id"],
        name: json["s_name"],
        addresses: addresses,
        createdAt: DateTime.tryParse(json["s_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["s_updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "addresses": List<dynamic>.from(addresses.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
