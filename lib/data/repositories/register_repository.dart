import '../models/position.dart';
import '../models/register.dart';

import '_impl/base_repository_impl.dart';

class RegisterRepository extends BaseRepositoryImpl {
  Future<Register> findFromPosition(Position position) async {
    var result = await localStorage.findRegisterFromPosition(position);

    return Register.fromMap(result);
  }
}
