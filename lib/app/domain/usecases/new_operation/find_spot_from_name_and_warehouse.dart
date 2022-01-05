import '../../entities/entities.dart';

abstract class FindSpotFromNameAndWarehouse {
  Future<SpotEntity> call();
}

class FindSpotFromNameAndWarehouseParams {
  final String name;
  final WarehouseEntity warehouse;

  FindSpotFromNameAndWarehouseParams({
    required this.name,
    required this.warehouse,
  });
}
