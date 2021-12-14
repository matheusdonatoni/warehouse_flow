import 'package:get/get.dart';
import '../../data/models/operation.dart';
import '../../routes/routes.dart';
import '../../data/models/warehouse.dart';
import '../../data/repositories/warehouse_repository.dart';

import '../_impl/base_getx_controller_impl.dart';

class RegisterController extends BaseGetxControllerImpl {
  WarehouseRepository get _repo => Get.find();

  final _warehouse = Rx<Warehouse>(Warehouse());
  Warehouse get warehouse => _warehouse.value;
  set warehouse(Warehouse val) => _warehouse.value = val;

  RxList<Operation> get operations => warehouse.register.rx.operations;

  void pushNewOperationPage() {
    Get.toNamed(Routes.NEW_OPERATION);
  }

  @override
  void onInit() async {
    super.onInit();

    warehouse = await _repo.findEagerLoadRegister(1);

    status = RxStatus.success();
  }
}
