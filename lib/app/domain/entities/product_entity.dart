class ProductEntity {
  ProductEntity({
    this.id,
    required this.code,
    required this.description,
    required this.unit,
    required this.type,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int code;
  String description;
  String unit;
  String type;
}
