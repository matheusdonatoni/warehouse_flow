import 'package:get/get.dart';
import '/data/models/street.dart';
import '/data/repositories/street_repository.dart';
import '/data/models/chamber.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class StreetNameDropDownButtonBloc extends GetxController {
  StreetRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rxn<Chamber?> get _chamber => _newOperationController.chamber;
  Chamber? get chamber => _chamber.value;
  set chamber(Chamber? val) => _chamber.value = val;

  Rxn<Street?> get _street => _newOperationController.street;
  Street? get street => _street.value;
  set street(Street? val) => _street.value = val;

  final streetNames = RxList<String>();

  @override
  void onInit() {
    super.onInit();

    _trackRelative();
  }

  void _trackRelative() {
    _chamber.listenAndPump(
      (chamber) async {
        if (chamber != null) {
          _street.call(Street());

          final streets = await _repo.findFromChamber(chamber);

          streetNames.assignAll(
            streets.map((street) => street.name!).toSet(),
          );
        }
      },
    );
  }

  void onChanged(String? value) {
    street = Street(name: value);
  }
}
