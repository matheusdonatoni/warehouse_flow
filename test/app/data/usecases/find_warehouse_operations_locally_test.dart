import 'package:flutter_test/flutter_test.dart';
import 'package:warehouse_flow/app/data/usecases/find_warehouse_operations_locally.dart';

import '../mocks/local_storage_factory.dart';
import '../mocks/local_storage_spy.dart';

void main() {
  late FindWarehouseOperationsLocally sut;
  late LocalStorageSpy localStorage;
  late FindWarehouseOperationsLocallyParams params;
  late List<Map<String, dynamic>> databaseResult;

  setUp(() {
    params = FindWarehouseOperationsLocallyParams(warehouseId: 1);
    databaseResult = LocalStorageFactory.makeWarehouseOperationListResult();
    localStorage = LocalStorageSpy();
    localStorage.mockFind(databaseResult);
    sut = FindWarehouseOperationsLocally(localStorage: localStorage);
  });
}
