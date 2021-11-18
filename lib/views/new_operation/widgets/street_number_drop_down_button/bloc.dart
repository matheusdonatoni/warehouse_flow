import 'package:get/get.dart';
import '/data/models/street.dart';
import '/data/repositories/street_repository.dart';
import '/data/models/chamber.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class StreetNumberDropDownButtonBloc extends GetxController {
  StreetRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rx<Chamber> get _chamber => _newOperationController.chamber;
  Chamber get chamber => _chamber.value;
  set chamber(Chamber val) => _chamber.value = val;

  Rx<Street> get _street => _newOperationController.street;
  Street get street => _street.value;
  set street(Street val) => _street.value = val;

  final numbers = RxList<int>();

  void _listenRelative() {
    _street.listen(
      (street) async {
        if (street.name != null) {
          numbers.assignAll(
            await _repo.findNumbers(chamber, street.name),
          );
        } else {
          numbers.clear();
        }
      },
    );
  }

  String? validator(int? value) {
    if (value == null) {
      return 'Selecione o número da rua';
    }

    return null;
  }

  void onChanged(int? number) async {
    if (number != street.number) {
      street = street.copyWith(
        number: number,
      );

      street = await _repo.findFromAddress(
        chamber,
        street,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
