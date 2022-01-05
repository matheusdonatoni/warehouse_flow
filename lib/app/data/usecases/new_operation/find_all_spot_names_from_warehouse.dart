import 'package:warehouse_flow/app/domain/usecases/new_operation/find_all_spot_names_from_warehouse.dart';

import '../../../domain/entities/entities.dart';

class FindAllSpotFromWarehouseLocally implements FindAllSpotFromWarehouse {
  @override
  Future<List<SpotEntity>> call(FindAllSpotFromWarehouseParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindAllSpotFromWarehouseLocallyParams {
  final int warehouseId;

  FindAllSpotFromWarehouseLocallyParams({
    required this.warehouseId,
  });

  factory FindAllSpotFromWarehouseLocallyParams.fromDomain(
          FindAllSpotFromWarehouseParams params) =>
      FindAllSpotFromWarehouseLocallyParams(
        warehouseId: params.warehouseId,
      );
}
