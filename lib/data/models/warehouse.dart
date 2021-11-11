import 'dart:convert';

import 'chamber.dart';

class Warehouse {
  Warehouse({
    this.id,
    this.name = '',
    this.chambers = const [],
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String name;
  List<Chamber> chambers;
  DateTime? createdAt;
  DateTime? updatedAt;

  Warehouse copyWith({
    int? id,
    String? name,
    List<Chamber>? chambers,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Warehouse(
        id: id ?? this.id,
        name: name ?? this.name,
        chambers: chambers ?? this.chambers,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Warehouse.fromJson(String str) => Warehouse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Warehouse.fromMap(Map<String, dynamic> json) => Warehouse(
        id: json["id"],
        name: json["name"] ?? '',
        chambers: List<Chamber>.from(
          (json["chambers"] ?? []).map((x) => Chamber.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "chambers": List.from(chambers.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
