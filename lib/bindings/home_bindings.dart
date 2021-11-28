import 'package:get/get.dart';
import '../controllers/home_controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() async {

    Get.lazyPut(() => HomeController());
  }
}
