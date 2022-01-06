abstract class FindAllSpotNamesFromWarehouse {
  Future<List<String>> call(
    FindAllSpotNamesFromWarehouseParams params,
  );
}

class FindAllSpotNamesFromWarehouseParams {
  final int warehouseId;

  FindAllSpotNamesFromWarehouseParams({
    required this.warehouseId,
  });
}
