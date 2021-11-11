import 'dart:convert';

import 'positions.dart';

class Street {
  Street({
    this.id,
    required this.name,
    required this.number,
    this.positions = const [],
  });

  int? id;
  String name;
  int number;
  List<Position> positions;

  Street copyWith({
    int? id,
    String? name,
    int? number,
    List<Position>? positions,
  }) =>
      Street(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
        positions: positions ?? this.positions,
      );

  factory Street.fromJson(String str) => Street.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Street.fromMap(Map<String, dynamic> json) => Street(
        id: json["id"],
        name: json["name"] ?? '',
        number: json["number"] ?? -1,
        positions: List<Position>.from(
          (json["positions"] ?? []).map((x) => Position.fromMap(x)),
        ),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "number": number,
        "positions": List<dynamic>.from(positions.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
