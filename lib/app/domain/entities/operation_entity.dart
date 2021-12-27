import 'entities.dart';

class OperationEntity {
  OperationEntity({
    this.id,
    required this.amount,
    required this.type,
    required this.product,
    required this.spot,
    required this.address,
    required this.position,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  double amount;
  String type;
  ProductEntity product;
  SpotEntity spot;
  AddressEntity address;
  PositionEntity position;
}