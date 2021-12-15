import 'package:get/get.dart';
import '../../controllers/root_controllers/root_controller.dart';
import '../../data/models/operation.dart';
import '../../routes/routes.dart';
import '../../data/models/warehouse.dart';

import '../_impl/base_getx_controller_impl.dart';

class RegisterController extends BaseGetxControllerImpl {
  RootController get _rootController => Get.find();

  Rx<Warehouse> get _warehouse => _rootController.warehouse;
  Warehouse get warehouse => _warehouse.value;
  set warehouse(Warehouse val) => _warehouse.value = val;

  RxList<Operation> get operations => warehouse.register.rx.operations;

  void pushNewOperationPage() {
    Get.toNamed(Routes.NEW_OPERATION);
  }

  @override
  void onInit() async {
    super.onInit();

    status = RxStatus.success();
  }
}
