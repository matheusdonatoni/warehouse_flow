import '../models/address.dart';
import '/data/models/position.dart';

import '_impl/base_repository_impl.dart';

class PositionRepository extends BaseRepositoryImpl {
  Future<List<Position>> findFromStreet(Address address) async {
    var result = await localStorage.findPositions(address);

    return List.from(
      result.map(
        (e) => Position.fromMap(e),
      ),
    );
  }

  Future<Position> find(Address address, Position position) async {
    var result = await localStorage.findPosition(address, position);

    return Position.fromMap(result);
  }

  Future<List<int>> findHeights(Address address) async {
    var result = await localStorage.findPositionHeights(address);

    return List.from(
      result.map(
        (e) => e["height"],
      ),
    );
  }

  Future<List<int>> findDepths(Address address, int? height) async {
    var result = await localStorage.findPositionDepths(address, height);

    return List.from(
      result.map(
        (e) => e["depth"],
      ),
    );
  }
}
