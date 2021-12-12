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

  Future<Warehouse> findEagerLoadAll(int id) async {
    var result = await localStorage.findWarehouseEagerLoadAll(id);

    final maps = <Map<String, dynamic>>[];

    if (result[0] is List<Map<String, dynamic>>) {
      maps.addAll(result[0] as List<Map<String, dynamic>>);
    }

    Warehouse warehouse = Warehouse();

    for (final map in maps) {
      if (warehouse.id == null) {
        warehouse = Warehouse.fromAliasesMap(map);
      }

      var spot = Spot.fromAliasesMap(map);

      if (map[kWarehouseId] == warehouse.id &&
          spot.id != null &&
          !warehouse.spots.any((e) => e.id == spot.id)) {
        warehouse.spots.add(spot);
      } else {
        spot = warehouse.spots.singleWhere((e) => e.id == spot.id);
      }

      var address = Address.fromAliasesMap(map);

      if (spot.id == map[kSpotId] &&
          address.id != null &&
          !spot.addresses.any((e) => e.id == address.id)) {
        spot.addresses.add(address);
      } else {
        address = spot.addresses.singleWhere((e) => e.id == address.id);
      }

      var position = Position.fromAliasesMap(map);

      if (address.id == map[kAddressId] &&
          position.id != null &&
          !address.positions.any((e) => e.id == position.id)) {
        address.positions.add(position);
      }
    }

    if (result[1] is List<Map<String, dynamic>>) {
      maps
        ..clear()
        ..addAll(result[1] as List<Map<String, dynamic>>);
    }

    for (final map in maps) {
      if (warehouse.register.id == null) {
        warehouse.register = Register.fromAliasesMap(map);
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
