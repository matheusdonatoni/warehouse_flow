import 'package:get/get.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/models/warehouse.dart';
import '/data/models/chamber.dart';
import '/data/repositories/chamber_repository.dart';

class ChamberDropDownButtonBloc extends GetxController {
  ChamberRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();
  Warehouse get _warehouse => _newOperationController.warehouse!;

  Rx<Chamber> get _chamber => _newOperationController.chamber;
  Chamber get chamber => _chamber.value;
  set chamber(Chamber val) => _chamber.value = val;

  final names = RxList<String>();

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Selecione uma câmara';
    }

    return null;
  }

  void onChanged(String? name) async {
    if (name != chamber.name) {
      chamber = await _repo.findFromName(name);
    }
  }

  @override
  void onInit() async {
    super.onInit();

    names.assignAll(
      await _repo.findChamberNames(_warehouse),
    );
  }
}
