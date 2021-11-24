import 'package:get/get.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class RegisterButtonBloc extends GetxController {
  NewOperationController get _newOperationController => Get.find();

  void addOperation() async => await _newOperationController.addOperation();
}
