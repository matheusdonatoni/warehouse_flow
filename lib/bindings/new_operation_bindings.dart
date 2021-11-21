import 'package:get/get.dart';

import '../data/repositories/operation_repository.dart';
import '../data/repositories/register_repository.dart';
import '../data/repositories/chamber_repository.dart';
import '../data/repositories/position_repository.dart';
import '../data/repositories/product_repository.dart';
import '../data/repositories/street_repository.dart';

import '/controllers/new_operation_controllers/new_operation_controller.dart';

class NewOperationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChamberRepository(), fenix: true);
    Get.lazyPut(() => StreetRepository(), fenix: true);
    Get.lazyPut(() => PositionRepository(), fenix: true);
    Get.lazyPut(() => RegisterRepository(), fenix: true);
    Get.lazyPut(() => ProductRepository(), fenix: true);
    Get.lazyPut(() => OperationRepository(), fenix: true);

    Get.lazyPut(
      () => NewOperationController(),
    );
  }
}
