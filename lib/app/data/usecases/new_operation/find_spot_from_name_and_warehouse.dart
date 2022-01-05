import 'package:warehouse_flow/app/domain/usecases/new_operation/find_spot_from_name_and_warehouse.dart';

import '../../../domain/entities/entities.dart';

class FindSpotFromNameAndWarehouseLocally
    implements FindSpotFromNameAndWarehouse {
  @override
  Future<SpotEntity> call(FindSpotFromNameAndWarehouseParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FindSpotFromNameAndWarehouseLocallyParams {
  final String name;
  final int warehouseId;

  FindSpotFromNameAndWarehouseLocallyParams({
    required this.name,
    required this.warehouseId,
  });

  factory FindSpotFromNameAndWarehouseLocallyParams.fromDomain(
          FindSpotFromNameAndWarehouseParams params) =>
      FindSpotFromNameAndWarehouseLocallyParams(
        name: params.name,
        warehouseId: params.warehouseId,
      );
}
