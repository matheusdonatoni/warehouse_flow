import '../../entities/entities.dart';

abstract class FindAllSpotFromWarehouse {
  Future<List<SpotEntity>> call();
}

class FindAllSpotFromWarehouseParams {
  final WarehouseEntity warehouse;

  FindAllSpotFromWarehouseParams({
    required this.warehouse,
  });
}
