import 'package:mocktail/mocktail.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage.dart';
import 'package:warehouse_flow/app/data/local_storage/local_storage_errors.dart';

class LocalStorageSpy extends Mock implements LocalStorage {
  When _mockFindCall() => when(() => find(query: any(named: 'query')));
  void mockFind(List<Map<String, dynamic>> result) =>
      this._mockFindCall().thenAnswer(
            (_) async => result,
          );
  void mockFindError(LocalStorageError error) => this._mockFindCall().thenThrow(
        error,
      );
}
