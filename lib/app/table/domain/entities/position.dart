import 'package:warehouse_flow/app/table/domain/entities/abs/entity.dart';

class Position extends Entity {
  Position({
    int? id,
    required this.height,
    required this.depth,
    required this.type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  int height;
  int depth;
  String type;
}
