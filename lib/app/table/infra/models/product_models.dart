import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
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

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        unit: json["unit"],
        type: json["type"],
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
}

class AliasedProductModel extends ProductModel {
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
