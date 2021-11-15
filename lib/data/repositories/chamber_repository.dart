import '/data/models/chamber.dart';

import '/data/models/warehouse.dart';

import '_impl/base_repository_impl.dart';

class ChamberRepository extends BaseRepositoryImpl {
  Future<List<Chamber>> findFromWarehouse(Warehouse warehouse) async {
    var result = await localStorage.findChambersFromWarehouse(warehouse);

    return List.from(
      result.map(
        (e) => Chamber.fromMap(e),
      ),
    );
  }
}
