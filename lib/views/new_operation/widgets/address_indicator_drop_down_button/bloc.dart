import 'package:get/get.dart';
import '../../../../data/models/address.dart';
import '../../../../data/repositories/adress_repository.dart';
import '../../../../data/models/spot.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class AddressIndicatorDropDownButtonBloc extends GetxController {
  AddressRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rx<Spot> get _spot => _newOperationController.spot;
  Spot get spot => _spot.value;
  set spot(Spot val) => _spot.value = val;

  Rx<Address> get _address => _newOperationController.address;
  Address get address => _address.value;
  set address(Address val) => _address.value = val;

  final indicators = RxList<String>();

  void _listenRelative() {
    _address.listen(
      (address) async {
        if (address.name != null) {
          indicators.assignAll(
            await _repo.findIndicators(spot, address.name),
          );

          if (indicators.length == 1 && address.id == null) {
            address = address.copyWith(
              indicator: indicators.single,
            );

            this.address = await _repo.findFromAddress(spot, address);
          }
        } else {
          indicators.clear();
        }
      },
    );
  }

  String? validator(String? value) {
    if (value == null) {
      return 'Selecione o número da rua';
    }

    return null;
  }

  void onChanged(String? indicator) async {
    if (indicator != null && indicator != address.indicator) {
      address = address.copyWith(
        indicator: indicator,
      );

      address = await _repo.findFromAddress(
        spot,
        address,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
