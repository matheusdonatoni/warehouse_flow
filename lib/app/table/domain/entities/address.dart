import 'abs/entity.dart';

class Address extends Entity {
  Address({
    int? id,
    required this.name,
    required this.indicator,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  String name;
  String indicator;
}
