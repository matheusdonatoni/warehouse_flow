import 'dart:convert';

import 'product.dart';

class Position {
  Position({
    this.id,
    required this.height,
    required this.depth,
    this.products = const [],
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int height;
  int depth;
  List<Product> products;
  DateTime? createdAt;
  DateTime? updatedAt;

  Position copyWith({
    int? id,
    int? height,
    int? depth,
    List<Product>? products,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Position(
        id: id ?? this.id,
        height: height ?? this.height,
        depth: depth ?? this.depth,
        products: products ?? this.products,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Position.fromJson(String str) => Position.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Position.fromMap(Map<String, dynamic> json) => Position(
        id: json["id"],
        height: json["height"] ?? -1,
        depth: json["depth"] ?? -1,
        products: List<Product>.from(
          (json["products"] ?? []).map((x) => Product.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "height": height,
        "depth": depth,
        "products": List.from(products.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
