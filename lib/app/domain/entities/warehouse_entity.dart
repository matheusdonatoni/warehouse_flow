import 'entities.dart';

class WarehouseEntity {
  WarehouseEntity({
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
}
