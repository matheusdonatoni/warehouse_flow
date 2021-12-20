import 'package:warehouse_flow/app/table/domain/entities/abs/entity.dart';

class Product extends Entity {
  Product({
    int? id,
    required this.code,
    required this.description,
    required this.unit,
    required this.type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  int code;
  String description;
  String unit;
  String type;
}
