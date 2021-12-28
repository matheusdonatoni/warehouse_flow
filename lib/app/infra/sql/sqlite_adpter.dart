import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';

class SQLiteAdapter extends LocalStorage {
  final Database database;

  SQLiteAdapter(this.database);

  @override
  Future<void> delete({required String query}) {
    try {
      return database.rawDelete(query);
    } on DatabaseException catch (e) {
      throw _handleException(e);
    } on Exception catch (_) {
      throw LocalStorageError.unknown;
    }
  }

  //Should return a Map, or a List of Maps from the ['json'] key;
  @override
  Future<dynamic> find({required String query}) async {
    try {
      var result = await database.rawQuery(query);

      return jsonDecode(result.single['json'] as String);
    } on DatabaseException catch (e) {
      throw _handleException(e);
    } on StateError catch (_) {
      throw LocalStorageError.malformedData;
    } on Exception catch (_) {
      throw LocalStorageError.unknown;
    }
  }

  @override
  Future<int> insert({required String query}) {
    try {
      return database.rawInsert(query);
    } on DatabaseException catch (e) {
      throw _handleException(e);
    } on Exception catch (_) {
      throw LocalStorageError.unknown;
    }
  }

  @override
  Future<void> update({required String query}) {
    try {
      return database.rawUpdate(query);
    } on DatabaseException catch (e) {
      throw _handleException(e);
    } on Exception catch (_) {
      throw LocalStorageError.unknown;
    }
  }

  Exception _handleException(DatabaseException exception) {
    if (exception.isDatabaseClosedError()) {
      throw LocalStorageError.closed;
    } else if (exception.isDuplicateColumnError()) {
      throw LocalStorageError.columnDuplicate;
    } else if (exception.isNoSuchTableError()) {
      throw LocalStorageError.tableNotFound;
    } else if (exception.isNotNullConstraintError()) {
      throw LocalStorageError.notNullConstraints;
    } else if (exception.isOpenFailedError()) {
      throw LocalStorageError.openFailed;
    } else if (exception.isReadOnlyError()) {
      throw LocalStorageError.readOnly;
    } else if (exception.isSyntaxError()) {
      throw LocalStorageError.syntax;
    } else if (exception.isUniqueConstraintError()) {
      throw LocalStorageError.uniqueConstraints;
    } else {
      throw LocalStorageError.unknown;
    }
  }
}
