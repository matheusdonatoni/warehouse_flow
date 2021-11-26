import '../utils/constants.dart';

import '../models/operation.dart';
import '../models/position.dart';
import '../models/street.dart';
import '../models/chamber.dart';
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
        chamber: Chamber.fromAliasesMap(map),
        street: Street.fromAliasesMap(map),
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

      var chamber = Chamber.fromAliasesMap(map);

      if (map[kWarehouseId] == warehouse.id &&
          chamber.id != null &&
          !warehouse.chambers.any((e) => e.id == chamber.id)) {
        warehouse.chambers.add(chamber);
      } else {
        chamber = warehouse.chambers.singleWhere((e) => e.id == chamber.id);
      }

      var street = Street.fromAliasesMap(map);

      if (chamber.id == map[kChamberId] &&
          street.id != null &&
          !chamber.streets.any((e) => e.id == street.id)) {
        chamber.streets.add(street);
      } else {
        street = chamber.streets.singleWhere((e) => e.id == street.id);
      }

      var position = Position.fromAliasesMap(map);

      if (street.id == map[kStreetId] &&
          position.id != null &&
          !street.positions.any((e) => e.id == position.id)) {
        street.positions.add(position);
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
        chamber: Chamber.fromAliasesMap(map),
        street: Street.fromAliasesMap(map),
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
