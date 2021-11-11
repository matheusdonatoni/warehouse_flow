import 'dart:convert';

import 'log.dart';

class Product {
  Product({
    this.id,
    required this.code,
    required this.log,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int code;
  Log log;
  DateTime? createdAt;
  DateTime? updatedAt;

  Product copyWith({
    int? id,
    int? code,
    Log? log,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Product(
        id: id ?? this.id,
        code: code ?? this.code,
        log: log ?? this.log,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        code: json["code"] ?? -1,
        log: Log.fromMap(json["log"] ?? Log()),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "log": log.toMap(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
