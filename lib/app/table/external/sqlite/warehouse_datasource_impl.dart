import 'package:sqflite/sqflite.dart';
import 'package:warehouse_flow/data/utils/constants.dart';

import '../../domain/entities/warehouse.dart';
import '../../domain/errors/table_exception.dart';
import '../../external/sqlite/queries/queries.dart';
import '../../infra/models/address_models.dart';
import '../../infra/models/operation_models.dart';
import '../../infra/models/position_models.dart';
import '../../infra/models/product_models.dart';
import '../../infra/models/register_models.dart';
import '../../infra/models/spot_models.dart';
import '../../infra/models/warehouse_models.dart';
import '../../infra/datasources/warehouse_datasource.dart';

class WarehouseDataSourceImpl extends WarehouseDatasource {
  final Database db;

  WarehouseDataSourceImpl(this.db);

  @override
  Future<Warehouse> findById(int id) async {
    try {
      var maps = await db.rawQuery(
        Query.warehouseWithRegiseter(id),
      );

      Warehouse? warehouse;

      for (final map in maps) {
        if (warehouse == null) {
          warehouse = AliasedWarehouseModel.fromMap(
            map,
            register: AliasedRegisterModel.fromMap(map, operations: []),
          );
        }

        final operation = AliasedOperationModel.fromMap(
          map,
          spot: AliasedSpotModel.fromMap(map),
          address: AliasedAddressModel.fromMap(map),
          position: AliasedPositionModel.fromMap(map),
          product: AliasedProductModel.fromMap(map),
        );

        if (map[kRegisterId] == warehouse.register.id && operation.id != null) {
          warehouse.register.operations.add(operation);
        }
      }

      if (warehouse != null) return warehouse;

      throw DataSourceException();
    } on DatabaseException catch (_) {
      throw InvalidSearchParamsException();
    }
  }
}
