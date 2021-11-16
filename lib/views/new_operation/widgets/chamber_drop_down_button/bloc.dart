import 'package:get/get.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/models/warehouse.dart';
import '/data/models/chamber.dart';
import '/data/repositories/chamber_repository.dart';

class ChamberDropDownButtonBloc extends GetxController {
  ChamberRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();
  Warehouse get _warehouse => _newOperationController.warehouse;

  Rxn<Chamber?> get _chamber => _newOperationController.chamber;
  Chamber? get chamber => _chamber.value;
  set chamber(Chamber? val) => _chamber.value = val;

  final chambers = RxList<Chamber>();

  @override
  void onInit() async {
    super.onInit();

    findChambers();
  }

  void findChambers() async {
    chambers.assignAll(
      await _repo.findFromWarehouse(_warehouse),
    );
  }

  void onChanged(Chamber? chamber) {
    this.chamber = chamber;
  }
}
