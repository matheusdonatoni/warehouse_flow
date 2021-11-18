import 'package:get/get.dart';
import 'package:warehouse_flow/data/repositories/warehouse_repository.dart';
import '../../data/models/warehouse.dart';
import '../_impl/base_getx_controller_impl.dart';
import '../../routes/routes.dart';

class HomeController extends BaseGetxControllerImpl<Warehouse> {
  WarehouseRepository get _repo => Get.find();

  void pushNewOperationPage() {
    Get.toNamed(Routes.NEW_OPERATION);
  }

  var counter = 0.obs;

  @override
  void onInit() async {
    super.onInit();

    change(
      await _repo.find(1),
      status: RxStatus.success(),
    );
  }
}
