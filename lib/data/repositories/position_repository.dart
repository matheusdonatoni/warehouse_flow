import '/data/models/operation.dart';
import '/data/models/product.dart';
import '/data/models/register.dart';

import '/data/models/street.dart';
import '/data/models/position.dart';

import '_impl/base_repository_impl.dart';

class PositionRepository extends BaseRepositoryImpl {
  Future<List<Position>> findFromStreet(Street street) async {
    var result = await localStorage.findPositions(street);

    return List.from(
      result.map(
        (e) => Position.fromMap(e),
      ),
    );
  }

  Future<Position> find(Street street, Position position) async {
    var result = await localStorage.findPosition(street, position);

    Position _position = Position();

    for (final map in result) {
      if (_position.id == null) {
        _position = Position.fromAliasesMap(map);
        _position.register = Register.fromAliasesMap(map);
      }

      var operation = Operation.fromAliasesMap(map);

      operation.product = Product.fromAlisesMap(map);

      _position.register.operations.add(operation);
    }

    return _position;
  }

  Future<List<int>> findHeights(Street street) async {
    var result = await localStorage.findPositionHeights(street);

    return List.from(
      result.map(
        (e) => e["height"],
      ),
    );
  }

  Future<List<int>> findDepths(Street street, int height) async {
    var result = await localStorage.findPositionDepths(street, height);

    return List.from(
      result.map(
        (e) => e["depth"],
      ),
    );
  }
}
