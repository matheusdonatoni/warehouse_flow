import 'entities.dart';

class OperationEntity {
  OperationEntity({
    this.id,
    required this.amount,
    required this.type,
    required this.product,
    required this.position,
    required this.spot,
    required this.address,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  double amount;
  String type;
  ProductEntity product;
  PositionEntity position;
  SpotEntity spot;
  AddressEntity address;
}
