import 'dart:convert';

import 'street.dart';

class Chamber {
  Chamber({
    this.id = 0,
    this.name,
    this.streets = const [],
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String? name;
  List<Street> streets;
  DateTime? createdAt;
  DateTime? updatedAt;

  Chamber copyWith({
    int? id,
    String? name,
    List<Street>? streets,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Chamber(
        id: id ?? this.id,
        name: name ?? this.name,
        streets: streets ?? this.streets,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Chamber.fromJson(String str) => Chamber.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Chamber.fromMap(Map<String, dynamic> json) => Chamber(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        streets: List<Street>.from(
          (json["streets"] ?? []).map((x) => Street.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "streets": List<dynamic>.from(streets.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
