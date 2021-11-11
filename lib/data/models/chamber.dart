import 'dart:convert';

import 'street.dart';

class Chamber {
  Chamber({
    this.id,
    this.name = '',
    this.streets = const [],
  });

  int? id;
  String name;
  List<Street> streets;

  Chamber copyWith({
    int? id,
    String? name,
    List<Street>? streets,
  }) =>
      Chamber(
        id: id ?? this.id,
        name: name ?? this.name,
        streets: streets ?? this.streets,
      );

  factory Chamber.fromJson(String str) => Chamber.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Chamber.fromMap(Map<String, dynamic> json) => Chamber(
        id: json["id"],
        name: json["name"],
        streets: List<Street>.from(
          (json["streets"] ?? []).map((x) => Street.fromMap(x)),
        ),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "streets": List<dynamic>.from(streets.map((x) => x.toMap())),
      };
}
