import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSpy extends Mock implements Database {
  When _mockRawQueryCall() => when(() => this.rawQuery(any(), [any()]));
  void mockRawQuery(String sql, [List<Object?>? arguments]) =>
      this._mockRawQueryCall().thenAnswer((_) async => [
            {'json': '{"id": 1, "anyKey": "anyValue"}'}
          ]);
  void mockRawQueryError(DatabaseException exception) =>
      this._mockRawQueryCall().thenThrow(exception);

  When _mockRawDeleteCall() => when(() => this.rawDelete(any(), [any()]));
  void mockRawDelete(String sql, [List<Object?>? arguments]) =>
      this._mockRawDeleteCall().thenAnswer((_) async => 1);
  void mockRawDeleteError(DatabaseException exception) =>
      this._mockRawDeleteCall().thenThrow(exception);

  When _mockRawUpdateCall() => when(() => this.rawUpdate(any(), [any()]));
  void mockRawUpdate(String sql, [List<Object?>? arguments]) =>
      this._mockRawUpdateCall().thenAnswer((_) async => 1);
  void mockRawUpdateError(DatabaseException exception) =>
      this._mockRawUpdateCall().thenThrow(exception);

  When _mockRawInsertCall() => when(() => this.rawInsert(any(), [any()]));
  void mockRawInsert(String sql, [List<Object?>? arguments]) =>
      this._mockRawInsertCall().thenAnswer((_) async => 1);
  void mockRawInsertError(DatabaseException exception) =>
      this._mockRawInsertCall().thenThrow(exception);
}
