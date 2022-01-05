abstract class LocalStorage {
  Future<dynamic> find({required String query, List<Object?>? arguments});
  Future<int> insert({required String query, List<Object?>? arguments});
  Future<void> update({required String query, List<Object?>? arguments});
  Future<void> delete({required String query, List<Object?>? arguments});
}
