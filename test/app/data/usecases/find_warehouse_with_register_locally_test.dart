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
  // warehouse without register.
  late FindWarehouseWithRegisterLocally absentRegisterSut;
  // warehouse with register only.
  late FindWarehouseWithRegisterLocally emptyOperationSut;
  // warehouse with a register and a filled operation list.
  late FindWarehouseWithRegisterLocally filledOperationSut;

  late LocalStorageSpy localStorageWithAbsentRegister;
  late LocalStorageSpy localStorageWithEmptyOperations;
  late LocalStorageSpy localStorageWithFilledOperation;

  late FindWarehouseWithRegisterParams params;

  late List<Map<String, dynamic>> databaseResultWithAbsentRegister;
  late List<Map<String, dynamic>> databaseResultWithEmptyRegister;
  late List<Map<String, dynamic>> databaseResultWithFilledRegister;

  setUp(() {
    params = ParamsFactory.makeFindWarehouseWithRegister();

    localStorageWithAbsentRegister = LocalStorageSpy();
    databaseResultWithAbsentRegister =
        DatabaseFactory.makeWarehouseWithAbsentRegister();
    localStorageWithAbsentRegister.mockFind(databaseResultWithAbsentRegister);
    absentRegisterSut = FindWarehouseWithRegisterLocally(
      localStorage: localStorageWithAbsentRegister,
    );

    localStorageWithEmptyOperations = LocalStorageSpy();
    databaseResultWithAbsentRegister =
        DatabaseFactory.makeWarehouseWithAbsentRegister();
    localStorageWithEmptyOperations.mockFind(databaseResultWithAbsentRegister);
    absentRegisterSut = FindWarehouseWithRegisterLocally(
      localStorage: localStorageWithAbsentRegister,
    );

    databaseResultWithEmptyRegister =
        DatabaseFactory.makeWarehouseWithEmptyRegisterResultJson();
    localStorageWithEmptyOperations = LocalStorageSpy();
    localStorageWithEmptyOperations.mockFind(databaseResultWithEmptyRegister);
    emptyOperationSut = FindWarehouseWithRegisterLocally(
      localStorage: localStorageWithEmptyOperations,
    );

    databaseResultWithFilledRegister =
        DatabaseFactory.makeWarehouseWithFilledRegisterResultJson();
    localStorageWithFilledOperation = LocalStorageSpy();
    localStorageWithFilledOperation.mockFind(databaseResultWithFilledRegister);
    filledOperationSut = FindWarehouseWithRegisterLocally(
      localStorage: localStorageWithFilledOperation,
    );
  });

  test('Should throw DomainError.absentRegister for register without id',
      () async {
    final future = absentRegisterSut(params);

    expect(future, throwsA(DomainError.absentRegister));
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

  test(
      'Should throw DomainError.malformedData on unexpectedFormat database result',
      () async {
    localStorageWithEmptyOperations.mockFindError(
      LocalStorageError.unexpectedFormat,
    );

    var future = emptyOperationSut(params);

    expect(future, throwsA(DomainError.malformedData));
  });

  test('Should throw DomainError.missingEntity on notFound database result',
      () async {
    localStorageWithEmptyOperations.mockFindError(LocalStorageError.notFound);

    var future = emptyOperationSut(params);

    expect(future, throwsA(DomainError.missingEntity));
  });

  test(
      'Should throw DomainError.unexpected '
      'on any other errors (database failed, not the query) database result',
      () async {
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
