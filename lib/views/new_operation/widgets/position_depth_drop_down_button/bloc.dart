import 'package:get/get.dart';
import '/data/models/operation.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/repositories/position_repository.dart';
import '../../../../data/models/address.dart';
import '../../../../data/models/position.dart';

class PositionDepthDropDownButtonBloc extends GetxController {
  PositionRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Operation get operation => _newOperationController.operation;

  Rx<Address> get _address => _newOperationController.address;
  Address get address => _address.value;
  set address(Address val) => _address.value = val;

  Rx<Position> get _position => _newOperationController.position;
  Position get position => _position.value;
  set position(Position val) => _position.value = val;

  final depths = RxList<int>();

  void _listenRelative() {
    _position.listen(
      (position) async {
        if (position.height != null) {
          depths.assignAll(
            await _repo.findDepths(address, position.height),
          );

          if (depths.length == 1 && position.id == null) {
            position = position.copyWith(
              depth: depths.single,
            );

            this.position = await _repo.find(address, position);
          }
        } else {
          depths.clear();
        }
      },
    );
  }

  String? validator(int? value) {
    if (value == null) {
      return 'Selecione a profundidade da posição';
    }

    return null;
  }

  void onChanged(int? depth) async {
    if (depth != null && depth != position.depth) {
      position = position.copyWith(depth: depth);

      position = await _repo.find(address, position);
    }
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
