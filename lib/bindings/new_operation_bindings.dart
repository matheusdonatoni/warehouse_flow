import 'package:get/get.dart';
import '../controllers/new_operation_controllers/new_operation_controller.dart';

class NewOperationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewOperationController(0));
  }
}
