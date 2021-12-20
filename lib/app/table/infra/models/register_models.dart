import 'operation_models.dart';

import '../../domain/entities/operation.dart';
import '../../domain/entities/register.dart';

class RegisterModel extends Register {
  RegisterModel({
    int? id,
    List<Operation> operations = const [],
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          operations: operations,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
        id: json["id"],
        operations: List<Operation>.from(
          (json["operations"] ?? []).map(
            (x) => OperationModel.fromMap(x),
          ),
        ),
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "operations": List.from(
          operations.map(
            (x) => (x as OperationModel).toMap(),
          ),
        ),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class AliasedRegisterModel extends RegisterModel {
  AliasedRegisterModel({
    int? id,
    List<Operation> operations = const [],
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          operations: operations,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory AliasedRegisterModel.fromMap(
    Map<String, dynamic> json, {
    required List<Operation> operations,
  }) =>
      AliasedRegisterModel(
        id: json["register_id"],
        operations: operations,
        createdAt: DateTime.tryParse(json["register_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["register_updatedAt"] ?? ''),
      );
}
