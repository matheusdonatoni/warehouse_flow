import 'entities.dart';

class ProductConsolidation {
  ProductConsolidation({
    required this.position,
    this.amount = 0,
    this.positions = const [],
    this.productConsolidationPerPositions = const [],
  });

  PositionEntity position;
  int amount;
  List<PositionEntity> positions;
  List<OperationEntity> productConsolidationPerPositions;
}
