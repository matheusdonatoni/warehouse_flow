import 'package:get/get.dart';
import 'package:warehouse_flow/data/models/warehouse.dart';
import 'package:warehouse_flow/data/repositories/warehouse_repository.dart';
import '../controllers/home_controllers/home_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => WarehouseRepository(), fenix: true);

    // final warehouse = Get.find<WarehouseRepository>().find(1);

    Get.lazyPut(() => HomeController());
  }
}
