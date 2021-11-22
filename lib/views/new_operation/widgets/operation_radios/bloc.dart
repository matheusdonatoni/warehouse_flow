import 'package:get/get.dart';
import '/data/models/operation.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class OperationRadiosBloc extends GetxController {
  NewOperationController get _newOperationController => Get.find();

  Rx<Operation> get _operation => _newOperationController.operation;
  Operation get operation => _operation.value;
  set operation(Operation val) => _operation.value = val;

  void onChanged(OperationType? type) {
    if (type != operation.type) {
      operation = operation.copyWith(type: type);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
