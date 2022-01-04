import 'package:warehouse_flow/app/data/usecases/find_warehouse_operations_locally.dart';
import 'package:warehouse_flow/app/domain/usecases/find_warehouse_with_register.dart';

class ParamsFactory {
  static FindWarehouseWithRegisterParams makeFindWarehouseWithRegister() =>
      FindWarehouseWithRegisterParams(id: 1);

  static FindWarehouseOperationsLocallyParams
      makeFindWarehouseOperationsLocally() =>
          FindWarehouseOperationsLocallyParams(warehouseId: 1);
}
