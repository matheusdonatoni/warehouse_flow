import 'dart:convert';

import 'operation.dart';

class Log {
  Log({
    this.id,
    this.logOperations = const [],
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  List<Operation> logOperations;
  DateTime? createdAt;
  DateTime? updatedAt;

  Log copyWith({
    int? id,
    List<Operation>? operations,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Log(
        id: id ?? this.id,
        logOperations: operations ?? this.logOperations,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Log.fromJson(String str) => Log.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Log.fromMap(Map<String, dynamic> json) => Log(
        id: json["id"],
        logOperations: List<Operation>.from(
          (json["operations"] ?? []).map((x) => Operation.fromMap(x)),
        ),
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "operations": List.from(logOperations.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
