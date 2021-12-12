import 'package:get/get.dart';
import '/data/models/operation.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/models/warehouse.dart';
import '../../../../data/models/spot.dart';
import '../../../../data/repositories/spot_repository.dart';

class SpotDropDownButtonBloc extends GetxController {
  SpotRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();
  Warehouse get _warehouse => _newOperationController.warehouse;

  Operation get operation => _newOperationController.operation;

  Rx<Spot> get _spot => _newOperationController.spot;
  Spot get spot => _spot.value;
  set spot(Spot val) => _spot.value = val;

  final names = RxList<String>();

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Selecione uma câmara';
    }

    return null;
  }

  void onChanged(String? name) async {
    if (name != null && name != spot.name) {
      spot = await _repo.findFromName(name);
    }
  }

  @override
  void onInit() async {
    super.onInit();

    names.assignAll(
      await _repo.findSpotNames(_warehouse),
    );
  }
}
