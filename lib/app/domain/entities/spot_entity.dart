class SpotEntity {
  SpotEntity({
    this. id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String name;
}
