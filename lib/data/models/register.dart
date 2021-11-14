import 'dart:convert';

import 'operation.dart';

class Register {
  Register({
    this.id,
    this.opreations = const [],
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  List<Operation> opreations;
  DateTime? createdAt;
  DateTime? updatedAt;

  Register copyWith({
    int? id,
    List<Operation>? operations,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Register(
        id: id ?? this.id,
        opreations: operations ?? this.opreations,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Register.fromJson(String str) => Register.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Register.fromMap(Map<String, dynamic> json) => Register(
        id: json["id"],
        opreations: List<Operation>.from(
          (json["operations"] ?? []).map((x) => Operation.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "operations": List.from(opreations.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
