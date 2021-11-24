import '../../data/models/chamber.dart';
import '../../data/models/street.dart';
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
      chamber: Chamber.fromAliasesMap(result),
      street: Street.fromAliasesMap(result),
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
          chamber: Chamber.fromAliasesMap(e),
          street: Street.fromAliasesMap(e),
          position: Position.fromAliasesMap(e),
        ),
      ),
    );
  }
}
