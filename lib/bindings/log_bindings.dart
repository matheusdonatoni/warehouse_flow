import 'package:get/get.dart';
import '../controllers/log_controllers/log_controller.dart';

class LogPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogController(0));
  }
}
