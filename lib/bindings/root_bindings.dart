import 'package:get/get.dart';
import '../controllers/root_controllers/root_controller.dart';
import '../data/repositories/product_repository.dart';
import '../data/repositories/warehouse_repository.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => WarehouseRepository(), fenix: true);
    Get.lazyPut(() => ProductRepository(), fenix: true);

    Get.put(RootController());
  }
}
