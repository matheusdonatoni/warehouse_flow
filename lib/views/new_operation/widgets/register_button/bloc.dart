import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';
import '/data/models/operation.dart';

class RegisterButtonBloc extends GetxController {
  NewOperationController get _newOperationController => Get.find();

  GlobalKey<FormState> get _formKey => _newOperationController.formKey;

  Rx<Operation> get _operation => _newOperationController.operation;
  Operation get operation => _operation.value;
  set operation(Operation val) => _operation.value = val;

  void onPressed() {
    _formKey.currentState?.validate();
  }
}
