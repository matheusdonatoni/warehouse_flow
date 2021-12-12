import '../models/spot.dart';
import '../models/address.dart';
import '../../data/models/position.dart';
import '../../data/models/product.dart';
import '../../data/models/register.dart';
import '../../data/models/operation.dart';

import '_impl/base_repository_impl.dart';

class OperationRepository extends BaseRepositoryImpl {
  Future<Operation> create(
    Operation operation,
    Register register,
  ) async {
    var result = await localStorage.createOperation(operation, register);

    return Operation.fromAliasesMap(
      result,
      product: Product.fromAlisesMap(result),
      spot: Spot.fromAliasesMap(result),
      address: Address.fromAliasesMap(result),
      position: Position.fromAliasesMap(result),
    );
  }

  Future<List<Operation>> findFromRegister(Register register) async {
    var result = await localStorage.findOperationsFromRegister(register);

    return List.from(
      result.map(
        (e) => Operation.fromAliasesMap(
          e,
          product: Product.fromAlisesMap(e),
          spot: Spot.fromAliasesMap(e),
          address: Address.fromAliasesMap(e),
          position: Position.fromAliasesMap(e),
        ),
      ),
    );
  }
}
