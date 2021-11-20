import 'package:get/get.dart';
import '../data/repositories/chamber_repository.dart';
import '../data/repositories/position_repository.dart';
import '../data/repositories/product_repository.dart';
import '../data/repositories/street_repository.dart';
import '../data/repositories/warehouse_repository.dart';
import '../controllers/home_controllers/home_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => WarehouseRepository(), fenix: true);
    Get.lazyPut(() => ChamberRepository(), fenix: true);
    Get.lazyPut(() => StreetRepository(), fenix: true);
    Get.lazyPut(() => PositionRepository(), fenix: true);
    Get.lazyPut(() => ProductRepository(), fenix: true);

    Get.put(HomeController());
  }
}
