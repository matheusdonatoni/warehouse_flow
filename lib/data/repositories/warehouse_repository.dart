import '../utils/constants.dart';

import '../models/operation.dart';
import '../models/position.dart';
import '../models/address.dart';
import '../models/spot.dart';
import '../models/warehouse.dart';
import '../models/register.dart';
import '../models/product.dart';

import '_impl/base_repository_impl.dart';

class WarehouseRepository extends BaseRepositoryImpl {
  Future<Warehouse> find(int id) async {
    var result = await localStorage.findWarehouse(id);

    return Warehouse.fromMap(result);
  }

  Future<Warehouse> findEagerLoadRegister(int id) async {
    var result = await localStorage.findWarehouseEagerLoadRegister(id);

    Warehouse warehouse = Warehouse();

    for (final map in result) {
      if (warehouse.id == null) {
        warehouse = Warehouse.fromAliasesMap(
          map,
          register: Register.fromAliasesMap(map),
        );
      }

      final operation = Operation.fromAliasesMap(
        map,
        spot: Spot.fromAliasesMap(map),
        address: Address.fromAliasesMap(map),
        position: Position.fromAliasesMap(map),
        product: Product.fromAlisesMap(map),
      );

      if (map[kRegisterId] == warehouse.register.id && operation.id != null) {
        warehouse.register.operations.add(operation);
      }
    }

    return warehouse;
  }
}
