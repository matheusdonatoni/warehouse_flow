import '../../data/models/register.dart';
import '../../data/models/operation.dart';

import '_impl/base_repository_impl.dart';

class OperationRepository extends BaseRepositoryImpl {
  Future<Operation> create(Operation operation, Register register) async {
    var result = await localStorage.createOperation(operation, register);

    return Operation.fromMap(result);
  }

  Future<List<Operation>> findFromRegister(Register register) async {
    var result = await localStorage.findOperationsFromRegister(register);

    return List.from(
      result.map(
        (e) => Operation.fromMap(e),
      ),
    );
  }
}
