import 'package:get/get.dart';
import '/data/models/operation.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class OperationRadiosBloc extends GetxController {
  NewOperationController get _newOperationController => Get.find();

  Operation get operation => _newOperationController.operation;
  set operation(Operation val) => _newOperationController.operation = val;

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
