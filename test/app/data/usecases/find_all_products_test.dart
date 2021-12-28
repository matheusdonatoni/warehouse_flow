import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/data/usecases/find_all_products_locally.dart';
import 'package:warehouse_flow/app/domain/helpers/domain_errors.dart';

import '../../infra/database_factory.dart';
import '../mocks/local_storage_spy.dart';

void main() {
  late FindAllProductsLocally sut;
  late LocalStorageSpy localStorage;
  late List<Map<String, dynamic>> databaseResult;

  setUp(() {
    databaseResult = DatabaseFactory.makeAllProductsListResultJson();
    localStorage = LocalStorageSpy();
    localStorage.mockFind(databaseResult);
    sut = FindAllProductsLocally(localStorage: localStorage);
  });

  test('Should make a successful find query', () async {
    await sut();

    verify(
      () => localStorage.find(
        query: QueryHelper.findAllProducts(),
      ),
    );
  });

  test(
      'Should throw DomainError.malformedData on LocalStorageError.unexpectedFormat',
      () async {
    localStorage.mockFindError(
      LocalStorageError.unexpectedFormat,
    );

    var future = sut();

    expect(future, throwsA(DomainError.malformedData));
  });

  test('Should throw DomainError.missingEntity on LocalStorageError.notFound',
      () async {
    localStorage.mockFindError(
      LocalStorageError.notFound,
    );

    var future = sut();

    expect(future, throwsA(DomainError.missingEntity));
  });
}
