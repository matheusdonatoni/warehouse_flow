abstract class LocalStorage {
  Future<dynamic> find({required String query});
  Future<void> insert({required String query});
  Future<void> update({required String query});
  Future<void> delete({required String query});
}
