import 'dart:convert';

class Product {
  Product({
    this.id,
    this.code = '',
    this.description = '',
    this.unit = '',
    this.type = '',
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String code;
  String description;
  String unit;
  String type;
  DateTime? createdAt;
  DateTime? updatedAt;

  Product copyWith({
    int? id,
    String? code,
    String? description,
    String? unit,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Product(
        id: id ?? this.id,
        code: code ?? this.code,
        description: description ?? this.description,
        unit: unit ?? this.unit,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        code: json["code"] ?? '',
        description: json["description"] ?? '',
        unit: json["unit"] ?? '',
        type: json["unit"] ?? '',
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
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

  @override
  String toString() {
    return toMap().toString();
  }
}
