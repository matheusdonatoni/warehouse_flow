import 'package:warehouse_flow/data/models/position.dart';
import 'package:warehouse_flow/data/models/register.dart';

import '../models/street.dart';
import '../models/chamber.dart';
import '../models/warehouse.dart';

import '_impl/base_repository_impl.dart';

class WarehouseRepository extends BaseRepositoryImpl {
  Future<Warehouse> find(int id) async {
    var result = await localStorage.findWarehouse(id);

    return Warehouse.fromMap(result);
  }

  Future<Warehouse> findEagerLoading(int id) async {
    var result = await localStorage.findWarehouseEagerLoading(id);

    Warehouse warehouse = Warehouse();

    for (final map in result) {
      if (warehouse.id == null) {
        warehouse = Warehouse.fromAliasesMap(map);
      }

      var chamber = Chamber.fromAliasesMap(map);

      if (map['warehouseId'] == warehouse.id &&
          !warehouse.chambers.any((e) => e.id == chamber.id)) {
        warehouse.chambers.add(chamber);
      } else {
        chamber = warehouse.chambers.singleWhere((e) => e.id == chamber.id);
      }

      var street = Street.fromAliasesMap(map);

      if (chamber.id == map['chamberId'] &&
          !chamber.streets.any((e) => e.id == street.id)) {
        chamber.streets.add(street);
      } else {
        street = chamber.streets.singleWhere((e) => e.id == street.id);
      }

      var position = Position.fromAliasesMap(map);
      position.register = Register.fromAliasesMap(map);

      if (street.id == map['streetId'] &&
          !street.positions.any((e) => e.id == position.id)) {
        street.positions.add(position);
      }
    }

    return warehouse;
  }
}
