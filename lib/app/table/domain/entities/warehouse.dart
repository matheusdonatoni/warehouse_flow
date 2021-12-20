import 'abs/entity.dart';

import 'register.dart';

class Warehouse extends Entity {
  Warehouse({
    int? id,
    required this.name,
    required this.register,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  String name;
  Register register;
}
