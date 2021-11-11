import 'dart:convert';

import 'positions.dart';

class Street {
  Street({
    this.id,
    this.name = '',
    this.positions = const [],
  });

  int? id;
  String name;
  List<Position> positions;

  Street copyWith({
    int? id,
    String? name,
    List<Position>? positions,
  }) =>
      Street(
        id: id ?? this.id,
        name: name ?? this.name,
        positions: positions ?? this.positions,
      );

  factory Street.fromJson(String str) => Street.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Street.fromMap(Map<String, dynamic> json) => Street(
        id: json["id"],
        name: json["name"] ?? '',
        positions: List<Position>.from(
          (json["positions"] ?? []).map((x) => Position.fromMap(x)),
        ),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "positions": List<dynamic>.from(positions.map((x) => x.toMap())),
      };
}
