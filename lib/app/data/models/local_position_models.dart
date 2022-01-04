import 'dart:convert';

import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/domain/entities/entities.dart';

class LocalPositionModel {
  LocalPositionModel._({
    this.id,
    required this.height,
    required this.depth,
    required this.type,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int height;
  int depth;
  String type;

  factory LocalPositionModel.fromJson(String str) =>
      LocalPositionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalPositionModel.fromMap(Map<String, dynamic> json) {
    if (!json.containsKey("id") || json["id"] == null) {
      throw LocalStorageError.invalidEntity;
    }

    return LocalPositionModel._(
      id: json["id"],
      height: json["height"] ?? 0,
      depth: json["depth"] ?? 0,
      type: json["type"] ?? '',
      createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "height": height,
        "depth": depth,
        "type": type,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  factory LocalPositionModel.fromEntity(PositionEntity entity) =>
      LocalPositionModel._(
        id: entity.id,
        height: entity.height,
        depth: entity.depth,
        type: entity.type,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  PositionEntity toEntity() => PositionEntity(
        id: id,
        height: height,
        depth: depth,
        type: type,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
