import 'package:get/get.dart';
import '../controllers/home_controllers/home_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(0));
  }
}
