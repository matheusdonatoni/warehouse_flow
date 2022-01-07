import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/usecases/products_catalog/find_all_products_locally.dart';
import 'package:warehouse_flow/app/domain/entities/entities.dart';
import 'package:warehouse_flow/app/domain/helpers/errors/domain_errors.dart';

import '../../mocks/local_storage_factory.dart';
import '../../mocks/local_storage_spy.dart';

void main() {
  late FindAllProductsLocally sut;
  late LocalStorageSpy localStorage;
  late List<Map<String, dynamic>> databaseResult;

  setUp(() {
    databaseResult = LocalStorageFactory.makeAllProductsListResult();
    localStorage = LocalStorageSpy();
    localStorage.mockFind(databaseResult);
    sut = FindAllProductsLocally(localStorage: localStorage);
  });

  test('Should make a successful find query', () async {
    await sut();

    verify(
      () => localStorage.find(
        query: QueryHelper.findAllProducts,
      ),
    );
  });

  test(
      'Should throw DomainError.malformedData on LocalStorageError.malformedData',
      () {
    localStorage.mockFindError(
      LocalStorageError.malformedData,
    );

    var future = sut();

    expect(future, throwsA(DomainError.malformedData));
  });

  test(
      'Should throw DomainError.missingEntity on LocalStorageError.missingEntity',
      () {
    localStorage.mockFindError(
      LocalStorageError.missingEntity,
    );

    var future = sut();

    expect(future, throwsA(DomainError.missingEntity));
  });

  test('Should throw DomainError.unexpected on any other LocalStorageError',
      () {
    localStorage.mockFindError(
      LocalStorageError.columnDuplicate,
    );

    var future = sut();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should parse the result for a list of ProductEntity', () async {
    var future = await sut();

    expect(future, isA<List<ProductEntity>>());
  });

  test(
      'Should throw DomainError.unexpected for LocalStorageError.invalidEntity data response',
      () async {
    localStorage.mockFind([
      {'invalid': 'result'}
    ]);

    var future = sut();

    expect(future, throwsA(DomainError.unexpected));
  });
}