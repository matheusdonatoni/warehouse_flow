import 'dart:convert';

class Position {
  Position({
    this.id,
    required this.height,
    required this.depth,
  });

  int? id;
  int height;
  int depth;

  Position copyWith({
    int? id,
    int? height,
    int? depth,
  }) =>
      Position(
        id: id ?? this.id,
        height: height ?? this.height,
        depth: depth ?? this.depth,
      );

  factory Position.fromJson(String str) => Position.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Position.fromMap(Map<String, dynamic> json) => Position(
        id: json["id"] == null ? null : json["id"],
        height: json["height"] == null ? null : json["height"],
        depth: json["depth"] == null ? null : json["depth"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "height": height,
        "depth": depth,
      };
}
