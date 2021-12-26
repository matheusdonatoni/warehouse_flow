import 'package:mocktail/mocktail.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';
import 'package:warehouse_flow/app/data/local_storage/query_helper/query_helper.dart';

class SQLiteCursorSpy extends Mock implements LocalStorage {
  final queryHelper = QueryHelper();

  When mockExecuteCall() => when(() => find(query: any(named: 'query')));
  void mockExecute(List<Map<String, dynamic>> result) =>
      this.mockExecuteCall().thenAnswer(
            (_) async => result,
          );
  void mockExecuteError(LocalStorageError error) => this.mockExecuteCall().thenThrow(
        error,
      );

  When mockInsertCall() => when(() => insert(query: any(named: 'query')));
  void mockInsert(int result) => this.mockInsertCall().thenAnswer(
        (_) async => result,
      );
  void mockInsertError(LocalStorageError error) => this.mockInsertCall().thenThrow(
        error,
      );

  When mockUpdateCall() => when(() => update(query: any(named: 'query')));
  void mockUpdate(int result) => this.mockUpdateCall().thenAnswer(
        (_) async => result,
      );
  void mockUpdateError(LocalStorageError error) => this.mockUpdateCall().thenThrow(
        error,
      );

  When mockDeleteCall() => when(() => delete(query: any(named: 'query')));
  void mockDelete(int result) => this.mockDeleteCall().thenAnswer(
        (_) async => result,
      );
  void mockDeleteError(LocalStorageError error) => this.mockDeleteCall().thenThrow(
        error,
      );
}
