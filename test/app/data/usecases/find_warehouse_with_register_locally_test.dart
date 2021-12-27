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
import '../mocks/sqlite_cursor_spy.dart';

void main() {
  // warehouse with resiter only.
  late FindWarehouseWithRegisterLocally emptyOperationSut;
  // warehouse with a resiter and a filled operation list.
  late FindWarehouseWithRegisterLocally filledOperationSut;

  late LocalStorageSpy localStorageWithEmptyOperations;
  late LocalStorageSpy localStorageWithFilledOperation;

  late FindWarehouseWithRegisterParams params;
  late List<Map<String, dynamic>> databaseResultWithEmptyRegister;
  late List<Map<String, dynamic>> databaseResultWithFilledRegister;

  setUp(() {
    params = ParamsFactory.makeFindWarehouseWithRegister();
    databaseResultWithEmptyRegister =
        DatabaseFactory.makeWarehouseWithEmptyRegisterResultJson();
    databaseResultWithFilledRegister =
        DatabaseFactory.makeWarehouseWithFilledRegisterResultJson();

    localStorageWithEmptyOperations = LocalStorageSpy();
    localStorageWithFilledOperation = LocalStorageSpy();

    localStorageWithEmptyOperations.mockFind(databaseResultWithEmptyRegister);
    emptyOperationSut = FindWarehouseWithRegisterLocally(
      localStorage: localStorageWithEmptyOperations,
    );

    localStorageWithFilledOperation.mockFind(databaseResultWithFilledRegister);
    filledOperationSut = FindWarehouseWithRegisterLocally(
      localStorage: localStorageWithFilledOperation,
    );
  });

  test('Should make a successful find query', () async {
    await emptyOperationSut(params);

    verify(
      () => localStorageWithEmptyOperations.find(
        query: QueryHelper.findWarehouseWithResiter(
          params.id,
        ),
      ),
    );
  });

  test('Should throw DomainError.malformedData on unexpectedFormat db result',
      () async {
    localStorageWithEmptyOperations
        .mockFindError(LocalStorageError.unexpectedFormat);

    var future = emptyOperationSut(params);

    expect(future, throwsA(DomainError.malformedData));
  });

  test('Should throw DomainError.malformedData on notFound db result',
      () async {
    localStorageWithEmptyOperations.mockFindError(LocalStorageError.notFound);

    var future = emptyOperationSut(params);

    expect(future, throwsA(DomainError.malformedData));
  });

  test(
      'Should throw DomainError.unexpected '
      'on any other errors (db failed, not the query) db result', () async {
    localStorageWithEmptyOperations.mockFindError(LocalStorageError.readOnly);

    var future = emptyOperationSut(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should return a WarehouseEntity', () async {
    final warehouse = await emptyOperationSut(params);

    expect(
      warehouse,
      isA<WarehouseEntity>(),
    );
  });

  test('Should return a WarehouseEntity with id', () async {
    final warehouse = await emptyOperationSut(params);

    expect(
      warehouse.id,
      isA<int>(),
    );
  });

  test('Should return a WarehouseEntity with a RegisterEntity with id',
      () async {
    final register = (await emptyOperationSut(params)).register;

    expect(
      register.id,
      isA<int>(),
    );
  });

  test(
      'Should return a WarehouseEntity with a RegisterEntity with OperationsEntity list',
      () async {
    final operations = (await emptyOperationSut(params)).register.operations;

    expect(
      operations,
      isA<List<OperationEntity>>(),
    );
  });

  test(
      'Should return a WarehouseEntity with a RegisterEntity with an empty OperationsEntity list',
      () async {
    final operations = (await emptyOperationSut(params)).register.operations;

    expect(
      operations.isEmpty,
      true,
    );
  });

  test(
      'Should return a WarehouseEntity with a RegisterEntity with an non-empty OperationsEntity list',
      () async {
    final operations = (await filledOperationSut(params)).register.operations;

    expect(
      operations.isNotEmpty,
      true,
    );
  });

  test(
      'Should return a WarehouseEntity with a RegisterEntity with an non-empty OperationsEntity list. OperationsEntity must have id',
      () async {
    final operations = (await filledOperationSut(params)).register.operations;

    expect(
      operations.first.id,
      isA<int>(),
    );
  });
}
