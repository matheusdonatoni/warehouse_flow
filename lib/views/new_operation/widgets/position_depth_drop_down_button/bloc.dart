import 'package:get/get.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/repositories/position_repository.dart';
import '../../../../data/models/street.dart';
import '../../../../data/models/position.dart';

class PositionDepthDropDownButtonBloc extends GetxController {
  PositionRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rx<Street> get _street => _newOperationController.street;
  Street get street => _street.value;
  set street(Street val) => _street.value = val;

  Rx<Position> get _position => _newOperationController.position;
  Position get position => _position.value;
  set position(Position val) => _position.value = val;

  final depths = RxList<int>();

  void _listenRelative() {
    _position.listen(
      (position) async {
        if (position.height != null) {
          depths.assignAll(
            await _repo.findDepths(street, position.height!),
          );
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
    if (depth != position.depth) {
      position = position.copyWith(depth: depth);

      position = await _repo.find(street, position);
    }
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
