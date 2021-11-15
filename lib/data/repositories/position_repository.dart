import '/data/models/street.dart';
import '/data/models/position.dart';

import '_impl/base_repository_impl.dart';

class PositionRepository extends BaseRepositoryImpl {
  Future<List<Position>> findFromStreet(Street street) async {
    var result = await localStorage.findPositionsFromStreet(street);

    return List.from(
      result.map(
        (e) => Street.fromMap(e),
      ),
    );
  }
}
