import 'package:get/get.dart';
import '../../../../data/models/address.dart';
import '../../../../data/repositories/adress_repository.dart';
import '../../../../data/models/spot.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class AddressNameDropDownButtonBloc extends GetxController {
  AddressRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rx<Spot> get _spot => _newOperationController.spot;
  Spot get spot => _spot.value;
  set spot(Spot val) => _spot.value = val;

  Rx<Address> get _street => _newOperationController.address;
  Address get street => _street.value;
  set street(Address val) => _street.value = val;

  final names = RxList<String>();

  void _listenRelative() {
    

    _spot.listen(
      (chamber) async {
        street = Address();

        names.assignAll(
          await _repo.findNames(chamber),
        );

        if (names.length == 1) street = Address(name: names.single);
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
      street = Address(name: name);
    }
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
