import '../models/spot.dart';

import '/data/models/warehouse.dart';

import '_impl/base_repository_impl.dart';

class SpotRepository extends BaseRepositoryImpl {
  Future<List<Spot>> findFromWarehouse(Warehouse warehouse) async {
    var result = await localStorage.findSpotsFromWarehouse(warehouse);

    return List.from(
      result.map(
        (e) => Spot.fromMap(e),
      ),
    );
  }

  Future<List<String>> findSpotNames(Warehouse warehouse) async {
    var result = await localStorage.findSpotNames(warehouse);

    return List.from(
      result.map(
        (e) => e['name'],
      ),
    );
  }

  Future<Spot> findFromName(String name) async {
    var result = await localStorage.findSpotFromName(name);

    return Spot.fromMap(result);
  }
}
