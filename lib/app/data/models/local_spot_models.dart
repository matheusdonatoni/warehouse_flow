import 'dart:convert';

import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/domain/entities/entities.dart';

class LocalSpotModel implements SpotEntity {
  LocalSpotModel({
    this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String name;

  factory LocalSpotModel.fromJson(String str) =>
      LocalSpotModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalSpotModel.fromMap(Map<String, dynamic> json) {
    if (!json.containsKey("id") || json["id"] == null) {
      throw LocalStorageError.invalidEntity;
    }

    return LocalSpotModel(
      id: json["id"],
      name: json["name"] ?? '',
      createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  factory LocalSpotModel.fromEntity(SpotEntity entity) => LocalSpotModel(
        id: entity.id,
        name: entity.name,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  SpotEntity toEntity() => SpotEntity(
        id: id,
        name: name,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
