import 'abs/entity.dart';
import 'address.dart';
import 'position.dart';
import 'product.dart';
import 'spot.dart';

class Operation extends Entity {
  Operation({
    int? id,
    required this.amount,
    required this.type,
    required this.product,
    required this.spot,
    required this.address,
    required this.position,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  double amount;
  String type;
  Product product;
  Spot spot;
  Address address;
  Position position;
}
