import 'dart:convert';

import 'chamber.dart';

class Warehouse {
  Warehouse({
    this.id,
    this.name = '',
    this.chambers = const [],
  });

  int? id;
  String name;
  List<Chamber> chambers;

  Warehouse copyWith({
    int? id,
    String? name,
    List<Chamber>? chambers,
  }) =>
      Warehouse(
        id: id ?? this.id,
        name: name ?? this.name,
        chambers: chambers ?? this.chambers,
      );

  factory Warehouse.fromJson(String str) => Warehouse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Warehouse.fromMap(Map<String, dynamic> json) => Warehouse(
        id: json["id"],
        name: json["name"] ?? '',
        chambers: List<Chamber>.from(
          (json["chambers"] ?? []).map((x) => Chamber.fromMap(x)),
        ),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "chambers": List.from(chambers.map((x) => x.toMap())),
      };
}
