import 'abs/entity.dart';
import 'operation.dart';

class Register extends Entity {
  Register({
    int? id,
    required this.operations,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  List<Operation> operations;
}
