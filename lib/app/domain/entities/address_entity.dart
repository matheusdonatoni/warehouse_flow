
class AddressEntity {
  AddressEntity({
    this.id,
    required this.name,
    required this.indicator,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String name;
  String indicator;
}
