import '/data/models/chamber.dart';
import '/data/models/street.dart';

import '_impl/base_repository_impl.dart';

class StreetRepository extends BaseRepositoryImpl {
  Future<List<Street>> findFromChamber(Chamber? chamber) async {
    var result = await localStorage.findStreetsFromChamber(chamber);

    return List.from(
      result.map(
        (e) => Street.fromMap(e),
      ),
    );
  }

  Future<Street> findFromAddress(
    Chamber? chamber,
    int? number,
    String? name,
  ) async {
    var result = await localStorage.findStreetFromAddress(
      chamber,
      number,
      name,
    );

    return Street.fromMap(result);
  }
}
