import 'package:get/get.dart';
import '/data/models/street.dart';
import '/data/repositories/street_repository.dart';
import '/data/models/chamber.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class StreetNumberDropDownButtonBloc extends GetxController {
  StreetRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rxn<Chamber?> get _chamber => _newOperationController.chamber;
  Chamber? get chamber => _chamber.value;
  set chamber(Chamber? val) => _chamber.value = val;

  Rxn<Street?> get _street => _newOperationController.street;
  Street? get street => _street.value;
  set street(Street? val) => _street.value = val;

  final streetNumbers = RxList<int>();

  @override
  void onInit() {
    super.onInit();

    _trackRelative();
  }

  void _trackRelative() {
    _street.listenAndPump(
      (street) async {
        if (street?.name != null) {
          final streets = await _repo.findFromChamber(chamber);

          streetNumbers.assignAll(
            streets.map((street) => street.number!).toSet(),
          );
        } else {}
      },
    );
  }

  void onChanged(int? value) async {
    street = street?.copyWith(number: value);

    street = await _repo.findFromAddress(
      chamber,
      street?.number,
      street?.name,
    );
  }
}
