import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSpy extends Mock implements Database {
  When _mockRawQueryCall() => when(() => this.rawQuery(any(), any()));
  void mockRawQuery(List<Map<String, Object?>> result) =>
      this._mockRawQueryCall().thenAnswer(
            (_) async => result,
          );
  void mockRawQueryError(dynamic exception) =>
      this._mockRawQueryCall().thenThrow(exception);

  When _mockRawDeleteCall() => when(() => this.rawDelete(any(), any()));
  void mockRawDelete(int result) => this._mockRawDeleteCall().thenAnswer(
        (_) async => result,
      );
  void mockRawDeleteError(dynamic exception) =>
      this._mockRawDeleteCall().thenThrow(exception);

  When _mockRawUpdateCall() => when(() => this.rawUpdate(any(), any()));
  void mockRawUpdate(int result) => this._mockRawUpdateCall().thenAnswer(
        (_) async => result,
      );
  void mockRawUpdateError(dynamic exception) =>
      this._mockRawUpdateCall().thenThrow(exception);

  When _mockRawInsertCall() => when(() => this.rawInsert(any(), any()));
  void mockRawInsert(int result) => this._mockRawInsertCall().thenAnswer(
        (_) async => result,
      );
  void mockRawInsertError(dynamic exception) =>
      this._mockRawInsertCall().thenThrow(exception);
}
