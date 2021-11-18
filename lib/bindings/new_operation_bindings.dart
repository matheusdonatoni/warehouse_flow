import 'package:get/get.dart';

import '/data/repositories/product_repository.dart';
import '/data/repositories/position_repository.dart';
import '/data/repositories/street_repository.dart';
import '/data/repositories/chamber_repository.dart';

import '/controllers/new_operation_controllers/new_operation_controller.dart';

class NewOperationBinding implements Bindings {
  @override
  void dependencies() {
    _injectRepositories();

    Get.lazyPut(
      () => NewOperationController(),
    );
  }

  void _injectRepositories() {
    Get.lazyPut(() => ChamberRepository());
    Get.lazyPut(() => StreetRepository());
    Get.lazyPut(() => PositionRepository());
    Get.lazyPut(() => ProductRepository());
  }
}
