import 'package:warehouse_flow/app/domain/entities/entities.dart';

abstract class FindWarehouseOperations {
  Future<List<OperationEntity>> call(FindWarehouseOperationsParams params);
}

class FindWarehouseOperationsParams {
  final int id;

  FindWarehouseOperationsParams({required this.id});
}
