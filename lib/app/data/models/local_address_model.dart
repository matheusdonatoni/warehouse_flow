import 'dart:convert';

import 'package:warehouse_flow/app/domain/entities/entities.dart';

class LocalAddressModel {
  LocalAddressModel({
    this.id,
    required this.name,
    required this.indicator,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String name;
  String indicator;

  factory LocalAddressModel.fromJson(String str) =>
      LocalAddressModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalAddressModel.fromMap(Map<String, dynamic> json) =>
      AliasedAddressModel(
        id: json["id"],
        name: json["name"] ?? '',
        indicator: json["indicator"] ?? '',
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "indicator": indicator,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  factory LocalAddressModel.fromEntity(AddressEntity entity) =>
      LocalAddressModel(
        id: entity.id,
        name: entity.name,
        indicator: entity.indicator,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  AddressEntity toEntity() => AddressEntity(
        id: id,
        name: name,
        indicator: indicator,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

class AliasedAddressModel extends LocalAddressModel {
  AliasedAddressModel({
    int? id,
    String name = '',
    String indicator = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          indicator: indicator,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory AliasedAddressModel.fromMap(Map<String, dynamic> json) =>
      AliasedAddressModel(
        id: json["address_id"],
        name: json["address_name"],
        indicator: json["address_indicator"],
        createdAt: DateTime.tryParse(json["address_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["address_updatedAt"] ?? ''),
      );
}
