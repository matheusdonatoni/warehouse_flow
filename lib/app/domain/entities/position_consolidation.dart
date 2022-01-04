import 'entities.dart';

class PositionConsolidation {
  PositionConsolidation({
    required this.position,
    this.products = const [],
    this.productConsolidationPerPositions = const [],
  });

  PositionEntity position;
  List<ProductEntity> products;
  List<OperationEntity> productConsolidationPerPositions;
}
