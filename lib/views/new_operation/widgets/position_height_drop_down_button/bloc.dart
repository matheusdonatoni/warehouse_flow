import 'package:get/get.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/repositories/position_repository.dart';
import '../../../../data/models/address.dart';
import '../../../../data/models/position.dart';

class PositionHeightDropDownButtonBloc extends GetxController {
  PositionRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rx<Address> get _address => _newOperationController.address;
  Address get address => _address.value;
  set address(Address val) => _address.value = val;

  Rx<Position> get _position => _newOperationController.position;
  Position get position => _position.value;
  set position(Position val) => _position.value = val;

  final heights = RxList<int>();

  void _listenRelative() {
    _address.listen(
      (address) async {
        position = Position();

        if (address.id != null) {
          heights.assignAll(
            await _repo.findHeights(address),
          );

          if (heights.length == 1 && position.height == null) {
            this.position = Position(height: heights.single);
          }
        } else {
          heights.clear();
        }
      },
    );
  }

  String? validator(int? value) {
    if (value == null) {
      return 'Selecione a altura da posição';
    }

    return null;
  }

  void onChanged(int? height) {
    if (height != null && height != position.height) {
      position = Position(height: height);
    }
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
