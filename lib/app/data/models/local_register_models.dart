import 'dart:convert';

import 'package:warehouse_flow/app/domain/entities/entities.dart';

import 'local_operation_models.dart';

class LocalRegisterModel extends RegisterEntity {
  LocalRegisterModel({
    int? id,
    List<OperationEntity> operations = const [],
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          operations: operations,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory LocalRegisterModel.fromJson(String str) =>
      LocalRegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalRegisterModel.fromMap(Map<String, dynamic> json) {
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
