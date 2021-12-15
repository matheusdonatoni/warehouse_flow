import 'package:get/get.dart';
import '../../data/models/product_resume.dart';
import '../../controllers/root_controllers/root_controller.dart';
import '../../data/models/warehouse.dart';
import '../_impl/base_getx_controller_impl.dart';

class HomeController extends BaseGetxControllerImpl {
  RootController get _rootController => Get.find();

  Rx<Warehouse> get _warehouse => _rootController.warehouse;
  Warehouse get warehouse => _warehouse.value;
  set warehouse(Warehouse val) => _warehouse.value = val;

  RxList<ProductResume> get resumes => warehouse.register.resumes;

  @override
  void onInit() async {
    super.onInit();

    status = RxStatus.success();
  }
}
