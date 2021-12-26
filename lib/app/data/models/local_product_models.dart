import 'dart:convert';

import 'package:warehouse_flow/app/domain/entities/entities.dart';

class LocalProductModel {
  LocalProductModel({
    this.id,
    required this.code,
    required this.description,
    required this.unit,
    required this.type,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int code;
  String description;
  String unit;
  String type;

  factory LocalProductModel.fromJson(String str) =>
      LocalProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalProductModel.fromMap(Map<String, dynamic> json) =>
      AliasedProductModel(
        id: json["id"],
        code: json["code"] ?? 0,
        description: json["description"] ?? '',
        unit: json["unit"] ?? '',
        type: json["type"] ?? '',
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "description": description,
        "unit": unit,
        "type": type,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  factory LocalProductModel.fromEntity(ProductEntity entity) =>
      LocalProductModel(
        id: entity.id,
        code: entity.code,
        description: entity.description,
        unit: entity.unit,
        type: entity.type,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  ProductEntity toEntity() => ProductEntity(
        id: id,
        code: code,
        description: description,
        unit: unit,
        type: type,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

class AliasedProductModel extends LocalProductModel {
  AliasedProductModel({
    int? id,
    int code = 0,
    String description = '',
    String unit = '',
    String type = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          code: code,
          description: description,
          unit: unit,
          type: type,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory AliasedProductModel.fromMap(Map<String, dynamic> json) =>
      AliasedProductModel(
        id: json["product_id"],
        code: json["product_code"],
        description: json["product_description"],
        unit: json["product_unit"],
        type: json["product_type"],
        createdAt: DateTime.tryParse(json["product_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["product_updatedAt"] ?? ''),
      );
}
