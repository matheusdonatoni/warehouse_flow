import 'package:get/get.dart';
import '../../data/models/warehouse.dart';
import '../../data/repositories/warehouse_repository.dart';
import '../_impl/base_getx_controller_impl.dart';
import '../../routes/routes.dart';

class HomeController extends BaseGetxControllerImpl {
  WarehouseRepository get _warehouseRepository => Get.find();

  final _warehouse = Rx<Warehouse>(Warehouse());
  Warehouse get warehouse => _warehouse.value;
  set warehouse(Warehouse val) => _warehouse.value = val;

  void pushNewOperationPage() {
    Get.toNamed(Routes.NEW_OPERATION);
  }

  @override
  void onInit() async {
    super.onInit();

    warehouse = await _warehouseRepository.findEagerLoading(1);

    status = RxStatus.success();
  }
}
