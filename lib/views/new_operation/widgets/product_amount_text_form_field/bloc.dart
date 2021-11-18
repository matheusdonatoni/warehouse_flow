import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_flow/data/models/operation.dart';
import '/data/models/product.dart';
import '/controllers/new_operation_controllers/new_operation_controller.dart';

class ProductAmountTextFormFieldBloc extends GetxController {
  final textController = TextEditingController();

  NewOperationController get _newOperationController => Get.find();

  Rx<Product> get _product => _newOperationController.product;
  Product get product => _product.value;
  set product(Product val) => _product.value = val;

  Rx<Operation> get _operation => _newOperationController.state!;
  Operation get operation => _operation.value;
  set operation(Operation val) => _operation.value = val;

  bool get readOnly => product.id == null;

  void _listenRelative() {
    _product.listen((product) {
      if (product.id == null) {
        textController.clear();
        operation = Operation(type: operation.type);
      }
    });
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um código de produto';
    }

    final parsedValue = double.tryParse(value);

    if (parsedValue == null) {
      return 'Formato de valor inválido';
    } else if (parsedValue <= 0) {
      return 'Valor inválido';
    }

    return null;
  }

  void onSubmitted(String? amount) {
    if (amount != null) {
      operation.amount = double.tryParse(amount);
    }
  }

  @override
  void onInit() {
    super.onInit();

    _listenRelative();
  }
}
