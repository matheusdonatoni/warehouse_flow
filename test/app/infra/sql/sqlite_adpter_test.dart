import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite/src/exception.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';
import 'package:warehouse_flow/app/infra/sql/sqlite_adpter.dart';

import '../mocks/database_factory.dart';
import '../mocks/database_spy.dart';

void main() {
  late SQLiteAdapter sut;
  late DatabaseSpy database;

  setUp(() {
    database = DatabaseSpy();
    sut = SQLiteAdapter(database);
  });

  group('Find tests', () {
    test('Should throw LocalStorageError.unknown on unknown Exception',
        () async {
      database.mockRawQueryError(Exception('unknown'));

      var future = sut.find(
        query: QueryHelper.findWarehouseWithRegister,
        arguments: [1],
      );

      expect(future, throwsA(LocalStorageError.unknown));
    });

    test('Should throw LocalStorageError.malformedData on malformed key result',
        () async {
      database.mockRawQuery(
        DatabaseFactory.makeWarehouseWithRegisterMalformedKeyResult(),
      );

      var future = sut.find(
        query: QueryHelper.findWarehouseWithRegister,
        arguments: [1],
      );

      expect(future, throwsA(LocalStorageError.malformedData));
    });

    test(
        'Should throw LocalStorageError.malformedData on malformed lenght result',
        () async {
      database.mockRawQuery(
        DatabaseFactory.makeWarehouseWithRegisterMalformedLengthResult(),
      );

      var future = sut.find(
        query: QueryHelper.findWarehouseWithRegister,
        arguments: [1],
      );

      expect(future, throwsA(LocalStorageError.malformedData));
    });

    test(
        'Should throw LocalStorageError.malformedData on malformed value result',
        () async {
      database.mockRawQuery(
        DatabaseFactory.makeWarehouseWithRegisterMalformedValueResult(),
      );

      var future = sut.find(
        query: QueryHelper.findWarehouseWithRegister,
        arguments: [1],
      );

      expect(future, throwsA(LocalStorageError.malformedData));
    });

    test('Should throw LocalStorageError.closed on DatabaseException.closed',
        () async {
      database.mockRawQueryError(
        SqfliteDatabaseException('database_closed', null),
      );

      var future = sut.find(
        query: QueryHelper.findWarehouseWithRegister,
        arguments: [1],
      );

      expect(future, throwsA(LocalStorageError.closed));
    });

    test('Should call rawQuery with correct values', () async {
      database.mockRawQuery(
        DatabaseFactory.makeWarehouseWithRegisterResult(),
      );

      await sut.find(
        query: QueryHelper.findWarehouseWithRegister,
        arguments: [1],
      );

      verify(
          () => database.rawQuery(QueryHelper.findWarehouseWithRegister, [1]));

      database.mockRawQuery(
        DatabaseFactory.makeAllProductsListResult(),
      );

      await sut.find(
        query: QueryHelper.findAllProducts,
      );

      verify(() => database.rawQuery(QueryHelper.findAllProducts));
    });

    test('Should call rawQuery and return correct value (single map)',
        () async {
      database.mockRawQuery(
        DatabaseFactory.makeWarehouseWithRegisterResult(),
      );

      var future = await sut.find(
        query: QueryHelper.findWarehouseWithRegister,
        arguments: [1],
      );

      expect(
        future,
        anyOf(
          isA<Map<String, dynamic>>(),
          isA<List<dynamic>>(),
        ),
      );
    });

    test('Should call rawQuery and return correct value (list of dynamic)',
        () async {
      database.mockRawQuery(
        DatabaseFactory.makeAllProductsListResult(),
      );

      var future = await sut.find(
        query: QueryHelper.findWarehouseWithRegister,
        arguments: [1],
      );

      expect(
        future,
        anyOf(
          isA<Map<String, dynamic>>(),
          isA<List<dynamic>>(),
        ),
      );
    });
  });

  group('Insert tests', () {
    test('Should throw LocalStorageError.unknown on unknown Exception',
        () async {
      database.mockRawInsertError(Exception('unknown'));

      var future = sut.insert(
        query: QueryHelper.insertIntoOperations,
        arguments: [1, 1, 1, 1, 1, 1, 1, 1, 1],
      );

      expect(future, throwsA(LocalStorageError.unknown));
    });

    test('Should throw LocalStorageError.closed on DatabaseException.closed',
        () async {
      database.mockRawInsertError(
        SqfliteDatabaseException('database_closed', null),
      );

      var future = sut.insert(
        query: QueryHelper.insertIntoOperations,
        arguments: [1, 1, 1, 1, 1, 1, 1, 1, 1],
      );

      expect(future, throwsA(LocalStorageError.closed));
    });

    test('Should call rawInsert with correct values', () async {
      database.mockRawInsert(1);

      await sut.insert(
        query: QueryHelper.insertIntoOperations,
        arguments: [1, 1, 1, 1, 1, 1, 1, 1, 1],
      );

      verify(
        () => database.rawInsert(
          QueryHelper.insertIntoOperations,
          [1, 1, 1, 1, 1, 1, 1, 1, 1],
        ),
      );
    });

    test('Should return a int on a rawInsert', () async {
      database.mockRawInsert(1);

      var future = await sut.insert(
        query: QueryHelper.insertIntoOperations,
        arguments: [1, 1, 1, 1, 1, 1, 1, 1, 1],
      );

      expect(future, isA<int>());
    });
  });
}
