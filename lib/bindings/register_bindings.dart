import 'package:get/get.dart';
import '../controllers/register_controllers/register_controller.dart';

class RegisterPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
