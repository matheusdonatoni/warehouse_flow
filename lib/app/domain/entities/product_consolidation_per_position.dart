import 'entities.dart';

class ProductConsolidationPerPosition {
  ProductConsolidationPerPosition({
    required this.product,
    required this.position,
    required this.amount,
  });

  ProductEntity product;
  PositionEntity position;
  double amount;
}
