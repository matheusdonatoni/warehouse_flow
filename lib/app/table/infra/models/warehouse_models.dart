import 'register_models.dart';
import '../../domain/entities/register.dart';
import '../../domain/entities/warehouse.dart';

class WarehouseModel extends Warehouse {
  WarehouseModel({
    int? id,
    String name = '',
    required Register register,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          register: register,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory WarehouseModel.fromMap(Map<String, dynamic> json) => WarehouseModel(
        id: json["id"],
        name: json["name"],
        register: RegisterModel.fromMap(json['register'] ?? {}),
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "register": (register as RegisterModel).toMap(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class AliasedWarehouseModel extends WarehouseModel {
  AliasedWarehouseModel({
    int? id,
    String name = '',
    required RegisterModel register,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          register: register,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory AliasedWarehouseModel.fromMap(
    Map<String, dynamic> json, {
    required RegisterModel register,
  }) =>
      AliasedWarehouseModel(
        id: json["warehouse_id"],
        name: json["warehouse_name"],
        register: register,
        createdAt: DateTime.tryParse(json["warehouse_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["warehouse_updatedAt"] ?? ''),
      );
}
