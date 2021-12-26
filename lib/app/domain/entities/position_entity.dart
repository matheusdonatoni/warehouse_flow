

class PositionEntity {
  PositionEntity({
    this.id,
    required this.height,
    required this.depth,
    required this.type,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int height;
  int depth;
  String type;
}
