import 'package:get/get.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/repositories/position_repository.dart';
import '../../../../data/models/street.dart';
import '../../../../data/models/position.dart';

class PositionHeightDropDownButtonBloc extends GetxController {
  PositionRepository get _repo => Get.find();

  NewOperationController get _newOperationController => Get.find();

  Rx<Street> get _street => _newOperationController.street;
  Street get street => _street.value;
  set street(Street val) => _street.value = val;

  Rx<Position> get _position => _newOperationController.position;
  Position get position => _position.value;
  set position(Position val) => _position.value = val;

  final heights = RxList<int>();

  void _listenRelative() {
    _street.listen(
      (street) async {
        position = Position();

        if (street.id != null) {
          heights.assignAll(
            await _repo.findHeights(street),
          );
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
