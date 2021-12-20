import '../../domain/entities/position.dart';

class PositionModel extends Position {
  PositionModel({
    int? id,
    int height = 0,
    int depth = 0,
    String type = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          height: height,
          depth: depth,
          type: type,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory PositionModel.fromMap(Map<String, dynamic> json) => PositionModel(
        id: json["id"],
        height: json["height"],
        depth: json["depth"],
        type: json["type"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "height": height,
        "depth": depth,
        "type": type,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class AliasedPositionModel extends PositionModel {
  AliasedPositionModel({
    int? id,
    int height = 0,
    int depth = 0,
    String type = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          height: height,
          depth: depth,
          type: type,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory AliasedPositionModel.fromMap(Map<String, dynamic> json) =>
      AliasedPositionModel(
        id: json["position_id"],
        height: json["position_height"],
        depth: json["position_depth"],
        type: json["position_type"],
        createdAt: DateTime.tryParse(json["position_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["position_updatedAt"] ?? ''),
      );
}
