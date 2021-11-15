import 'dart:convert';

import 'register.dart';

class Position {
  Position({
    this.id = 0,
    required this.height,
    required this.depth,
    required this.register,
    required this.type,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int height;
  int depth;
  String type;
  Register register;
  DateTime? createdAt;
  DateTime? updatedAt;

  Position copyWith({
    int? id,
    int? height,
    int? depth,
    String? type,
    Register? register,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Position(
        id: id ?? this.id,
        height: height ?? this.height,
        depth: depth ?? this.depth,
        type: type ?? this.type,
        register: register ?? this.register,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Position.fromJson(String str) => Position.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Position.fromMap(Map<String, dynamic> json) => Position(
        id: json["id"] = 0,
        height: json["height"] ?? 0,
        depth: json["depth"] ?? 0,
        type: json["type"] ?? '',
        register: Register.fromMap(json["register"] ?? Register()),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "height": height,
        "depth": depth,
        "type": type,
        "register": register.toMap(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
