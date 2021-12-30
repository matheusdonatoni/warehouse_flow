import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/usecases/find_warehouse_with_register_locally.dart';
import 'package:warehouse_flow/app/domain/entities/entities.dart';
import 'package:warehouse_flow/app/domain/helpers/domain_errors.dart';
import 'package:warehouse_flow/app/domain/usecases/find_warehouse_with_register.dart';

import '../../domain/params_factory.dart';
import '../../infra/mocks/database_factory.dart';
import '../mocks/local_storage_spy.dart';

void main() {
  late FindWarehouseWithRegisterLocally sut;
  late LocalStorageSpy localStorage;
  late FindWarehouseWithRegisterParams params;
  late Map<String, dynamic> databaseResult;

  setUp(() {
    params = ParamsFactory.makeFindWarehouseWithRegister();
    databaseResult = DatabaseFactory.makeWarehouseWithRegisterResult();
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
        query: QueryHelper.findWarehouseWithRegister,
        arguments: [params.id],
      ),
    );
  });

  test(
      'Should throw DomainError.malformedData on LocalStorage.malformedData database result',
      () async {
    localStorage.mockFindError(
      LocalStorageError.malformedData,
    );

    var future = sut(params);

    expect(future, throwsA(DomainError.malformedData));
  });

  test('Should throw DomainError.missingEntity on notFound database result',
      () async {
    localStorage.mockFindError(LocalStorageError.missingEntity);

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

  test(
      'Should throw DomainError.unexpected for LocalStorageError.invalidEntity data response',
      () async {
    localStorage.mockFind({'fake': 'wrong'});

    var future = sut(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
