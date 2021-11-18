import '/data/models/chamber.dart';
import '/data/models/street.dart';

import '_impl/base_repository_impl.dart';

class StreetRepository extends BaseRepositoryImpl {
  Future<List<Street>> find(Chamber chamber) async {
    var result = await localStorage.findStreets(chamber);

    return List.from(
      result.map(
        (e) => Street.fromMap(e),
      ),
    );
  }

  Future<List<String>> findNames(Chamber chamber) async {
    var result = await localStorage.findStreetNames(chamber);

    return List.from(
      result.map(
        (e) => e['name'],
      ),
    );
  }

  Future<List<int>> findNumbers(Chamber chamber, String? name) async {
    var result = await localStorage.findStreetNumbers(chamber, name);

    return List.from(
      result.map(
        (e) => e['number'],
      ),
    );
  }

  Future<Street> findFromAddress(
    Chamber chamber,
    Street street,
  ) async {
    var result = await localStorage.findStreetFromAddress(
      chamber,
      street,
    );

    return Street.fromMap(result);
  }
}
