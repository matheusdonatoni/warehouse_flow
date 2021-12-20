import 'package:dartz/dartz.dart';

import '../datasources/warehouse_datasource.dart';
import '../../domain/entities/warehouse.dart';
import '../../domain/errors/table_exception.dart';
import '../../domain/repositories/warehouse_repository.dart';

class WarehouseRepositoryImpl implements WarehouseRepository {
  final WarehouseDatasource datasource;

  WarehouseRepositoryImpl(this.datasource);

  @override
  Future<Either<TableException, Warehouse>> findWithRegisterById(int id) async {
    Warehouse? warehouse;

    try {
      warehouse = await datasource.findById(id);
    } catch (e) {
      return left(DataSourceException());
    }

    return warehouse == null ? left(EmptyValueException()) : right(warehouse);
  }
}
