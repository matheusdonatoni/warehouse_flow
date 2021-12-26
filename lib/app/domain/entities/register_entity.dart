import 'entities.dart';

class RegisterEntity {
  RegisterEntity({
    this.id,
    required this.operations,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<OperationEntity> operations;
}
