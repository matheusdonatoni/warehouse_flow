import '../../entities/entities.dart';

abstract class FindSpotFromNameAndWarehouse {
  Future<SpotEntity> call(
    FindSpotFromNameAndWarehouseParams params,
  );
}

class FindSpotFromNameAndWarehouseParams {
  final String name;
  final WarehouseEntity warehouse;

  FindSpotFromNameAndWarehouseParams({
    required this.name,
    required this.warehouse,
  });
}
