import 'abs/entity.dart';


class Spot extends Entity {
  Spot({
    int? id,
    required this.name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  String name;
}
