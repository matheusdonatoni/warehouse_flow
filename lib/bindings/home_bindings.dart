import 'package:get/get.dart';
import '../data/repositories/warehouse_repository.dart';
import '../controllers/home_controllers/home_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => WarehouseRepository(), fenix: true);

    Get.put(HomeController());
  }
}
