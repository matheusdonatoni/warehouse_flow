import 'package:warehouse_flow/app/domain/entities/entities.dart';

abstract class FindWarehouseWithRegister {
  Future<WarehouseEntity> call(
    FindWarehouseWithRegisterParams params,
  );
}

class FindWarehouseWithRegisterParams {
  final int id;

  FindWarehouseWithRegisterParams({required this.id});
}
