import '../../entities/entities.dart';

abstract class FindSpotFromNameAndWarehouse {
  Future<SpotEntity> call(
    FindSpotFromNameAndWarehouseParams params,
  );
}

class FindSpotFromNameAndWarehouseParams {
  final String name;
  final int warehouseId;

  FindSpotFromNameAndWarehouseParams({
    required this.name,
    required this.warehouseId,
  });
}
