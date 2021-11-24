import 'package:get/get.dart';
import '/data/models/street.dart';
import '/data/repositories/street_repository.dart';
import '/data/models/chamber.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class StreetNameDropDownButtonBloc extends GetxController {
  StreetRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rx<Chamber> get _chamber => _newOperationController.operation.rx.chamber;
  Chamber get chamber => _chamber.value;
  set chamber(Chamber val) => _chamber.value = val;

  Rx<Street> get _street => _newOperationController.operation.rx.street;
  Street get street => _street.value;
  set street(Street val) => _street.value = val;

  final names = RxList<String>();

  void _listenRelative() {
    _chamber.listen(
      (chamber) async {
        street = Street();

        names.assignAll(
          await _repo.findNames(chamber),
        );

        if (names.length == 1) street = Street(name: names.single);
      },
    );
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Selecione uma rua';
    }

    return null;
  }

  void onChanged(String? name) {
    if (name != null && name != street.name) {
      street = Street(name: name);
    }
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
