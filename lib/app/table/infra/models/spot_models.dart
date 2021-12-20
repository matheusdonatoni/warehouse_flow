import '../../domain/entities/spot.dart';

class SpotModel extends Spot {
  SpotModel({
    int? id,
    String name = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory SpotModel.fromMap(Map<String, dynamic> json) => SpotModel(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.tryParse(json["createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? ''),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class AliasedSpotModel extends Spot {
  AliasedSpotModel({
    int? id,
    String name = '',
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory AliasedSpotModel.fromMap(
    Map<String, dynamic> json,
  ) =>
      AliasedSpotModel(
        id: json["spot_id"],
        name: json["spot_name"],
        createdAt: DateTime.tryParse(json["spot_createdAt"] ?? ''),
        updatedAt: DateTime.tryParse(json["spot_updatedAt"] ?? ''),
      );
}
