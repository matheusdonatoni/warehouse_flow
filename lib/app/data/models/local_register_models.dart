import 'dart:convert';

import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/domain/entities/entities.dart';

import 'local_operation_models.dart';

class LocalRegisterModel implements RegisterEntity {
  LocalRegisterModel({
    this.id,
    this.operations = const [],
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<OperationEntity> operations;

  factory LocalRegisterModel.fromJson(String str) =>
      LocalRegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalRegisterModel.fromMap(Map<String, dynamic> json) {
    if (!json.containsKey("id") || json["id"] == null) {
      throw LocalStorageError.invalidEntity;
    }

    return LocalRegisterModel(
      id: json["id"],
      operations: List<OperationEntity>.from(
        (json["operations"] ?? []).map(
          (x) => LocalOperationModel.fromMap(x).toEntity(),
        ),
      ),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "operations": List.from(
          operations.map(
            (x) => LocalOperationModel.fromEntity(x).toMap(),
          ),
        ),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  factory LocalRegisterModel.fromEntity(RegisterEntity entity) =>
      LocalRegisterModel(
        id: entity.id,
        operations: entity.operations,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  RegisterEntity toEntity() => RegisterEntity(
        id: id,
        operations: operations,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
