import 'dart:convert';

import 'package:warehouse_flow/app/data/models/local_register_models.dart';
import 'package:warehouse_flow/app/domain/entities/entities.dart';

class LocalWarehouseModel {
  LocalWarehouseModel({
    this.id,
    required this.name,
    required this.register,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String name;
  RegisterEntity register;

  factory LocalWarehouseModel.fromJson(String str) =>
      LocalWarehouseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalWarehouseModel.fromMap(Map<String, dynamic> json) =>
      LocalWarehouseModel(
        id: json["id"],
        name: json["name"] ?? '',
        register: LocalRegisterModel.fromMap(json['register'] ?? {}).toEntity(),
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "register": LocalRegisterModel.fromEntity(register).toMap(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  factory LocalWarehouseModel.fromEntity(WarehouseEntity entity) =>
      LocalWarehouseModel(
        id: entity.id,
        name: entity.name,
        register: entity.register,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  WarehouseEntity toEntity() => WarehouseEntity(
        id: id,
        name: name,
        register: register,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
