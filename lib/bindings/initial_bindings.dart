import 'package:get/get.dart';
import '../services/navigation_services.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationServices());
  }
}
