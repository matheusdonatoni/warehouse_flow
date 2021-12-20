import 'package:dartz/dartz.dart';
import '../errors/table_exception.dart';
import '../entities/warehouse.dart';

abstract class WarehouseRepository {
  Future<Either<TableException, Warehouse>> findWithRegisterById(int id);
}
