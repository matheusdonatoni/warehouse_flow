import 'entities.dart';

class PositionConsolidation {
  PositionConsolidation({
    required this.productConsolidationsPerPosition,
  }) : assert(
          productConsolidationsPerPosition.isEmpty ||
              productConsolidationsPerPosition.every(
                (e) =>
                    e.position.id ==
                    productConsolidationsPerPosition.first.position.id,
              ),
        );

  PositionEntity? get position {
    if (productConsolidationsPerPosition.isNotEmpty)
      return productConsolidationsPerPosition.first.position;
  }

  List<ProductConsolidationPerPosition> productConsolidationsPerPosition;
}
