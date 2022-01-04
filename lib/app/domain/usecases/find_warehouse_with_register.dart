import 'package:warehouse_flow/app/domain/entities/entities.dart';

// working on DB version 5 only

abstract class FindWarehouseWithRegister {
  Future<WarehouseEntity> call(
    FindWarehouseWithRegisterParams params,
  );
}

class FindWarehouseWithRegisterParams {
  final int id;

  FindWarehouseWithRegisterParams({required this.id});
}
