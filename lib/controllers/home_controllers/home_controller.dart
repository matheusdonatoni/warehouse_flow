import 'package:get/get.dart';
import '../../data/repositories/position_repository.dart';
import '../../data/models/warehouse.dart';
import '../../data/models/chamber.dart';
import '../../data/repositories/street_repository.dart';
import '../../data/repositories/chamber_repository.dart';
import '../../data/repositories/warehouse_repository.dart';
import '../_impl/base_getx_controller_impl.dart';
import '../../routes/routes.dart';

class HomeController extends BaseGetxControllerImpl {
  WarehouseRepository get _warehouseRepository => Get.find();
  ChamberRepository get _chamberRepository => Get.find();
  StreetRepository get _streetRepository => Get.find();
  PositionRepository get _positionRepository => Get.find();

  final _warehouse = Rx<Warehouse>(Warehouse());
  Warehouse get warehouse => _warehouse.value;
  set warehouse(Warehouse val) => _warehouse.value = val;

  List<Chamber> get chambers => warehouse.chambers;
  set chambers(List<Chamber> val) => warehouse.chambers = val;

  void pushNewOperationPage() {
    Get.toNamed(Routes.NEW_OPERATION);
  }

  Future<void> _populateWarehouse() async {
    warehouse = await _warehouseRepository.find(1);

    chambers = await _chamberRepository.findFromWarehouse(warehouse);

    for (final chamber in chambers) {
      chamber.streets = await _streetRepository.find(chamber);

      for (final street in chamber.streets) {
        street.positions = await _positionRepository.findFromStreet(street);
      }
    }
  }

  @override
  void onInit() async {
    super.onInit();

    await _populateWarehouse();
  }
}
