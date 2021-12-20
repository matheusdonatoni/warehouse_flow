import '../../domain/entities/warehouse.dart';

abstract class WarehouseDatasource {
  Future<Warehouse?> findById(int id);
}
