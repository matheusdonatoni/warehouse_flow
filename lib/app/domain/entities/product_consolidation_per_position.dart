import 'entities.dart';

class ProductConsolidationPerPosition {
  ProductConsolidationPerPosition({
    required this.product,
    required this.position,
    this.amount = 0,
  });

  ProductEntity product;
  PositionEntity position;
  double amount;
}
