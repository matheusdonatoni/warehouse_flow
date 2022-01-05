import '../../entities/entities.dart';

abstract class FindAllSpotFromWarehouse {
  Future<List<SpotEntity>> call(
    FindAllSpotFromWarehouseParams params,
  );
}

class FindAllSpotFromWarehouseParams {
  final int warehouseId;

  FindAllSpotFromWarehouseParams({
    required this.warehouseId,
  });
}
