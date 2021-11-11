import 'dart:convert';

class Position {
  Position({
    this.id,
    required this.height,
    required this.depth,
    required this.quantity,
  });

  int? id;
  int height;
  int depth;
  double quantity;

  Position copyWith({
    int? id,
    int? height,
    int? depth,
    double? quantity,
  }) =>
      Position(
        id: id ?? this.id,
        height: height ?? this.height,
        depth: depth ?? this.depth,
        quantity: quantity ?? this.quantity,
      );

  factory Position.fromJson(String str) => Position.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Position.fromMap(Map<String, dynamic> json) => Position(
        id: json["id"],
        height: json["height"] ?? -1,
        depth: json["depth"] ?? -1,
        quantity: json["quantity"] ?? -1,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "height": height,
        "depth": depth,
        "quantity": quantity,
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
