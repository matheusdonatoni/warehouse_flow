import 'package:get/get.dart';
import '../../controllers/root_controllers/root_controller.dart';
import '../../data/models/warehouse.dart';
import '../_impl/base_getx_controller_impl.dart';
import '../../routes/routes.dart';

class HomeController extends BaseGetxControllerImpl {
  RootController get _rootController => Get.find();

  Rx<Warehouse> get _warehouse => _rootController.warehouse;
  Warehouse get warehouse => _warehouse.value;
  set warehouse(Warehouse val) => _warehouse.value = val;

  void pushNewOperationPage() {
    Get.toNamed(Routes.NEW_OPERATION);
  }

  @override
  void onInit() async {
    super.onInit();

    status = RxStatus.success();
  }
}
