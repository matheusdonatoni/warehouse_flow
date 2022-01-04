import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/usecases/find_warehouse_operations_locally.dart';
import 'package:warehouse_flow/app/domain/entities/entities.dart';
import 'package:warehouse_flow/app/domain/usecases/find_warehouse_operations.dart';

import '../mocks/local_storage_factory.dart';
import '../mocks/local_storage_spy.dart';

void main() {
  late FindWarehouseOperationsParams params;
  late List<Map<String, dynamic>> databaseResult;
  late FindWarehouseOperationsLocally sut;
  late LocalStorageSpy localStorage;

  setUp(() {
    params = FindWarehouseOperationsParams(id: 1);
    databaseResult = LocalStorageFactory.makeWarehouseOperationListResult();
    localStorage = LocalStorageSpy();
    localStorage.mockFind(databaseResult);
    sut = FindWarehouseOperationsLocally(localStorage: localStorage);
  });

  test('Should call LocalStorage.find with correct values', () async {
    await sut(params);

    verify(
      () => localStorage.find(
        query: QueryHelper.findWarehouseOperations,
        arguments: [1],
      ),
    );
  });

  test('Should return a list of OperationsEntity', () async {
    var future = await sut(params);

    expect(future, isA<List<OperationEntity>>());
  });
}
