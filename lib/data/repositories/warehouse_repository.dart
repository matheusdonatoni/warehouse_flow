import 'package:warehouse_flow/data/models/warehouse.dart';

import '_impl/base_repository_impl.dart';

class WarehouseRepository extends BaseRepositoryImpl {
  Future<Warehouse> find(int id) async {
    var result = await localStorage.findWarehouse(id);

    return Warehouse.fromMap(result);
  }
}
