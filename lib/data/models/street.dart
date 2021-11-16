import 'dart:convert';

import 'position.dart';

class Street {
  Street({
    this.id = 0,
    this.name,
    this.number,
    this.positions = const [],
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String? name;
  int? number;
  List<Position> positions;
  DateTime? createdAt;
  DateTime? updatedAt;

  Street copyWith({
    int? id,
    String? name,
    int? number,
    List<Position>? positions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Street(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
        positions: positions ?? this.positions,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Street.fromJson(String str) => Street.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Street.fromMap(Map<String, dynamic> json) => Street(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        number: json["number"] ?? 0,
        positions: List<Position>.from(
          (json["positions"] ?? []).map((x) => Position.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "number": number,
        "positions": List<dynamic>.from(positions.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
