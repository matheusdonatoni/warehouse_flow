import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/usecases/find_warehouse_with_register_locally.dart';
import 'package:warehouse_flow/app/domain/entities/entities.dart';
import 'package:warehouse_flow/app/domain/helpers/domain_errors.dart';
import 'package:warehouse_flow/app/domain/usecases/find_warehouse_with_register.dart';

import '../../domain/params_factory.dart';
import '../../infra/database_factory.dart';
import '../mocks/local_storage_spy.dart';

void main() {
  late FindWarehouseWithRegisterLocally sut;
  late LocalStorageSpy localStorage;
  late FindWarehouseWithRegisterParams params;
  late List<Map<String, dynamic>> databaseResult;

  setUp(() {
    params = ParamsFactory.makeFindWarehouseWithRegister();
    databaseResult = DatabaseFactory.makeWarehouseWithRegisterResultJson();
    localStorage = LocalStorageSpy();
    localStorage.mockFind(databaseResult);
    sut = FindWarehouseWithRegisterLocally(
      localStorage: localStorage,
    );
  });

  test('Should make a successful find query', () async {
    await sut(params);

    verify(
      () => localStorage.find(
        query: QueryHelper.findWarehouseWithRegister(
          params.id,
        ),
      ),
    );
  });

  test(
      'Should throw DomainError.malformedData on unexpectedFormat database result',
      () async {
    localStorage.mockFindError(
      LocalStorageError.unexpectedFormat,
    );

    var future = sut(params);

    expect(future, throwsA(DomainError.malformedData));
  });

  test('Should throw DomainError.missingEntity on notFound database result',
      () async {
    localStorage.mockFindError(LocalStorageError.notFound);

    var future = sut(params);

    expect(future, throwsA(DomainError.missingEntity));
  });

  test(
      'Should throw DomainError.unexpected '
      'on any other errors (database failed, not the query) database result',
      () async {
    localStorage.mockFindError(LocalStorageError.readOnly);

    var future = sut(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should return a WarehouseEntity', () async {
    final warehouse = await sut(params);

    expect(
      warehouse,
      isA<WarehouseEntity>(),
    );
  });

  test('Should return a WarehouseEntity with id', () async {
    final warehouse = await sut(params);

    expect(
      warehouse.id,
      isA<int>(),
    );
  });

  test('Should return a WarehouseEntity with a RegisterEntity with id',
      () async {
    final register = (await sut(params)).register;

    expect(
      register.id,
      isA<int>(),
    );
  });

  test(
      'Should return a WarehouseEntity with a RegisterEntity with OperationsEntity list',
      () async {
    final operations = (await sut(params)).register.operations;

    expect(
      operations,
      isA<List<OperationEntity>>(),
    );
  });

  test(
      'Should return a WarehouseEntity with a RegisterEntity with an non-empty OperationsEntity list',
      () async {
    final operations = (await sut(params)).register.operations;

    expect(
      operations.isNotEmpty,
      true,
    );
  });

  test(
      'Should return a WarehouseEntity with a RegisterEntity with an non-empty OperationsEntity list. OperationsEntity must have id',
      () async {
    final operations = (await sut(params)).register.operations;

    expect(
      operations.first.id,
      isA<int>(),
    );
  });
}
