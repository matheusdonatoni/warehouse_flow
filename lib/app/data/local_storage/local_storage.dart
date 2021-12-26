abstract class LocalStorage {
  Future<List<Map<String, dynamic>>> find({required String query});
  Future<int> insert({required String query});
  Future<int> update({required String query});
  Future<int> delete({required String query});
}
