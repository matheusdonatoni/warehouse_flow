import 'entities.dart';

class ProductConsolidation {
  ProductConsolidation({
    required this.productConsolidationsPerPosition,
  }) : assert(
          productConsolidationsPerPosition.isEmpty ||
              productConsolidationsPerPosition.every(
                (e) =>
                    e.product.id ==
                    productConsolidationsPerPosition.first.product.id,
              ),
        );

  double get total {
    if (productConsolidationsPerPosition.isEmpty) return 0;
    return productConsolidationsPerPosition
        .map((e) => e.amount)
        .reduce((value, element) => value + element);
  }

  ProductEntity? get product {
    if (productConsolidationsPerPosition.isNotEmpty)
      return productConsolidationsPerPosition.first.product;
  }

  List<ProductConsolidationPerPosition> productConsolidationsPerPosition;
}
